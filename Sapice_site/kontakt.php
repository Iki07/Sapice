<?php require_once("partials/header.php");?>

<section class="page-hero simple internal-bgr-2">
    <div class="wrapper">
        <hgroup>
            <h1>Kontakt</h1>
        </hgroup>
    </div>
</section>

<section class="content-section">
    <div class="wrapper">
        <div class="form-outer">
            <form id="contact-form">
                <div class="form-row half">
                    <div class="form-item">
                        <label>Ime i prezime</label>
                        <input type="text" name="name" placeholder="Ime i prezime">
                    </div>
                    <div class="form-item">
                        <label>Email</label>
                        <input type="email" name="email" placeholder="Email">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-item">
                        <label>Razlog javljanja</label>
                        <select name="reason">
                            <option value="1" <?php if (isset($_GET['id']) && $_GET['id'] == '1') echo "selected"; ?>>Generalna pitanja</option>
                            <option value="2" <?php if (isset($_GET['id']) && $_GET['id'] == '2') echo "selected"; ?>>Donacija</option>
                            <option value="3" <?php if (isset($_GET['id']) && $_GET['id'] == '3') echo "selected"; ?>>Volontiranje</option>
                            <option value="4" <?php if (isset($_GET['id']) && $_GET['id'] == '4') echo "selected"; ?>>Usvajanje</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-item">
                        <label>Poruka</label>
                        <textarea name="message" placeholder="Poruka"></textarea>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-item">
                        <input type="hidden" name="dog_id" id="dog_id" value="<?php echo $_GET['dog_id'] ?? null ?>">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-item">
                        <button type="submit" class="button">Pošalji</button>
                    </div>
                </div>

                <div class="form-row" id="answer">
                </div>
            </form>
        </div>
    </div>
</section>

<?php require_once("partials/footer.php");?>

<script>

$(function() {
  $('#contact-form').submit(function(e){
    e.preventDefault();
    var formData = new FormData (this);
    console.log(formData);
    $.ajax({
        url:'ajax/ajax-contact-form.php',
        type: 'POST',
        data: formData,
        success: function (response) {
            let answer=JSON.parse(response);
            if(answer.error!=""){
                $("#answer").addClass("mb-3 alert alert-danger");
                $("#answer").html(answer.error);
                return false;
            } else {
                $("#answer").removeClass("alert alert-danger");
                $("#answer").addClass("mb-3 alert alert-success");
                $("#answer").html(answer.success);
            }
        },
        cache: false,
        contentType: false,
        processData: false
    })
  })

$("#cancel").click(function(e) {
    e.preventDefault(); 
    var r = confirm ("Da li ste sigurni da želite da odustanete?"); 
    if (r == true) { 
        $('#contact-form')[0].reset();
    } 
});

})

</script>