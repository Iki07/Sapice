<?php
    session_start();
    require_once("../classes/class_base.php");
    require_once("../include/functions.php");
    $db=new Base();
    if(!$db->connect()) exit();


    $id = $_GET['id'];
    $query = "SELECT * FROM users WHERE user_id=$id";
    $result = $db->query($query);
    queryErrorLog ($db, $_SESSION['email']);

    $row = $db->fetch_assoc($result);
  
    echo json_encode($row, 256);

?>
