<?php 
    require_once ("partials/header-connect.php"); 
    require_once("partials/header.php"); 
    $category_id=$_GET['id'];

    $category_query = "SELECT name FROM img_categories WHERE category_id = {$category_id}";
    $category_result = $db->query($category_query);
    $category_row = $db->fetch_object($category_result); 
    $name=$category_row->name;      

    $query = "SELECT * FROM all_images WHERE category_id={$category_id} ORDER BY RAND() LIMIT 9";
    $result=$db->query($query);
    $db->close();
    $partial_url="../../Sapice_complete/Sapice_admin/";
    
?>

<section class="page-hero simple internal-bgr-1">
    <div class="wrapper">
        <hgroup>
            <h1>Galerija</h1>
        </hgroup>
    </div>
</section>

<section class="content-section">
    <div class="wrapper">
        <div class="content-wrapper">
            <h2>Galerija slika - <?php echo $name?></h2>
        </div>
        <div class="content-columns gallery-grid">
        <?php
            while($row=$db->fetch_object($result)) {
                $img_src=$partial_url.$row->img_source;
                echo "<article>";
                    echo "<figure>";
                        echo "<a href='{$img_src}' class='fancybox-overlay' data-fancybox='gallery-dog'><img src='{$img_src}' alt='{$row->name}'></a>";
                    echo "</figure>";
                echo "</article>";
            }
        ?>
        </div>
    </div>
</section>

<?php require_once ("partials/footer.php"); ?>