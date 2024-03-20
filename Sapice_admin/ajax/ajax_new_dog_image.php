<?php
session_start();
$email=$_SESSION['email'];
require_once("../classes/class_base.php");
require_once("../include/functions.php");
$answer=array(
    "error"=>"",
    "success"=>"",
    "img_name"=>"",
    "img_id"=>"",
    "profile"=>"",
    "img_src"=>""
);
$db=new Base();
if(!$db->connect()) exit;

$dog_id=$_POST['dog_id'];
$dog_name=$_POST['dog_name'];
$profile=$_POST['editDropdownFieldValue1'];
$answer['profile']=$profile;
   
$upload_dir = '../uploads/dog_imgs/'; 

if ($_FILES['dog-image']['error']==0) {  
    $img_name = $_FILES['dog-image']['name'];
    $img_size=$_FILES['dog-image']['size'];
    $img_temp = $_FILES['dog-image']['tmp_name'];
    $img_type = $_FILES['dog-image']['type'];
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
                $new_img_name=$_POST['dog_name']."_".$id.".".pathinfo($img_name, PATHINFO_EXTENSION);
                $img_path=$upload_dir.$new_img_name;
                $answer['img_name'] = $new_img_name;
                $img_path_abs=substr($img_path,3);
                $answer['img_src']=$img_path_abs;
                move_uploaded_file($img_temp,$img_path);

                $stmt = $db->prepare("INSERT INTO dog_imgs (dog_id, img_source, name, profile) VALUES (?,?,?,?)");
                $stmt->bind_param('dsss', $dog_id, $img_path_abs, $new_img_name, $profile);
                $stmt->execute();
                $new_img_id = $db->insert_id(); // Get the ID of the newly inserted image.
                $answer['img_id']=$new_img_id;

                // Step 2: Find the old profile image and set its status to not profile.
                if($profile=="da") {
                    $stmt = $db->prepare("UPDATE dog_imgs SET profile = 'ne' WHERE dog_id = ? AND profile = 'da' AND img_id != ?");
                    $stmt->bind_param('ii', $dog_id, $new_img_id);
                    $stmt->execute();
                    $answer['profile']="da";
                } else {
                    $answer['profile']="ne";
                }
            }
        }
    }
} //else {
   // $answer['img_src'] = $_POST['old_img'];//
//}

if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    writeIntoStatistics ($db, $message, $email);
}

echo JSON_encode($answer, 256);
?>


 