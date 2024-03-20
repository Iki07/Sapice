<?php
session_start();
$email=$_SESSION['email'];
require_once("../classes/class_base.php");
require_once("../include/functions.php");
$answer=array(
    "error"=>"",
    "success"=>"",
    "id"=>""
);
$db=new Base();
if(!$db->connect()) exit;

$dog_id=$_POST['id'];
$answer['id']=$dog_id;

foreach ($_POST as $key => $value) {
    switch ($key) {
        case 'name':
            if(isset($_POST['name']) and $_POST['name']!="") {
                $name = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $answer['error']="Molimo Vas unesite ime.";
                echo JSON_encode ($answer, 256);
                exit;
            }
            break;
        case 'gender':
            $gender=$_POST['gender'];
            break;
        case 'description':
            if(isset($_POST['description']) and $_POST['description']!="") {
                $description = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                $description=NULL;
            }
            break;
        case 'age':
            if(isset($_POST['age']) and $_POST['age']!="") {
                $age = filter_var($value, FILTER_VALIDATE_INT);
            } else {
                $age=NULL;
            }
            break;
        case 'breed':
            if(isset($_POST['breed']) and $_POST['breed']!="") {
                $query="SELECT * FROM breeds WHERE name='{$value}'";
                $result=$db->query($query);
                $row=$db->fetch_object($result);
                $breed_id = $row->breed_id;
            } else {
                $breed_id=NULL;
            }
            break;
        case 'weight':
            if(isset($_POST['weight']) and $_POST['weight']!="") {
                $weight = filter_var($value, FILTER_VALIDATE_INT);
            } else {
                $weight=NULL;
            }
            break;

        case 'found_when':
            if(isset($_POST['found_when']) and $_POST['found_when']!="") {
                $found_when = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } 
            break;
        case 'found_where':
            if(isset($_POST['found_where']) and $_POST['found_where']!="") {
                $found_where = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } 
            break;

        case 'comment':
            if(isset($_POST['comment']) and $_POST['comment']!="") {
                $comment = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $comment=NULL;
            }
            break;
        case 'status':
            if(isset($_POST['status']) and $_POST['status']!="") {
                $status = filter_var($value, FILTER_VALIDATE_INT);
            } 
            break;
    }
}

$query_dogs=$db->prepare ("UPDATE dogs SET name=?, gender=?, breed_id=?, description=?, age=?, weight=?, found_when=?, found_where=?, status=?, comment=? WHERE dog_id=$dog_id");
$query_dogs->bind_param("ssisiissis", $name, $gender, $breed_id, $description, $age, $weight, $found_when, $found_where, $status, $comment);

$query_dogs->execute();
queryErrorLog ($db);

//prolazak kroz sve karakteristike
$query_char = "SELECT * FROM characteristics WHERE status=1";
$result_char = $db->query($query_char);
queryErrorLog ($db);

$query_dc = "SELECT * FROM dogs_characteristics WHERE dog_id=$dog_id";
$result_dc = $db->query($query_dc);
queryErrorLog ($db);

// kreiranje niza koji ce da sadrzi sve postojece osobine psa 
$existing_characteristics = [];
while ($row_dc = $db->fetch_object($result_dc)) {
    $existing_characteristics["char" . $row_dc->char_id] = true;
}
while ($row_char = $db->fetch_object($result_char)) {
    $char_id = "char" . $row_char->char_id;
    // Provera da li osobina postoji u novoj formi
    $is_in_form_data = isset($_POST[$char_id]) && $_POST[$char_id] != "";
    // Provera da li je ova osobina vec uneta za ovog psa
    $exists_for_dog = isset($existing_characteristics[$char_id]);
    if ($is_in_form_data && !$exists_for_dog) {
        // Ako osobina postoji u formi ali nije vec dodeljena psu - ubaci je
        $insert = "INSERT INTO dogs_characteristics (dog_id, char_id) VALUES ($dog_id, $row_char->char_id)";
        $db->query($insert);
        queryErrorLog ($db);
    } elseif (!$is_in_form_data && $exists_for_dog) {
        // Ako osobina nije u formi ali je vec dodeljena psu - update-uj njen status
        $update = "UPDATE dogs_characteristics SET status=0 WHERE dog_id=$dog_id AND char_id=$row_char->char_id;";
        $db->query($update);
        queryErrorLog ($db);
    }
}

//specijalne potrebe
$query_need="SELECT * FROM special_needs WHERE status=1";
$result_need=$db->query($query_need); 
queryErrorLog ($db);

