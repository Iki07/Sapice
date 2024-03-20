<?php 
    $is_cookie_set = isset($_COOKIE['remember']) && $_COOKIE['remember'] != "";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once("components/_admin_head.php");?>
    <title>Logout uspešan</title>
</head>
<body>
    <div class="container">
        <?php require_once("components/_admin_header.php");?>
        <div class="main-admin-content">
            <div class="row admin">
                    <h2>Uspešno ste se izlogovali!</h2>
                    <div class="col logout-option">Šta biste sledeće želeli da uradite?</div>
                    <ul class="list-group">
                        <li><a class="list-group-item border-0 text-decoration-underline text-primary" href="login.php">Ulogujte se ponovo</a></li>
                        <li><a class="list-group-item border-0 text-decoration-underline text-primary" href="../Sapice_site/index.php">Pogledajte sajt</a></li>
                        <?php 
                        if($is_cookie_set) {
                            echo "<li id='forget-me' onclick='forgetMe()'><a class='list-group-item border-0 text-decoration-underline text-primary' href='ajax/forget_me.php'>Zaboravi me na ovom uredjaju</a></li>";
                        }
                        ?>
                    </ul>   
            </div> <!--row admin--> 
        </div>
        <?php require_once("components/_admin_footer.php");?>
    </div><!--container-->
</body>
</html>

<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script>
<script>
$(function(){
    $("#forget-me").click(function(){
        $(this).addClass("visually-hidden");
    })
})
</script>
