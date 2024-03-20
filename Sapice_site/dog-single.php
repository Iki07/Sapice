<?php 
    require_once("partials/header-connect.php"); 
    require_once("partials/header.php"); 
    
    $dog_id=$_GET['id'];

    $query="SELECT * FROM dogs_details WHERE dog_id={$dog_id}";
    $result=$db->query($query);
    $row=$db->fetch_object($result);

    $partial_url="../../Sapice_complete/Sapice_admin/";

    $query_img="SELECT * FROM dog_imgs WHERE dog_id={$dog_id}";
    $result_img=$db->query($query_img);
    $imgs=array();
    $i=0;
    while ($row_img=$db->fetch_object($result_img)){
        $img_id=$row_img->img_id;
        if($row_img->profile=="da"){
            $profile_img=$partial_url.$row_img->img_source;
            $profile_img_name=$row_img->name;
        } else {
            $img_src=$partial_url.$row_img->img_source;
            $name=$row_img->name;
            $imgs[$i]=array("img_id"=>$img_id, "img_src"=>$img_src, "name"=>$name);
            $i++;
        };
        
    }
    $length=count($imgs);

    $query_random_dogs = "SELECT * FROM dogs_details WHERE dog_id != {$dog_id} ORDER BY RAND() LIMIT 3";
    $result_random_dogs = $db->query($query_random_dogs);

    $db->close();

?>

<section class="content-section">
    <div class="wrapper">
        <div class="top-info-content">
            <div class="top-gallery">
                <div class="top-gallery-item">
                    <figure>
                        <a href="<?php echo $profile_img?>" class="fancybox-overlay" data-fancybox="gallery-dog">
                            <img src="<?php echo $profile_img?>" alt="<?php echo $profile_img?>">
                        </a>
                    </figure>
                </div>


                <div class="top-gallery-thumbs">
                    <?php
                    for ($i=0; $i<$length;$i++){
                        echo "<figure>";
                            echo "<a href='".$imgs[$i]['img_src']."' class='fancybox-overlay' data-fancybox='gallery-dog'>";
                                echo "<img src='".$imgs[$i]['img_src']."' alt='".$imgs[$i]['name']."'></a>";
                        echo "</figure>";
                    }
                    ?>
                </div>
            </div>
            <div class="top-text">
                <hgroup>
                    <?php  
                    echo "<h1>{$row->name}</h1>";
                    echo "<ul>";
                        echo "<li><strong>{$row->gender}</strong> &bull; {$row->breed} &bull; {$row->age} god. &bull; {$row->weight} kg</li>";

                        echo "<li><strong>Nadjen: </strong> {$row->found_where} &bull; ".date("d.m.Y",strtotime($row->found_when))."</li>";

                        echo "<li><strong>Osobine: </strong>{$row->characteristics}</li>";
                        echo "<li><strong>Posebne potrebe: </strong>{$row->spec_needs}</li>";
                    ?>
                    </ul>
                </hgroup>
                <a href="kontakt.php?id=4&dog_id=<?php echo $dog_id?>" class="button">Usvoji me</a>
            </div>
        </div>

        <div class="content-wrapper">
            <h4>Opis</h4>
            <?php
            echo $row->description;
            ?>
        </div>
    </div>
</section> 

<section class="content-section border-top">
    <div class="wrapper">
        <h2>Pogledajte još</h2>
        <div class="content-columns dog-grid">
        <?php 
        while ($row_random_dogs=$db->fetch_object($result_random_dogs)){
            $id=$row_random_dogs->dog_id;
            $img_src=$partial_url.$row_random_dogs->profile_img;
            echo "<article>";
                echo "<figure>";
                    echo "<a href='dog-single.php?id={$id}'><img src='{$img_src}' alt='{$row_random_dogs->name}'></a>";
                echo "</figure>";
                echo "<p class='tag'>{$row_random_dogs->breed}</p>";     
                echo "<h5><a href='dog-single.php?id={$id}'>{$row_random_dogs->name}</a></h5>";
                echo "<p class='meta'><strong>{$row_random_dogs->gender}</strong> •";
                $god = ($row_random_dogs->age == 2 || $row_random_dogs->age == 3 || $row_random_dogs->age == 4) ? " godine star" : " godina star";
                echo $row_random_dogs->age.$god;
                echo "</p>";
            echo "</article>";
        }

        ?>
        </div>
    </div>
</section>

<?php require_once("partials/footer.php"); ?>