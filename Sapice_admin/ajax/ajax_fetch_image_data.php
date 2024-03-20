<?php
    session_start();
    require_once("../classes/class_base.php");
    require_once("../include/functions.php");
    $db=new Base();
    if(!$db->connect()) exit();


    $id = $_GET['id'];
    $category_id = $_GET['category_id'];
    if($category_id==2){
        $id="di_".$_GET['id'];
    } else {
        $id="i_".$_GET['id'];
    }
    $query = "SELECT * FROM all_images WHERE img_id='{$id}'";
    $result = $db->query($query);
    queryErrorLog ($db, $_SESSION['email']);

    $row = $db->fetch_assoc($result);
        
    echo json_encode($row, 256);

?>
