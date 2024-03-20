<?php
    session_start();
    require_once("classes/class_base.php");
    require_once("include/functions.php");
    
    loginCheck();
//dodaj proveru role ulogovanog korisnika
    $db=new Base();
    if(!$db->connect()) exit();
//ovaj se deo ponavlja, razmisli o f-ji na all dogs, all charrs, all breeds, needs, users...
    $records="SELECT * FROM users";
    $result=$db->query($records);
    $row=$db->fetch_object($result);
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
    <title>Korisnici</title>
</head>

<body>

    <div class="container">

        <?php require_once("components/_admin_header.php"); ?>
        <div class="main-admin-content">
            <div class="row admin">
                <div class="col-6 mb-5">
                    <h2>Pregled postojećih korisnika</h2>
                </div><!--col-6-->
                <div class="col-6 mb-5 text-end align-self-center">
                    <a href="logout.php?page=all_users.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
                </div><!--col-6 text-end-->
            
                <div class="col-9 me-auto"> <!--tabela + paginacija-->
                    <table id="users" class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">Red.br.</th>
                                <th scope="col">Ime</th>
                                <th scope="col">Prezime</th>
                                <th scope="col">E-mail adresa</th>
                                <th scope="col">Telefon</th>
                                <th scope="col">Uloga</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <?php
                            $roles=array();
                            $active_roles=array();
                            $query_roles="SELECT * FROM roles";
                            $result_roles=$db->query($query_roles);
                            $k=1;
                            while ($row_role=$db->fetch_assoc($result_roles)){
                                if($row_role['status']==0) {
                                    $roles[$row_role['role_id']]="Nije definisana";
                                } else {
                                    $roles[$row_role['role_id']]=$row_role['name'];
                                    $active_roles[$k]=$row_role['name'];
                                    $k++;
                                }
                            }

                            $query="SELECT * FROM users LIMIT {$limit} OFFSET {$offset}";
                            $result=$db->query($query);
                            $i=0;
                            while($row=$db->fetch_object($result)) {
                                $id=$row->user_id;
                                $role=$roles[$row->role_id];
                                $status = ($row->status == 0) ? "obrisan" : "aktivan";
                                $i++;
                                echo "<tr class='align-middle'>";                           
                                    echo "<td scope='col'>{$i}</td>";

                                    echo "<td scope='col' class='editable-text' data-field='name' data-id='{$id}'>{$row->name}</td>";

                                    echo "<td scope='col' class='editable-text' data-field='last-name' data-id='{$id}'>{$row->last_name}</td>";

                                    echo "<td scope='col' class='editable-text' data-field='email' data-id='{$id}' data-email='{$row->email}'>{$row->email}</td>";

                                    echo "<td scope='col' class='editable-text' data-field='phone' data-id='{$id}'>{$row->phone}</td>";

                                    echo "<td scope='col' class='editable-dropdown' data-field='role' data-id='{$id}' data-role='{$row->role_id}'>{$role}</td>";

                                    echo "<td scope='col' class='editable-dropdown' data-field='status' data-id='{$id}' data-status='{$row->status}'>{$status}</td>";
                            ?>
                                <td scope="col">
                                    <ul class="nav justify-content-left">
                                        <!--<li class="nav-item">
                                            <a class="nav-link edit-user" href="view_user.php?id=<?php echo $id?>" data-id="<?php echo $id?>" data-bs-toggle="tooltip" data-bs-title="Izmeni zapis"><i class="bi bi-pencil"></i></a>
                                        </li>-->
                                        <li class="nav-item">
                                            <a class="nav-link edit-user" href="#" data-id="<?php echo $id?>" data-bs-toggle="tooltip" data-bs-title="Izmeni zapis"><i class="bi bi-pencil"></i></a>
                                        </li>
                                        <!--<li class="nav-item">
                                            <a class="nav-link new-password" href="change_password.php" data-id="<?php echo $id?>" data-bs-toggle="tooltip" data-bs-title="Nova lozinka"><i class="bi bi-shield-slash"></i></a>
                                        </li>-->
                                        <li class="nav-item">
                                            <a class="nav-link new-password" href="#" data-id="<?php echo $id?>" data-email="<?php echo $row->email;?>" data-bs-toggle="tooltip" data-bs-title="Nova lozinka"><i class="bi bi-shield-slash"></i></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link delete-user" href="#" data-id="<?php echo $id ?>" data-bs-toggle="tooltip" data-bs-title="Obriši zapis"><i class="bi bi-trash"></i></a>
                                        </li>  
                                    </ul>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
<div class="mb-3 mt-3 d-flex">
                    <button type="button" class="btn btn-primary me-2" id="new-user" >Dodaj novog korisnika</button>

                    <a class="page-link" href="view_user.php?id=<?php echo $_SESSION['id']?>"> <button type="button" class="btn btn-primary" id="new-user" >Pogledaj svoje podatke</button></a>
</div>

<!--i ovo dole ce da se ponavlja vrv-->
                    <nav aria-label="Paginacija">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a href="users.php?page=<?php echo ($current_page - 1); ?>" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <?php
                                for ($i = 1; $i <= $pages; $i++) {
                                    echo "<li class='page-item'><a class='page-link' href='users.php?page={$i}'>{$i}</a></li>";
                                }
                            ?>
                            <li class="page-item">
                                <a class="page-link" href="users.php?page=<?php echo ($current_page + 1); ?>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span></a>
                            </li>
                        </ul>
                    </nav>


                </div><!--col-6 me-auto tabela + paginacija-->


                <?php require_once("components/_admin_menu_left.php");?>

                <div id="answer">
                    <!--ovde ide odgovor-->
                </div>
                
            </div><!--row-admin-->
        </div><!--main-admin-content-->

        <?php require_once("components/_admin_footer.php");?>

    </div><!--container-->



    <!-- Text Field Edit Modal -->
    <div class="modal fade" id="edit-modal" tabindex="-1" aria-labelledby="edit-modal-label"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="edit-modal-label">Ažurirajte zapis o korisniku</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="edit-text">
                        <div class="mb-3">
                            <label for="edit-text-value" class="form-label">Ime:</label>
                            <input type="text" class="form-control" id="edit-text-value" name="edit-text-value">
                        </div>
                        <div class="mb-3">
                            <label for="edit-last-name" class="form-label">Prezime:</label>
                            <input type="text" class="form-control" id="edit-last-name" name="edit-last-name">
                        </div>
                        <div class="mb-3">
                            <label for="edit-email" class="form-label">Email adresa:</label>
                            <input type="text" class="form-control" id="edit-email" name="edit-email">
                        </div>
                        <div class="mb-3">
                            <label for="edit-phone" class="form-label">Telefon:</label>
                            <input type="text" class="form-control" id="edit-phone" name="edit-phone">
                        </div>
                        
                        <div class="mb-3">
                            <label for="edit-role" class="form-label">Uloga:</label>
                            <select class="form-select" id="edit-role" name="edit-role">
                               <!-- <option selected>Izaberite status:</option>-->
                                
                            <?php
                                for ($i=1; $i<=count($active_roles); $i++) {
                                    echo "<option value='{$i}'>{$active_roles[$i]}</option>";
                                }
                            ?>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="edit-status" class="form-label">Novi status:</label>
                            <select class="form-select" id="edit-status" name="edit-status">
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

</body>

</html>

<script src="assets/jquery/code.jquery.com_jquery-3.7.0.js"></script>
<!-----bootstrap je vec jquery, sto da ga ukljucujem 2x??-->
<!--"ukljucivanje" jquery-->
<script>
    $(document).ready(function() {
//$(document).on('click', '.edit-user', function() {

    $('#new-user').click(function() {
        window.location.assign("new_user.php");
        });

    function populateModalFields(userData) {
        $('#edit-text-value').val(userData.name);
        $('#edit-last-name').val(userData.last_name);
        $('#edit-email').val(userData.email);
        $('#edit-phone').val(userData.phone);
        $('#edit-role').val(userData.role_id);
        $('#edit-status').val(userData.status);
    }

    
        $('.edit-user').click(function(e) {
            e.preventDefault();
            var userId = $(this).data('id');
            var userData = {
                name: $(this).closest('tr').find('.editable-text[data-field="name"]').text(),
                last_name: $(this).closest('tr').find('.editable-text[data-field="last-name"]').text(),
                email: $(this).closest('tr').find('.editable-text[data-field="email"]').text(),
                phone: $(this).closest('tr').find('.editable-text[data-field="phone"]').text(),
                role_id: $(this).closest('tr').find('.editable-dropdown[data-field="role"]').data('role'),
                status: $(this).closest('tr').find('.editable-dropdown[data-field="status"]').data('status'),
            };

            populateModalFields(userData);

            $('#edit-modal').modal('show');

            $('#edit-confirm').off('click').on('click', function () {
                var active_roles = ["Administrator", "Urednik", "Korisnik"];
                var updatedData = {
                    name: $('#edit-text-value').val(),
                    last_name: $('#edit-last-name').val(),
                    email: $('#edit-email').val(),
                    phone: $('#edit-phone').val(),
                    role_id: $('#edit-role').val(),
                    status: $('#edit-status').val(),
                };
                console.log("podaci za: " + userId, updatedData);
                //var updated_data = JSON.stringify(updatedData);
                $.ajax({
                    type: 'POST',
                    url: 'ajax/ajax_update_user.php',
                    data: {
                        user_id: userId, 
                        user_data: updatedData
                    },
                    success: function (response) {
                        console.log(response);
                        var answer = JSON.parse(response);
                        if (answer.error !== "") {
                            $("#answer").addClass("mb-3 alert alert-danger");
                            $("#answer").html(answer.error);
                        } else {
                            var updated_data = answer.updated_data;
                            var tableRow = $('.edit-user[data-id="' + userId + '"]').closest('tr');
                            tableRow.find('.editable-text[data-field="name"]').text(updated_data.name);
                            tableRow.find('.editable-text[data-field="last-name"]').text(updated_data.last_name);
                            tableRow.find('.editable-text[data-field="email"]').text(updated_data.email);
                            tableRow.find('.editable-text[data-field="phone"]').text(updated_data.phone);

                            var roleDisplay = tableRow.find('.editable-dropdown[data-field="role"]');
                            roleDisplay.text(updated_data.role);
                            roleDisplay.data('role', updated_data.role_id);

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

                        $('#edit-modal').modal('hide');
                        
                    }
                    
                })
            })
        })

    $('.delete-user').click (function(e) {
        e.preventDefault();
        var confirmation = confirm("Da li ste sigurni da zelite da obrisete ovaj zapis?");
        if (confirmation) {
            var userId = $(this).data('id');
    
            console.log("user id za brisanje: "+userId);
            
            $.ajax({
                url: "ajax/ajax_delete_user.php",
                type: 'GET',
                data: { id: userId },
                success: function (response) {
                        console.log(response);
                        var answer = JSON.parse(response);
                        if (answer.error !== "") {
                            $("#answer").addClass("mb-3 alert alert-danger");
                            $("#answer").html(answer.error);
                        } else {
                            $("#answer").removeClass("alert alert-danger d-none");
                            $("#answer").addClass("mb-3 alert alert-success");
                            $("#answer").html(answer.success);
                        }
                        setTimeout(function() {
                            $("#answer").addClass("d-none");
                            location.reload();
                        }, 2000);
                    }
            });
        }
    });

    $('.new-password').click (function(e) {
        e.preventDefault();
        var userId = $(this).data('id');
        var userEmail= $(this).data('email');
        var user_loggedin_id='<?php echo $_SESSION['id']; ?>';
        console.log("id ulogovanog korisnika: " +user_loggedin_id);
        console.log("id korisnika kome se menja lozinka: "+userId);
        console.log("email korisnika kome se menja lozinka: "+userEmail);

        if(user_loggedin_id == userId) {
            window.location.assign("change_password.php");
        } else {
            $.ajax({
                url: "ajax/reset_password.php",
                type: 'POST',
                data: { id: userId, email: userEmail },                    success: function (response) {
                    console.log(response);
                    var answer = JSON.parse(response);
                    if (answer.error !== "") {
                        $("#answer").addClass("mb-3 alert alert-danger");
                        $("#answer").html(answer.error);
                    } else {
                        $("#answer").removeClass("alert alert-danger d-none");
                        $("#answer").addClass("mb-3 alert alert-success");
                        $("#answer").html(answer.success);
                    }
                    setTimeout(function() {
                        $("#answer").addClass("d-none");
                        location.reload();
                    }, 2000);
                }
            });
        }
    });
    
    //incijalizacija bootstrap toogle funkcionalnosti
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

    });

</script>

