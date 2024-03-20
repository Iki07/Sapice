<?php
    session_start();
    require_once("../classes/class_base.php");
    require_once("../include/functions.php");
    $db=new Base();
    if(!$db->connect()) exit();


    $id = $_GET['id'];
    $query = "SELECT * FROM dogs_details WHERE dog_id=$id";
    $result = $db->query($query);
    queryErrorLog ($db, $_SESSION['email']);

    $row = $db->fetch_assoc($result);
            
    if($row['characteristics']!=""){
        $characteristics = explode(", ", trim($row['characteristics']));
        unset($row['characteristics']);
        $new_chars=array();
        $query_char = "SELECT * FROM characteristics WHERE status=1";
        $result = $db->query($query_char);
        queryErrorLog ($db, $_SESSION['email']);
        while($row_char=$db->fetch_assoc($result)) {
            for ($i=0; $i<count($characteristics); $i++) {
                if($row_char['name']==$characteristics[$i]){
                    $key="char".$row_char['char_id'];
                    $new_chars[$key]=$characteristics[$i];
                }
            }
        }
        $array_new = array_merge($row, $new_chars);
    } else {
        $array_new = $row;
    }

    if($row['spec_needs']!=""){
        $new_needs=array();
        $spec_needs = explode(", ", trim($row['spec_needs']));
        unset($row['spec_needs']);
        $query_need = "SELECT * FROM special_needs WHERE status=1";
        $result = $db->query($query_need);
        queryErrorLog ($db, $_SESSION['email']);
        while($row_need=$db->fetch_assoc($result)) {
            for ($i=0; $i<count($spec_needs); $i++) {
                if($row_need['name']==$spec_needs[$i]){
                    if($row_need['need_id']>1){
                        $key="need".$row_need['need_id'];
                        $new_needs[$key]=$spec_needs[$i];
                    }
                }
            }
        }
        $array_new = array_merge($array_new, $new_needs);
    }

    echo json_encode($array_new, 256);

?>
