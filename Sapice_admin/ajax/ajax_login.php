<?php
session_start();
require_once("../classes/class_base.php");
require_once("../include/functions.php");
$answer=array(
    "error"=>"",
    "success"=>""
);
$db=new Base();
if(!$db->connect()) exit;

$email=$_POST['email'];
$pass=$_POST['pass'];

if($email!="" and $pass!="") {
    $email = trim($email);
    $pass = trim($pass);
    //$pass=md5($_POST['pass']);

    //proveri da li korisnik postoji u bazi
    $query = $db->prepare("SELECT * FROM users WHERE email=?");
    $query->bind_param("s", $email);
    $query->execute();
    $result = $query->get_result(); 
    queryErrorLog ($db, $email);

    if($db->num_rows($result)==1){
        $row=$db->fetch_object($result);
        if($pass==$row->password){
            $_SESSION['id']=$row->user_id;
            $_SESSION['email']=$row->email;
            $_SESSION['role']=$row->role_id;
            $message="Uspešno logovanje korisnika";
            writeIntoStatistics ($db, $message, $email);
                if (isset($_POST['remember']) && $_POST['remember'] == 1) {
                    $token = bin2hex(random_bytes(32)); // generisanje random sigurnosnog tokena
                    $expireTime = time() + (900); // token i cookie isticu za 15min -> produzi vreme naknadno
                    setcookie("remember", $token, $expireTime, "/"); 
                    // Upisi remember token u bazu
                    $query=$db->prepare("UPDATE users SET token=? WHERE email =?");
                    $query->bind_param("ss", $token, $email);
                    $query->execute();
                    queryErrorLog ($db, $email);
                    } 
            $answer['success']="main_admin.php";
        } else {
            $message="Uneta pogrešna lozinka";
            writeIntoStatistics ($db, $message, $email);   
            $answer['error']=$message;
        }
    } else {
        $message = "Korisnik ne postoji";
        writeIntoStatistics ($db, $message, $email); 
        $answer['error']=$message;
    }
} else {
    $message = "Nisu uneti svi podaci";
    writeIntoStatistics ($db, $message, $email);
    $answer['error']=$message;
}
$db->close();
echo JSON_encode($answer, 256);
?>

