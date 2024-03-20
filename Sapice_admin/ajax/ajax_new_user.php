<?php
/*error_reporting(E_ALL); 
ini_set('display_errors', 1);
echo mb_internal_encoding();*/

session_start();
require_once("../include/functions.php");
require_once("../classes/class_base.php");
loginCheck();
$email=$_SESSION['email'];
$answer=array(
    "error"=>"",
    "success"=>"",
    "user_id"=>""
);
$db=new Base();
if(!$db->connect()) exit;

if(!isset($_POST['name']) or $_POST['name']=="") {
    $answer['error'] = "Ime je obavezan podatak.";
    echo JSON_encode ($answer, 256);
    exit;
}
//prosiri ove uslove kasnije ako treba


foreach ($_POST as $key => $value) {
    
    switch ($key) {
        case 'name':
            $name=checkInput($_POST['name'], FILTER_SANITIZE_FULL_SPECIAL_CHARS, "Ime je obavezan podatak.");
            break;

        case 'last-name':
            $last_name=checkInput($_POST['last-name'], FILTER_SANITIZE_FULL_SPECIAL_CHARS, "Prezime je obavezan podatak.");
            break;

        case 'email':
            $email=checkInput($_POST['email'], FILTER_SANITIZE_EMAIL, "Email adresa je obavezan podatak.");
            break;

        case 'phone':
            $phone=checkInput($_POST['phone'], FILTER_SANITIZE_FULL_SPECIAL_CHARS, "", false);
            break;

        case 'role':
            if(isset($_POST['role']) and $_POST['role']!="0") {
                $role_id=$_POST['role'];
            } else {
                $answer['error']="Molimo Vas da dodelite ulogu korisniku.";
                echo JSON_encode ($answer, 256);
                exit;
            }
            break;

    }

}


$pass="12345";

$query=$db->prepare("INSERT INTO users (name, last_name, email, password, phone, role_id) VALUES (?,?,?,?,?,?)");
$query->bind_param("sssssi", $name, $last_name, $email, $pass, $phone, $role_id);




$query->execute();



$last_added_id=$db->insert_id();

writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu users.', $email);


if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    $answer['user_id']=$last_added_id;
    writeIntoStatistics ($db, $message, $email);
}

//unset($name, $last_name, $email, $phone, $role_id);
echo JSON_encode($answer, 256);
?>


 