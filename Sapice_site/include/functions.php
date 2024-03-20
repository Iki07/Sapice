<?php    
    function calculatePages ($db, $table, $limit, $filter){
        $records="SELECT * FROM {$table} WHERE status=1".$filter;
        $records_result=$db->query($records);
        $total_records=$db->num_rows($records_result);
        return ceil($total_records/$limit);  
    }

    function generatePaginationHtml($page_name, $pages, $current_page, $previous, $next){
        $pagination_html = "<li class='page-item'><a class='page-link' href='{$page_name}?page={$previous}'><span aria-hidden='true'>&laquo;</span></a></li>";
        for ($i = 1; $i <= $pages; $i++) {
            $activeClass = ($i == $current_page) ? 'active' : '';
            $pagination_html .= "<li class='page-item {$activeClass}'><a class='page-link' href='{$page_name}?page={$i}'>{$i}</a></li>";
        }
        $pagination_html .= "<li class='page-item'><a class='page-link' href='{$page_name}?page={$next}'><span aria-hidden='true'>&raquo;</span></a></li>";

        return $pagination_html;
    }
?>
