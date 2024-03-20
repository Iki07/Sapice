<?php
//fajl za konfigurisanje meni-ja (na main_admin.php strani i svim ostalim stranama gde je prisutan levi pomocni meni)
$menu = array(
    'Psi' => array(
        'Pogledaj sve pse u bazi' => "all_dogs.php",
        'Dodaj novog psa' => "new_dog.php"
    ),
    'Korisnici' => array(
        'Pogledaj sve korisnike u bazi' => "all_users.php",
        'Dodaj novog korisnika' => "new_user.php",
        'Pogledaj svoje podatke' => "view_user.php?id={$_SESSION['id']}"
    ),
    'Galerija' => array(
        'Pogledaj sve slike u bazi' => "all_images.php",
        'Dodaj novu sliku' => "new_image.php"
    ),
    'Blog' => array (
        'Pregledaj sve postove' => "all_blogs.php",
        'Dodaj novi post' => "new_blog.php"
    ),
    'Volonteri' => array(
        'Pregledaj sve volontere' => "#",
        'Dodaj novog volontera' => "#"
    ),
    'Sponzori' => array(
        'Pregledaj sve sponzore' => "#",
        'Dodaj novog sponzora' => "#"
    ),
    'Ostalo' => array (
        'Pregled postojećih rasa pasa' => "breeds.php",
        'Pregled unetih osobina pasa' => "characteristics.php",
        'Pregled posebnih potreba' => "spec_needs.php", 
        //'Pregled slika pasa' => "dog_images.php",
       // 'Pogledaj statistiku' => "#"
    )
);
?>