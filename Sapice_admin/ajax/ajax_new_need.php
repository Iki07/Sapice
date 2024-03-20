<?php
session_start();
require_once("../include/functions.php");
require_once("../classes/class_base.php");
//loginCheck(); do I need this?
$email=$_SESSION['email'];
$answer=array(
    "error"=>"",
    "success"=>"",
    "need_id"=>""
);

$db=new Base();
if(!$db->connect()) exit;

if(!isset($_POST['need_name']) or $_POST['need_name']=="") {
    $answer['error'] = "Molimo Vas unesite novu posebnu potrebu.";
    echo JSON_encode ($answer, 256);
    exit;
}



$query=$db->prepare ("INSERT INTO special_needs (name) VALUES(?)");

$query->bind_param("s", $_POST['need_name']);

$query->execute();

$answer['need_id']=$db->insert_id();

writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu special_needs.', $email);




if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    writeIntoStatistics ($db, $message, $email);
}

echo JSON_encode($answer, 256);
?>


 