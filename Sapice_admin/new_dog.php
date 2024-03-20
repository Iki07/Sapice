<?php
    session_start();
    require_once("include/functions.php");
    loginCheck();
    require_once("classes/class_base.php");
    $db=new Base();
    if(!$db->connect()) exit();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once("components/_admin_head.php");?>
    <title>Unos novog psa u bazu</title>
</head>
<body>

<div class="container">

    <?php require_once("components/_admin_header.php");?>

    <div class="row admin">
        <div class="col-8 mb-5 ">
            <h2>Unos novog psa u bazu</h2>
        </div><!--col-6-->
        <div class="col-4 text-end align-self-center">
            <a href="logout.php?page=new_dog.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
        </div><!--col-6 text-end-->
    <!--</div>row-admin

    <div class="row admin">-->
        <div class="col-8 me-auto">

            <form id="dog-form" method="POST" enctype="multipart/form-data">
                <div class="row mb-3">
                    <div class="col-6">
                        <label for="name" class="form-label">Unesite ime:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Unesite ime kuce">
                    </div><!--ime-->

                    <div class="col-6">
                        <label for="image" class="form-label">Izaberite profilnu sliku psa:</label>
                        <input type="file" class="form-control" id="image" name="image">
                    </div><!--profilna slika-->
                </div>

                <div class="row">
                    <div class="col-6">
                        <label for="gender" class="form-label">Kog je pola pas?</label>
                        <select name="gender" id="gender" class="form-select">
                            <option value="0">--Izaberite pol--</option>
                            <option value="Mužjak">Mužjak</option>
                            <option value="Ženka">Ženka</option>
                        </select>
                    </div><!--pol-->

                    <div class="col-6">
                        <label for="breed" class="form-label">Izabrite rasu:</label>
                        <input class="form-control" list="datalistOptions" id="breed" name="breed" placeholder="Izaberite/unesite rasu">
                        <datalist id="datalistOptions">
                            <?php
                                $query="SELECT * FROM breeds WHERE status=1";
                                $result=$db->query($query);
                                while($row=$db->fetch_object($result)) {
                                    echo "<option value='{$row->name}'>{$row->name}</option>";
                                }
                            ?>
                        </datalist>
                    </div><!--rase-->
                </div>

                <div class="mb-3 mt-3">
                    <label for="description" class="form-label">Unesite kratak opis psa:</label>
                    <textarea name="description" id="description" rows="2" class="form-control"></textarea>
                </div><!--opis-->

                <div class="row">
                    <div class="col-6">
                        <label for="age" class="form-label">Unesite godine:</label>
                        <input type="number" class="form-control" min="0" max="20" id="age" name="age" placeholder="Unesite koliko pas ima godina">
                    </div><!--godine-->
                    <div class="col-6">
                        <label for="weight" class="form-label">Unesite težinu:</label>
                        <input type="number" class="form-control" id="weight" name="weight" placeholder="Unesite koliko pas ima kilograma">
                    </div><!--težina-->
                </div>

                <div class="row">
                    <div class="col-6 mb-3 mt-3">
                        <label for="found_when" class="form-label">Izaberite datum kada je pas nadjen:</label>
                        <input type="date" class="form-control" id="found_when" name="found_when" placeholder="Kada je pas nadjen?">
                    </div><!--vreme kada ja nadjen pas-->

                    <div class="col-6 mb-3 mt-3">
                        <label for="found_where" class="form-label">Gde je pronadjen:</label>
                        <input type="text" class="form-control" id="found_where" name="found_where" placeholder="Približna lokacija gde je kuca nadjena">
                    </div><!--mesto gde je nadjen-->
                </div>

                <div class="mb-3 pb-3 border-bottom light-border osobine">
                    <p>Izaberite sve osobine koje pas poseduje:</p>

                    <?php
                        $query="SELECT * FROM characteristics WHERE status=1";
                        $result=$db->query($query);
                        while($row=$db->fetch_object($result)) {
                            echo "<div class='form-check'>";
                            echo "<input type='checkbox' class='form-check-input' id='c{$row->char_id}' name='c{$row->char_id}' value='{$row->char_id}'>{$row->name}</div>";
                        }
                        ?>
                </div><!--osobine-->

                <div class="mb-3 mt-3 form-check">
                    <input type="checkbox" class="form-check-input" id="spec-needs" name="spec-needs">
                    <label for="spec-needs" class="form-check-label">Da li je u pitanju pas sa posebnim potrebama?</label>
                </div><!--posebne potrebe da/ne?-->
                <div class="mb-3 mt-3 pb-3 osobine border-bottom light-border" id="special-needs" style="display: none;">
                        <?php
                            $query="SELECT * FROM special_needs WHERE status=1";
                            $result=$db->query($query);
                            while ($row=$db->fetch_object($result)){
                                if($row->need_id>1) {
                                    echo "<div class='form-check'>";
                                    echo "<input type='checkbox' class='form-check-input' id='n{$row->need_id}' name='n{$row->need_id}' value='{$row->need_id}'>";
                                    echo "<label for='n{$row->name}' class='form-check-label'>{$row->name}</label></div>";
                                }
                            }
                        ?>
                </div><!--posebne potrebe-->

                <div class="mb-3 mt-3">
                    <label for="comment">Dodatne informacije:</label>
                    <textarea class="form-control" rows="2" id="comment" name="comment" placeholder="Ovde unesite dodatne informacije ukoliko je potrebno..."></textarea>
                </div><!--dodatni komentar-->

                <div class="mb-3 mt-3 d-flex">
                    <button type="submit" class="btn btn-primary me-2" id="dog-submit">Snimi zapis</button>               
                    <button type="button" class="btn btn-secondary me-2" id="cancel" >Odustani</button>
                    <a href="all_dogs.php" class="btn btn-secondary ms-auto" role="button" id="back">Pregled svih pasa</a>
                    <!--<button type="button" class="btn btn-secondary ms-auto" id="back">Pregled svih pasa</button>-->           
                </div><!--buttons-->

            </form>



        </div><!--col-7 me-auto-->

        <?php require_once("components/_admin_menu_left.php");?>
    </div><!--row-admin-->

            <div id="answer">
            <!--ovde ide odgovor-->
            </div>

    <?php require_once("components/_admin_footer.php");?>

