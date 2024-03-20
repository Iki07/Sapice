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
    <title>Slika-info</title>
</head>
<body>

<div class="container">

    <?php require_once("components/_admin_header.php");?>

    <div class="row admin">
        <div class="col-8 mb-5 ">
            <h2>Detalji unete slike</h2>
        </div><!--col-6-->
        <div class="col-4 text-end align-self-center">
            <a href="logout.php?page=new_dog.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
        </div><!--col-6 text-end-->
    <!--</div>row-admin

    <div class="row admin">-->
        <div class="col-8 me-auto">

            <!--<form onsubmit="dodajPsa(); return false;" enctype="mulitpart/form-data">-->
            <form id="img-form" method="POST" enctype="multipart/form-data">
                <div class="row mb-3">
                    <div class="col-4" >
                        <img name="old_img" id="old_img" src="" alt="slika" height="250"></img>
                    </div>
                    <div class="col-4 align-self-center">
                        <input type="file" class="form-control" id="new_img" name="new_img" style="display: none;">
                    </div><!-- slika-->
                

                
                    <div class="col-6">
                        <label for="name" class="form-label">Ime:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Unesite ime kuce">
                    </div><!--ime-->
                
                    <div class="col-6">
                        <label for="category" class="form-label">Kategorija:</label>
                        <select name="category" id="category" class="form-select">
                            <?php
                                $query="SELECT * FROM img_categories WHERE status=1";
                                $result=$db->query($query);
                                while($row=$db->fetch_object($result)) {
                                    if($row->category_id>1) {
                                        echo "<option value='{$row->category_id}'>{$row->name}</option>";
                                    }
                                }
                            ?>
                        </select>
                    </div><!--kategorije-->
                
                    <div class="mb-3 mt-3">
                        <label for="status" class="form-label">Status zapisa:</label>
                        <select name="status" id="status" class="form-select">
                            <option value="0">Obrisan</option>
                            <option value="1">Aktivan</option>
                        </select>
                    </div><!--status-->
                </div>

                <div class="mb-3 mt-3 d-flex">
                <?php if($id) {?>
                    <button type="button" class="btn btn-primary me-2" id="change">Izmeni zapis</button>

                    <button type="button" class="btn btn-primary me-2" id="new-img">Dodaj novi zapis</button>

                    <button type="submit" class="btn btn-primary me-2" id="update" style="display: none;">Sačuvaj izmene</button>

                    <button type="button" class="btn btn-secondary me-2" id="cancel" style="display: none;">Odustani</button>

                    <button type="button" class="btn btn-secondary me-2" id="back">Pregled svih slika</button>

                    <button type="button" class="btn btn-danger ms-auto" id="delete">Obriši</button>
                <?php } ?>
                </div><!--buttons-->
            </form>



        </div><!--col-7 me-auto-->

        <?php require_once("components/_admin_menu_left.php");?>
    </div><!--row-admin-->

            <div id="answer">
                <?php if(!$id) {?>
                <div class="alert alert-danger">Morate izabrati sliku da biste videli informacije. Molimo Vas idite na stranu: <br><a href="all_images.php">Sve slike u galeriji</a> </div>
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
        $("input, select").removeAttr("disabled");
        $(this).hide();
        $("#new-img").hide();
        $("#update").show();
        $("#cancel").show();
        $("#new_img").show();
    });

    // Cancel button click event
    $(document).on('click', '#cancel', function(e) {
        e.preventDefault();
        $("input, select").attr("disabled", "disabled");
        $(this).hide();
        $("#new-img").show();
        $("#update").hide();
        $("#change").show();
        $("#new_img").hide();
    });

    // New-dog button click event
    $(document).on('click', '#new-img', function(e) {
        e.preventDefault();
        window.location.href = 'new_image.php'; 
    });

    // Back to overview button click event
    $(document).on('click', '#back', function(e) {
        e.preventDefault();
        window.location.href = "all_images.php";
    });

    // Update button click event
 $("#img-form").submit(function(e){
    e.preventDefault();
    var formData = new FormData (this);
    var id='<?php echo $id; ?>';
    var old_img=$("#old_img").attr('src');
    console.log(formData);
    formData.append('id', id); 
    formData.append('old_img', old_img);
    $.ajax({
        url: 'ajax/ajax_update_image.php',
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
                $('#img-form').find('input, select, checkbox').prop('disabled', true);
                id=answer.img_id;
                setTimeout(function(){ 
                    window.location.assign("view_image.php?id="+answer.id); 
                }, 2000);
            }
        },
        cache: false,
        contentType: false,
        processData: false
    })
})


   /* $(document).on('click', '#update', function(e) {
        e.preventDefault();
        var id='<?php echo $id; ?>';
        var img_name = $("#name").val();
        var old_img=$("#old_img").attr('src');
        var img_data = gatherFormData('img-form');
        var dataString = 'id=' + id + '&img_data=' + JSON.stringify(img_data);

        var ajaxCall1 = $.ajax({
            url: "ajax/ajax_update_image_info.php",
            type: 'POST',
            data: dataString
        });

        var formData = new FormData($('#dog-form')[0]); 
        formData.append('new_img', $('input[type=file]')[0].files[0]);
        formData.append('img_id', id); 
        formData.append('img_name', dog_name);
        formData.append('old_img', old_img);//

        var fileInput = $('input[type=file]')[0];
        if (fileInput.files.length > 0) {
            formData.append('new_img', fileInput.files[0]);
        }

        var ajaxCall2 = $.ajax({
            url: 'ajax/ajax_update_image.php',
            type: 'POST',
            data: formData,
            processData: false, 
            contentType: false
        });

        Promise.all([ajaxCall1, ajaxCall2]).then(function(values) {
            console.log(values);
            let answer1 = JSON.parse(values[0]);
            let answer2 = JSON.parse(values[1]);
            
            if (answer1.error == "" && answer2.error == ""){
                $("#answer").removeClass("alert alert-danger d-none alert-warning");
                $("#answer").addClass("mb-3 alert alert-success text-center");
                $("#answer").html("Podaci su uspešno promenjeni.");
                populateFields();
                $("#new_img").hide();
                $("#update").hide();
                $("#change").show();
                setTimeout(function(){ 
                    $("#answer").addClass("d-none"); 
                }, 2000);
                
            } else if (answer1.error != "" && answer2.error != ""){
                $("#answer").addClass("mb-3 alert alert-danger text-center");
                $("#answer").html("Došlo je do greške pri pokušaju izmene podataka.");
                
            } else if (answer1.error != ""){
                $("#answer").addClass("mb-3 alert alert-warning text-center");
                $("#answer").html("Uspešno ste zamenili sliku ali je došlo do greške pri izmeni tekstualnih podataka.");
            } else {
                $("#answer").addClass("mb-3 alert alert-warning text-center");
                $("#answer").html("Uspešno je izmenjen tekstualni deo podataka, ali je došlo do greške pri pokušaju izmene slike.");
            }

        }, function(error) {
            // This function will be called if any of the ajax calls fail
            console.log(error);
            $("#answer").addClass("mb-3 alert alert-danger text-center");
            $("#answer").html("Došlo je do greške pri procesuiranju podataka.");
        });
});*/


})
    
