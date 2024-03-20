<?php
session_start();
require_once("../include/functions.php");
require_once("../classes/class_base.php");
//loginCheck(); do I need this?
$email=$_SESSION['email'];
$answer=array(
    "error"=>"",
    "success"=>"",
    "role_id"=>""
);

$db=new Base();
if(!$db->connect()) exit;

if(!isset($_POST['role_name']) or $_POST['role_name']=="") {
    $answer['error'] = "Molimo Vas unesite naziv vrste.";
    echo JSON_encode ($answer, 256);
    exit;
}



$query=$db->prepare ("INSERT INTO roles (name) VALUES(?)");

$query->bind_param("s", $_POST['role_name']);

$query->execute();

$answer['role_id']=$db->insert_id();

writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu roles.', $email);




if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    writeIntoStatistics ($db, $message, $email);
}

echo JSON_encode($answer, 256);
?>


 