</div><!--container-->
    
</body>
</html>

<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script>

<script>
$(function() {
  $("#spec-needs").click(function() {
    if ($(this).is(":checked")) {
        console.log("fja testirana")
        $("#special-needs").show();
    } else {
        $("#special-needs").hide();
    }
  });
})

$("#dog-form").submit(function(e){
    e.preventDefault();
    var formData = new FormData (this);
    console.log(formData);

    $.ajax({
        url: 'ajax/ajax_new_dog.php',
        type: 'POST',
        data: formData,
        success: function (response) {
            let answer=JSON.parse(response);
            if(answer.error!=""){
                $("#answer").addClass("mb-3 alert alert-danger");
                $("#answer").html(answer.error);
                return false;
            } else {
                $("#answer").removeClass("alert alert-danger");
                $("#answer").addClass("mb-3 alert alert-success");
                $("#answer").html(answer.success);
                $('#dog-form').find('input, select, checkbox').prop('disabled', true);
                id=answer.dog_id;
                setTimeout(function(){ 
                    window.location.assign("view_dog.php?id="+id); 
                }, 2000);
            }
        },
        cache: false,
        contentType: false,
        processData: false
    })
})

   $("#cancel").click(function(e) {
    e.preventDefault();
    var r = confirm ("Molimo Vas da obratite pažnju: ukoliko ima unetih podataka - isti neće biti sačuvani. Da li ste sigurni da želite da odustanete?"); 
    if (r == true) { 
        $('#dog-form')[0].reset();
        window.location.href = 'main_admin.php'; 
    } 
});

</script>