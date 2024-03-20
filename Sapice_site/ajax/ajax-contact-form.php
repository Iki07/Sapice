<?php
    require_once("../../Sapice_admin/classes/class_base.php");
    require_once("../../Sapice_admin/include/functions.php");
    
    $db=new Base();
    if(!$db->connect()) exit();
    $answer=array(
        "error"=>"",
        "success"=>""
    );

    foreach ($_POST as $key => $value) {
    
        switch ($key) {
            case 'name':
                $name=checkInput($_POST['name'], FILTER_SANITIZE_FULL_SPECIAL_CHARS, "Molimo Vas, unesite ime i prezime.");
                break;

            case 'email':
                $email=checkInput($_POST['email'], FILTER_SANITIZE_EMAIL, "Molimo Vas, unesite email adresu.");
                break;

            case 'message':
                $message=checkInput($_POST['message'], FILTER_SANITIZE_EMAIL, "Molimo Vas, unesite Vašu poruku.");
                break;

            case 'reason':
                if(isset($_POST['reason'])) {
                    $reason=$_POST['reason'];
                }
                break;

            case 'dog_id':
                if(isset($_POST['dog_id'])) {
                    $dog_id=$_POST['dog_id'];
                }
                break;
        }
    }

$query=$db->prepare("INSERT INTO messages_contact_form (contact, email, reason, dog_id,message) VALUES (?, ?, ?, ?, ?)");
$query->bind_param("sssis", $name, $email, $reason, $dog_id, $message);
$query->execute();

if($answer['error']=="") {
    $message = "Hvala Vam na interesovanju. Uskoro ćemo Vas kontaktirati.";
    $answer['success'] = $message;
    writeIntoStatistics ($db, $message, $email);
}
$db->close();

echo JSON_encode($answer, 256);
    
?>

