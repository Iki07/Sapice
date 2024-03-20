<?php 
session_start();
require_once("classes/class_base.php");
$db=new Base();
if(!$db->connect()) exit();
// Provera da li postoji "remember" cookie
if (isset($_COOKIE["remember"])) {
    $token = $_COOKIE["remember"];

    // Pronalazenje korisnika koji je povezan sa "remember" token-om
    $query = "SELECT * FROM users WHERE token = '{$token}'";
    $result = $db->query($query);

    if ($db->num_rows($result) == 1) {
        // Logovanje korisnika i redirekcija na mainAdmin.php
        $row=$db->fetch_object($result);
        $_SESSION['id']=$row->user_id;
        $_SESSION['email']=$row->email;
        $_SESSION['role']=$row->role_id;
        $db->close();
        header("Location: main_admin.php");
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once("components/_admin_head.php");?>
    <title>Login</title>
</head>
<body>
    <div class="container">
        <?php require_once("components/_admin_header.php");?>
        <div class="main-admin-content">
            <div class="row admin">
                <h2>Prijava</h2>
                    <form onsubmit="login(); return false;">

                        <div class="mb-3 mt-3">
                            <label for="email" class="form-label" >Unesite Vašu email adresu:</label>
                            <input type="email" class="form-control" id="email" placeholder="Unesite Vašu email adresu" name="email" autocomplete="on">
                        </div><br>

                        <div class="mb-3 mt-3">
                            <label for="pass" class="form-label">Unesite lozinku:</label>
                            <input type="password" class="form-control" id="pass" placeholder="Unesite lozinku" name="pass">
                        </div><br>

                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="remember" name="remember">
                            <label class="form-check-label">Zapamti me na ovom uredjaju?</label>
                            <i id="info-icon" class="mt-3 bi bi-info-circle"></i>
                            <p id="password-info" class="visually-hidden d-inline-block w-auto password-visible">Info: Bićete zapamćeni na ovom uredjaju u periodu od narednih 7 dana. Nakon toga ćete morati ponovo da se ulogujete na standardan način.</p>
                            <br><br>
                        </div>

                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary">Uloguj se</button>
                        </div><br>
                    </form>

                    <div class="col-auto" id="forgotten" onclick="forgottenPass()">
                        <p><a href="#">Zaboravili ste lozinku?</a></p>
                    </div>

                    <div id="answer-if-forgotten">
                      <!--  <h5 class="visually-hidden"><i>Napomena:</i> Ovo je simulacija mejl-a koji bi bio poslat korisniku!</h5>-->

                        <div id="answer">
                            <!--ovde ide odgovor o gresci pri logovanju-->
                        </div><!--answer-->
                        <div>
                            <!--<a id="reset-link">ovde ide link za reset lozinke -backup za demonstarciju u slucaju problema sa internetom</a>-->
                        </div>

                    </div><!--answer-complete-->
            </div><!--row admin-->
        </div><!--main-admin-content-->

        <?php require_once("components/_admin_footer.php");?>
    </div><!--container-->

</body>
</html>

<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script>
<script>
$(function(){
    $("#info-icon").click(function() {
        $("#password-info").toggleClass("visually-hidden");
    });
})

//citanje unetih vrednosti, prosledjivanje u ajax_login i prikaz "odgovora"
function login(){
    console.log("F-ja je pozvana");
    let email=$("#email").val();
    console.log("email: "+email);
    let pass=$("#pass").val();
    console.log("pass: "+pass);
    let remember=$("#remember").is(':checked')? 1: 0;
    $.post(
        "ajax/ajax_login.php", 
        {email: email, pass: pass, remember: remember}, 
        function(response){
            console.log(response);
            let answer=JSON.parse(response);
            if(answer.error!=""){
                $("#answer").addClass("mb-3 alert alert-danger");
                $("#answer").html(answer.error);
                return false;
                } else {
                    $("#answer").removeClass("alert alert-danger");
                    window.location.assign(answer.success);
                }
        }
    )
}

//pozivanje f-je za generisanje linka za resetovanje lozinke i slanje istog u mejlu
function forgottenPass() {
    console.log("F-ja je pozvana");
    let email=$("#email").val();
    console.log(email);
    $.post(
        'ajax/reset_password.php',
        {email: email}, function(response){
            let answer=JSON.parse(response);
            if(answer.error!=""){
                $("#answer").addClass("mb-3 alert alert-danger");
                $("#answer").html(answer.error);
                return false;
            } else {             
               // $("#answer-if-forgotten").addClass("reset-email rounded");   
               // $("#answer-if-forgotten h5").removeClass("visually-hidden");  
                $("#answer").removeClass("alert alert-danger");
                $("#answer").addClass("mb-3 alert alert-success");
                $("#answer").html(answer.success);
               // $("#reset-link").html("link").addClass("text-decoration-underline").attr("href", answer.link);
            }
        }
    )
}
            
</script>


