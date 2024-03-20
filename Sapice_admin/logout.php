<?php
    session_start();
    require_once("classes/class_base.php");
    require_once("include/functions.php");
    $db=new Base();
    if(!$db->connect()) exit;

    $page=$_GET['page'];
    $message = "Korisnik se izlogovao";
    writeIntoStatistics ($db, $message, $_SESSION['email'], $page); 
    session_unset();
    session_destroy();
    setcookie("email", "", time() - 3600);
    $db->close();
    header("Location:logout_success.php");
?>