<?php
session_start();
require_once("../classes/class_base.php");
require_once("../include/functions.php");

$db = new Base();
if (!$db->connect()) exit();

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $name = $_POST['name'];
    $status = $_POST['status'];
    $id = $_POST['id'];
    $profile = $_POST['profile'];


    // Update the field value in the database
    $query = "UPDATE dog_imgs SET name = ?, profile=?, status=? WHERE img_id = ?";
    $stmt=$db->prepare($query);
    $stmt->bind_param('ssii',$name, $profile, $status,$id);
    $result = $stmt->execute();
    //$result = $db->query($query);

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
