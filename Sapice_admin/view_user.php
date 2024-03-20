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
    <title>Korisnik - info</title>
</head>
<body>

<div class="container">

    <?php require_once("components/_admin_header.php");?>

    <div class="row admin">
        <div class="col-8 mb-5 ">
            <h2>Pregled unetih informacija o korisniku</h2>
        </div><!--col-6-->
        <div class="col-4 text-end align-self-center">
            <a href="logout.php?page=new_user.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
        </div><!--col-6 text-end-->
    <!--</div>row-admin

    <div class="row admin">-->
        <div class="col-8 me-auto">

            <!--<form onsubmit="dodajPsa(); return false;" enctype="mulitpart/form-data">-->
            <form id="user-form" method="POST" enctype="multipart/form-data">
                <div class="row mb-3">
                    <div class="col-6">
                        <label for="name" class="form-label">Ime:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Unesite ime kuce">
                    </div><!--ime-->
                    <div class="col-6">
                        <label for="last_name" class="form-label">Prezime:</label>
                        <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Unesite prezime korisnika">
                    </div><!--prezime-->
                </div>

                <div class="row mb-3">
                    <div class="col-6">
                        <label for="email" class="form-label" >Email adresa korisnika:</label>
                        <input type="email" class="form-control" id="email" placeholder="Unesite email adresu" name="email" autocomplete="on">
                    </div><!--email-->

                    <div class="col-6">
                        <label for="phone" class="form-label">Broj telefona korisnika:</label>
                        <input type="tel" class="form-control" id="phone" placeholder="Unesite broj telefona" name="phone" autocomplete="on">
                    </div><!--tel-->
                </div>

                <div class="col-6">
                    <label for="role_id" class="form-label">Korisnička uloga:</label>
                    <select name="role_id" id="role_id" class="form-select">
                        <option value="0" selected>--Izaberite ulogu--</option>
                        <?php  
                            $query="SELECT * FROM roles WHERE status=1";
                            $result=$db->query($query);
                            while($row=$db->fetch_object($result)) {
                                echo "<option value='{$row->role_id}'>{$row->name}</option>";
                            }
                        ?>
                    </select>
                </div><!--uloge-->

                <div class="row">
                    <div class="mb-3 mt-3">
                        <label for="gender" class="form-label">Status zapisa:</label>
                        <select name="status" id="status" class="form-select">
                            <option value="0">Obrisan</option>
                            <option value="1">Aktivan</option>
                        </select>
                    </div><!--status-->
                </div>

                <div class="mb-3 mt-3 d-flex">
               
                    <button type="button" class="btn btn-primary me-2" id="change">Izmeni zapis</button>

                    <button type="button" class="btn btn-primary me-2" id="pass-change">Promeni lozinku</button>

                    <button type="button" class="btn btn-primary me-2" id="new-user">Dodaj novi zapis</button>

                    <button type="submit" class="btn btn-primary me-2" id="update" style="display: none;">Sacuvaj izmene</button>

                    <button type="button" class="btn btn-secondary me-2" id="cancel" style="display: none;">Odustani</button>

                    <button type="button" class="btn btn-secondary me-2" id="back">Pregled svih korisnika</button>

                    <button type="button" class="btn btn-danger ms-auto" id="delete">Obrisi</button>
              
                </div><!--buttons-->
            </form>



        </div><!--col-7 me-auto-->

        <?php require_once("components/_admin_menu_left.php");?>
    </div><!--row-admin-->

            <div id="answer">
                <?php if(!$id) {?>
                <div class="alert alert-danger">Morate izabrati korisnika da biste videli informacije. Molimo Vas idite na stranu: <br><a href="all_users.php">Svi korisnici - pregled informacija</a> </div>
                <?php }?>
                <!--ovde ide odgovor-->
            </div>

    <?php require_once("components/_admin_footer.php");?>

</div><!--container-->
    
</body>
</html>

<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script>
<!--"ukljucivanje" jquery-->

