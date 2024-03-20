<?php
session_start();
require_once("../include/functions.php");
require_once("../classes/class_base.php");
//loginCheck(); do I need this?
$email=$_SESSION['email'];
$answer=array(
    "error"=>"",
    "success"=>"",
    "breed_id"=>""
);

$db=new Base();
if(!$db->connect()) exit;

if(!isset($_POST['breed_name']) or $_POST['breed_name']=="") {
    $answer['error'] = "Molimo Vas unesite naziv vrste.";
    echo JSON_encode ($answer, 256);
    exit;
}



$query=$db->prepare ("INSERT INTO breeds (name) VALUES(?)");

$query->bind_param("s", $_POST['breed_name']);

$query->execute();

$answer['breed_id']=$db->insert_id();

writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu breeds.', $email);




if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    writeIntoStatistics ($db, $message, $email);
}

echo JSON_encode($answer, 256);
?>


 