<?php 
require_once("../classes/class_base.php");

$db=new Base();
if(!$db->connect()) exit();
$answer=array(
    "error"=>"",
    "success"=>""
);

$admin_check_query="SELECT * FROM users WHERE status=1 AND role_id=1";
$result_admin=$db->query($admin_check_query);
$admin_check=$db->num_rows($result_admin);

if(isset($_GET['id'])){
    $id = $_GET['id'];
    $query="SELECT * FROM users WHERE user_id={$id}";
    $result = $db->query($query);
    $row = $db->fetch_object($result);
    if ($row->status==0){
        $answer['error']="Zapis je već u statusu obrisan.";
    } else {
        if($row->role_id==1) {
            $answer['error']="Brisanje nije dozvoljeno. Morate imati bar jednog administratora.";
        } else {
            $query_del="UPDATE users SET status=0 WHERE user_id={$id}";
            $db->query($query_del);
            $answer['success'] = "Zapis je uspešno obrisan.";
        }
    }   
} else {
    $answer['error'] = "Došlo je do greške.";
}

echo json_encode($answer, 256);
?>
