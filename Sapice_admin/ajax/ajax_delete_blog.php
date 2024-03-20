<?php 
require_once("../classes/class_base.php");

$db=new Base();
if(!$db->connect()) exit();
$answer=array(
    "error"=>"",
    "success"=>""
);

if(isset($_GET['id'])){
    $id = $_GET['id'];
    $query="SELECT * FROM blogs WHERE blog_id={$id}";
    $result = $db->query($query);
    $row = $db->fetch_object($result);
    if ($row->status==0){
        $answer['error']="Zapis je već u statusu obrisan.";
    } else {
        $query_del="UPDATE blogs SET status=0 WHERE blog_id={$id}";
        $db->query($query_del);
        $answer['success'] = "Zapis je uspešno obrisan.";
    }   
} else {
    $answer['error'] = "Došlo je do greške.";
}

echo json_encode($answer, 256);
?>
