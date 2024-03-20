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
    <title>Nova slika</title>
</head>
<body>

<div class="container">

    <?php require_once("components/_admin_header.php");?>

    <div class="row admin">
        <div class="col-8 mb-5 ">
            <h2>Unos nove slike u bazu</h2>
        </div><!--col-6-->
        <div class="col-4 text-end align-self-center">
            <a href="logout.php?page=new_image.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
        </div><!--col-6 text-end-->
    <!--</div>row-admin

    <div class="row admin">-->
        <div class="col-6 me-auto">

            <form id="img-form" method="POST" enctype="multipart/form-data">
                <div class="row mb-3">
                    <label for="image" class="form-label">Izaberite sliku:</label>
                    <input type="file" class="form-control" id="image" name="image">
                </div><!--profilna slika-->

                <div class="row mb-3">
                    <label for="img-name" class="form-label">Dajte ime slici:</label>
                    <input type="text" class="form-control" id="img-name" name="img-name" placeholder="Unesite naziv slike">
                </div><!--ime-->


                

                <div class="row mb-3">
                    <label for="img-category" class="form-label">Kojoj kategoriji pripada?</label>
                    <select name="img-category" id="img-category" class="form-select">
                        <option value="0" selected>--Izaberite kategoriju--</option>
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

            
                <div class="mb-3 mt-3 d-flex">
                    <button type="submit" class="btn btn-primary me-2" id="img-submit">Snimi zapis</button>               
                    <button type="button" class="btn btn-secondary me-2" id="cancel" >Odustani</button>
                    <button type="button" class="btn btn-secondary ms-auto" id="back">Pregled svih slika</button>               
                </div><!--buttons-->

            </form>



        </div><!--col-8 me-auto-->

        <?php require_once("components/_admin_menu_left.php");?>
    </div><!--row-admin-->

            <div id="answer">
            <!--ovde ide odgovor-->
            </div>

    <?php require_once("components/_admin_footer.php");?>

</div><!--container-->
    
</body>
</html>

<script>
$(function() {

})

$("#img-form").submit(function(e){
    e.preventDefault();
    var formData = new FormData (this);
    console.log(formData);

    $.ajax({
        url: 'ajax/ajax_new_image.php',
        type: 'POST',
        data: formData,
        success: function (response) {
            let answer=JSON.parse(response);
            if(answer.error!=""){
                $("#answer").addClass("mb-3 alert alert-danger text-center");
                $("#answer").html(answer.error);
                return false;
            } else {
                $("#answer").removeClass("alert alert-danger");
                $("#answer").addClass("mb-3 alert alert-success text-center");
                $("#answer").html(answer.success);
                $('#img-form').find('input, select, checkbox').prop('disabled', true);
                id=answer.img_id;
                setTimeout(function(){ 
                    window.location.assign("view_image.php?id="+id); 
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
        $('#img-form')[0].reset();
        // Redirect to the all admin page
        window.location.href = 'main_admin.php'; 
    } 
});

    $(document).on('click', '#back', function(e) {
        e.preventDefault();
        window.location.href = "all_images.php";
    });

</script>