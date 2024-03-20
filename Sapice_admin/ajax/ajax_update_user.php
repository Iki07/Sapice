<?php
session_start();
$email=$_SESSION['email'];
require_once("../classes/class_base.php");
require_once("../include/functions.php");
$answer=array(
    "error"=>"",
    "success"=>"",
    "updated_data"=>""
);
$db=new Base();
if(!$db->connect()) exit;
//echo "ovo je POST: ";
//var_dump($_POST);

$output="";
$user_id=$_POST['user_id'];
$user_data = $_POST['user_data'];
//$user_data = json_decode($_POST['user_data'], true); 
//echo $user." | ".$user_data;
if(!isset($user_data['name']) or $user_data['name']=="") {
    $answer['error'] = "Ime je obavezan podatak.";
    exit;
}
//var_dump($_POST);

foreach ($user_data as $key => $value) {
    $output.= $key.": ".$value." | ";
    
    switch ($key) {
        case 'name':
            if(isset($user_data['name']) and $user_data['name']!="") {
                $name = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $answer['error']="Molimo Vas unesite ime.";
                echo JSON_encode ($answer, 256);
                exit;
            }
            break;

        case 'last_name':
            if(isset($user_data['last_name']) and $user_data['last_name']!="") {
                $last_name = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $answer['error']="Molimo Vas unesite prezime.";
                echo JSON_encode ($answer, 256);
                exit;
            }
            break;

        case 'email':
            if(isset($user_data['email']) and $user_data['email']!="") {
                $email = filter_var($value, FILTER_SANITIZE_EMAIL);
            } else {
                $answer['error']="Molimo Vas unesite email adresu.";
                echo JSON_encode ($answer, 256);
                exit;
            }
            break;

        case 'phone':
            if(isset($user_data['phone']) and $user_data['phone']!="") {
                $phone = filter_var($value, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
            } else {
                $phone=NULL;
            }
            break;

        case 'role_id':
            if(isset($user_data['role_id']) and $user_data['role_id']!=0) {
                $query="SELECT * FROM roles WHERE role_id=$value";
                $result=$db->query($query);
                $row=$db->fetch_object($result);
                $role_id = $row->role_id;
            } else {
                $answer['error']="Molimo Vas da dodelite ulogu korisniku.";
                echo JSON_encode ($answer, 256);
                exit;
            }
            break;

        case 'status':
            if(isset($user_data['status']) and $user_data['status']==0) {
                $status = 0;
            } else {
                $status =1;
            }
    }

}

$query_users=$db->prepare ("UPDATE users SET name=?, last_name=?, email=?, phone=?, role_id=?, status=? WHERE user_id=$user_id");
$query_users->bind_param("ssssii", $name, $last_name, $email, $phone, $role_id, $status);

$query_users->execute();
queryErrorLog ($db);

if($answer['error']=="") {
    $message = "Podaci su uspešno uneti u bazu.";
    $answer['success'] = $message;
    $answer['updated_data']= $user_data;
    writeIntoStatistics ($db, $message, $email);
}
             
echo JSON_encode($answer, 256);
?>


 