<?php
    session_start();
    require_once("classes/class_base.php");
    require_once("include/functions.php");
    
    loginCheck();

    $db=new Base();
    if(!$db->connect()) exit();

    $records="SELECT * FROM all_images";
    $result=$db->query($records);
    $total_records=$db->num_rows($result);
    $limit=7;
    $offset=0;
    $pages=ceil($total_records/$limit);
    $current_page = isset($_GET['page']) && !empty($_GET['page']) ? $_GET['page'] : 1;
    $offset=($current_page-1)*$limit;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once("components/_admin_head.php");?>
    <title>Sve slike u galeriji</title>
</head>

<body>

    <div class="container">

        <?php require_once("components/_admin_header.php"); ?>
        <div class="main-admin-content">
            <div class="row admin">
                <div class="col-6 mb-5">
                    <h2>Pregled svih slika u galeriji</h2>
                </div><!--col-6-->
                <div class="col-6 mb-5 text-end align-self-center">
                    <a href="logout.php?page=all_images.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
                </div><!--col-6 text-end-->
            
                <div class="col-9 me-auto"> <!--tabela + paginacija-->
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">Ime</th>
                                <th scope="col">Slika</th>
                                <th scope="col">Kategorija</th>
                                <th scope="col">Status</th>
                                <th scope="col">Opcije</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <?php
                            $categories=array();
                            $active_categories=array();
                            $query_cat="SELECT * FROM img_categories";
                            $result_cat=$db->query($query_cat);
                            $k=1;
                            while ($row_cat=$db->fetch_assoc($result_cat)){
                                if($row_cat['status']==0) {
                                    $categories[$row_cat['category_id']]="Nije definisana";
                                } else {
                                    $categories[$row_cat['category_id']]=$row_cat['name'];
                                    $active_categories[$k]=$row_cat['name'];
                                    $k++;
                                }
                            }
                            $json_active_categories=json_encode($active_categories);

                            $query="SELECT * FROM all_images LIMIT {$limit} OFFSET {$offset}";
                            $result=$db->query($query);
                            $i=$offset;
                            while($row=$db->fetch_object($result)) {
                                $id=$row->img_id; 
                                $original_id=$row->original_id;
                                $original_category=$row->category_id;
                                $i++;
                                switch ($row->status){
                                    case 0:
                                        $status="obrisan";
                                        break;
                                    case 1:
                                        $status="aktivan";
                                        break;
                                } 
                                if ($original_category==2) {
                                    $query_dog="SELECT * FROM dog_imgs WHERE img_id= {$original_id}";
                                    $result_dog=$db->query($query_dog);
                                    $row_dog=$db->fetch_object($result_dog);
                                    $dog_id=$row_dog->dog_id;
                                    $view_link="dog_images.php?id=".$dog_id;
                                } else {
                                    $view_link="view_image.php?id=".$original_id;
                                }
                                                     
                            echo "<tr class='align-middle'>";                           
                                echo "<td scope='col'>{$i}</td>";
                                echo "<td scope='col'>{$row->name}</td>";
                                echo "<td scope='col'><img src='{$row->img_source}' alt='{$row->name}' height='80'></td>";
                                echo "<td scope='col' data-category='{$row->category_id}'> {$row->category} </td>";
                                echo "<td scope='col' data-status='{$status}'> {$status} </td>";
                            ?>
                                <td scope="col">
                                    <ul class="nav justify-content-left">
                                        <li class="nav-item">
                                            <a class="nav-link edit-img" href="<?php echo $view_link?>" 
                                            data-bs-toggle="tooltip" data-bs-title="Izmeni detalje o slici"><i class="bi bi-pencil"></i></a>
                                        </li>

                                        <li class="nav-item">
                                            <a class="nav-link delete-img" href="#" data-id="<?php echo $i ?>" data-original_id="<?php echo $original_id ?>"
                                            data-category_id="<?php echo $row->category_id ?>"data-bs-toggle="tooltip" data-bs-title="Obriši zapis"><i class="bi bi-trash"></i></a>               
                                        </li>                           
                                    </ul>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>

                    <nav aria-label="Paginacija">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a href="all_images.php?page=<?php echo ($current_page - 1); ?>" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <?php
                                for ($i = 1; $i <= $pages; $i++) {
                                    echo "<li class='page-item'><a class='page-link' href='all_images.php?page={$i}'>{$i}</a></li>";
                                }
                            ?>
                            <li class="page-item">
                                <a class="page-link" href="all_images.php?page=<?php echo ($current_page + 1); ?>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span></a>
                            </li>
                        </ul>
                    </nav>

                </div><!--col-9 me-auto tabela + paginacija-->

                <?php require_once("components/_admin_menu_left.php");?>

                <div id="answer">
                    <!--ovde ide odgovor-->
                </div>
            </div><!--row-admin-->
        </div><!--main-admin-content-->

        <?php require_once("components/_admin_footer.php");?>

    </div><!--container-->

</body>

</html>

<!--<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script> 
-----bootstrap je vec jquery, sto da ga ukljucujem 2x??-->
<!--"ukljucivanje" jquery-->
<script>
    $(document).ready(function() {
        //incijalizacija bootstrap toogle funkcionalnosti
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))


    function populateModalFields(imgData) {
        $('#editTextFieldValue').val(imgData.name);
        $('#editDropdownFieldValue1').val(imgData.category);
        $('#editDropdownFieldValue').val(imgData.status);
    }


        $(document).on('click', '.delete-img', function(e) {
            e.preventDefault();
            var confirmation = confirm("Da li ste sigurni da želite da obrišete ovaj zapis?");

            if (confirmation) {
                var id = $(this).data('original_id');
                var view_id = $(this).data('id');
                var category_id = $(this).data('category_id');
                console.log("id je: "+id);
                console.log("category_id je: "+category_id);

                $.ajax({
                    url: "ajax/ajax_delete_image.php",
                    type: 'GET',
                    data: { 
                        id: id, 
                        category_id: category_id
                    },
                    success: function (response) {
                        console.log(response);
                        let answer=JSON.parse(response);
                        if(answer.error!=""){
                            $("#answer").addClass("mb-3 alert alert-danger text-center");
                            $("#answer").html(answer.error);
                            setTimeout(function() {
                                $("#answer").addClass("d-none"); 
                            }, 2000); 
                            return false;
                        } else {
                            $("#answer").removeClass("alert alert-danger");
                            $("#answer").addClass("mb-3 alert alert-success text-center");
                            $("#answer").html(answer.success);
                            $('[data-id="' + id + '"]').closest('tr').find('[data-status]').text("obrisan");
                            setTimeout(function() {
                                $("#answer").addClass("d-none"); 
                                location.reload();
                            }, 2000); 
                        }
                    },
                    cashe:false
                });
            }
        })
                        


        $('.edit-img').click(function(e) {
           // e.preventDefault();
            console.log("fja edit je pozvana");
            var imgId = $(this).data('id');
            console.log("i je: "+imgId);
            var imgSrc = $(this).data('source');
            var imgData = {
                name: $(this).closest('tr').find('.editable-text[data-field="name"]').text(),
                category: $(this).closest('tr').find('.editable-dropdown[data-field="category"]').data('category'),
                status: $(this).closest('tr').find('.editable-dropdown[data-field="status"]').data('status')
            };

            populateModalFields(imgData);

            $('#editTextFieldModal').modal('show');

            $('#editTextFieldConfirm').off('click').on('click', function () {
                var active_categories = <?php echo $json_active_categories; ?>;
                var updatedData = {
                    name: $('#editTextFieldValue').val(),
                    category_id: $('#editDropdownFieldValue1').val(),
                    status: $('#editDropdownFieldValue').val()
                };
                console.log("podaci za: " + imgId, updatedData);
                //var updated_data = JSON.stringify(updatedData);
                $.ajax({
                    type: 'POST',
                    url: 'ajax/ajax_update_image_info.php',
                    data: {
                        img_id: imgId, 
                        img_data: updatedData,
                        original_category: category_id,
                        img_src: imgSrc
                    },
                    success: function (response) {
                        console.log(response);
                        var answer = JSON.parse(response);
                        if (answer.error !== "") {
                            $("#answer").addClass("mb-3 alert alert-danger");
                            $("#answer").html(answer.error);
                        } else {
                            var updated_data = answer.updated_data;
                            var tableRow = $('.edit-user[data-id="' + imgId + '"]').closest('tr');
                            tableRow.find('.editable-text[data-field="name"]').text(updated_data.name);

                            var categoryDisplay = tableRow.find('.editable-dropdown[data-field="category"]');
                            categoryDisplay.text(updated_data.category);
                            categoryDisplay.data('category', updated_data.category_id);

                            var statusDisplay = tableRow.find('.editable-dropdown[data-field="status"]');
                            statusDisplay.text(updated_data.status_text);
                            statusDisplay.data('status', updated_data.status_value);  
                            
                            $("#answer").removeClass("alert alert-danger d-none");
                            $("#answer").addClass("mb-3 alert alert-success");
                            $("#answer").html(answer.success);
                        }
                        setTimeout(function() {
                            $("#answer").addClass("d-none");
                            location.reload();
                        }, 2000);

                        $('#editTextFieldModal').modal('hide');
                        
                    }
                    
                })
            })
        });

            // Back to overview button click event


    });

</script>

