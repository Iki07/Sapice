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

$img_id=$_POST['id'];
//$img_data = $_POST['img_data'];
//$original_category=$_POST['original_category'];
//$img_src=$_POST['img_src'];
//echo $img_id." | ".$img_src;

foreach ($_POST as $key => $value) {
    switch ($key) {
        case 'name':
            if(isset($_POST['name']) and $_POST['name']!="") {
                $name = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $name = $img_name=date("Y-m-d_h:i:s").".jpg";
            }
            break;
        case 'category_id':            
            if(isset($_POST['category_id']) and $_POST['category_id']!=0) {
                $category_id=$_POST['category_id'];
            } else {
                $category_id = 1;
            }
            break;
        case 'status':
            if(isset($_POST['status']) and $_POST['status']==0) {
                $status = 0;
            } else {
                $status =1;
            }
    }
}

if($original_category== 2) {
    if($category_id ==2) {
        //update dog_images
        $query_dogs=$db->prepare ("UPDATE dog_imgs SET name=?, status=? WHERE img_id=$img_id");
        $query_dogs->bind_param("si", $name, $status);
        $query_dogs->execute();
        queryErrorLog ($db);
    } else {
        //delete dog_images
        $dog_status=1;
        $query_dogs=$db->prepare ("UPDATE dog_imgs SET status=? WHERE img_id=$img_id");
        $query_dogs->bind_param("i", $dog_status);
        $query_dogs->execute();
        queryErrorLog ($db);
        //insert images
        ("INSERT INTO images (img_source, name) VALUES (?,?)");
        $query_imgs=$db->prepare ("INSERT INTO images (img_source, name) VALUES (?,?)");
        $query_imgs->bind_param("ss", $img_src, $name);
        $query_imgs->execute();
        queryErrorLog ($db);
    }
} else {
    if ($category_id == 2) {
        //insert dogs
        $answer['error']="Ukoliko želite da ovu sliku vežete za konkretnog psa, molimo Vas idite na sledeću stranicu: ";
        $answer['link']="../all_dogs.php";
        //delete images
        $query_imgs=$db->prepare ("UPDATE images SET status=? WHERE img_id=$img_id");
        $query_imgs->bind_param("i", $status);
        $query_imgs->execute();
        queryErrorLog ($db);

    } else {
        // update images (cat, status)
        $query_imgs=$db->prepare ("UPDATE images SET name=?, category_id=?, status=? WHERE img_id=$img_id");
        $query_imgs->bind_param("sii", $name, $category_id, $status);
        $query_imgs->execute();
        queryErrorLog ($db);
    }
}

if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    $answer['id']= $img_id;
    writeIntoStatistics ($db, $message, $email);
}
             
echo JSON_encode($answer, 256);
?>


 