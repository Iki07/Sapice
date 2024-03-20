<?php
    session_start();
    require_once("classes/class_base.php");
    require_once("include/functions.php");
    
    loginCheck();

    $db=new Base();
    if(!$db->connect()) exit();
//ovaj se deo ponavlja, razmisli o f-ji na all dogs, all charrs, all breeds, needs, users...
    $records="SELECT * FROM breeds";
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
    <title>Rase pasa</title>
</head>

<body>

    <div class="container">

        <?php require_once("components/_admin_header.php"); ?>
        <div class="main-admin-content">
            <div class="row admin">
                <div class="col-6 mb-5">
                    <h2>Pregled unetih rasa pasa</h2>
                </div><!--col-6-->
                <div class="col-6 mb-5 text-end align-self-center">
                    <a href="logout.php?page=breeds.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
                </div><!--col-6 text-end-->
            
                <div class="col-6 me-auto"> <!--tabela + paginacija-->
                    <table id="breeds" class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">Red.br.</th>
                                <th scope="col">Naziv rase</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <?php
                            $query="SELECT * FROM breeds LIMIT {$limit} OFFSET {$offset}";
                            $result=$db->query($query);
                            $i=$offset;
                            while($row=$db->fetch_object($result)) {
                                $id=$row->breed_id;
                                $status = ($row->status == 0) ? "obrisan" : "aktivan";
                                $i++;
                                echo "<tr class='align-middle'>";                           
                                    echo "<td scope='col'>{$i}</td>";
                                    echo "<td scope='col' class='editable-text' data-field='name' data-id='{$id}'>{$row->name}</td>";
                                    echo "<td scope='col' class='editable-dropdown' data-field='status' data-id='{$id}' data-status='{$row->status}'>{$status}</td>";
                            ?>
                                <td scope="col">
                                    <a class="edit-breed" href="#" data-id="<?php echo $id?>" data-bs-toggle="tooltip" data-bs-title="Izmeni zapis"><i class="bi bi-pencil"></i></a>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>

                    <button type="submit" class="btn btn-primary" id="new-breed" data-bs-toggle="modal" data-bs-target="#addBreedModal">Dodaj novu rasu</button>
<!--i ovo dole ce da se ponavlja vrv-->
                    <nav aria-label="Paginacija">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a href="breeds.php?page=<?php echo ($current_page - 1); ?>" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <?php
                                for ($i = 1; $i <= $pages; $i++) {
                                    echo "<li class='page-item'><a class='page-link' href='breeds.php?page={$i}'>{$i}</a></li>";
                                }
                            ?>
                            <li class="page-item">
                                <a class="page-link" href="breeds.php?page=<?php echo ($current_page + 1); ?>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span></a>
                            </li>
                        </ul>
                    </nav>


                </div><!--col-6 me-auto tabela + paginacija-->

                <?php require_once("components/_admin_menu_left.php");?>
                
            </div><!--row-admin-->
            <div id="answer">
                <!--ovde ide odgovor-->
            </div>
        </div><!--main-admin-content-->

        <?php require_once("components/_admin_footer.php");?>

    </div><!--container-->

    <!-- Text Field Edit Modal -->
    <div class="modal fade" id="editTextFieldModal" tabindex="-1" aria-labelledby="editTextFieldModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editTextFieldModalLabel">Ažurirajte naziv rase</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editTextFieldForm">
                        <div class="mb-3">
                            <label for="editTextFieldValue" class="form-label">Novi unos:</label>
                            <input type="text" class="form-control" id="editTextFieldValue" name="editTextFieldValue">
                        </div>
                        <div class="mb-3">
                            <label for="editDropdownFieldValue" class="form-label">Novi status:</label>
                            <select class="form-select" id="editDropdownFieldValue" name="editDropdownFieldValue">
                               <!-- <option selected>Izaberite status:</option>-->
                                <option value="0">obrisan</option>
                                <option value="1">aktivan</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Odustani</button>
                    <button type="button" class="btn btn-primary" id="editTextFieldConfirm">Izmeni</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Text Field entry Modal -->
    <div class="modal fade" id="addBreedModal" tabindex="-1" aria-labelledby="addBreedModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addBreedModalLabel">Unesite novu rasu</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addBreedForm">
                        <div class="mb-3">
                            <label for="breed-name" class="form-label">Naziv rase:</label>
                            <input type="text" class="form-control" id="breed-name" name="breed-name">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Odustani</button>
                            <button type="submit" class="btn btn-primary">Snimi</button>
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
    </div>
</body>

</html>

<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script>
<!-----bootstrap je vec jquery, sto da ga ukljucujem 2x??-->
<!--"ukljucivanje" jquery-->
<script>
    $(document).ready(function() {

    $("#info-icon").click(function() {
        $("#info").toggleClass("visually-hidden");
    });

    var fieldToEdit;
    var idToEdit;

//$(document).on('click', '.edit-breed', function() {
    $('.edit-breed').click(function() {
            var icon = $(this);
            var row = icon.closest('tr');
            var id = icon.data('id');
            var name = row.find('.editable-text').text();
            var status = row.find('.editable-dropdown').data('status');
            console.log ("status je: "+status);

            fieldToEdit = {
                id: id,
                name: name,
                status: status
            };

            $('#editTextFieldValue').val(name);
            $('#editDropdownFieldValue').val(status);
            $('#editTextFieldModal').modal('show');
        });

        $('#editTextFieldConfirm').click(function() {
            var newName = $('#editTextFieldValue').val();
            var newStatus = $('#editDropdownFieldValue').val();
            console.log ("novi status je: "+newStatus);
            $('#editTextFieldModal').modal('hide');

            updateBreed(fieldToEdit.id, newName, newStatus);
        });

        function updateBreed(id, name, status) {
            $.ajax({
                url: 'ajax/ajax_update_breeds.php',
                type: 'POST',
                data: {
                    id: id,
                    name: name,
                    status: status
                },
                success: function(response) {
                    console.log(response);
                    var answer = JSON.parse(response);
                    if (answer.error !== "") {
                        $("#answer").addClass("mb-3 alert alert-danger");
                        $("#answer").html(answer.error);
                    } else {
                        $("#answer").removeClass("alert alert-danger d-none");
                        $("#answer").addClass("mb-3 alert alert-success");
                        $("#answer").html(answer.success);

                        $('[data-id="' + id + '"] .editable-text').text(name);
                        if(status==0) {
                            $('[data-id="' + id + '"][data-field="status"]').text("obrisan");
                        } else {
                            $('[data-id="' + id + '"][data-field="status"]').text("aktivan");
                        }
                    }
                    
                    setTimeout(function() {
                        $("#answer").addClass("d-none");
                    }, 2000);
                },
                cache: false
            });
        }

$("#addBreedForm").submit(function(e) {
        console.log("submit fja pozvana");
        e.preventDefault();
        var breedName = $("#breed-name").val();
        $.ajax({
            type: "POST",
            url: "ajax/ajax_new_breed.php", 
            data: {
                breed_name: breedName
            },
            success: function(response) {
                // handle server response here
                console.log(response);
                let answer=JSON.parse(response);
                if(answer.error!=""){
                    $("#answer").addClass("mb-3 alert alert-danger text-center");
                    $("#answer").html(answer.error);
                    return false;
                }  else {
                    $("#answer").removeClass("alert alert-danger");
                    $("#answer").addClass("mb-3 alert alert-success text-center");
                    $("#answer").html(answer.success);
                       // reset form and close modal

                    $("#addBreedForm")[0].reset();
                    var addBreedModal = bootstrap.Modal.getInstance(document.getElementById('addBreedModal'));
                    addBreedModal.hide();

                    var newRow=$("<tr>");
                    newRow.append($("<td>").text(answer.breed_id));
                    newRow.append($("<td>").addClass("editable-text").attr("data-field", "name").attr("data-id", answer.breed_id).text(breedName));
                    newRow.append($("<td>").addClass("editable-dropdown").attr("data-field", "status").attr("data-id", answer.breed_id).text("aktivan"));
                    var editLink = $("<a>").addClass("edit-img").attr("href", "#").attr("data-id", answer.img_id).attr("data-bs-toggle", "tooltip").attr("data-bs-title", "Izmeni zapis").append($("<i>").addClass("bi bi-pencil"));
                    newRow.append($("<td>").append(editLink));

                    $("#breeds tbody").append(newRow);

                }
            },  
        });
    });
    
    //incijalizacija bootstrap toogle funkcionalnosti
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

    });

</script>

