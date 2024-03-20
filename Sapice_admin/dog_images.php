<?php
    session_start();
    require_once("classes/class_base.php");
    require_once("include/functions.php");
    
    loginCheck();

    $db=new Base();
    if(!$db->connect()) exit();
//ovaj se deo ponavlja, razmisli o f-ji na all dogs, all charrs, all breeds, needs, users...

    isset($_GET['id'])? $dog_id=$_GET['id']: $dog_id=NULL;

    $records="SELECT * FROM dog_imgs WHERE dog_id=$dog_id";
    $result=$db->query($records);
    $row=$db->fetch_object($result);
    $dog_name=$row->name;
    $total_records=$db->num_rows($result);
    $limit=7;
    $offset=0;
    $pages=ceil($total_records/$limit);
    $current_page = isset($_GET['page']) && !empty($_GET['page']) ? $_GET['page'] : 1;
    $offset=($current_page-1)*$limit;

    $records="SELECT * FROM dogs WHERE dog_id=$dog_id";
    $result=$db->query($records);
    $row=$db->fetch_object($result);
    $dog_name=$row->name;
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php require_once("components/_admin_head.php");?>
    <title>Slike psa</title>
</head>

<body>

    <div class="container">

        <?php require_once("components/_admin_header.php"); ?>
        <div class="main-admin-content">
            <div class="row admin">
                <div class="col-6 mb-5">
                    <h2>Pregled unetih slika</h2>
                </div><!--col-6-->
                <div class="col-6 mb-5 text-end align-self-center">
                    <a href="logout.php?page=all_dogs.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
                </div><!--col-6 text-end-->
            
                <div class="col-6 me-auto"> <!--tabela + paginacija-->
                    <table id="imgs" class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">Red.br.</th>
                                <th scope="col">Slika</th>
                                <th scope="col">Naziv slike</th>
                                <th scope="col">Profilna slika</th>
                               <!-- <th scope="col">Putanja do slike</th>-->
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <?php
                            $query="SELECT * FROM dog_imgs WHERE dog_id=$dog_id LIMIT {$limit} OFFSET {$offset}";
                            $result=$db->query($query);
                            $i=$offset;
                            while($row=$db->fetch_object($result)) {
                                $id=$row->img_id;
                                $status = ($row->status == 0) ? "obrisan" : "aktivan";
                                $i++;
                                echo "<tr class='align-middle'>";                           
                                    echo "<td scope='col'>{$i}</td>";
                                    echo "<td scope='col'><figure class='thumbnail'><img src='{$row->img_source}' alt='{$row->name}' data-field='image' data-id='{$id}'></figure></td>";
                                    echo "<td scope='col' class='editable-text' data-field='name' data-id='{$id}'>{$row->name}</td>";
                                    echo "<td scope='col' class='editable-dropdown1' data-field='profile' data-id='{$id}' data-profile='{$row->profile}'>{$row->profile}</td>";
                                   // echo "<td scope='col' class='editable-text' data-field='path' data-id='{$id}'>{$row->img_source}</td>";
                                    echo "<td scope='col' class='editable-dropdown' data-field='status' data-id='{$id}' data-status='{$row->status}'>{$status}</td>";
                            ?>
                                <td scope="col">
                                    <a class="edit-img" href="#" data-id="<?php echo $id?>" data-bs-toggle="tooltip" data-bs-title="Izmeni zapis"><i class="bi bi-pencil"></i></a>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>

                    <button type="submit" class="btn btn-primary" id="new-img" data-bs-toggle="modal" data-bs-target="#addImgModal">Dodaj novu sliku</button>
<!--i ovo dole ce da se ponavlja vrv-->
                    <nav aria-label="Paginacija">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a href="dog_images.php?id=<?php echo $dog_id."&page=".($current_page - 1); ?>" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <?php
                                for ($i = 1; $i <= $pages; $i++) {
                                    echo "<li class='page-item'><a class='page-link' href='dog_images.php?id={$dog_id}&page={$i}'>{$i}</a></li>";
                                }
                            ?>
                            <li class="page-item">
                                <a class="page-link" href="dog_images.php?id=<?php echo $dog_id."&page=".($current_page + 1); ?>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span></a>
                            </li>
                        </ul>
                    </nav>


                </div><!--col-6 me-auto tabela + paginacija-->

                <!--<div class="col-2 me-auto info-pane">
                    
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
                    <h5 class="modal-title" id="editTextFieldModalLabel">Ažurirajte podatke o slici</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editTextFieldForm">
                        <div class="mb-3">
                            <label for="editTextFieldValue" class="form-label">Novi naziv:</label>
                            <input type="text" class="form-control" id="editTextFieldValue" name="editTextFieldValue">
                        </div>
                        <div class="mb-3">
                            <label for="editDropdownFieldValue1" class="form-label">Profilna slika:</label>
                            <select class="form-select" id="editDropdownFieldValue1" name="editDropdownFieldValue1">
                               <!-- <option selected>Izaberite status:</option>-->
                                <option value="da">da</option>
                                <option value="ne">ne</option>
                            </select>
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
    <div class="modal fade" id="addImgModal" tabindex="-1" aria-labelledby="addImgModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addImgModalLabel">Unesite novu sliku</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addImgForm">
                        <div class="mb-3">
                            <label for="dog-image" class="form-label">Izaberite sliku:</label>
                            <input type="file" class="form-control" id="dog-image" name="dog-image">
                        </div>
                        <div class="mb-3">
                            <label for="editDropdownFieldValue1" class="form-label">Da li želite da ovo bude profilna slika:</label>
                            <select class="form-select" id="editDropdownFieldValue1" name="editDropdownFieldValue1">
                               <!-- <option selected>Izaberite status:</option>-->
                                <option value="da">da</option>
                                <option value="ne">ne</option>
                            </select>
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
    var fieldToEdit;
    var idToEdit;

   /* var urlParams = new URLSearchParams(window.location.search);
    var imageIdToEdit = urlParams.get('id');
    console.log ("imageIdToEdit je: "+imageIdToEdit +" urlParams: " + urlParams);
    if (imageIdToEdit) {
        setTimeout(function() {
            $('.edit-img[data-id="' + imageIdToEdit + '"]').trigger('click');
        }, 250)
    }*/

//$(document).on('click', '.edit-breed', function() {
    $('.edit-img').click(function() {
            var icon = $(this);
            var row = icon.closest('tr');
            var id = icon.data('id');
            console.log ("id iz clcika je: "+id);
            var name = row.find('.editable-text').text();
            var profile = row.find('.editable-dropdown1').data('profile');
            var status = row.find('.editable-dropdown').data('status');
            console.log ("status je: "+status +" profil: " + profile);

            fieldToEdit = {
                id: id,
                name: name,
                profile: profile,
                status: status
            };

            $('#editTextFieldValue').val(name);
            $('#editDropdownFieldValue1').val(profile);
            $('#editDropdownFieldValue').val(status);
            $('#editTextFieldModal').modal('show');
        });

        $('#editTextFieldConfirm').click(function() {
            var newName = $('#editTextFieldValue').val();
            var newProfile = $('#editDropdownFieldValue1').val();
            var newStatus = $('#editDropdownFieldValue').val();
            console.log ("novi status je: "+newStatus+" novi profil: "+newProfile);
            $('#editTextFieldModal').modal('hide');

            updateImg(fieldToEdit.id, newName, newProfile, newStatus);
        });

        function updateImg(id, name, profile, status) {
            $.ajax({
                url: 'ajax/ajax_update_dog_images.php',
                type: 'POST',
                data: {
                    id: id,
                    name: name,
                    profile: profile,
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
                        $('[data-id="' + id + '"][data-fiels="profile"]').text(profile);
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

$("#addImgForm").submit(function(e) {
        console.log("submit fja pozvana");
        e.preventDefault();
        var dog_id='<?php echo $dog_id; ?>';
        var dog_name='<?php echo $dog_name; ?>';
        var formData = new FormData (this);
        console.log('form data: '+formData);

        formData.append('dog_id', dog_id); 
        formData.append('dog_name', dog_name);

     //   var imgName = $("#img-name").val();
        $.ajax({
            type: "POST",
            url: "ajax/ajax_new_dog_image.php", 
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                // handle server response here
                console.log(response);
                let answer=JSON.parse(response);
                if(answer.error!=""){
                    $("#answer").addClass("mb-3 alert alert-danger");
                    $("#answer").html(answer.error);
                    return false;
                }  else {
                    $("#answer").removeClass("alert alert-danger");
                    $("#answer").addClass("mb-3 alert alert-success");
                    $("#answer").html(answer.success);
                       // reset form and close modal

                    $("#addImgForm")[0].reset();
                    var addImgModal = bootstrap.Modal.getInstance(document.getElementById('addImgModal'));
                    addImgModal.hide();

                    var newRow=$("<tr>");
                    newRow.append($("<td>").text(answer.img_id));
                    newRow.append($("<td>").attr("data-field", "image").attr("data-id", answer.img_id).append($("<img>").attr("src", answer.img_src).attr("alt", answer.img_name).attr("height", "8š0")));
                    newRow.append($("<td>").addClass("editable-text").attr("data-field", "name").attr("data-id", answer.img_id).text(answer.img_name));
                    newRow.append($("<td>").addClass("editable-text").attr("data-field", "profile").attr("data-id", answer.img_id).text(answer.profile));
                    newRow.append($("<td>").addClass("editable-dropdown").attr("data-field", "status").attr("data-id", answer.img_id).text("aktivan"));
                    var editLink = $("<a>").addClass("edit-img").attr("href", "#").attr("data-id", answer.img_id).attr("data-bs-toggle", "tooltip").attr("data-bs-title", "Izmeni zapis").append($("<i>").addClass("bi bi-pencil"));
                    newRow.append($("<td>").append(editLink));

                    $("#imgs tbody").append(newRow);

                }
            },  
        });
    });
    
    //incijalizacija bootstrap toogle funkcionalnosti
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

    });

</script>

