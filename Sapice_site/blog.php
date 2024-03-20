<?php 
    require_once("partials/header-connect.php"); 
    require_once("partials/header.php");  
    require_once("include/functions.php");

    $limit=6;
    $current_page = isset($_GET['page']) && !empty($_GET['page']) ? $_GET['page'] : 1;
    $page_name = basename($_SERVER['PHP_SELF']);
    
?>

<section class="page-hero simple internal-bgr-2">
    <div class="wrapper">
        <hgroup>
            <h1>Blog</h1>
        </hgroup>
    </div>
</section>

<section class="content-section">

    <div class="wrapper">
            <div class="filters">
                <div class="filter-item" style="max-width:340px;">
                    <label for="blog-category">Kategorije</label>
                    <select name="blog-category" id="blog-category">
                        <option value="all">Sve</option>
                        <?php
                            $query_bc="SELECT * FROM blog_categories WHERE status=1";
                            $result_bc=$db->query($query_bc);
                            while($row=$db->fetch_object($result_bc)) {
                                echo "<option value='{$row->name}'>{$row->name}</option>";
                            }
                        ?>
                    </select>
                </div><!--filter-item-->
            </div> <!--filters-->

            <input type="hidden" id="current-page" value="<?php echo $current_page; ?>">
            <input type="hidden" id="page_name" value="<?php echo $page_name; ?>">

        <div class="content-columns"></div><!--content columns-->
        
        <nav aria-label="Paginacija">
            <ul class="pagination justify-content-center">
            </ul>
        </nav>

    </div><!--wrapper-->
</section>

<?php 
    $db->close();
    require_once("partials/footer.php"); 
?>


<script>
$(document).ready(function() { 
    $('#blog-category').change(function(){
        var limit='<?php echo $limit; ?>';
        var blog_category = $('#blog-category').val() || 'all';
        var current_page = $('#current-page').val();
        var page_name = $('#page_name').val();

        $.ajax ({
            method: 'POST',
            url: 'ajax/ajax-blog-filter.php',
            data: { blog_category: blog_category, limit: limit, current_page: current_page, page_name: page_name},
            success: function(response) {
                let answer=JSON.parse(response);
                $('.content-columns').html(answer.blog_list_html);
                $('.pagination').html(answer.pagination_html);
            }
        });
    }).trigger('change');
});

</script>

