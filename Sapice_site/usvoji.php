<?php 
    require_once("partials/header-connect.php");
    require_once("partials/header.php"); 
    require_once("include/functions.php");

    $limit=9;
    $current_page = isset($_GET['page']) && !empty($_GET['page']) ? $_GET['page'] : 1;
    $page_name = basename($_SERVER['PHP_SELF']);
?>

<section class="page-hero simple internal-bgr-3">
    <div class="wrapper">
        <hgroup>
            <h1>Usvoji</h1>
        </hgroup>
    </div>
</section><!--hero section-->

<section class="content-section">
    <div class="wrapper">

        <div class="filters">
            <div class="filter-item">
                <label for="breed">Rasa</label>
                <select name="breed" id="breed">
                    <option value="all">Sve</option>
                    <?php
                        $query_breeds="SELECT * FROM breeds WHERE status=1";
                        $result_breeds=$db->query($query_breeds);
                        while($row=$db->fetch_object($result_breeds)) {
                            echo "<option value='{$row->name}'>{$row->name}</option>";
                        }
                        ?>
                </select>
            </div><!--breed-->

            <div class="filter-item">
                <label for="gender">Pol</label>
                <select name="gender" id="gender">
                    <option value="all">Sve</option>
                    <option value="Mužjak">Mužjak</option>
                    <option value="Ženka">Ženka</option>
                </select>
            </div><!--gender-->

            <div class="filter-item">
                <label for="size">Veličina</label>
                <select name="size" id="size">
                    <option value="all">Sve</option>
                    <option value="small">Mali psi</option>
                    <option value="medium">Srednji psi</option>
                    <option value="large">Veliki psi</option>
                </select>
            </div><!--size-->
            
            <div class="filter-item">
                <label for="special-needs">Posebne potrebe</label>
                <select name="special-needs" id="special-needs">
                    <option value="all">Sve</option>
                    <?php
                        $query_needs="SELECT * FROM special_needs WHERE status=1";
                        $result_needs=$db->query($query_needs);
                        while($row=$db->fetch_object($result_needs)) {
                            echo "<option value='{$row->name}'>{$row->name}</option>";
                        }
                    ?>
                </select>
            </div><!--special needs-->
        </div><!--filters-->
        
        <input type="hidden" id="current-page" value="<?php echo $current_page; ?>">
        <input type="hidden" id="page_name" value="<?php echo $page_name; ?>">

        <div class="content-columns dog-grid">

        </div><!--content columns-->

        <nav aria-label="Paginacija">
            <ul class="pagination justify-content-center">
            </ul>
        </nav>

    </div><!--wrapper-->
</section><!--content section-->
<?php 
    $db->close();
    require_once("partials/footer.php"); 
?>

<script>
$(document).ready(function() {
    $('#breed, #gender, #size, #special-needs').change(function() {
        var limit = '<?php echo $limit; ?>';
        var breed = $('#breed').val() || 'all';
        var gender = $('#gender').val() || 'all';
        var size = $('#size').val() || 'all';
        var special_needs = $('#special-needs').val() || 'all';
        var current_page = $('#current-page').val();
        var page_name = $('#page_name').val();

        $.ajax ({
            method: 'POST',
            url: 'ajax/ajax-dog-filter.php',
            data: { breed: breed, gender: gender, size: size, special_needs: special_needs, limit: limit, current_page: current_page, page_name: page_name},
            success: function(response) {
                let answer=JSON.parse(response);
                $('.content-columns').html(answer.dog_list_html);
                $('.pagination').html(answer.pagination_html);
            }
        });
    }).trigger('change');  
});
</script>