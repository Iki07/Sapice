<?php 
    require_once("partials/header-connect.php"); 
    require_once("partials/header.php"); 

    $query = "SELECT * FROM img_categories ORDER BY category_id DESC";
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
        <div class="content-columns">
        <?php
            while($row=$db->fetch_object($result)) {
                $category_id=$row->category_id;
                $img_src=$partial_url.$row->img_src;
                echo "<article>";
                    echo "<figure>";
                        echo "<a href='galerija-category.php?id={$category_id}'><img src='{$img_src}' alt='{$row->name}'</a>";
                    echo "</figure>";
                    echo "<h4><a href='galerija-category.php?id={$category_id}'>{$row->name}</a></h4>";
                echo "</article>";
            }
        ?>

        </div>
    </div>
</section>

<?php require_once ("partials/footer.php"); ?>