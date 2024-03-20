<?php
    session_start();
    require_once("../classes/class_base.php");
    require_once("../include/functions.php");
    $db=new Base();
    if(!$db->connect()) exit();

    $id = $_GET['id'];
    $query = "SELECT * FROM blogs WHERE blog_id=$id";
    $result = $db->query($query);
    queryErrorLog ($db, $_SESSION['email']);

    $row = $db->fetch_assoc($result);

    $query_cat="SELECT * FROM blogs_blog_categories WHERE blog_id=$id AND status=1";
    $result_cat=$db->query($query_cat);
    queryErrorLog ($db, $_SESSION['email']);
    $i=0;
    $array_cat=array();
    while ($row_cat=$db->fetch_assoc($result_cat)) {
        $i++;
        $key="cat".$row_cat['blog_category_id'];
        $array_cat[$key]=$row_cat['blog_category_id'];
    }

    $array_new = array_merge($row, $array_cat);

    echo json_encode($array_new, 256);
?>
