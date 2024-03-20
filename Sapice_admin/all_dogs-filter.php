<?php
    session_start();
    require_once("classes/class_base.php");
    require_once("include/functions.php");
    
    loginCheck();

    $db=new Base();
    if(!$db->connect()) exit();

    $records="SELECT * FROM dogs";
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
    <title>Svi psi - pregled informacija</title>
</head>

<body>

    <div class="container">

        <?php require_once("components/_admin_header.php"); ?>
        <div class="main-admin-content">
            <div class="row admin">
                <div class="col-6 mb-5">
                    <h2>Pregled svih zapisa o psima</h2>
                </div><!--col-6-->
                <div class="col-6 mb-5 text-end align-self-center">
                    <a href="logout.php?page=all_dogs.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
                </div><!--col-6 text-end-->
             
                <div class="mb-3 d-flex">
                    <form action="all_dogs-filter.php" method="POST">
                        <input name="search_term" id="search_term" class="col-4 me-2" type="text" placeholder="Unesite termin za pretragu...">
                        <!--<button type="button" class="btn btn-primary me-2" id="searchButton">Pretraži</button>-->
                        <label for="statusFilter">Filter by Category:</label>
                        <select name="statusFilter" id="statusFilter">
                            <option value="">Svi statusi</option>
                            <option value="0">Obrisan</option>
                            <option value="1">Za usvajanje</option>
                            <option value="2">Usvojen</option>
                            <!-- Add more categories as needed -->
                        </select>

                        <button type="submit" class="btn btn-primary me-2" id="searchButton">Pretraži</button>
                    </form>
                </div>

                <div class="col-9 me-auto"> <!--tabela + paginacija-->
                    <table class="table table-hover table-responsive" id="myTable">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">Ime</th>
                                <th scope="col">Profilna slika</th>
                                <th scope="col">Godine</th>
                                <th scope="col">Pol</th> 
                                <th scope="col">Status</th>
                                <th scope="col">Opcije</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <?php
                            $searchCondition ="";
                            $status_filter="";
                           /* if (isset($_POST['search_term'])) {
                                $searchTerm = $_POST['search_term'];
                                echo $searchTerm."<hr>";
                                $searchCondition = "WHERE name LIKE '%$searchTerm%' OR gender LIKE '%$searchTerm%' OR description LIKE '%$searchTerm%' OR found_where LIKE '%$searchTerm%'";
                            }*/
                            if (isset($_POST['search_term'])) {
                                $searchTerm = $_POST['search_term'];
                                echo $searchTerm."<hr>";
                                $searchCondition = " AND (name LIKE '%$searchTerm%' OR gender LIKE '%$searchTerm%' OR description LIKE '%$searchTerm%' OR found_where LIKE '%$searchTerm%')";
                            }
                            if (isset($_POST['statusFilter']) and $_POST['statusFilter']!="") {
                                $statusFilter = $_POST['statusFilter'];
                                echo $statusFilter."<hr>";
                                $status_filter = " AND status={$statusFilter}";
                            }


                            $query0="SELECT * FROM dogs WHERE 1";
                            $queryZ=" LIMIT {$limit} OFFSET {$offset}";
                            $query=$query0.$searchCondition.$status_filter.$queryZ;
                 
                           // $query="SELECT * FROM dogs $searchCondition LIMIT {$limit} OFFSET {$offset}";
                            echo $query."<hr>";
                            $result=$db->query($query);
                            while($row=$db->fetch_object($result)) {
                                $id=$row->dog_id;
                                $img_query="SELECT profile_img FROM dogs_details WHERE dog_id=$id";      
                                $img_result=$db->query($img_query);   
                                $img_src=$db->fetch_object($img_result)->profile_img;  
                                switch ($row->gender){
                                    case "Mužjak":
                                        $gender="Mužjak";
                                        break;
                                    case "Ženka":
                                        $gender="Ženka";
                                        break;
                                    default:
                                        $gender="Nije unet";
                                        break;
                                }   
                                switch ($row->status){
                                    case 1:
                                        $status="Za usvajanje";
                                        break;
                                    case 2:
                                        $status="Usvojen";
                                        break;
                                    default:
                                        $status="Obrisan";
                                        break;
                                }                            
                            echo "<tr class='align-middle'>";                           
                                echo "<td scope='col'>{$id}</td>";
                                echo "<td scope='col'>{$row->name}</td>";
                                echo "<td scope='col'><img class='rounded' src='$img_src' alt='profilna slika' height='80'></td>";
                                echo "<td scope='col'> {$row->age} </td>";
                                echo "<td scope='col'> {$gender} </td>";
                                echo "<td scope='col' data-status='{$status}'> {$status} </td>";
                            ?>
                                <td scope="col">
                                    <ul class="nav justify-content-left">
                                        <li class="nav-item">
                                            <a class="nav-link" href="view_dog.php?id=<?php echo $id?>" data-bs-toggle="tooltip" data-bs-title="Više detalja"><i class="bi bi-three-dots"></i></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="dog_images.php?id=<?php echo $id?>" data-bs-toggle="tooltip" data-bs-title="Sve slike ovog psa"><i class="bi bi-images"></i></a>
                                        </li> 
                                        <li class="nav-item">
                                            <a class="nav-link delete-dog" href="#" data-id="<?php echo $id ?>" data-bs-toggle="tooltip" data-bs-title="Obriši zapis"><i class="bi bi-trash"></i></a>               
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
                                <a href="all_dogs-filter.php?page=<?php echo ($current_page - 1); ?>" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <?php
                                for ($i = 1; $i <= $pages; $i++) {
                                    echo "<li class='page-item'><a class='page-link' href='all_dogs-filter.php?page={$i}'>{$i}</a></li>";
                                }
                            ?>
                            <li class="page-item">
                                <a class="page-link" href="all_dogs-filter.php?page=<?php echo ($current_page + 1); ?>" aria-label="Next">
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

        /*$("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });*/
    function resetForm() {
        document.getElementById("filterForm").reset();
    }

        $(document).on('click', '.delete-dog', function(e) {
            e.preventDefault();
            var confirmation = confirm("Da li ste sigurni da želite da obrišete ovaj zapis?");

            if (confirmation) {
                var id = $(this).data('id');
                console.log("id je: "+id);

                $.ajax({
                    url: "ajax/ajax_delete_dog.php",
                    type: 'GET',
                    data: { id: id },
                    success: function (response) {
                        console.log(response);
                        let answer=JSON.parse(response);
                        if(answer.error!=""){
                            $("#answer").addClass("mb-3 alert alert-danger text-center");
                            $("#answer").html(answer.error);
                            return false;
                        } else {
                            $("#answer").removeClass("alert alert-danger");
                            $("#answer").addClass("mb-3 alert alert-success text-center");
                            $("#answer").html(answer.success);
                            $('[data-id="' + id + '"]').closest('tr').find('[data-status]').text("Obrisan");
                            setTimeout(function() {
                                $("#answer").addClass("d-none"); 
                            }, 2000); 
                        }
                    },
                    cashe:false
                });
            }
        });

    });

</script>

