<?php
require_once("../classes/class_base.php");

$db=new Base();
if(!$db->connect()) exit();
$token = $_GET['token'];

$query = $db->prepare("SELECT * FROM reset_passwords WHERE token=?");
$query->bind_param("s", $token);
$query->execute();
$result = $query->get_result(); 
if($db->num_rows($result)==1) {
    $row=$db->fetch_object($result);
    if(date('Y-m-d H:i:s')<=$row->valid_to){
        setcookie("email", $row->email, time()+900, "/");//proveri vaznost cookie-a
        header("Location: ../change_password.php");
    } else {
        echo "Važnost Vašeg linka je istekla.";
    }
} else {
    echo "Došlo je do greške.";
}
$db-close();                       
?>

