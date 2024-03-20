<?php
session_start();
require_once("../include/functions.php");
require_once("../classes/class_base.php");
loginCheck();
$email=$_SESSION['email'];
$answer=array(
    "error"=>"",
    "success"=>"",
    "blog_id"=>""
);
$db=new Base();
if(!$db->connect()) exit;

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
        case 'blog-text':
            if(isset($_POST['blog-text']) and $_POST['blog-text']!="") {
                $blog_text = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $answer['error']="Molimo Vas unesite tekst posta.";
                echo JSON_encode ($answer, 256);
                exit;
            }
            break;
    }
}

$upload_dir = '../uploads/blog_imgs/'; 
if (!empty($_FILES['image']['name'])) {  
    $img_name = $_FILES['image']['name'];
    $img_size=$_FILES['image']['size'];
    $img_temp = $_FILES['image']['tmp_name'];
    $img_type = $_FILES['image']['type'];
    $img_path = $upload_dir . $img_name;

    $max_img_size = 500*1024;
    if(getimagesize($img_temp)!=false) {
        $allowed_types=['image/jpeg','image/jpg','image/png', 'image/gif', 'image/webp','image/avif'];
        $img_type=mime_content_type($img_temp);
        if(in_array($img_type, $allowed_types)) {
            if($img_size<=$max_img_size) {
                $query="SELECT * FROM blogs";
                $result=$db->query($query);
                queryErrorLog ($db);
                $id=$db->num_rows($result)+1;
                $new_img_name="blog_".$id.".".pathinfo($img_name, PATHINFO_EXTENSION);
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
} 

$query_blogs=$db->prepare ("INSERT INTO blogs (title, subtitle, blog_text, img_source, img_name) VALUES (?,?,?,?,?)");
$query_blogs->bind_param("sssss", $title, $subtitle, $blog_text, $img_path_abs, $new_img_name);
$query_blogs->execute();
$last_added_id=$db->insert_id();
writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu blogs.', $email);

$query="SELECT * FROM blog_categories WHERE status=1";
$result=$db->query($query);
queryErrorLog ($db);
while($row=$db->fetch_object($result)){
    if(isset($_POST[$row->blog_category_id]) and $_POST[$row->blog_category_id]==$row->blog_category_id) {
        $add_cat=$db->prepare("INSERT INTO blogs_blog_categories (blog_id, blog_category_id) VALUES (?,?)");
        $add_cat->bind_param("ii", $last_added_id, $row->blog_category_id);
        $add_cat->execute();
        writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu blogs_blog_categories.', $email);
    }
}

if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    $answer['blog_id'] = $last_added_id;
    writeIntoStatistics ($db, $message, $email);
}

echo JSON_encode($answer, 256);
?>


 