<?php 
session_start();
require_once("include/functions.php");
loginCheck();
require_once ("include/menu_config.php"); 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once("components/_admin_head.php");?>
    <title>Admin panel</title>
</head>
<body>
    <div class="container">
        <?php require_once("components/_admin_header.php");?>

        <div class="main-admin-content">
            <div class="row admin">
                <div class="col-6">
                    <h2>Dobro došli!</h2>
                </div>
                <div class="col-6 text-end">
                    <a class="text-decoration-none" id="logout-link" href="logout.php?page=main_admin.php">Odjavite se</a>
                </div>
            </div> <!--row admin--> 

        
            <div class="row admin">  
                <?php  
                foreach ($menu as $group => $items) {
                    echo "<div class='col-4 btn-group'>";

                    echo "<button type='button' class='btn btn-secondary dropdown-toggle a-panel' data-bs-toggle='dropdown' aria-expanded='false'>{$group}</button>";  

                        echo "<ul class='dropdown-menu'>";
                            foreach ($items as $label =>$file) {
                                echo "<li><a class='dropdown-item' href='{$file}'>{$label}</a></li>";
                            }
                        echo "</ul>";
                    echo "</div>";
                }
                ?>
               <!-- <div class="col-4 btn-group">
                    <button type="button" class="btn btn-secondary dropdown-toggle a-panel" data-bs-toggle="dropdown" aria-expanded="false">
                    Psi
                    </button>
                    <ul class="dropdown-menu"> Dropdown menu links 
                        <li><a class="dropdown-item" href="all_dogs.php">Pregledaj sve pse u bazi</a></li>
                        <li><a class="dropdown-item" href="new_dog.php">Dodaj novog psa</a></li> 
                    </ul>
                </div>col-4 btn-group-->
            </div><!--row admin-->
        </div>

        <?php require_once("components/_admin_footer.php");?>
    </div><!--container-->
</body>
</html>
