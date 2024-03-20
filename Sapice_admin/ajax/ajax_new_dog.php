<?php
session_start();
require_once("../include/functions.php");
require_once("../classes/class_base.php");
loginCheck();
$email=$_SESSION['email'];
$answer=array(
    "error"=>"",
    "success"=>"",
    "dog_id"=>""
);
$db=new Base();
if(!$db->connect()) exit;

if(!isset($_POST['name']) or $_POST['name']=="") {
    $answer['error'] = "Ime je obavezan podatak.";
    echo JSON_encode ($answer, 256);
    exit;
}

foreach ($_POST as $key => $value) {
    switch ($key) {
        case 'name':
            $name = filter_var($_POST['name'], FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            break;

        case 'gender':
            $gender = $_POST['gender'];
            break;

        case 'description':
            $description = filterInput('description', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            break;

        case 'age':
            $age = filterInput('age', FILTER_VALIDATE_INT);
            break;

        case 'breed':
            $breed_id = getBreedId($db, $value);
            break;

        case 'weight':
            $weight = filterInput('weight', FILTER_SANITIZE_NUMBER_FLOAT);
            break;

        case 'found_when':
            $found_when = filterInput('found_when', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            break;

        case 'found_where':
            $found_where = filterInput('found_where', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            break;

        case 'comment':
            $comment = filterInput('comment', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            break;
    }

}

$query_dogs=$db->prepare ("INSERT INTO dogs (name, gender, age, breed_id, weight, found_when, found_where, description, comment) VALUES(?,?,?,?,?,?,?,?,?)");
$query_dogs->bind_param("ssiidssss", $name, $gender, $age, $breed_id, $weight, $found_when, $found_where, $description, $comment);
$query_dogs->execute();
$last_added_id=$db->insert_id();

writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu dogs.', $email);


$query="SELECT * FROM characteristics WHERE status=1";
$result=$db->query($query);
queryErrorLog ($db);
while($row=$db->fetch_object($result)){
    if(isset($_POST["c".$row->char_id]) and $_POST['c'.$row->char_id]==$row->char_id) {
        $add_char=$db->prepare("INSERT INTO dogs_characteristics (dog_id, char_id) VALUES (?,?)");
        $add_char->bind_param("ii", $last_added_id, $row->char_id);
        $add_char->execute();
        writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu dogs_characteristics.', $email);
    }
}

if(!isset($_POST['spec-needs'])) {
    $query=$db->prepare("INSERT INTO dogs_needs (dog_id, need_id) VALUES (?, 1)");
    $query->bind_param("i", $last_added_id);
    $query->execute();
    writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu dogs_needs.', $email);
    } else {
        $query="SELECT * FROM special_needs WHERE status=1";
        $result=$db->query($query); 
        $i=0;
        while($row=$db->fetch_object($result)) {
            if($row->need_id>1) {
                if(isset($_POST['n'.$row->need_id]) and $_POST['n'.$row->need_id]==$row->need_id) {
                $add_need=$db->prepare("INSERT INTO dogs_needs (dog_id, need_id) VALUES (?,?)");
                $add_need->bind_param("ii", $last_added_id, $row->need_id);
                $add_need->execute();
                writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu dogs_needs.', $email);
                $i++;
                echo "i je: ".$i;
                } 
            }
        }
        if($i==0) {
            echo "i je: ".$i;
            $answer['error']="Čekirali ste da pas ima posebne potrebe. Molimo Vas da definišete koje.";
            exit;
        }
    }

$upload_dir = '../uploads/dog_imgs/'; 
if (!empty($_FILES['image']['name'])) {  
    $img_name = $_FILES['image']['name'];
    $img_size=$_FILES['image']['size'];
    $img_temp = $_FILES['image']['tmp_name'];
    $img_type = $_FILES['image']['type'];
    $img_path = $upload_dir . $img_name;
    $max_img_size = 500*1024;
    if(getimagesize($img_temp)!=false) {//d
        $allowed_types=['image/jpeg','image/jpg','image/png', 'image/gif', 'image/webp','image/avif'];
        $img_type=mime_content_type($img_temp);
        if(in_array($img_type, $allowed_types)) {//c
            if($img_size<=$max_img_size) {//b
                $query="SELECT * FROM dog_imgs";
                $result=$db->query($query);
                queryErrorLog ($db);
                $id=$db->num_rows($result)+1;
                $new_img_name=$_POST['name']."_".$id.".".pathinfo($img_name, PATHINFO_EXTENSION);
                $img_path=$upload_dir.$new_img_name;
                $img_path_abs=substr($img_path,3);
                if(move_uploaded_file($img_temp,$img_path)){
                    addDogImg($db, $img_path_abs, $last_added_id, $new_img_name, $email);
                    addDogDogImg($db, $last_added_id, $id, $email);
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
    $new_img_name = 'avatar_'.$last_added_id.'.jpg';
    if (!file_exists($upload_dir.$new_img_name)) {
        copy($upload_dir.'avatar.jpg', $upload_dir.$new_img_name);
    }
    $img_src = substr($upload_dir.$new_img_name,3);
    addDogImg($db, $img_src, $last_added_id, $new_img_name, $email);
}

if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    $answer['dog_id']=$last_added_id;
    writeIntoStatistics ($db, $message, $email);
}

echo JSON_encode($answer, 256);
?>


 