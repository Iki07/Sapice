<?php
    session_start();
    require_once("include/functions.php");
    loginCheck();
    require_once("classes/class_base.php");
    $db=new Base();
    if(!$db->connect()) exit();
    isset($_GET['id'])? $id=$_GET['id']: $id=NULL;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once("components/_admin_head.php");?>
    <title>Pas-info</title>
</head>
<body>

<div class="container">

    <?php require_once("components/_admin_header.php");?>

    <div class="row admin">
        <div class="col-8 mb-5 ">
            <h2>Pregled unetih informacija o psu</h2>
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
                        <label for="name" class="form-label">Ime:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Unesite ime kuce">
                    </div><!--ime-->

                    <div class="col-2" >
                        <img name="old_img" id="old_img" src="" alt="profilna slika" height="100"></img>
                    </div>
                   <div class="col-4 align-self-center">
                        <input type="file" class="form-control" id="new_img" name="new_img" style="display: none;">
                    </div><!--profilna slika-->
                </div>

                    <div class="row">
                    <div class="col-6">
                        <label for="gender" class="form-label">Pol:</label>
                        <select name="gender" id="gender" class="form-select">
                            <option value="0">--Izaberite pol--</option>
                            <option value="Mužjak">Mužjak</option>
                            <option value="Ženka">Ženka</option>
                        </select>
                    </div><!--pol-->

                    <div class="col-6">
                        <label for="breed" class="form-label">Rasa:</label>
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
                    <label for="description" class="form-label">Kratak opis psa:</label>
                    <textarea name="description" id="description" rows="3" class="form-control"></textarea>
                </div><!--opis-->

                <div class="row">
                    <div class="col-6">
                        <label for="age" class="form-label">Godine:</label>
                        <input type="number" class="form-control" min="0" max="20" id="age" name="age" placeholder="Unesite koliko pas ima godina">
                    </div><!--godine-->
                    <div class="col-6">
                        <label for="weight" class="form-label">Težina:</label>
                        <input type="number" class="form-control" id="weight" name="weight" placeholder="Unesite koliko pas ima kilograma">
                    </div><!--težina-->
                </div>

                <div class="row">
                    <div class="col-6 mb-3 mt-3">
                        <label for="found_when" class="form-label">Datum kada je pas nadjen:</label>
                        <input type="date" class="form-control" id="found_when" name="found_when" placeholder="Kada je pas nadjen?">
                    </div><!--vreme kada ja nadjen pas-->

                    <div class="col-6 mb-3 mt-3">
                        <label for="found_where" class="form-label">Gde je pronadjen:</label>
                        <input type="text" class="form-control" id="found_where" name="found_where" placeholder="Približna lokacija gde je kuca nadjena">
                    </div><!--mesto gde je nadjen-->
                </div>

                <div class="mb-3 pb-3 border-bottom light-border osobine">
                    <p>Osobine koje pas poseduje:</p>

                    <?php
                        $query="SELECT * FROM characteristics WHERE status=1";
                        $result=$db->query($query);
                        while($row=$db->fetch_object($result)) {
                            echo "<div class='form-check'>";
                            echo "<input type='checkbox' class='form-check-input' id='char{$row->char_id}' name='char{$row->char_id}' value='char{$row->char_id}'>{$row->name}</div>";
                        }
                    ?>
                </div><!--osobine-->

                <div class="mb-3 mt-3 form-check">
                    <input type="checkbox" class="form-check-input" id="need1" name="need1">Pas ima posebne potrebe:
                </div><!--posebne potrebeČ da/ne?-->
                <div class="mb-3 mt-3 pb-3 osobine border-bottom light-border" id="special-needs" style="display: none;">
                        <!--<p>Izaberite posebne potrebe koje pas ima:</p>-->
                        <?php
                            $query="SELECT * FROM special_needs WHERE status=1";
                            $result=$db->query($query);
                            while ($row=$db->fetch_object($result)){
                                if($row->need_id>1) {
                                    echo "<div class='form-check'>";
                                    echo "<input type='checkbox' class='form-check-input' id='need{$row->need_id}' name='need{$row->need_id}'>{$row->name}</div>";
                                }
                            }
                        ?>
                </div><!--posebne potrebe-->

                <div class="mb-3 mt-3">
                    <label for="comment">Dodatne informacije:</label>
                    <textarea class="form-control" rows="3" id="comment" name="comment" placeholder="Ovde unesite dodatne informacije ukoliko je potrebno..."></textarea>
                </div><!--dodatni komentar-->

                <div class="row">
                    <div class="mb-3 mt-3">
                        <label for="gender" class="form-label">Status zapisa:</label>
                        <select name="status" id="status" class="form-select">
                            <option value="0" disabled>Obrisan</option>
                            <option value="1">Za usvajanje</option>
                            <option value="2">Usvojen</option>
                        </select>
                    </div><!--status-->
                </div>

                <div class="mb-3 mt-3 d-flex">
                <?php if($id) {?>
                    <button type="button" class="btn btn-primary me-2" id="change">Izmeni zapis</button>

                    <button type="button" class="btn btn-primary me-2" id="new-dog">Dodaj novi zapis</button>

                    <button type="submit" class="btn btn-primary me-2" id="update" style="display: none;">Sacuvaj izmene</button>

                    <button type="button" class="btn btn-secondary me-2" id="cancel" style="display: none;">Odustani</button>

                    <button type="button" class="btn btn-secondary me-2" id="back">Pregled svih pasa</button>

                    <button type="button" class="btn btn-danger ms-auto" id="delete">Obrisi</button>
                <?php } ?>
                </div><!--buttons-->
            </form>



        </div><!--col-7 me-auto-->

        <?php require_once("components/_admin_menu_left.php");?>
    </div><!--row-admin-->

            <div id="answer">
                <?php if(!$id) {?>
                <div class="alert alert-danger">Morate izabrati psa da biste videli informacije. Molimo Vas idite na stranu: <br><a href="all_dogs.php">Svi psi - pregled informacija</a> </div>
                <?php }?>
                <!--ovde ide odgovor-->
            </div>

    <?php require_once("components/_admin_footer.php");?>

