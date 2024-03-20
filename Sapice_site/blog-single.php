<?php     
    require_once("partials/header-connect.php"); 
    require_once("partials/header.php"); 

    $blog_id=$_GET['id']; 

    $query="SELECT * FROM blogs WHERE blog_id={$blog_id}";
    $result=$db->query($query);
    $row=$db->fetch_object($result);

    $partial_url="../../Sapice_complete/Sapice_admin/";

    $query_random_blogs = "SELECT * FROM blog_view WHERE blog_id != {$blog_id} ORDER BY RAND() LIMIT 3";
    $result_random_blogs = $db->query($query_random_blogs);

    $db->close();
        
    
?>

<section class="page-hero simple internal-bgr-2">
    <div class="wrapper">
        <hgroup>
            <?php 
            echo "<h1>{$row->title}</h1>";
            ?>
        </hgroup>
    </div>
</section>

<section class="content-section">
    <div class="wrapper">
        <div class="content-wrapper">
            <?php 
            echo "<h4>{$row->subtitle}</h4>";
            echo "<p>{$row->blog_text}</p>"
            ?>
        </div>
    </div>
</section>

<section class="content-section border-top">
    <div class="wrapper">
        <h2>Pogledajte još</h2>
        <div class="content-columns">
            <?php 
            while ($row_random_blogs=$db->fetch_object($result_random_blogs)) {
                $id=$row_random_blogs->blog_id;
                $img_src=$partial_url.$row_random_blogs->img_source;
                echo "<article>";
                    echo "<figure>";
                        echo "<img src='{$img_src}' alt='{$row_random_blogs->title}'>";
                    echo "</figure>";
                    echo "<h4><a href='blog-single.php?id={$id}'>{$row_random_blogs->title}</a></h4>";
                    echo "<p>{$row_random_blogs->text_short}</p>";
                echo "</article>";
            }
            
            ?>
        </div>
    </div>
</section>

<?php require_once("partials/footer.php"); ?>