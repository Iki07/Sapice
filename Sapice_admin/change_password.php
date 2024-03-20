<?php 
    require_once("classes/class_base.php");
    require_once("include/functions.php");
    session_start();
//u slucaju da korsinik nije vec ulogovan ili nije dosao preko mejla za promenu lozinke
    if(isset($_SESSION['email'])) {
        $user_email = $_SESSION['email'];
    } else if (isset($_COOKIE['email'])) {
        $user_email = $_COOKIE['email'];
    } else {
        echo "<script>";
        echo "alert('Nedozvoljen pristup stranici.');";
        echo "window.location.assign('login.php');";
        echo "</script>";
    }

    $db=new Base();
    if(!$db->connect()) exit();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once("components/_admin_head.php");?>
    <title>Promena Lozinke</title>
</head>
<body>
    <div class="container">
        <?php require_once("components/_admin_header.php");?>

        <div class="row admin">
            <h2>Promena Lozinke</h2>
                <form onsubmit="passCheck(); return false;">

                    <div class="mb-3 mt-3">
                        <label for="email" class="form-label">Unesite Vašu email adresu:</label>
                        <input type="email" class="form-control" id="email" placeholder="Unesite Vašu email adresu" name="email" autocomplete="on">
                    </div><br>

                    <div class="mb-3 mt-3">
                        <label for="pass" class="form-label">Unesite novu lozinku:</label>
                        <i id="info-icon" class="mt-3 bi bi-info-circle"></i>
                        <p id="password-info" class="visually-hidden d-inline-block w-auto password-visible">Info: Lozinka mora imati najmanje 8 karaktera, od čega minimum po jedno veliko slovo, malo slovo, cifru i specijalni karakter (npr. !, @, #, $, %).</p>
                        <input type="password" class="form-control" id="pass" placeholder="Unesite lozinku, min 8 karaktera" name="pass">
                    </div><br>

                     <div class="mb-3 mt-3">
                        <label for="pass" class="form-label">Ponovite lozinku:</label>
                        <input type="password" class="form-control" id="new_pass" placeholder="Unesite lozinku" name="new_pass">
                    </div><br>

                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary">Promeni lozinku</button>
                        <button type="button" class="btn btn-secondary" id="cancel">Odustani</button>
                    </div><br>
                </form>

                 <div id="answer">
                    <!--ovde ide odgovor-->
                </div>
                <div>
                    <a id="main-admin-link"><!--ovde ide link na main admin stranu--></a>
                </div>



        </div><!--row admin-->
                 <div id="answer">
                    <!--ovde ide odgovor-->
                </div>
                <div>
                    <a id="main-admin-link"><!--ovde ide link na main admin stranu--></a>
                </div>
        <?php require_once("components/_admin_footer.php");?>
    </div><!--container-->

</body>
</html>


<!--jquery-->
<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script>
<!--turn on jquery-->
<script>
$(function(){
    $("#info-icon").click(function() {
        $("#password-info").toggleClass("visually-hidden");
    });

    $('#cancel').click(function() {
        console.log("fja je pozvana");
        window.history.go(-1);
    });

})

//citanje unetih vrednosti, prosledjivanje u ajax_login i prikaz "odgovora"
function passCheck(){
    console.log("F-ja je pozvana");
    let email=$("#email").val();
    let pass=$("#pass").val();
    let new_pass=$("#new_pass").val();
    let user_email='<?php echo $user_email; ?>';
    
    console.log(email + " | " + pass + " | " + new_pass + " | " + user_email);
   // console.log(user_sessionEmail);
   

    if (email=="" || pass=="" || new_pass==""){
        $("#answer").addClass("mb-3 alert alert-danger");
        $("#answer").html("Svi podaci su obavezni!");
        return false;
    }

    if (user_email != email) {
       // if(user_sessionEmail != email){
            $("#answer").addClass("mb-3 alert alert-danger");
            $('#answer').html("Unet je pogrešan email!");
        return false;
      //  }
    } 

    if (pass.length<8){
        $("#answer").addClass("mb-3 alert alert-danger");
        $('#answer').html("Proverite dužinu lozinke! Minimum je 8 karaktera.");
        return false;
    }

    if (pass!=new_pass){
            $("#answer").addClass("mb-3 alert alert-danger");
            $('#answer').html("Lozinke nisu iste!");
            return false;
    }
    
    $.post(
        "ajax/ajax_change_password.php",
        {email: email, pass: new_pass},
        function (response){
            let answer = JSON.parse(response);
            if(answer.error!=""){
                $("#answer").addClass("mb-3 alert alert-danger");
                $("#answer").html(answer.error);
            } else {
                $("#answer").removeClass("mb-3 alert alert-danger").addClass("mb-3 alert alert-success");
                $("#answer").html(answer.success);
                $("#main-admin-link").html("Login strana").addClass("text-decoration-underline").attr("href", answer.link);
            }
        }
    )


}

</script>

