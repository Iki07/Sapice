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
    $category_id=$_GET['category_id'];
    if($category_id==2){
        $query_dogs="SELECT * FROM dog_imgs WHERE img_id={$id}";
        $result = $db->query($query_dogs);
        $row = $db->fetch_object($result);
        if ($row->status==0){
            $answer['error']="Zapis je već u statusu obrisan.";
        } else {
            $query_del="UPDATE dog_imgs SET status=0 WHERE img_id={$id}";
            $db->query($query_del);
           // $answer['success'] = "Zapis je uspešno obrisan.";
        }
    } else {
        $query="SELECT * FROM images WHERE img_id={$id}";
        $result = $db->query($query);
        $row = $db->fetch_object($result);
        if ($row->status==0){
            $answer['error']="Zapis je već u statusu obrisan.";
        } else {
            $query_del="UPDATE images SET status=0 WHERE img_id={$id}";
            $db->query($query_del);
            //$answer['success'] = "Zapis je uspešno obrisan.";
        } 
    } 
} else {
    $answer['error'] = "Došlo je do greške.";
}
if($answer['error']=="") {$answer['success']="Zapis je uspešno obrisan.";}
echo json_encode($answer, 256);
?>
