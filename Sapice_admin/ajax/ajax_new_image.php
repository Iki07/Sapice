<?php
session_start();
require_once("../include/functions.php");
require_once("../classes/class_base.php");
loginCheck();
$email=$_SESSION['email'];
$answer=array(
    "error"=>"",
    "success"=>"",
    "img_id"=>""
);
$db=new Base();
if(!$db->connect()) exit;


foreach ($_POST as $key => $value) {
    
    switch ($key) {
        case 'img-name':
            if(isset($_POST['img-name']) and $_POST['img-name']!="") {
                $new_img_name = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $new_img_name=date("Y-m-d_h:i:s");
            }
            break;

        case 'img-category':            
            if(isset($_POST['img-category']) and $_POST['img-category']!=0) {
                $category_id=$_POST['img-category'];
            } else {
                $category_id = 1;
            }
            break;
    }

}


$query_cat="SELECT * FROM img_categories WHERE category_id=$category_id";
$result=$db->query($query_cat);
$row=$db->fetch_object($result);
$category=$row->name;
queryErrorLog ($db);


$upload_dir = '../uploads/'.$category.'/'; 

if (!is_dir($upload_dir)) {
    if (!mkdir($upload_dir, 0777, true)) {
        $answer['error'] = "Došlo je do greške pri kreiranju foldera.";
        echo JSON_encode($answer, 256);
        exit;
    }
}



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
                $new_img_name=$new_img_name.".".pathinfo($img_name, PATHINFO_EXTENSION);
                $img_path=$upload_dir.$new_img_name;
                $img_path_abs=substr($img_path,3);

                if(move_uploaded_file($img_temp,$img_path)){
                    $add_img=$db->prepare("INSERT INTO images (img_source, name) VALUES (?,?)");
                    $add_img->bind_param("ss", $img_path_abs, $new_img_name);
                    $add_img->execute();
                    $last_added_img_id=$db->insert_id();
                    writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu images.', $email);

                    $update_iic=$db->prepare("INSERT INTO images_img_categories (img_id, category_id) VALUES (?,?)");
                    $update_iic->bind_param("ii", $last_added_img_id, $category_id);
                    $update_iic->execute();
                    writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu images_img_categories.', $email);

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
} 

if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    $answer['img_id']=$last_added_img_id;
    writeIntoStatistics ($db, $message, $email);
}

echo JSON_encode($answer, 256);
?>


 