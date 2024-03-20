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
    <title>Blog-info</title>
</head>
<body>

<div class="container">

    <?php require_once("components/_admin_header.php");?>

    <div class="row admin">
        <div class="col-8 mb-5 ">
            <h2>Pregled posta</h2>
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
                        <label for="title" class="form-label">Naslov posta:</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Unesite naslov">
                    </div><!--ime-->

                    <div class="col-6">
                        <label for="subtitle" class="form-label">Unesite podnaslov posta:</label>
                        <input type="text" class="form-control" id="subtitle" name="subtitle" placeholder="Unesite podnaslov">
                    </div><!--podnaslov-->

                    <div class="col-4" >
                        <img name="old_img" id="old_img" src="" alt="slika" height="250"></img>
                    </div>
                   <div class="col-4 align-self-center">
                        <input type="file" class="form-control" id="new_img" name="new_img" style="display: none;">
                    </div><!--propratna slika-->
                </div>

                <div class="mb-3 mt-3">
                    <label for="blog_text" class="form-label">Tekst posta:</label>
                    <textarea name="blog_text" id="blog_text" rows="5" class="form-control"></textarea>
                </div><!--post-->

                <div class="mb-3 pb-3 border-bottom light-border osobine">
                    <p>Kategorije kojima post pripada:</p>

                    <?php
                        $query="SELECT * FROM blog_categories WHERE status=1";
                        $result=$db->query($query);
                        while($row=$db->fetch_object($result)) {
                            echo "<div class='form-check'>";
                            echo "<input type='checkbox' class='form-check-input' id='cat{$row->blog_category_id}' name='cat{$row->blog_category_id}' value='{$row->blog_category_id}'>{$row->name}</div>";
                        }
                        ?>
                </div><!--kategorije-->

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
                <?php if($id) {?>
                    <button type="button" class="btn btn-primary me-2" id="change">Izmeni zapis</button>

                    <button type="button" class="btn btn-primary me-2" id="new-blog">Dodaj novi zapis</button>

                    <button type="submit" class="btn btn-primary me-2" id="update" style="display: none;">Sacuvaj izmene</button>

                    <button type="button" class="btn btn-secondary me-2" id="cancel" style="display: none;">Odustani</button>

                    <button type="button" class="btn btn-secondary me-2" id="back">Pregled svih postova</button>

                    <button type="button" class="btn btn-danger ms-auto" id="delete">Obrisi</button>
                <?php } ?>
                </div><!--buttons-->
            </form>

        </div><!--col-7 me-auto-->

        <?php require_once("components/_admin_menu_left.php");?>
        
    </div><!--row-admin-->

    <div id="answer">
        <?php if(!$id) {?>
            <div class="alert alert-danger">Morate izabrati post da biste videli informacije. Molimo Vas idite na stranu: <br><a href="all_blogs.php">Svi postovi - pregled informacija</a> </div>
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
    populateFields(); 

    // Change button click event
    $(document).on('click', '#change', function(e) {
        e.preventDefault();
        $("input, select, textarea").removeAttr("disabled");
        $(this).hide();
        $("#new-blog").hide();
        $("#update").show();
        $("#cancel").show();
        $("#new_img").show();
    });

    // Cancel button click event
    $(document).on('click', '#cancel', function(e) {
        e.preventDefault();
        $("input, select, textarea").attr("disabled", "disabled");
        $(this).hide();
        $("#new-blog").show();
        $("#update").hide();
        $("#change").show();
        $("#new_img").hide();
    });

    // New-blog button click event
    $(document).on('click', '#new-blog', function(e) {
        e.preventDefault();
        window.location.href = 'new_blog.php'; 
    });

    // Back to overview button click event
    $(document).on('click', '#back', function(e) {
        e.preventDefault();
        window.location.href = "all_blogs.php";
    });

    // Update button click event
    $("#blog-form").submit(function(e){
    e.preventDefault();
    var formData = new FormData (this);
    var id='<?php echo $id; ?>';
    var old_img=$("#old_img").attr('src');
    console.log(formData);
    formData.append('id', id); 
    formData.append('old_img', old_img);
    $.ajax({
        url: 'ajax/ajax_update_blog.php',
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
                    window.location.assign("view_blog.php?id="+answer.id); 
                }, 2000);
            }
        },
        cache: false,
        contentType: false,
        processData: false
    })
})

// Delete button click event
$(document).on('click', '#delete', function(e) {
    e.preventDefault();
    var confirmation = confirm("Da li ste sigurni da zelite da obrisete ovaj zapis?");
    if (confirmation) {
        var id = '<?php echo $id; ?>';    
        $.ajax({
            url: "ajax/ajax_delete_blog.php",
            type: 'GET',
            data: { id: id },
            success: function(result) {
                console.log(result);
                window.location.href = "all_blogs.php";
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
    let form_elements = $("form#blog-form :input[name]");
    let names=[];

    form_elements.each(function() {
        names.push($(this).attr("name"));
        $(this).prop("disabled", true);
    });
    console.log ("form names: " + names);

    $.ajax({
        url: "ajax/ajax_fetch_blog_data.php",
        method: "GET",
        data: {id},
        success: function (data) {
            let answer=JSON.parse(data);
            console.log ("data: " + data);
            for (var key in answer) {
                console.log("key:" +key);
                if (answer.hasOwnProperty(key)){
                        if(key.slice(0,3)=="cat"){
                            $("[name='" + key + "']").prop("checked", true);
                            console.log("key: " + key + " and value is checked");
                        } else if (key=="img_source") {
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
};

//ovo moze u functions.js  
function gatherFormData(formId) {
    var form = document.getElementById(formId);
    var inputs = form.elements;
    var obj = {};
    for(var i = 0; i < inputs.length; i++) {
        if(inputs[i].name) {
            if(inputs[i].type === "checkbox") {
                if(inputs[i].checked) {
                    obj[inputs[i].name] = inputs[i].value;
                }
            } else {
                obj[inputs[i].name] = inputs[i].value;
            }
        }
    }
    return obj;
};
})
</script>