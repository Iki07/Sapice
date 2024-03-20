<?php
session_start();
require_once("../include/functions.php");
require_once("../classes/class_base.php");
loginCheck();
$email=$_SESSION['email'];
$answer=array(
    "error"=>"",
    "success"=>"",
    "id"=>""
);
$db=new Base();
if(!$db->connect()) exit;

$blog_id=$_POST['id'];

foreach ($_POST as $key => $value) {    
    switch ($key) {
        case 'title':
            if(isset($_POST['title']) and $_POST['title']!="") {
                $title = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $answer['error']="Molimo Vas unesite naslov posta.";
                echo JSON_encode ($answer, 256);
                exit;
            }
            break;
        case 'subtitle':
            if(isset($_POST['subtitle']) and $_POST['subtitle']!="") {
                $subtitle = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $subtitle="";
            }
            break;
        case 'blog_text':
            if(isset($_POST['blog_text']) and $_POST['blog_text']!="") {
                $blog_text = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $answer['error']="Molimo Vas unesite tekst posta.";
                echo JSON_encode ($answer, 256);
                exit;
            }
            break;
        case 'status':
            if(isset($_POST['status']) and $_POST['status']!="") {
                $status = filter_var($value, FILTER_VALIDATE_INT);
            } 
            break;
    }
}

$upload_dir = '../uploads/blog_imgs/'; 
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
               $new_img_name="blog_".$blog_id.".".pathinfo($img_name, PATHINFO_EXTENSION);
                $img_path=$upload_dir.$new_img_name;
                $img_path_abs=substr($img_path,3);
                if(!move_uploaded_file($img_temp,$img_path)){
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
    $img_path_abs=$_POST['old_img'];
}

$query_blogs=$db->prepare ("UPDATE blogs SET title=?, subtitle=?, blog_text=?, img_source=?, img_name=?, status=? WHERE blog_id=?");
$query_blogs->bind_param("ssssssi", $title, $subtitle, $blog_text, $img_path_abs, $new_img_name, $status, $blog_id);
$query_blogs->execute();
writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu blogs.', $email);

$query_cat = "SELECT * FROM blog_categories WHERE status=1";
$result_cat = $db->query($query_cat);
queryErrorLog ($db);

$query_bbc = "SELECT * FROM blogs_blog_categories WHERE blog_id={$blog_id}";
$result_bbc = $db->query($query_bbc);
queryErrorLog ($db);

$existing_categories = [];
while ($row_bbc = $db->fetch_object($result_bbc)) {
    $existing_categories["cat" . $row_bbc->blog_category_id] = true;
}

while ($row_cat = $db->fetch_object($result_cat)) {
    $blog_category_id = "cat" . $row_cat->blog_category_id;
    $is_in_form_data = isset($_POST[$blog_category_id]) && $_POST[$blog_category_id] != "";
    $exists_for_blog = isset($existing_categories[$blog_category_id]);
    if ($is_in_form_data && !$exists_for_blog) {
        $insert = "INSERT INTO blogs_blog_categories (blog_id, blog_category_id) VALUES ($blog_id, $row_cat->blog_category_id)";
        $db->query($insert);
        queryErrorLog ($db);
    } elseif (!$is_in_form_data && $exists_for_blog) {
        $update = "UPDATE blogs_blog_categories SET status=0 WHERE blog_id=$blog_id AND blog_category_id=$row_cat->blog_category_id;";
        $db->query($update);
        queryErrorLog ($db);
    }
}

if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    $answer['id'] = $blog_id;
    writeIntoStatistics ($db, $message, $email);
}

echo JSON_encode($answer, 256);
?>


 