<script>
jQuery(document).ready(function($) {
    // Change button click event
    $(document).on('click', '#change', function(e) {
        e.preventDefault();
        $("input, select").removeAttr("disabled");
        $(this).hide();
        $("#new-user").hide();
        $("#update").show();
        $("#cancel").show();
    });

    // Cancel button click event
    $(document).on('click', '#cancel', function(e) {
        e.preventDefault();
        $("input, select").attr("disabled", "disabled");
        $(this).hide();
        $("#new-user").show();
        $("#update").hide();
        $("#change").show();
    });

    // New-user button click event
    $(document).on('click', '#new-user', function(e) {
        e.preventDefault();
        window.location.href = 'new_user.php'; 
    });

    // Back to overview button click event
    $(document).on('click', '#back', function(e) {
        e.preventDefault();
        window.location.href = "all_users.php";
    });

    $(document).on('click', '#pass-change', function(e) {
        e.preventDefault();
        var role='<?php echo $_SESSION['role']; ?>';
        var user_email='<?php echo $_SESSION['email']; ?>';
        var email = $("#email").val();
        //var id='<?php echo $id; ?>';
        if (user_email==email) {
                window.location.href = "change_password.php";
            } else {
                if (role==1) {
                    $.ajax ({
                        url: "ajax/reset_password.php",
                        //type: 'GET',
                        type: 'POST',
                        //data: {id: id},
                        data: {email: email},
                        success: function (response) {
                            let answer=JSON.parse(response);
                            if (answer.error=="") {
                                $("#answer").removeClass("alert alert-danger d-none alert-warning");
                                $("#answer").addClass("mb-3 alert alert-success");
                                $("#answer").html(answer.success);
                            } else {
                                 $("#answer").addClass("mb-3 alert alert-danger");
                                $("#answer").html(answer.error);
                            }
                        }
                    })
                } else {
                    $("#answer").addClass("mb-3 alert alert-danger");
                    $("#answer").html("Niste ovlašćeni da menjate lozinku za ovog korisnika!");
                }
                
            }
        })
    

    // Update button click event
    $(document).on('click', '#update', function(e) {
        e.preventDefault();
        var id='<?php echo $id; ?>';
        var user_name = $("#name").val();
       // var old_img=$("#old_profile_img").attr('src');
        var user_data = gatherFormData('user-form');
        var dataString = 'id=' + id + '&user_data=' + JSON.stringify(user_data);

        $.ajax({
            url: "ajax/ajax_update_user.php",
            type: 'POST',
            data: dataString, 
            success: function (response) {
                let answer=JSON.parse(response);
                if (answer.error==""){
                    $("#answer").removeClass("alert alert-danger d-none alert-warning");
                    $("#answer").addClass("mb-3 alert alert-success");
                    $("#answer").html("Podaci su uspešno promenjeni.");
                    populateFields();
                    $("#update").hide();
                    $("#change").show();
                    setTimeout(function() {
                        $("#answer").addClass("d-none");
                    }, 2000);
                } else {
                    $("#answer").addClass("mb-3 alert alert-danger");
                    $("#answer").html(answer.error);
                }
            }
        });
    });

    
populateFields(); 

    // Delete button click event
    $(document).on('click', '#delete', function(e) {
        e.preventDefault();
        var confirmation = confirm("Da li ste sigurni da zelite da obrisete ovaj zapis?");
        if (confirmation) {
            var id = '<?php echo $id; ?>';
            
            $.ajax({
                url: "ajax/ajax_delete_user.php",
                type: 'GET',
                data: { id: id },
                success: function(result) {
                    let answer=JSON.parse(result);
                    if (answer.error==""){
                        $("#answer").removeClass("alert alert-danger d-none alert-warning");
                        $("#answer").addClass("mb-3 alert alert-success");
                        $("#answer").html("Podaci su uspešno promenjeni.");
                        populateFields();
                        $("#update").hide();
                        $("#change").show();
                        setTimeout(function() {
                            $("#answer").addClass("d-none");
                        }, 2000);
                    } else {
                        $("#answer").addClass("mb-3 alert alert-danger");
                        $("#answer").html(answer.error);
                        setTimeout(function() {
                            $("#answer").addClass("d-none");
                            window.location.href = "all_users.php";
                        }, 2000);
                        
                    }
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
    
    //let form_elements = document.forms["dog-form"].elements;
    let form_elements = $("form#user-form :input[name]");
    let names=[];

    form_elements.each(function() {
        names.push($(this).attr("name"));
        $(this).prop("disabled", true);
    });
    console.log ("form names: " + names);


    $.ajax({
        url: "ajax/ajax_fetch_user_data.php",
        method: "GET",
        data: {id},
        success: function (data) {
            let answer=JSON.parse(data);
            console.log ("data: " + data);
           // $("#special-needs").show();
            for (var key in answer) {
                console.log("key:" +key);
                if (answer.hasOwnProperty(key)){
                    $("[name='" + key + "']").val(answer[key]);
                    console.log("key: " + key + " and value: " + answer[key]);
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
        // For all other form elements, get their values
        obj[inputs[i].name] = inputs[i].value;        
    }
    return obj;
}
});
</script>