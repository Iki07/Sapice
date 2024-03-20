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
    <title>Novi korisnik</title>
</head>
<body>

<div class="container">

    <?php require_once("components/_admin_header.php");?>

    <div class="row admin">
        <div class="col-8 mb-5 ">
            <h2>Unos novog korisnika u bazu</h2>
        </div><!--col-6-->
        <div class="col-4 text-end align-self-center">
            <a href="logout.php?page=new_dog.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
        </div><!--col-6 text-end-->
    <!--</div>row-admin

    <div class="row admin">-->
        <div class="col-8 me-auto">

            <form id="user-form" method="POST" enctype="multipart/form-data">
                <div class="row mb-3">
                    <div class="col-6">
                        <label for="name" class="form-label">Unesite ime:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Unesite ime korisnika">
                    </div><!--ime-->

                    <div class="col-6">
                        <label for="last-name" class="form-label">Unesite prezime:</label>
                        <input type="text" class="form-control" id="last-name" name="last-name" placeholder="Unesite prezime korisnika">
                    </div><!--prezime-->
                </div>

                <div class="row mb-3">
                    <div class="col-6">
                        <label for="email" class="form-label" >Unesite email adresu korisnika:</label>
                        <input type="email" class="form-control" id="email" placeholder="Unesite email adresu" name="email" autocomplete="on">
                    </div><!--email-->

                    <div class="col-6">
                        <label for="phone" class="form-label">Unesite broj telefona korisnika:</label>
                        <input type="tel" class="form-control" id="phone" placeholder="Unesite broj telefona" name="phone" autocomplete="on">
                    </div><!--tel-->
                </div>

                <div class="col-6">
                    <label for="role" class="form-label">Koju ulogu će imati korisnik?</label>
                    <select name="role" id="role" class="form-select">
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

                <div class="mb-3 mt-3 d-flex">
                    <button type="submit" class="btn btn-primary me-2" id="user-submit">Snimi zapis</button>               
                    <button type="button" class="btn btn-secondary me-2" id="cancel" >Odustani</button>
                    <a href="all_users.php" class="btn btn-secondary ms-auto" role="button" id="back">Pregled svih korisnika</a>
                    <!--<button type="button" class="btn btn-secondary ms-auto" id="back">Pregled svih korisnika</button> -->              
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
<!--"ukljucivanje" jquery-->

<script>
$(function() {
  
})

$("#user-form").submit(function(e){
    e.preventDefault();
    var formData = new FormData (this);
    console.log(formData);
    for (var pair of formData.entries()) {
    console.log(pair[0]+ ', ' + pair[1]); 
}

    $.ajax({
        url: 'ajax/ajax_new_user.php',
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
                id=answer.user_id;
                setTimeout(function(){ 
                    window.location.assign("view_user.php?id="+id); 
                }, 2000);
            }
        },
        cache: false,
        contentType: false,
        processData: false
    })


 
})

   $("#cancel").click(function(e) {
    e.preventDefault(); // Prevents the default action (if any)

    var r = confirm ("Molimo Vas da obratite pažnju: ukoliko ima unetih podataka - isti neće biti sačuvani. Da li ste sigurni da želite da odustanete?"); 
    if (r == true) { 
        // Resets all the input fields
        $('#user-form')[0].reset();
        // Redirect to the all admin page
        window.location.href = 'main_admin.php'; 
    } 
});

</script>