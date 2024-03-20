<?php 

//obrada greske pri izvrsavanju upita i upis u Log fajl ukoliko se poziva iz ajax file-a
function queryErrorLog ($db, $email = null) {
    if ($email===null) {
        $email= $_SESSION['email'];
    }
    if ($db->error()) {
        $error = $db->error();
        Log::writeIntoLog("../logs/" . date("Y-m-d") . "_error_logs.log", "Korisnik: '{$email}', IP: '{$_SERVER['REMOTE_ADDR']}', stranica: '{$_SERVER['PHP_SELF']}', greška: '{$error}'.");
        $answer['error'] = "Došlo je do greške.";
    } else {
        $answer['error']="";
    }
    return $answer;
}


//upis u statistiku
function writeIntoStatistics ($db, $message, $email, $page = null) {
    if($page===null){
        $page=$_SERVER['PHP_SELF'];
    }
    $query = $db->prepare ("INSERT INTO statistics (message, email, ip, page) VALUES (?, ?, ?, ?)");
    $query->bind_param("ssss", $message, $email, $_SERVER['REMOTE_ADDR'], $page);
    $query->execute();

    queryErrorLog ($db, $email);
}

function loginCheck() {
    if(!isset($_SESSION['email'])) {
        echo "<script>";
        echo "alert('Morate biti ulogovani');";
        echo "window.location.assign('login.php');";
        echo "</script>";
    }
}

function filterInput($input, $filter) {
    if (isset($_POST[$input]) && $_POST[$input] !== "") {
        return filter_var($_POST[$input], $filter);
    } else {
        return NULL;
    }
}

function getBreedId($db, $value) {
    if(isset($_POST['breed']) and $_POST['breed']!="") {
        $query="SELECT * FROM breeds WHERE name='{$value}'";
        $result=$db->query($query);
        queryErrorLog ($db);
        $row=$db->fetch_object($result);
        return $row->breed_id;
    } else {
        return NULL;
    }
}

function addDogImg($db, $img_path, $last_added_id, $new_img_name, $email) {
    $add_img=$db->prepare("INSERT INTO dog_imgs (img_source, dog_id, name, profile) VALUES (?,?,?,'da')");
    $add_img->bind_param("sis", $img_path, $last_added_id, $new_img_name);
    $add_img->execute();
    return $last_added_img_id=$db->insert_id();
    writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu dog_imgs.', $email);
}

function addDogDogImg($db, $last_added_id, $id, $email) {
    $update_ddi=$db->prepare("INSERT INTO dogs_dog_images (dog_id, img_id) VALUES (?,?)");
    $update_ddi->bind_param("ii", $last_added_id, $id);
    $update_ddi->execute();
    writeIntoStatistics ($db, 'Uspešan unos podataka u tabelu dogs_dog_images.', $email);
}

/*function getImageData ($img, $upload_dir) {
    $img_name = $img['name'];
    $img_size = $img['size'];
    $img_temp = $img['tmp_name'];
    $img_type = $img['type'];
    $img_path = $upload_dir . $img_name;
    $max_img_size = 500 * 1024;

    return array(
        'img_name' => $img_name,
        'img_size' => $img_size,
        'img_temp' => $img_temp,
        'img_type' => $img_type,
        'img_path' => $img_path,
        'max_img_size' => $max_img_size
    );
}*/

//vidi da zamenis filter input sa ovim u ajax_new dog and update dog
function checkInput($input, $filter, $message, $mandatory='true') {
    global $answer;
    if(isset($input) and $input!="") {
        return filter_var($input,$filter);
    } else {
        if ($mandatory) {
            return $answer['error']=$message;
            echo JSON_encode ($answer, 256);
        } else {
            return NULL;
        }
        
    }
}

?>