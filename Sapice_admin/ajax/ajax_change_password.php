<?php
session_start();
require_once("../classes/class_base.php");
require_once("../include/functions.php");
$answer=array(
    "error"=>"",
    "success"=>"",
    "link"=>""
);
$db=new Base();
if(!$db->connect()) exit;

$email=$_POST['email'];
$email=trim($email);
$email=filter_var($email, FILTER_SANITIZE_EMAIL, FILTER_FLAG_STRIP_HIGH);

$pass=md5($_POST['pass']);
$pass=$_POST['pass'];
$pass=trim($pass);

if (!preg_match('/[A-Z]/', $pass) || !preg_match('/[a-z]/', $pass) || !preg_match('/[0-9]/', $pass) || !preg_match('/[$@$!%*?&]/', $pass)) {
    $answer['error']="Lozinka ne zadovoljava zadate kriterijume. Pokušajte ponovo.";
  } else {
    $action="promena lozinke";
    $query="UPDATE users SET password='{$pass}' WHERE email='{$email}'";
    $result=$db->query($query);
    if(!$db->error()){
        $message="Uspešno promenjena lozinka korisnika";
        writeIntoStatistics ($db, $message, $email);
        $main_admin_link = "http://localhost/Sapice_final/login.php";
        $answer['link']=$main_admin_link;
        $answer['success']="Uspešno promenjena lozinka. Ulogujte se da biste nastavili rad:";
    } else {
        $message="Greška pri promeni lozinke. Pokušajte ponovo.";
        writeIntoStatistics ($db, $message, $email);
        $answer['error']="Greška pri promeni lozinke. Pokušajte ponovo.";
    }
}
$db->close();
echo JSON_encode($answer, 256);
?>