</div><!--container-->
    
</body>
</html>

<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script>
<script>
jQuery(document).ready(function($) {
    // Change button click event
    $(document).on('click', '#change', function(e) {
        e.preventDefault();
        $("input, select, textarea").removeAttr("disabled");
        $(this).hide();
        $("#new-dog").hide();
        $("#update").show();
        $("#cancel").show();
        $("#new_img").show();
    });

    // Cancel button click event
    $(document).on('click', '#cancel', function(e) {
        e.preventDefault();
        $("input, select, textarea").attr("disabled", "disabled");
        $(this).hide();
        $("#new-dog").show();
        $("#update").hide();
        $("#change").show();
        $("#new_img").hide();
    });

    // New-dog button click event
    $(document).on('click', '#new-dog', function(e) {
        e.preventDefault();
        window.location.href = 'new_dog.php'; 
    });

    // Back to overview button click event
    $(document).on('click', '#back', function(e) {
        e.preventDefault();
        window.location.href = "all_dogs.php";
    });

    // Update button click event
    $("#dog-form").submit(function(e) {
        e.preventDefault();
        var formData = new FormData (this);
        var id='<?php echo $id; ?>';
        var old_img=$("#old_img").attr('src');
        console.log(formData);
        formData.append('id', id); 
        formData.append('old_img', old_img);
        $.ajax({
            url: 'ajax/ajax_update_dog.php',
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
                    $('#blog-form').find('input, select, checkbox').prop('disabled', true);
                    id=answer.id;
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
})

$(function() {
  $("#need1").click(function() {
    if ($(this).is(":checked")) {
        console.log("fja testirana")
        $("#special-needs").show();
    } else {
        $("#special-needs input[type='checkbox']").prop('checked', false);
        $("#special-needs").hide();
    }
  });
})
    
populateFields(); 

// Delete button click event
$(document).on('click', '#delete', function(e) {
    e.preventDefault();
    var confirmation = confirm("Da li ste sigurni da zelite da obrisete ovaj zapis?");
    if (confirmation) {
        var id = '<?php echo $id; ?>';
        $.ajax({
            url: "ajax/ajax_delete_dog.php",
            type: 'GET',
            data: { id: id },
            success: function(result) {
                console.log(result);
                window.location.href = "all_dogs.php";
            },
            error: function(err) {
                console.log(err);
            }
        });
    }
});

function populateFields(){
    console.log("populate fields fja je pozvana");
    let id='<?php echo $id; ?>';
    console.log("id: " +id);
    let form_elements = $("form#dog-form :input[name]");
    let names=[];

    form_elements.each(function() {
        names.push($(this).attr("name"));
        $(this).prop("disabled", true);
    });
    console.log ("form names: " + names);
    $.ajax({
        url: "ajax/ajax_fetch_dog_data.php",
        method: "GET",
        data: {id},
        success: function (data) {
            let answer=JSON.parse(data);
            console.log ("data: " + data);
            $("#special-needs").show();
            for (var key in answer) {
                console.log("key:" +key);
                if (answer.hasOwnProperty(key)){
                        if(key.slice(0,4)=="char" || key.slice(0,4)=="need"){
                            $("[name='" + key + "']").prop("checked", true);
                            console.log("key: " + key + " and value is checked");
                        } else if (key=="profile_img") {
                            $("[name='old_img']").prop("src", answer[key]);
                            console.log("key: " + key + " and value: " + answer[key]);
                        } else {
                            $("[name='" + key + "']").val(answer[key]);
                            console.log("key: " + key + " and value: " + answer[key]);
                        }   
                    }
                }
            },
        error: function (xhr, status, error){
            console.log("Error: " + error);
        }
    })
}

//ovo moze u functions.js  
function gatherFormData(formId) {
    var form = document.getElementById(formId);
    var inputs = form.elements;
    var obj = {};
    for(var i = 0; i < inputs.length; i++) {
        if(inputs[i].name) {
            if(inputs[i].type === "checkbox") {
                if(inputs[i].checked) {
                    obj[inputs[i].name] = inputs[i].value;
                }
            } else {
                obj[inputs[i].name] = inputs[i].value;
            }
        }
    }
    return obj;
}
</script>