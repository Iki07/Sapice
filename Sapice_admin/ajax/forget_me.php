<?php
    session_start();
    require_once("../classes/class_base.php");

    $db=new Base();
    if(!$db->connect()) exit;

    $query =$db->prepare("UPDATE users SET token = NULL WHERE token = ?");
    $query->bind_param("s", $_COOKIE['remember']);
    $query->execute();

    if($db->error()==""){
        unset($_COOKIE['remember']);
        setcookie("remember", "", time() - 3600, "/");   
    } else {
        echo "Doslo je do greske";
    }
    $db->close();
    header("Location:../logout_success.php");
?>

