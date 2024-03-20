<?php require_once ("include/menu_config.php"); ?>

<div class="col-2 side-bar">
  <!--<div class="group"> 
        <a class="btn btn-secondary" data-bs-toggle="collapse" href="#collapseDogs" role="button" aria-expanded="false" aria-controls="collapseDogs">Psi</a>
        <div class="collapse" id="collapseDogs">
            <div class="card card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><a href="http://localhost/Sapice_complete/Sapice_admin/all_dogs.php">Svi psi</a></li>
                    <li class="list-group-item"><a href="http://localhost/Sapice_complete/Sapice_admin/new_dog.php">Dodaj psa</a></li>                             
                </ul>
            </div>
      </div>
 </div>-->

    <?php  
    foreach ($menu as $group => $items) {
        echo "<div class='group'>";
        echo "<a class='btn btn-secondary' data-bs-toggle='collapse' href='#collapse{$group}' role='button' aria-expanded='false' aria-controls='collapse{$group}'>{$group}</a>";
            echo "<div class='collapse' id='collapse{$group}'>";
                echo "<div class='card card-body'>";
                    echo "<ul class='list-group list-group-flush'>";
                    foreach ($items as $label =>$file) {
                        echo "<li class='list-group-item'><a href='{$file}'>{$label}</a></li>";
                    }
                    echo "</ul>";
                echo "</div>";
            echo "</div>";
        echo "</div>";
    }
    ?>
</div>
<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script>
<script src="include/functions.js"></script>
<script>
   $(document).ready(function() {
        hideMenuItem();
    })

</script>

