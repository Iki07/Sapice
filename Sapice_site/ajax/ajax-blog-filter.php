<?php
    require_once("ajax-header-connect.php"); 
    require_once("../include/functions.php"); 

    $partial_url="../../Sapice_complete/Sapice_admin/";

    $filter="";
    if (isset($_POST['blog_category']) and $_POST['blog_category']!="all") {
        $filter = $_POST['blog_category'];
        $filter = " AND blog_categories LIKE '%{$filter}%'";
    }

    $limit=$_POST['limit'];
    $current_page = $_POST['current_page'];
    if ($filter==""){
        $offset = ($current_page - 1) * $limit;
    } else {
        $offset=0;
    }

    $pages = calculatePages($db, "blog_view", $limit, $filter);

    $query_blogs="SELECT * FROM blog_view WHERE status=1".$filter." LIMIT {$limit} OFFSET {$offset}";
    $result_blogs=$db->query($query_blogs);

    $page_name=$_POST['page_name'];
    $previous = ($current_page > 1) ? ($current_page - 1) : '1';
    $next = ($current_page < $pages) ? ($current_page + 1) : '$pages';

    $blog_list_html = "";
    $i = 0;
    while($row_blog=$db->fetch_object($result_blogs)) {
        $id=$row_blog->blog_id;
        if ($i < $limit) {
            $blog_list_html .= "<article>";
            $blog_list_html .= "<figure>";
            $blog_list_html .= "<img src='../Sapice_admin/{$row_blog->img_source}' alt='{$row_blog->img_name}'>";
            $blog_list_html .= "</figure>";
            $blog_list_html .=  "<h4><a href='blog-single.php?id=".$id."'>{$row_blog->title}</a></h4>";
            $blog_list_html .=  "<p>{$row_blog->subtitle}</p>";
            $blog_list_html .=  "<p>{$row_blog->blog_categories}</p>";
            $blog_list_html .=  "</article>";

        }
    }

    $pagination_html = generatePaginationHtml($page_name, $pages, $current_page, $previous, $next);

    $response = array('blog_list_html' => $blog_list_html, 'pagination_html' => $pagination_html);
    echo json_encode($response, 256);
?>

