<?php include 'partials/header.php' ?>

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
            <form>
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
                            <option value="1">Generalna pitanja</option>
                            <option value="2">Donacija</option>
                            <option value="3">Volontiranje</option>
                            <option value="4">Usvajanje</option>
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
                        <button type="submit" class="button">Pošalji</button>
                        </div>
                </div>
            </form>
        </div>
    </div>
</section>

<?php include 'partials/footer.php' ?>