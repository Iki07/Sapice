<?php
    session_start();
    require_once("classes/class_base.php");
    require_once("include/functions.php");
    
    loginCheck();

    $db=new Base();
    if(!$db->connect()) exit();
//ovaj se deo ponavlja, razmisli o f-ji na all dogs, all charrs, all breeds, needs, users...
    $records="SELECT * FROM special_needs";
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
    <title>Posebne potrebe</title>
</head>

<body>

    <div class="container">

        <?php require_once("components/_admin_header.php"); ?>
        <div class="main-admin-content">
            <div class="row admin">
                <div class="col-6 mb-5">
                    <h2>Pregled unetih posebnih potreba</h2>
                </div><!--col-6-->
                <div class="col-6 mb-5 text-end align-self-center">
                    <a href="logout.php?page=all_dogs.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
                </div><!--col-6 text-end-->
            
                <div class="col-6 me-auto"> <!--tabela + paginacija-->
                    <table id="needs" class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">Red.br.</th>
                                <th scope="col">Posebna potreba</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <?php
                            $query="SELECT * FROM special_needs LIMIT {$limit} OFFSET {$offset}";
                            $result=$db->query($query);
                            $i=0;
                            while($row=$db->fetch_object($result)) {
                                $id=$row->need_id;
                                $status = ($row->status == 0) ? "obrisan" : "aktivan";
                                $i++;
                                echo "<tr class='align-middle'>";                           
                                    echo "<td scope='col'>{$i}</td>";
                                    echo "<td scope='col' class='editable-text' data-field='name' data-id='{$id}'>{$row->name}</td>";
                                    echo "<td scope='col' class='editable-dropdown' data-field='status' data-id='{$id}' data-status='{$row->status}'>{$status}</td>";
                            ?>
                                <td scope="col">
                                    <a class="edit-need" href="#" data-id="<?php echo $id?>" data-bs-toggle="tooltip" data-bs-title="Izmeni zapis"><i class="bi bi-pencil"></i></a>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>

                    <button type="submit" class="btn btn-primary mb-3" id="new-need" data-bs-toggle="modal" data-bs-target="#addNeedModal">Dodaj novu posebnu potrebu</button>
<!--i ovo dole ce da se ponavlja vrv-->
                    <nav aria-label="Paginacija">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a href="spec_needs.php?page=<?php echo ($current_page - 1); ?>" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <?php
                                for ($i = 1; $i <= $pages; $i++) {
                                    echo "<li class='page-item'><a class='page-link' href='spec_needs.php?page={$i}'>{$i}</a></li>";
                                }
                            ?>
                            <li class="page-item">
                                <a class="page-link" href="spec_needs.php?page=<?php echo ($current_page + 1); ?>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span></a>
                            </li>
                        </ul>
                    </nav>


                </div><!--col-6 me-auto tabela + paginacija-->

               <!-- <div class="col-2 me-auto info-pane">
                    
                    <b><i class="bi bi-info-square" id="info-icon"></i><span> Uputstvo</span></b>
                    <div class="info-pane visually-hidden" id="info"><i>Da biste korigovali zapis u tabeli, jednostavno kliknite na polje koje želite da promenite.<br><br>U prozoru koji se otvori unesite novu vrednost i kliknite na dugme "<b>Izmeni</b>".<br><br>Molimo Vas, <b>obratite pažnju</b> da će se promena naziva rase odraziti na već postojeće zapise o psima (za razliku od statusa).</i></div>
                    

                </div>-->

                <?php require_once("components/_admin_menu_left.php");?>

                <div id="answer">
                    <!--ovde ide odgovor-->
                </div>
                
            </div><!--row-admin-->
        </div><!--main-admin-content-->

        <?php require_once("components/_admin_footer.php");?>

    </div><!--container-->



    <!-- Text Field Edit Modal -->
    <div class="modal fade" id="editTextFieldModal" tabindex="-1" aria-labelledby="editTextFieldModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editTextFieldModalLabel">Ažurirajte naziv posebne potrebe</h5>
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
    <div class="modal fade" id="addNeedModal" tabindex="-1" aria-labelledby="addNeedModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addNeedModalLabel">Unesite novu posebnu potrebu:</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addNeedForm">
                        <div class="mb-3">
                            <label for="need-name" class="form-label">Posebna potreba:</label>
                            <input type="text" class="form-control" id="need-name" name="need-name">
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
    $('.edit-need').click(function() {
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

            updateNeed(fieldToEdit.id, newName, newStatus);
        });

        function updateNeed(id, name, status) {
            $.ajax({
                url: 'ajax/ajax_update_needs.php',
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

$("#addNeedForm").submit(function(e) {
        console.log("submit fja pozvana");
        e.preventDefault();
        var needName = $("#need-name").val();
        $.ajax({
            type: "POST",
            url: "ajax/ajax_new_need.php", 
            data: {
                need_name: needName
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

                    $("#addNeedForm")[0].reset();
                    var addNeedModal = bootstrap.Modal.getInstance(document.getElementById('addNeedModal'));
                    addNeedModal.hide();

                    var newRow=$("<tr>");
                    newRow.append($("<td>").text(answer.need_id));
                    newRow.append($("<td>").addClass("editable-text").attr("data-field", "name").attr("data-id", answer.need_id).text(needName));
                    newRow.append($("<td>").addClass("editable-dropdown").attr("data-field", "status").attr("data-id", answer.need_id).text("aktivan"));

                    $("#needs tbody").append(newRow);

                }
            },  
        });
    });
    
    //incijalizacija bootstrap toogle funkcionalnosti
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

    });

</script>

