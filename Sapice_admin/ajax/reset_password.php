<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer/src/Exception.php';
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';

require_once '../PHPMailer/config.php';//


$mail = new PHPMailer;
$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->Port = 587;
$mail->SMTPAuth = true;
$mail->Username = GMAIL_USERNAME;
$mail->Password = GMAIL_PASSWORD;
$mail->SMTPSecure = 'tls';

session_start();
require_once("../classes/class_base.php");
$answer=array(
    "error"=>"",
    "success"=>"",
    "link"=>""
);
$db=new Base();
if(!$db->connect()) exit();

$email = $_POST['email'];
$query = $db->prepare("SELECT * FROM users WHERE email=?");
$query->bind_param("s", $email);
$query->execute();
$result = $query->get_result();
  
if ($db->num_rows($result) > 0) {
    $email=($db->fetch_object($result))->email;
    $reset_token = bin2hex(random_bytes(32));
    $created = date('Y-m-d H:i:s');
    $valid_to = date('Y-m-d H:i:s', strtotime($created) + 900); //token ce vaziti 15 minuta 

    $query = $db->prepare ("INSERT INTO reset_passwords (email, token, created, valid_to) VALUES (?, ?, ?, ?)");
    $query->bind_param("ssss", $email, $reset_token, $created, $valid_to);
    $query->execute();

    $reset_link = "http://localhost/Sapice_complete/Sapice_admin/ajax/token_check.php?token=".$reset_token;
    $answer['success']="Molimo Vas kliknite na sledeći link da biste resetovali lozinku:";
    $answer['link']=$reset_link;

    $mail->setFrom('info@sapice.com', 'Sapice-admin');
    $mail->addAddress(SEND_TO, 'Irena'); //adresa je hard-coded za potrebe demonstracije funkcionalnosti
    $mail->Subject = 'Link za resetovanje lozinke';
    $mail->Body = "Poštovani korisniče,"."\r\n"." Molimo Vas, kliknite na linku nastavku kako biste resetovali svoju lozinku: $reset_link";

    if ($mail->send()) {
        $answer['success'] = 'Email za resetovanje lozinke je uspešno poslat! Molimo proverite svoj inbox.';
    } else {
        $answer['error'] = "Došlo je do greške: " . $mail->ErrorInfo;
    }
}
$db->close();
echo JSON_encode($answer, 256);
?>