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
    <script src="assets/tinymce/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '#blog-text'
        });
    </script>
    <title>Novi blog</title>
</head>
<body>

<div class="container">

    <?php require_once("components/_admin_header.php");?>

    <div class="row admin">
        <div class="col-8 mb-5 ">
            <h2>Unos novog posta u bazu</h2>
        </div><!--col-6-->
        <div class="col-4 text-end align-self-center">
            <a href="logout.php?page=new_blog.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
        </div><!--col-6 text-end-->
    <!--</div>row-admin

    <div class="row admin">-->
        <div class="col-8 me-auto">

            <form id="blog-form" method="POST" enctype="multipart/form-data">
                <div class="row mb-3">
                    <div class="col-6">
                        <label for="title" class="form-label">Unesite naslov posta:</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Unesite naslov">
                    </div><!--naslov-->

                    <div class="col-6">
                        <label for="subtitle" class="form-label">Unesite podnaslov posta:</label>
                        <input type="text" class="form-control" id="subtitle" name="subtitle" placeholder="Unesite podnaslov">
                    </div><!--podnaslov-->

                    <div class="col-6">
                        <label for="image" class="form-label">Izaberite propratnu sliku:</label>
                        <input type="file" class="form-control" id="image" name="image">
                    </div><!--propratna slika-->
                </div>

                <div class="mb-3 mt-3">
                    <label for="blog-text" class="form-label">Unesite tekst posta:</label>
                    <textarea name="blog-text" id="blog-text" rows="5" class="form-control"></textarea>
                </div><!--post-->

                <div class="mb-3 pb-3 border-bottom light-border osobine">
                    <p>Dodelite kategorije kojima post pripada:</p>
                    <?php
                        $query="SELECT * FROM blog_categories WHERE status=1";
                        $result=$db->query($query);
                        while($row=$db->fetch_object($result)) {
                            echo "<div class='form-check'>";
                            echo "<input type='checkbox' class='form-check-input' id='c{$row->blog_category_id}' name='{$row->blog_category_id}' value='{$row->blog_category_id}'>{$row->name}</div>";
                        }
                        ?>
                </div><!--kategorije-->

                <div class="mb-3 mt-3 d-flex">
                    <button type="submit" class="btn btn-primary me-2" id="blog-submit">Snimi zapis</button>               
                    <button type="button" class="btn btn-secondary me-2" id="cancel" >Odustani</button>
                    <a href="all_blogs.php" class="btn btn-secondary ms-auto" role="button" id="back">Pregled svih postova</a>
                    <!--<button type="button" class="btn btn-secondary ms-auto" id="back">Pregled svih pasa</button>-->           
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

<script>
$(function() {

})

$("#blog-form").submit(function(e){
    e.preventDefault();
    tinymce.triggerSave();
    var formData = new FormData (this);
    console.log(formData);

    $.ajax({
        url: 'ajax/ajax_new_blog.php',
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
                id=answer.blog_id;
                setTimeout(function(){ 
                    window.location.assign("view_blog.php?id="+id); 
                }, 2000);
            }
        },
        cache: false,
        contentType: false,
        processData: false
    }) 
})

$("#cancel").click(function(e) {
    e.preventDefault(); 
    var r = confirm ("Molimo Vas da obratite pažnju: ukoliko ima unetih podataka - isti neće biti sačuvani. Da li ste sigurni da želite da odustanete?"); 
    if (r == true) { 
        $('#blog-form')[0].reset();
        window.location.href = 'main_admin.php'; 
    } 
});

</script>