populateFields(); 

// Delete button click event
$(document).on('click', '#delete', function(e) {
    e.preventDefault();
    var confirmation = confirm("Da li ste sigurni da zelite da obrisete ovaj zapis?");
    if (confirmation) {
        var id = '<?php echo $id; ?>';
            $.ajax({
                url: "ajax/ajax_delete_image.php",
                type: 'GET',
                data: { id: id },
                success: function(result) {
                    console.log(result);
                    window.location.href = "all_images.php";
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
    let category_id=$('#category').val();
    console.log("id: " +id);
    console.log("category_id: " +category_id);
    let form_elements = $("form#img-form :input[name]");
    let names=[];

    form_elements.each(function() {
        names.push($(this).attr("name"));
        $(this).prop("disabled", true);
    });
    console.log ("form names: " + names);


    $.ajax({
        url: "ajax/ajax_fetch_image_data.php",
        method: "GET",
        data: {id: id, category_id: category_id},
        success: function (data) {
            let answer=JSON.parse(data);
            console.log ("data: " + data);
            $("#special-needs").show();
            for (var key in answer) {
                console.log("key:" +key);
                if (answer.hasOwnProperty(key)){
                    if (key=="img_source") {
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
            // Check if the form element is a checkbox
            
                // For all other form elements, get their values
                obj[inputs[i].name] = inputs[i].value;
            
        }
    }
    return obj;
}

    $(document).on('click', '#back', function(e) {
        e.preventDefault();
        window.location.href = "all_images.php";
    });
</script>