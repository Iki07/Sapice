<?php include 'partials/header.php' ?>

<section class="page-hero simple internal-bgr-3">
    <div class="wrapper">
        <hgroup>
            <h1>Usvoji</h1>
        </hgroup>
    </div>
</section>

<section class="content-section">
    <div class="wrapper">

        <div class="filters">
            <div class="filter-item">
                <label for="rasa">Rasa</label>
                <select name="rasa" id="rasa">
                    <option value="all">Sve</option>
                    <option value="jack-russel">Džek Rasel Terijer</option>
                    <option value="mixed">Mešanac</option>
                    <option value="malinois">Malinoa</option>
                    <option value="pit-bull">Pit bul terijer</option>
                    <option value="beagle">Bigl</option>
                </select>
            </div>
            <div class="filter-item">
                <label for="pol">Pol</label>
                <select name="pol" id="pol">
                    <option value="all">Sve</option>
                    <option value="male">Mužjak</option>
                    <option value="zenka">Ženka</option>
                </select>
            </div>
            <div class="filter-item">
                <label for="age">Godine</label>
                <select name="age" id="age">
                    <option value="all">Sve</option>
                    <option value="1">1 godina</option>
                    <option value="2">2 godine</option>
                    <option value="3">3 godine</option>
                    <option value="4">4 godine</option>
                    <option value="5">5 godina</option>
                    <option value="6">6 godina</option>
                    <option value="7">7 godina</option>
                    <option value="8">8 godina</option>
                    <option value="9">9 godina</option>
                    <option value="10">10 godina</option>
                    <option value="11">11 godina</option>
                    <option value="12">12 godina</option>
                    <option value="13">13 godina</option>
                    <option value="14">14 godina</option>
                    <option value="15">15 godina</option>
                    <option value="16">16 godina</option>
                    <option value="17">17 godina</option>
                    <option value="18">18 godina</option>
                    <option value="19">19 godina</option>
                    <option value="20">20 godina</option>
                </select>
            </div>
            <div class="filter-item">
                <label for="disability">Posebne potrebe</label>
                <select name="disability" id="disability">
                    <option value="all">Sve</option>
                    <option value="blind">Slep</option>
                    <option value="deaf">Gluv</option>
                    <option value="disabled">Invalid</option>
                </select>
            </div>
        </div>

        <div class="content-columns dog-grid">
            <article>
                <figure>
                    <a href="dog-single.php"><img src="uploads/dogs/dog-1-1.jpeg" alt="Radivoje"></a>
                </figure>
                <p class="tag">Džek Rasel Terijer</p>
                <h5><a href="dog-single.php">Radivoje</a></h5>
                <p class="meta"><strong>Mužjak</strong> • 2 godine star</p>
            </article>
            <article>
                <figure>
                    <a href="dog-single.php"><img src="uploads/dogs/dog-2-1.jpeg" alt="Mara"></a>
                </figure>
                <p class="tag">Mešanac</p>
                <h5><a href="dog-single.php">Mara</a></h5>
                <p class="meta"><strong>Ženka</strong> • 1 godinu stara</p>
            </article>
            <article>
                <figure>
                    <a href="dog-single.php"><img src="uploads/dogs/dog-3-1.jpeg" alt="Janko"></a>
                </figure>
                <p class="tag">Mešanac</p>
                <h5><a href="dog-single.php">Janko</a></h5>
                <p class="meta"><strong>Mužjak</strong> • 10 godina star</p>
            </article>
            <article>
                <figure>
                    <a href="dog-single.php"><img src="uploads/dogs/dog-4-1.jpeg" alt="Ruža"></a>
                </figure>
                <p class="tag">Malinoa</p>
                <h5><a href="dog-single.php">Ruža</a></h5>
                <p class="meta"><strong>Ženka</strong> • 12 godine stara</p>
            </article>
            <article>
                <figure>
                    <a href="dog-single.php"><img src="uploads/dogs/dog-5-1.jpeg" alt="Boki"></a>
                </figure>
                <p class="tag">Pit bul terijer</p>
                <h5><a href="dog-single.php">Boki</a></h5>
                <p class="meta"><strong>Mužjak</strong> • 6 godina star</p>
            </article>
            <article>
                <figure>
                    <a href="dog-single.php"><img src="uploads/dogs/dog-6-1.jpeg" alt="Rex"></a>
                </figure>
                <p class="tag">Mešanac</p>
                <h5><a href="dog-single.php">Rex</a></h5>
                <p class="meta"><strong>Mužjak</strong> • 3 godina star</p>
            </article>
            <article>
                <figure>
                    <a href="dog-single.php"><img src="uploads/dogs/dog-7-1.jpeg" alt="Jasna"></a>
                </figure>
                <p class="tag">Bigl</p>
                <h5><a href="dog-single.php">Jasna</a></h5>
                <p class="meta"><strong>Ženka</strong> • 3 meseca stara</p>
            </article>
            <article>
                <figure>
                    <a href="dog-single.php"><img src="uploads/dogs/dog-8-1.jpeg" alt="Laki"></a>
                </figure>
                <p class="tag">Mešanac</p>
                <h5><a href="dog-single.php">Laki</a></h5>
                <p class="meta"><strong>Mužjak</strong> • 10 godina star</p>
            </article>
            <article>
                <figure>
                    <a href="dog-single.php"><img src="uploads/dogs/dog-9-1.jpeg" alt="Borivoje"></a>
                </figure>
                <p class="tag">Bigl</p>
                <h5><a href="dog-single.php">Borivoje</a></h5>
                <p class="meta"><strong>Mužjak</strong> • 13 godina star</p>
            </article>
        </div>
    </div>
</section>

<?php include 'partials/footer.php' ?>