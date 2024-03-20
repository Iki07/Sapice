<?php
    session_start();
    require_once("classes/class_base.php");
    require_once("include/functions.php");
    
    loginCheck();

    $db=new Base();
    if(!$db->connect()) exit();

    $records="SELECT * FROM blogs";
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
    <title>Svi postovi</title>
</head>

<body>

    <div class="container">

        <?php require_once("components/_admin_header.php"); ?>
        <div class="main-admin-content">
            <div class="row admin">
                <div class="col-6 mb-5">
                    <h2>Pregled svih postova</h2>
                </div><!--col-6-->
                <div class="col-6 mb-5 text-end align-self-center">
                    <a href="logout.php?page=all_blogs.php" class="text-decoration-none" id="logout-link">Odjavite se</a>
                </div><!--col-6 text-end-->
            
                <div class="col-9 me-auto"> <!--tabela + paginacija-->
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">Naslov</th>
                                <th scope="col">Podnaslov</th>
                                <th scope="col">Propratna slika</th>
                                <th scope="col">Kategorije</th> 
                                <th scope="col">Status</th>
                                <th scope="col">Opcije</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <?php
                            $query="SELECT * FROM blog_view LIMIT {$limit} OFFSET {$offset}";
                            $result=$db->query($query);
                            $i=$offset;
                            while($row=$db->fetch_object($result)) {
                                $i++;
                                $id=$row->blog_id;
                                switch ($row->status){
                                    case 0:
                                        $status="obrisan";
                                        break;
                                    case 1:
                                        $status="aktivan";
                                        break;
                                }                            
                            echo "<tr class='align-middle'>";                           
                                echo "<td scope='col'>{$i}</td>";
                                echo "<td scope='col'>{$row->title}</td>";
                                echo "<td scope='col'>{$row->subtitle}</td>";
                                echo "<td scope='col'><img class='rounded' src='{$row->img_source}' alt='{$row->img_name}' height='80'></td>";
                                echo "<td scope='col'> {$row->blog_categories} </td>";
                                echo "<td scope='col' data-status='{$status}'> {$status} </td>";
                            ?>
                                <td scope="col">
                                    <ul class="nav justify-content-left">
                                        <li class="nav-item">
                                            <a class="nav-link" href="view_blog.php?id=<?php echo $id?>" data-bs-toggle="tooltip" data-bs-title="Više detalja"><i class="bi bi-three-dots"></i></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link delete-blog" href="#" data-id="<?php echo $id ?>" data-bs-toggle="tooltip" data-bs-title="Obriši zapis"><i class="bi bi-trash"></i></a>               
                                        </li>                           
                                    </ul>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>

                    <button type="button" class="btn btn-primary me-2" id="new-blog" >Dodaj novi post</button>
                    <nav aria-label="Paginacija">
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a href="all_blogs.php?page=<?php echo ($current_page - 1); ?>" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <?php
                                for ($i = 1; $i <= $pages; $i++) {
                                    echo "<li class='page-item'><a class='page-link' href='all_blogs.php?page={$i}'>{$i}</a></li>";
                                }
                            ?>
                            <li class="page-item">
                                <a class="page-link" href="all_blogs.php?page=<?php echo ($current_page + 1); ?>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span></a>
                            </li>
                        </ul>
                    </nav>

                    <div id="answer">
                        <!--ovde ide odgovor-->
                    </div>
                
                </div><!--col-9 me-auto tabela + paginacija-->

                <?php require_once("components/_admin_menu_left.php");?>

            </div><!--row-admin-->
        </div><!--main-admin-content-->

        <?php require_once("components/_admin_footer.php");?>

    </div><!--container-->    
</body>
</html>

<script>
$(document).ready(function() {
    //incijalizacija bootstrap toogle funkcionalnosti
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

    $('#new-blog').click(function() {
        window.location.assign("new_blog.php");
    });

    $(document).on('click', '.delete-blog', function(e) {
        e.preventDefault();
        var confirmation = confirm("Da li ste sigurni da želite da obrišete ovaj zapis?");
        if (confirmation) {
                var id = $(this).data('id');
                console.log("id je: "+id);
                $.ajax({
                    url: "ajax/ajax_delete_blog.php",
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
                            $('[data-id="' + id + '"]').closest('tr').find('[data-status]').text("obrisan");
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

