<?php 
    require_once("partials/header-connect.php"); 
    require_once("partials/header.php"); 
?>

<section class="page-hero home-hero">
    <div class="wrapper">
        <hgroup>
            <h1>Dom za kuce <br>
            bez doma</h1>
        </hgroup>
    </div>
</section>

<section class="content-section">
    <div class="wrapper">
        <h2>Oni čekaju vas</h2>
        <div class="content-columns dog-grid dog-slider">
            <?php
                $query="SELECT * FROM dogs_details WHERE status=1 ORDER BY created DESC LIMIT 7";
                $result=$db->query($query);
                $db->close();
                while($row=$db->fetch_object($result)) {
                    $id=$row->dog_id;
                    echo "<article>";
                        echo "<figure>";
                            echo "<a href='dog-single.php?id={$id}'><img src='../../Sapice_complete/Sapice_admin/{$row->profile_img}' alt='{$row->name}'></a>";
                        echo "</figure>";
                        echo "<p class='tag'>{$row->breed}</p>";     
                        echo "<h5><a href='dog-single.php?id={$id}'>{$row->name}</a></h5>";
                        echo "<p class='meta'><strong>{$row->gender}</strong> •";
                        $god = ($row->age == 2 || $row->age == 3 || $row->age == 4) ? " godine star" : " godina star";
                        echo $row->age.$god;
                        echo "</p>";
                    echo "</article>";
                }
            ?>       
        </div><!--dog-grid dog-slider-->
    </div><!--wrapper-->
</section><!--content-section-->

<section class="content-section light">
    <div class="wrapper">
        <div class="content-wrapper">
            <h2>O nama</h2>
            <p>Dobro došli na našu stranicu, mesto ljubavi i nade za one koji su zaboravljeni, zanemareni i ostavljeni. Mi smo tu da pružimo pravac i svrhu životima pasa bez doma, pružajući im ljubav i brigu koju zaslužuju.</p>
            <p>Naše delovanje je dvostruko: ne samo da nalazimo trajne domove za naše beskućne pse, već i ukazujemo na probleme s kojima se suočavaju ovi hrabri preživeli. Oni možda nemaju glas, ali mi smo tu da govorimo u njihovo ime, šireći svest o njihovim teškoćama i borbi za preživljavanje.</p>
            <a href="o-nama.php" class="button">Saznajte više o nama</a>
        </div><!--content-wrapper-->
    </div><!--wrapper-->
</section><!--content-section light-->

<section class="content-section">
    <div class="wrapper">
        <h2>Kako pomoći</h2>
        <?php require_once ("partials/kako-pomoci-content.php"); ?>
    </div><!--wrapper-->
</section><!--content-section-->


<?php require_once("partials/footer.php"); ?>