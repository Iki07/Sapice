<?php
    require_once("ajax-header-connect.php"); 
    require_once("../include/functions.php");

    $filter_breed="";
    $filter_gender="";
    $filter_size="";
    $filter_need="";

    if (isset($_POST['breed']) and $_POST['breed']!="all") {
        $filter = $_POST['breed'];
        $filter_breed = " AND breed='{$filter}'";
    }

    if (isset($_POST['gender']) and $_POST['gender']!="all") {
        $filter = $_POST['gender'];
        $filter_gender = " AND gender ='{$filter}'";
    }

    if (isset($_POST['size']) and $_POST['size']!="all") {
        $filter = $_POST['size'];
        $filter_size = " AND size_category = '{$filter}'";
    }

    if (isset($_POST['special_needs']) and $_POST['special_needs']!="all") {
        $filter = $_POST['special_needs'];
        $filter_need = " AND spec_needs LIKE '%{$filter}%'";
    }

    $filter=$filter_breed.$filter_gender.$filter_size.$filter_need;
    $limit=$_POST['limit'];
    $current_page = $_POST['current_page'];
    if ($filter==""){
        $offset = ($current_page - 1) * $limit;
    } else {
        $offset=0;
    }
 
    $pages = calculatePages($db, "dogs_details", $limit, $filter);

    $query_dogs="SELECT * FROM dogs_details WHERE status=1".$filter." LIMIT {$limit} OFFSET {$offset}";
    $result_dogs=$db->query($query_dogs);

    $page_name=$_POST['page_name'];
    $previous = ($current_page > 1) ? ($current_page - 1) : '1';
    $next = ($current_page < $pages) ? ($current_page + 1) : '$pages';

    $dog_list_html = "";
    $i = 0;
    while ($row_dog = mysqli_fetch_object($result_dogs)) {
        $id = $row_dog->dog_id;
        if ($i < $limit) {
            $dog_list_html .= "<article>";
            $dog_list_html .= "<figure>";
            $dog_list_html .= "<a href='dog-single.php?id={$id}'><img src='../../Sapice_complete/Sapice_admin/{$row_dog->profile_img}' alt='{$row_dog->name}'></a>";
            $dog_list_html .= "</figure>";
            $dog_list_html .= "<p class='tag'>$row_dog->breed</p>";
            $dog_list_html .= "<h5><a href='dog-single.php?id={$id}'>{$row_dog->name}</a></h5>";
            $dog_list_html .= "<p class='meta'><strong>{$row_dog->gender}</strong>•";
            $god = ($row_dog->age == 2 || $row_dog->age == 3 || $row_dog->age == 4) ? " godine star" : " godina star";
            $dog_list_html .= $row_dog->age.$god;
            $dog_list_html .= "</p>";   
            $dog_list_html .= "</article>";
            $i++;
        } else {
            break;
        }
    }

    $pagination_html = generatePaginationHtml($page_name, $pages, $current_page, $previous, $next);

    $response = array('dog_list_html' => $dog_list_html, 'pagination_html' => $pagination_html);
    echo json_encode($response, 256);

?>