$query_dn="SELECT * FROM dogs_needs WHERE dog_id=$dog_id";
$result_dn=$db->query($query_dn); 
queryErrorLog ($db);

$existing_needs = [];
while ($row_dn=$db->fetch_object($result_dn)) {
    $existing_needs["need".$row_dn->need_id] = true;
}

$first_checkbox_checked = isset($_POST['need1']) && $_POST['need1'] != "";

if($first_checkbox_checked) {
    while($row_need=$db->fetch_object($result_need)) {
        $need_id = "need".$row_need->need_id;
        if($need_id=="need1") {
            if(!isset($existing_needs[$need_id])) {
                $update="UPDATE dogs_needs SET status=1 WHERE dog_id=$dog_id AND need_id=$row_need->need_id";
                $db->query($update);
                queryErrorLog ($db);
            } else {
                $update="UPDATE dogs_needs SET status=0 WHERE dog_id=$dog_id AND need_id=$row_need->need_id";
                $db->query($update);
                queryErrorLog ($db);
            }
        } else {
            if(isset($_POST[$need_id]) and $_POST[$need_id] != "") {
                if(!isset($existing_needs[$need_id])) {
                    $insert="INSERT INTO dogs_needs (dog_id, need_id, status) VALUES ($dog_id, $row_need->need_id, 1)";
                    $db->query($insert);
                    queryErrorLog ($db);
                } else {
                    $update="UPDATE dogs_needs SET status=1 WHERE dog_id=$dog_id AND need_id=$row_need->need_id";
                    $db->query($update);
                    queryErrorLog ($db);
                }
            } else {
                if(isset($existing_needs[$need_id])) {
                    $update="UPDATE dogs_needs SET status=0 WHERE dog_id=$dog_id AND need_id=$row_need->need_id";
                    $db->query($update);
                    queryErrorLog ($db);
                }
            }
        }

    }
} else {
    $update_all = "UPDATE dogs_needs SET status=0 WHERE dog_id=$dog_id AND need_id>1";
    $db->query($update_all);
    queryErrorLog ($db);

    if(!isset($existing_needs['need1'])) {
        $insert="INSERT INTO dogs_needs (dog_id, need_id, status) VALUES ($dog_id, 1, 1)";
        $db->query($insert);
        queryErrorLog ($db);
    }
}

$upload_dir = '../uploads/dog_imgs/'; 
if (!empty($_FILES['new_img']['name'])) {  
    $img_name = $_FILES['new_img']['name'];
    $img_size=$_FILES['new_img']['size'];
    $img_temp = $_FILES['new_img']['tmp_name'];
    $img_type = $_FILES['new_img']['type'];
    $img_path = $upload_dir . $img_name;
    $max_img_size = 500*1024;

    if(getimagesize($img_temp)!=false) {
        $allowed_types=['image/jpeg','image/jpg','image/png', 'image/gif', 'image/webp','image/avif'];
        $img_type=mime_content_type($img_temp);
        if(in_array($img_type, $allowed_types)) {
            if($img_size<=$max_img_size) {
                $query="SELECT * FROM dog_imgs";
                $result=$db->query($query);
                queryErrorLog ($db);
                $id=$db->num_rows($result)+1;
                $new_img_name=$name."_".$dog_id.".".pathinfo($img_name, PATHINFO_EXTENSION);
               // echo $new_img_name;
                $img_path=$upload_dir.$new_img_name;
                $img_path_abs=substr($img_path,3);
                if(move_uploaded_file($img_temp,$img_path)){
                    $stmt = $db->prepare("INSERT INTO dog_imgs (dog_id, img_source, name) VALUES (?, ?, ?)");
                    $stmt->bind_param('dss', $dog_id, $img_path_abs, $new_img_name);
                    $stmt->execute();
                    $new_img_id = $db->insert_id(); 
                    $stmt = $db->prepare("UPDATE dog_imgs SET profile = 'ne' WHERE dog_id = ? AND profile = 'da' AND img_id != ?");
                    $stmt->bind_param('ii', $dog_id, $new_img_id);
                    $stmt->execute();
                } else {
                    $answer['error']="Greška pri prebacivanju slike.";
                }
            } else {
                $answer['error']="Slika je prevelika.";
            }
        } else {
            $answer['error']="Nije dozovoljena slika ovog tipa.";
        }
    } else {
        $answer['error']="Izabrani fajl nije slika.";
    }
} else {
    $answer['img_src']=$_POST['old_img'];
    //$img_path_abs=$_POST['old_img'];
}
                 
if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    writeIntoStatistics ($db, $message, $email);
}
             
echo JSON_encode($answer, 256);
?>


 