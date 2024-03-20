<?php
session_start();
require_once("../classes/class_base.php");
require_once("../include/functions.php");

$db = new Base();
if (!$db->connect()) exit();

$name = $_POST['name'];
$status = $_POST['status'];
$id = $_POST['id'];
$table = $_POST['table'];
$column = $_POST['column'];

updateSimpleTable($db, $table, $column, $id, $name, $status);

function updateSimpleTable ($db, $table_name, $column, $id, $name, $status) {
    $query = "UPDATE {$table_name} SET name = ?, status=? WHERE {$column} = ?";
    $stmt=$db->prepare($query);
    $stmt->bind_param('sii',$name, $status,$id);
    $result = $stmt->execute();
        if ($result) {
        $response = [
            'success' => 'Podatak je uspešno izmenjen.',
            'error' => ''
        ];
    } else {
        $response = [
            'success' => '',
            'error' => 'Greška pri ažuriranju polja.'
        ];
    }

    echo json_encode($response);
}
?>
