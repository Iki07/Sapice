-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 20, 2024 at 02:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sapice`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_images`
-- (See below for the actual view)
--
CREATE TABLE `all_images` (
`img_id` varchar(13)
,`original_id` int(10) unsigned
,`name` varchar(255)
,`category_id` decimal(10,0)
,`category` varchar(50)
,`img_source` varchar(255)
,`created` timestamp
,`status` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(10) UNSIGNED NOT NULL,
  `title` tinytext NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `blog_text` text NOT NULL,
  `img_source` varchar(250) DEFAULT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisan\r\n1-aktivan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `title`, `subtitle`, `blog_text`, `img_source`, `img_name`, `created`, `status`) VALUES
(1, 'Putovanje usvajanja: Kako pronaći svog savr&scaron;enog psa', 'Otkrijte korake i savete za usvajanje psa koji će biti savr&scaron;en dodatak vašoj porodici.', 'Pronalaženje savr&scaron;enog psa za vas i va&scaron;u porodicu može biti divno, ali i zahtevno putovanje. U svetu gde postoje tolike rase pasa, skloni&scaron;ta puna onih koji čekaju na svoj dom, može biti te&scaron;ko znati odakle početi. Ovaj članak ima za cilj da vas uputi u korake koje trebate preduzeti da biste prona&scaron;li psa koji će biti savr&scaron;en dodatak va&scaron;oj porodici.\n\nPrvi korak u ovom putovanju jeste razumevanje &scaron;ta želite od psa. Da li vam je potreban pas koji može trčati sa vama ili pas koji je miran i voli da se mazi? Da li preferirate određenu rasu ili ste otvoreni za sve opcije? Da li ste spremni da se brinete o psu sa posebnim potrebama ili bi vam bilo bolje sa psom koji zahteva minimalno održavanje? Sve su to pitanja koja treba da razmotrite pre nego &scaron;to krenete na put usvajanja.\n\nSledeći korak je istraživanje. Provedite neko vreme učenjem o različitim rasama pasa, njihovim temperamentima i potrebama. Proučite koje rase pasa se najbolje slažu sa decom, koje su najbolje za stanovanje u stanu, koje rase zahtevaju najvi&scaron;e vežbe, i tako dalje. Internet je ogroman izvor informacija, ali možete razgovarati i sa veterinarima, trenerima pasa ili radnicima u skloni&scaron;tima za pse.\n\nPoseta skloni&scaron;tima za pse može biti veoma koristan korak. Ovde možete upoznati različite pse i razgovarati sa osobljem koje može pružiti korisne informacije o njihovim temperamentima i potrebama. Ponekad, pas koji se čini savr&scaron;enim za vas na papiru može da ne odgovara va&scaron;em načinu života kada ga upoznate lično.\n\nRazmislite o vremenu koje ste spremni da posvetite svom psu. Psi zahtevaju mnogo vi&scaron;e od hrane i skloni&scaron;ta. Potrebna im je redovna vežba, socijalizacija, trening i posvećeno vreme za igru. Ovo je posebno važno ako razmi&scaron;ljate o usvajanju &scaron;teneta. Imajte na umu da va&scaron; novi ljubimac može biti deo va&scaron;e porodice narednih 10-15 godina, pa se potrudite da budete spremni na dugoročnu obavezu.\n\nUzmite u obzir i finansijski aspekt usvajanja psa. Usvajanje psa iz skloni&scaron;ta može imati određene početne tro&scaron;kove, ali tu su i tro&scaron;kovi hrane, veterinarskih usluga, igračaka, treninga i slično. Važno je da budete sigurni da možete da pokrijete sve tro&scaron;kove pre nego &scaron;to usvojite psa.\n\nSvaki pas je jedinstven, sa svojim specifičnim potrebama i osobinama. Kada pronađete psa koji bi mogao biti dobar za vas, provedite neko vreme sa njim pre nego &scaron;to donesete odluku. Ovo vam može pružiti uvid u njegov karakter i pokazati da li se dobro slažete.\n\nNakon &scaron;to pronađete svog savr&scaron;enog psa, zapamtite da će mu biti potrebno vreme da se prilagodi novom domu. Budite strpljivi i pružite mu puno ljubavi. Takođe, razmislite o obuci za pse, &scaron;to može biti od velike pomoći u integraciji novog člana u va&scaron;u porodicu.\n\nPutovanje usvajanja psa može biti emotivno i zahtevno, ali nagrade su beskrajne. Usvajanjem psa ne samo da pružate dom nekom ko je ostao bez njega, već takođe dobijate novog člana porodice koji će pružiti bezuslovnu ljubav i radost.\n\nNa kraju, ne zaboravite da je ovo putovanje samo početak. Usvajanje psa je dugoročna obaveza koja donosi mnogo radosti, ali i obaveza. Sve &scaron;to možete da učinite je da se pripremite najbolje &scaron;to možete, da budete strpljivi, i da uživate u procesu pronalaženja svog savr&scaron;enog psa.', 'uploads/blog_imgs/.jpg', 'Saveti za usvajanje psa2.jpg', '2023-07-21 11:18:40', 1),
(2, 'Snaga veze: Kako izgraditi poverenje sa svojim usvojenim psom', 'Ključevi za snažnu povezanost i harmoniju s usvojenim psom.', 'Snaga veze: Kako izgraditi poverenje sa svojim usvojenim psom\r\n\r\nUsvajanje psa može biti ispunjavajuće iskustvo, kako za vas tako i za psa koji je prona&scaron;ao novi dom. Međutim, mnogi usvojeni psi doživljavaju određene izazove i traume pre nego &scaron;to se prilagode novoj sredini. Izgradnja poverenja sa svojim usvojenim psom ključna je za uspe&scaron;no prilagođavanje i harmoničan odnos između vas i va&scaron;eg novog ljubimca. Evo nekoliko korisnih saveta kako biste izgradili snažnu vezu sa svojim usvojenim psom:\r\n\r\n1. Strpljenje i razumevanje: Razumevanje da je va&scaron; usvojeni pas možda pro&scaron;ao te&scaron;ko iskustvo u pro&scaron;losti je prvi korak ka izgradnji poverenja. Budite strpljivi jer će va&scaron; ljubimac možda trebati vremena da se opusti i pokaže svoj pravi karakter. Neka pas odluči kada je spreman za fizički kontakt i nemojte ga forsirati u situacije koje bi mogle izazvati stres.\r\n\r\n2. Konsistentnost i rutina: Psi vole predvidivost i rutinu. Stoga, poku&scaron;ajte da održite svakodnevni raspored hranjenja, &scaron;etnji i igre. To će pomoći va&scaron;em psu da se oseća sigurnije i bolje se prilagodi novoj sredini. Osim toga, budite dosledni u komunikaciji i nagrađivanju željenog pona&scaron;anja.\r\n\r\n3. Komunikacija neverbalnim jezikom: Psi su majstori čitanja neverbalnih signala. Upotrebite blagi i smirujući ton glasa kako biste komunicirali sa svojim usvojenim psom. Izbegavajte preterano glasne ili o&scaron;tre tonove koji bi mogli izazvati strah kod psa. Pokažite ljubav i pažnju kako biste izgradili poverenje.\r\n\r\n4. Igra kao sredstvo povezivanja: Igra je odličan način da se povežete sa svojim usvojenim psom. Upotrebite igračke i interaktivne aktivnosti kako biste podstakli pasivne pse ili umanjili anksioznost kod nervoznih pasa. Igra će vam omogućiti da se zajedno opustite i stvorite pozitivne veze.\r\n\r\n5. Posetite trenera: Ako se va&scaron; usvojeni pas bori sa pona&scaron;anjem ili je pro&scaron;ao kroz traumatično iskustvo, razmotrite posetu stručnom psihologu ili treneru pasa. Kvalifikovani profesionalci mogu pružiti potrebne tehnike i strategije kako biste bolje razumeli potrebe svog psa i pomogli mu da se brže prilagodi novoj okolini.\r\n\r\n6. Ponudite sigurno utoči&scaron;te: Obezbedite svom usvojenom psu sigurno mesto u va&scaron;em domu gde će se osećati za&scaron;tićeno i bezbedno. Dajte mu svoj miran kutak sa mekanom posteljinom i dovoljno prostora da se povuče kada mu je potrebno vreme samoće.\r\n\r\n7. Upoznavanje sa drugim psima i ljudima: Postupno uvodite svog usvojenog psa drugim psima i ljudima. Socijalizacija je važna kako bi se va&scaron; pas osećao ugodno u različitim situacijama. Međutim, vodite računa da to radite postepeno i u kontrolisanim uslovima kako biste izbegli preveliki stres.\r\n\r\nNemojte očekivati trenutne rezultate, jer izgradnja poverenja sa usvojenim psom zahteva vreme i predanost. Va&scaron;a posvećenost i pažnja će na kraju rezultirati snažnom vezom između vas i va&scaron;eg novog četvoronožnog prijatelja. Budite strpljivi i otvoreni, a uskoro ćete uživati u ispunjujućem odnosu sa svojim usvojenim psom koji će trajati dugi niz godina.', 'uploads/blog_imgs/blog_2.jpg', NULL, '2023-07-21 11:26:46', 1),
(3, 'Prvi koraci: Priprema doma za dolazak usvojenog psa', 'Stvaranje ljubavi i topline za dugogodi&scaron;nju sreću sa usvojenim psom', 'Dolazak usvojenog psa u va&scaron; dom može biti jedno od najuzbudljivijih i ispunjavajućih iskustava. Međutim, pre nego &scaron;to dovedete novog ljubimca, važno je pravilno pripremiti dom kako biste mu pružili sigurno i ljubazno okruženje. Ključni koraci koje treba preduzeti kako biste se pripremili za dolazak usvojenog psa mogu učiniti tranziciju glatkom i stvoriti temelje za snažan i dugotrajan odnos.\r\n\r\n1. Istražite pasminu i karakteristike: Pre nego &scaron;to usvojite psa, istražite različite pasmine i razmislite koja bi vam najbolje odgovarala. Svaka pasmina ima svoje jedinstvene karakteristike i potrebe. Odlučite se za psa čiji će temperament i potrebe odgovarati va&scaron;em životnom stilu.\r\n\r\n2. Priprema doma: Preuredite svoj dom kako biste stvorili bezbedno i prijateljsko okruženje za psa. Uklonite potencijalne opasnosti poput otrovnih biljaka, sitnih predmeta ili električnih kablova koje pas može gristi. Odredite mirno mesto gde će pas imati svoj kutak sa posteljinom i igračkama.\r\n\r\n3. Nabavite osnovnu opremu: Nabavite neophodnu opremu pre nego &scaron;to dovedete psa kući. To uključuje posudu za hranu i vodu, ogrlicu i povodac, igračke, četku i ležaj. Opremite se i sredstvima za či&scaron;ćenje za brži odgovor na nesreće tokom procesa prilagođavanja.\r\n\r\n4. Angažujte članove porodice: Razgovarajte sa svim članovima porodice o odgovornostima koje će imati prema psu. Jasno odredite raspored hranjenja, &scaron;etnji i brige kako biste se svi aktivno uključili u brigu o novom članu porodice.\r\n\r\n5. Obezbedite veterinarsku negu: Zakazivanje posete veterinaru odmah po dolasku psa je od presudne važnosti. Veterinar će proveriti zdravstveno stanje psa i preporučiti potrebne vakcinacije i tretmane. Ovo je takođe idealna prilika da postavite pitanja i dobijete savete o brizi za va&scaron;eg novog ljubimca.\r\n\r\n6. Polako uvodite novog psa u dom: Kada dovedete psa kući, polako ga upoznajte sa novim okruženjem. Neka istražuje prostor postepeno i omogućite mu da se privikne na novu atmosferu. Ohrabrujte pozitivno pona&scaron;anje i nagrađujte ga za dobre postupke.\r\n\r\n7. Strpljenje i ljubav: Prilagodba novog psa može potrajati neko vreme, stoga budite strpljivi. Neka pas odabere svoj tempo i ne forsirajte ga u situacije koje izazivaju strah. Pristupite mu sa mnogo ljubavi, pažnje i razumevanja kako biste izgradili poverenje i sigurnost.\r\n\r\n8. Posvetite se obuci: Investirajte vreme u obuku svog psa. Osnovni trening komandi pomoći će vam u komunikaciji i izgradnji jačih veza. Trening će takođe pobolj&scaron;ati samopouzdanje psa i pomoći mu da se uklopi u porodični život.\r\n\r\n9. Socijalizacija: Integri&scaron;ite psa u va&scaron;u zajednicu i izvodite ga u susret sa drugim psima i ljudima. Socijalizacija je ključna za izgradnju samopouzdanja i poverenja kod va&scaron;eg psa.\r\n\r\nPriprema doma za dolazak usvojenog psa zahteva pažnju i predanost, ali će vam trud biti nagrađen snažnom povezano&scaron;ću i ljubavlju. Pravilna priprema će va&scaron;em psu omogućiti da se lak&scaron;e prilagodi novom okruženju i osjeti se dobrodo&scaron;lim članom va&scaron;e porodice.', 'uploads/blog_imgs/Prvi koraci: Priprema doma za dolazak usvojenog psa.jpg', NULL, '2023-07-21 11:43:38', 1),
(11, 'Pas na Putovanju: Pratnja koja čini putovanje jo&scaron; nezaboravnijim', 'Kako se pripremiti i uživati u putovanju sa Va&scaron;im vernim četvoronožnim prijateljem', '&lt;p&gt;Odlučivanje da va&scaron; verni pratilac bude deo va&scaron;e avanture znači da ćete morati prilagoditi neke aspekte putovanja. Prvo, pronađite destinacije koje su prijateljski nastrojene prema psima. Mnogi gradovi i hoteli su postali otvoreniji prema kućnim ljubimcima, &scaron;to olak&scaron;ava pronalaženje odgovarajućeg sme&scaron;taja. Takođe, istražite zanimljive lokacije i parkove u blizini koji će va&scaron;em psu pružiti dovoljno mogućnosti za igru i vežbanje.&lt;/p&gt;\r\n&lt;p&gt;Priprema za putovanje sa psom takođe uključuje posetu veterinaru kako biste proverili zdravstveno stanje va&scaron;eg ljubimca i osigurali da je on dovoljno za&scaron;tićen od bolesti koje se mogu prenositi na putovanjima. Va&scaron; veterinar će vam takođe dati potrebne informacije o putovanju sa psom i preporučiti moguće dodatke ishrani i lekove koji bi mogli biti korisni tokom puta.&lt;/p&gt;\r\n&lt;p&gt;Putovanje sa psom zahteva pažljivo pakovanje. Obezbedite sve &scaron;to je potrebno za va&scaron;eg psa, uključujući hranu, posude za hranu i vodu, igračke, povodac, ogrlicu i naravno, njegovu omiljenu ćebadicu ili jastuk. Ako planirate duže putovanje, razmislite o tome kako osigurati udobnost svog psa tokom vožnje.&lt;/p&gt;\r\n&lt;p&gt;Na putovanju, osigurajte da va&scaron; pas bude dobro pripitomljen i držite ga na povocu kada ste na javnim mestima. Po&scaron;tujte pravila i propise u vezi sa psima u području koje posećujete, kako biste izbegli neprijatne situacije.&lt;/p&gt;\r\n&lt;p&gt;Kada stignete na odredi&scaron;te, vreme je za istraživanje zajedno! Neka va&scaron; pas uživa u novim mirisima, zvucima i okolinama. Budite strpljivi i dajte mu vremena da se prilagodi novom okruženju. Upoznajte lokalne staze i parkove kako biste mogli provoditi kvalitetno vreme zajedno.&lt;/p&gt;\r\n&lt;p&gt;Putovanje sa psom može biti nezaboravno iskustvo koje će ojačati va&scaron; odnos i doneti mnogo radosti. Pravilna priprema, briga i pažnja prema va&scaron;em ljubimcu omogućiće vam da zajedno stvarate predivne uspomene koje ćete dugo pamtiti. Stoga, bez obzira na odredi&scaron;te, razmislite o tome da svog psa povedete na putovanje i uživajte u avanturi zajedno!&lt;/p&gt;', 'uploads/blog_imgs/blog_11.jpg', 'blog_11.jpg', '2023-07-24 22:04:57', 1),
(12, 'Briga o Va&scaron;em psu: Najče&scaron;će bolesti i ključni saveti za njihovu prevenciju', 'Očuvajte zdravlje Va&scaron;eg ljubimca - Saveti za prevenciju i za&scaron;titu od čestih bolesti', '&lt;p&gt;Kao odgovorni vlasnici, jedan od najvažnijih aspekata brige o na&scaron;em četvoronožnom prijatelju je za&scaron;tita njihovog zdravlja. Psi, kao i ljudi, podložni su različitim bolestima i stanjima koja mogu uticati na njihovu dobrobit i sreću. U ovom vodiču, istražujemo najče&scaron;će bolesti pasa i pružamo vam ključne savete kako ih za&scaron;tititi i održati va&scaron;eg psa zdravim i srećnim.&lt;/p&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Zarazne bolesti: Zarazne bolesti kao &scaron;to su besnilo, parvoviroza, zarazni hepatitis i ka&scaron;alj pasa (kenel ka&scaron;alj) su ozbiljna pitanja koja zahtevaju pažljivu za&scaron;titu. Redovno vakcinisanje va&scaron;eg psa je ključno za prevenciju ovih bolesti. Posavetujte se sa veterinarom o preporučenom rasporedu vakcinacija za va&scaron;eg ljubimca.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Buve i krpelji: Paraziti kao &scaron;to su buve i krpelji mogu izazvati ozbiljne probleme kod pasa, uključujući svrab, alergijske reakcije i preno&scaron;enje opasnih bolesti. Redovno tretiranje psa antiparazitskim sredstvima i redovno pregledavanje dlake mogu pomoći u sprečavanju infestacije buvama i krpeljima.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Problemi sa kožom: Psi su skloni različitim kožnim problemima poput alergija, infekcija i ekcema. Pravilna ishrana bogata hranljivim sastojcima, redovna higijena i redovni posete veterinaru pomažu u očuvanju zdrave kože va&scaron;eg psa.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Problemi sa zglobovima: Stariji psi i veće rase skloni su problema sa zglobovima, poput artritisa. Održavanje zdrave težine va&scaron;eg psa i pravilna fizička aktivnost mogu pomoći u smanjenju rizika od ovih problema. Takođe, postoje specijalizovane ishrane i dodaci ishrani koji podržavaju zdravlje zglobova kod pasa.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Gojaznost: Gojaznost je čest problem kod pasa i može izazvati ozbiljne zdravstvene probleme, uključujući srčane bolesti i dijabetes. Održavanje uravnotežene ishrane i redovna fizička aktivnost ključni su za sprečavanje prekomerne težine va&scaron;eg psa.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Dentalni problemi: Problemi sa zubima i desnima su uobičajeni kod pasa, a mogu izazvati nelagodnost i smanjiti kvalitet života va&scaron;eg ljubimca. Redovno či&scaron;ćenje zuba i desni, kao i davanje posebnih igračaka za žvakanje, pomoći će u održavanju zdravlja usne &scaron;upljine va&scaron;eg psa.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;/ol&gt;\r\n&lt;p&gt;Konačno, redovni veterinarski pregledi igraju ključnu ulogu u prevenciji i ranom otkrivanju potencijalnih zdravstvenih problema kod va&scaron;eg psa. Redovno proveravajte njihovo zdravlje, pratite promene u pona&scaron;anju ili apetitu i posavetujte se sa veterinarom ako primetite bilo kakve neobičnosti. Zdravlje va&scaron;eg psa je va&scaron;a odgovornost, stoga uložite trud u prevenciju i pružite mu dug i srećan život.&lt;/p&gt;', 'uploads/blog_imgs/Briga o Vašem psu: Najčešće bolesti i ključni saveti za njihovu prevenciju.jpeg', 'Briga o Vašem psu: Najčešće bolesti i ključni saveti za njihovu prevenciju.jpeg', '2023-07-24 22:11:03', 1),
(13, 'Srećan početak: Kako uspostaviti harmoničan odnos između novog psa i male dece u istom domu', 'Vodič za sigurno i srećno upoznavanje Va&scaron;eg novog ljubimca s malim članovima porodice', '&lt;p&gt;Dolazak novog psa u dom može biti uzbudljiv trenutak za celu porodicu, ali ako imate malu decu, postavlja se pitanje kako osigurati skladan i bezbedan odnos između va&scaron;eg novog četvoronožnog prijatelja i najmlađih članova porodice. Uvođenje novog psa u okolinu sa malom djecom zahteva pažnju, strpljenje i pravilno upravljanje situacijom kako bi se osiguralo da svi uživaju u druženju s novim ljubimcem.&lt;/p&gt;\r\n&lt;p&gt;Prvi koraci: Kada dovedete novog psa kući, dozvolite mu da istraži svoj novi dom, ali istovremeno uspostavite sigurno i mirno mjesto gdje će moći povući se ako osjeti potrebu za odmorom ili opu&scaron;tanjem. Djeca bi trebala naučiti po&scaron;tovati ovo mjesto kao privatni prostor psa, gdje mu nije dozvoljeno smetati. Objasnite djeci da je novi pas možda upla&scaron;en ili nesiguran u novom okruženju i da mu je potrebno vrijeme da se prilagodi.&lt;/p&gt;\r\n&lt;p&gt;Pravila interakcije: Naučite djecu osnovnim pravilima interakcije s psom. Pokažite im kako nježno pristupiti novom ljubimcu i izbjegavati naglo trčanje, vikanje ili grubo rukovanje. Djeci treba objasniti važnost da ne ometaju psa dok jede, spava ili igra se sa svojim igračkama. Supervizirajte njihovu interakciju u početku kako biste osigurali da su sigurni i da se uspostavlja povjerenje između djece i psa.&lt;/p&gt;\r\n&lt;p&gt;Uključivanje djece u brigu: Redovito uključujte djecu u brigu o psu. Pod nadzorom odraslih, mogu pomoći u hranjenju, pružanju svježe vode ili u &scaron;etnji s psom. Ovo će pomoći u jačanju veze između djece i ljubimca, ali i potaknuti osjećaj odgovornosti kod djece.&lt;/p&gt;\r\n&lt;p&gt;Nagrađivanje i ispravljanje pona&scaron;anja: Nagradite pozitivno pona&scaron;anje kod psa i djece. Pohvalite ih kada se pona&scaron;aju pristojno jedni prema drugima i podstičite ih da razvijaju bliskost kroz igru i međusobno po&scaron;tovanje. Ukoliko dođe do nesporazuma ili nesreće, razgovarajte s djecom i objasnite im &scaron;to se dogodilo i kako se izbjeći takva situacija u budućnosti.&lt;/p&gt;\r\n&lt;p&gt;Sigurnost i nadzor: Važno je da odrasli prepoznaju granice i pravilno nadziru interakciju između psa i djece. Ako primijetite bilo kakve znakove nelagodnosti kod psa, odmah interveni&scaron;ite kako biste izbjegli potencijalne rizike. Ukoliko ste nesigurni u vezi sa pona&scaron;anjem psa ili njegovom reakcijom na djecu, potražite savjet od stručnjaka za pona&scaron;anje pasa.&lt;/p&gt;\r\n&lt;p&gt;Uživanje zajedno: Postepeno uvodite nove aktivnosti i avanture u koje možete uključiti i psa i djecu. &Scaron;etnje, igre u dvori&scaron;tu ili jednostavno provođenje vremena zajedno učvrstiće odnos između svih članova porodice i va&scaron;eg novog ljubimca.&lt;/p&gt;\r\n&lt;p&gt;Zaključak: Sa strpljenjem, ljubavlju i pravilnim upravljanjem, možete stvoriti topao i harmoničan odnos između va&scaron;eg novog psa i male djece. Budite dosledni u podučavanju djece o pravilima i odgovornostima prema psu kako biste stvorili predivno iskustvo za cijelu porodicu dok gledate kako rastu i razvijaju se zajedno.&lt;/p&gt;', 'uploads/blog_imgs/Srećan početak: Kako uspostaviti harmoničan odnos između novog psa i male dece u istom domu.jpg', 'Srećan početak: Kako uspostaviti harmoničan odnos između novog psa i male dece u istom domu.jpg', '2023-07-24 22:17:14', 1),
(14, 'Pas i mačka - Istine i zablude o njihovom odnosu', 'Razotkrivanje mitova i pravih činjenica o suživotu pasa i mačaka', '&lt;p&gt;Pas i mačka su verovatno najpoznatiji kućni ljubimci na svetu, i uvek su bili postavljeni kao suparnici. Mnogi mitovi i priče kruže o njihovom odnosu, ali je vreme da razotkrijemo istine i zablude o ovom suživotu. Da li su oni zaista neprijatelji, ili možda mogu postati nerazdvojni prijatelji? U ovom vodiču, istražujemo prave činjenice o odnosu pasa i mačaka i dajemo savete kako im pomoći da žive harmonično zajedno.&lt;/p&gt;\r\n&lt;ol&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Mit: Psi i mačke su neprijatelji. Istina: Iako je istina da su psi i mačke različite vrste i imaju različite načine komunikacije, to ne znači da su automatski neprijatelji. Mnogi psi i mačke mogu razviti prijateljske odnose, posebno ako su zajedno od malena. Međutim, važno je shvatiti da svaki pojedinac ima svoj karakter i da neke mačke i psi jednostavno neće biti najbolji prijatelji.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Mit: Pas će loviti mačku. Istina: Lovni instinkti mogu biti prisutni kod nekih pasa, ali ne znači da će svaki pas loviti mačku. Ponovno, socijalizacija i odgoj igraju ključnu ulogu u odnosu između njih. Ako su pas i mačka odgojeni zajedno i naučeni po&scaron;tovati jedno drugo, &scaron;anse za lovljenje su manje.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Mit: Mačke su nezainteresovane za igru s psima. Istina: Iako mačke nisu poznate po igri kao &scaron;to su psi, mnoge mačke mogu uživati ​​u zajedničkim igrama s psima. To može pomoći u jačanju njihovog odnosa i pružiti im vi&scaron;e zabave i stimulacije.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Mit: Pas i mačka će odmah postati najbolji prijatelji. Istina: Prilagođavanje i razvijanje odnosa između pasa i mačaka zahteva vreme i strpljenje. Potrebno je postepeno uvođenje, uz nadzor, kako bi se osiguralo da se njihov susret odvija mirno i bez stresa. Važno je pratiti njihovu reakciju i postupno povećavati vreme koje provode zajedno.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;li&gt;\r\n&lt;p&gt;Mit: Pas i mačka uvijek će se boriti. Istina: Borbe između pasa i mačaka nisu neizbežne. U većini slučajeva, borbe se događaju kada su životinje prestravljene, nesigurne ili nisu pravilno predstavljene jedna drugoj. Ponovno, odgoj, socijalizacija i pažljivo uvođenje mogu pomoći u izbegavanju sukoba.&lt;/p&gt;\r\n&lt;/li&gt;\r\n&lt;/ol&gt;\r\n&lt;p&gt;Saveti za suživot pasa i mačaka:&lt;/p&gt;\r\n&lt;ul&gt;\r\n&lt;li&gt;Postepeno uvođenje: Pustite ih da se upoznaju na neutralnom teritoriji uz nadzor.&lt;/li&gt;\r\n&lt;li&gt;Pozitivna iskustva: Nagrađujte ih poslasticama i pohvalama kada se pona&scaron;aju dobro jedno prema drugom.&lt;/li&gt;\r\n&lt;li&gt;Osobni prostor: Osigurajte im odvojeni prostor gde mogu imati svoje mesto za odmor i opu&scaron;tanje.&lt;/li&gt;\r\n&lt;li&gt;Individualno vreme: Posvetite vreme svakom ljubimcu zasebno kako bi osećali jedinstvenu pažnju.&lt;/li&gt;\r\n&lt;/ul&gt;', 'uploads/blog_imgs/blog_14.jpg', 'blog_14.jpg', '2023-07-24 22:20:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogs_blog_categories`
--

CREATE TABLE `blogs_blog_categories` (
  `blog_blog_cat_id` int(10) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `blog_category_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisano\r\n1-aktivno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs_blog_categories`
--

INSERT INTO `blogs_blog_categories` (`blog_blog_cat_id`, `blog_id`, `blog_category_id`, `status`) VALUES
(1, 2, 1, 1),
(2, 2, 6, 1),
(3, 3, 1, 1),
(4, 3, 3, 0),
(5, 4, 1, 1),
(6, 1, 1, 1),
(8, 7, 6, 1),
(9, 8, 6, 1),
(10, 9, 6, 1),
(11, 10, 2, 1),
(12, 11, 5, 1),
(13, 12, 3, 1),
(14, 13, 1, 1),
(15, 13, 4, 1),
(16, 14, 6, 1),
(17, 3, 5, 0),
(18, 3, 4, 1),
(19, 3, 2, 0),
(20, 3, 6, 0),
(21, 14, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `blog_category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisan\r\n1-aktivan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`blog_category_id`, `name`, `status`) VALUES
(1, 'usvajanje', 1),
(2, 'volontiranje', 1),
(3, 'zdravlje', 1),
(4, 'bezbednost', 1),
(5, 'putovanje', 1),
(6, 'zanimljivosti', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `blog_view`
-- (See below for the actual view)
--
CREATE TABLE `blog_view` (
`blog_id` int(10) unsigned
,`title` tinytext
,`subtitle` varchar(255)
,`blog_text` text
,`img_name` varchar(255)
,`img_source` varchar(250)
,`blog_category_ids` mediumtext
,`blog_categories` mediumtext
,`status` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `breeds`
--

CREATE TABLE `breeds` (
  `breed_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisan\r\n1-aktivan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `breeds`
--

INSERT INTO `breeds` (`breed_id`, `name`, `status`) VALUES
(1, 'mešanac', 1),
(2, 'vučjak', 1),
(3, 'bigl', 1),
(4, 'maltezer', 1),
(5, 'pudla', 1),
(6, 'labrador', 1),
(7, 'pit bul terijer', 1),
(8, 'haski', 1),
(9, 'retriver', 1),
(10, 'jazavičar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `characteristics`
--

CREATE TABLE `characteristics` (
  `char_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisana\r\n1-aktivna'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characteristics`
--

INSERT INTO `characteristics` (`char_id`, `name`, `status`) VALUES
(1, 'dobar čuvar', 0),
(2, 'inteligentan', 1),
(3, 'lak za treniranje', 1),
(4, 'dobar za porodicu', 1),
(5, 'pas vodič', 1),
(6, 'dobar sa malom decom', 1),
(7, 'izražen lovački instinkt', 1),
(8, 'sklonost ka bežanju', 1),
(9, 'miran', 1),
(10, 'druželjubiv', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dogs`
--

CREATE TABLE `dogs` (
  `dog_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `gender` enum('0','Mužjak','Ženka') DEFAULT NULL,
  `breed_id` int(10) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `age` int(10) UNSIGNED DEFAULT NULL,
  `weight` int(10) UNSIGNED DEFAULT NULL,
  `found_when` date DEFAULT NULL,
  `found_where` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisan\r\n1-za usvajanje\r\n2-usvojen',
  `comment` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dogs`
--

INSERT INTO `dogs` (`dog_id`, `name`, `gender`, `breed_id`, `description`, `age`, `weight`, `found_when`, `found_where`, `status`, `comment`, `created`, `updated`) VALUES
(1, 'Radivoje', 'Mužjak', 1, NULL, 2, 14, '2023-05-03', 'Ta&scaron;majdan', 1, NULL, '2023-07-21 19:01:11', '2024-03-20 08:19:43'),
(2, 'Mara', 'Ženka', 1, NULL, 1, 19, '2023-04-04', 'Novi Beograd', 1, NULL, '2023-07-21 19:09:02', '2024-03-20 08:15:38'),
(3, 'Janko', 'Mužjak', 1, 'Janko je stariji me&scaron;anac koji ima 10 godina. Pronađen je na ulici, izgubljen i izgladneli. Iako je pro&scaron;ao kroz te&scaron;ka vremena, Janko je pravi borac i pokazuje neverovatnu hrabrost i vernost. Ima miran i staložen temperament, idealan za porodičnog psa. Janko je već naučen na osnovne komande i veran je saputnik koji bi pružio puno ljubavi svojim novim vlasnicima.', 10, 13, '2023-05-11', 'Surčin', 1, NULL, '2023-07-21 19:10:57', '2023-07-25 09:56:17'),
(4, 'Ruža', 'Ženka', 2, 'Ruža je stara vučjakica od 12 godina. Nađena je na selu, izgladnela i izmučena. Unatoč svojim godinama, Ruža ima nesumnjivu eleganciju i dostojanstvo. Ima divnu, gusta dlaku koja ju &scaron;titi od svih vremenskih uslova. Ruža je veoma za&scaron;titnički nastrojena prema ljudima koje voli i odlično bi se slagala s iskusnim vlasnicima koji razumeju potrebe ovog divnog psa.', 12, 23, '2023-06-05', 'okolina Valjeva', 1, NULL, '2023-07-21 19:13:23', NULL),
(7, 'Boki', 'Mužjak', 7, 'Boki je živahni pit bul terijer star 6 godina. Pronađen je na ulici, upla&scaron;en i napaćen. Ima snažnu građu, ali iza tog snažnog izgleda krije se srce od zlata. Boki voli da bude u centru pažnje i ima neiscrpnu energiju. Ovaj pas zahteva pažljivog vlasnika koji će ga pravilno trenirati i držati pod kontrolom. Ako se pravilno socijalizuje, Boki će biti verni prijatelj i odan član porodice.', 6, 27, '2023-07-12', 'Novi Beograd', 1, NULL, '2023-07-21 19:16:24', NULL),
(8, 'Rex', 'Mužjak', 1, 'Rex je 3-godi&scaron;nji me&scaron;anac, pronađen u blizini prometne saobraćajnice. Bio je u lo&scaron;em zdravstvenom stanju, ali brzom veterinarskom brigom sada je zdrav i spreman za novi dom. Rex je izuzetno privržen i obožava igru i pažnju. Ima srednje veličine, kratku dlaku i prelepe smeđe oči. Idealan je za porodicu koja će mu pružiti puno ljubavi i nežnosti.', 3, 19, '2023-07-06', 'Zemun', 1, NULL, '2023-07-21 19:20:30', NULL),
(9, 'Rea', 'Ženka', 3, 'Rea je preslatka biglica stara samo 3 meseca. Pronađena je napu&scaron;tena na ulici, usamljena i prepla&scaron;ena. Rea je vrlo radoznala i vesela, obožava istraživati svet oko sebe. Potrebna joj je puno pažnje i obuke kako bi postala dobro socijalizovani pas. Rea bi bila savr&scaron;en izbor za aktivnu porodicu koja će se brinuti o njoj i pružiti joj siguran i ljubazan dom.', 0, 4, '2023-07-10', 'Zemun', 1, NULL, '2023-07-21 19:25:57', NULL),
(10, 'Laki', 'Mužjak', 1, 'Laki je stariji me&scaron;anac star 10 godina. Pronađen je na ulici, izgubljen i upla&scaron;en. Laki je umiljat i nežan pas s prelepim sivim očima koje odaju mudrost. Ima miran temperament i veoma je poslu&scaron;an. Voli &scaron;etnje i dru&scaron;tvo drugih pasa. Laki bi bio idealan pratilac za mirniji dom i osobe koje žele starijeg, opu&scaron;tenijeg psa.', 10, 26, '2023-03-30', 'Novi Beograd', 1, NULL, '2023-07-21 19:29:54', NULL),
(11, 'Mile', 'Mužjak', 3, 'Mile je stariji bigl star 13 godina. Pronađen je kako luta u &scaron;umi, umoran i usamljen. Mile je klasični predstavnik svoje rase - energičan, vesel i veseo. Ima karakterističan lajež koji će vas nasmejati. Iako je stariji pas, Mile je jo&scaron; uvek aktivan i voli &scaron;etnje. Bio bi divan saputnik za porodicu koja ceni vesele i prijateljske pse.', 13, 17, NULL, NULL, 1, NULL, '2023-07-21 19:32:24', NULL),
(12, 'Ma&scaron;a', 'Ženka', 1, 'Ma&scaron;a je prelepa ženka stara 6 godina. Pronađena je kako luta po selu, umorna i upla&scaron;ena. Ma&scaron;a ima prepoznatljive plave oči i gusta dlaka koja je prilagođena hladnijim uslovima. Ima snažnu volju i nezavisnu prirodu. Ma&scaron;a zahteva dosta fizičke aktivnosti i stimulacije kako bi bila srećna. Bila bi sjajan izbor za aktivne ljubitelje prirode koji žive u hladnijim predelima i pružaju joj dovoljno pažnje i ljubavi.', 4, 22, '2023-06-02', 'okolina Mladenovca', 1, NULL, '2023-07-21 19:34:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dogs_characteristics`
--

CREATE TABLE `dogs_characteristics` (
  `dog_char_id` int(10) UNSIGNED NOT NULL,
  `dog_id` int(10) UNSIGNED NOT NULL,
  `char_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisano\r\n1-aktivno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dogs_characteristics`
--

INSERT INTO `dogs_characteristics` (`dog_char_id`, `dog_id`, `char_id`, `status`) VALUES
(58, 1, 2, 1),
(59, 1, 6, 1),
(60, 2, 3, 1),
(61, 2, 4, 1),
(62, 3, 2, 1),
(63, 3, 4, 1),
(64, 3, 6, 1),
(65, 3, 9, 1),
(66, 4, 2, 1),
(67, 4, 3, 1),
(68, 7, 2, 1),
(69, 7, 8, 1),
(70, 8, 2, 1),
(71, 8, 6, 1),
(72, 9, 4, 1),
(73, 9, 7, 1),
(74, 10, 3, 1),
(75, 10, 6, 1),
(76, 10, 9, 1),
(77, 11, 4, 1),
(78, 11, 7, 1),
(79, 11, 8, 1),
(80, 12, 2, 1),
(81, 12, 7, 1),
(82, 12, 8, 1),
(99, 2, 5, 1),
(100, 1, 3, 1),
(101, 1, 8, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dogs_details`
-- (See below for the actual view)
--
CREATE TABLE `dogs_details` (
`dog_id` int(10) unsigned
,`name` varchar(40)
,`gender` enum('0','Mužjak','Ženka')
,`breed` varchar(50)
,`description` text
,`age` int(10) unsigned
,`weight` int(10) unsigned
,`found_when` date
,`found_where` varchar(250)
,`status` int(11)
,`comment` text
,`created` timestamp
,`updated` timestamp
,`characteristics` mediumtext
,`spec_needs` mediumtext
,`profile_img` varchar(255)
,`size_category` varchar(6)
);

-- --------------------------------------------------------

--
-- Table structure for table `dogs_dog_images`
--

CREATE TABLE `dogs_dog_images` (
  `dog_img_id` int(10) UNSIGNED NOT NULL,
  `dog_id` int(10) UNSIGNED NOT NULL,
  `img_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisana\r\n1-aktivna\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dogs_dog_images`
--

INSERT INTO `dogs_dog_images` (`dog_img_id`, `dog_id`, `img_id`, `status`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 7, 5, 1),
(6, 8, 6, 1),
(7, 9, 7, 1),
(8, 10, 8, 1),
(9, 11, 9, 1),
(10, 12, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dogs_needs`
--

CREATE TABLE `dogs_needs` (
  `dog_need_id` int(10) UNSIGNED NOT NULL,
  `dog_id` int(10) UNSIGNED NOT NULL,
  `need_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisana\r\n1-aktivna'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dogs_needs`
--

INSERT INTO `dogs_needs` (`dog_need_id`, `dog_id`, `need_id`, `status`) VALUES
(130, 1, 6, 0),
(131, 2, 1, 1),
(132, 3, 1, 1),
(133, 4, 5, 1),
(134, 7, 3, 1),
(135, 8, 3, 1),
(136, 9, 4, 1),
(137, 10, 5, 1),
(138, 11, 5, 1),
(139, 12, 1, 1),
(158, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dog_imgs`
--

CREATE TABLE `dog_imgs` (
  `img_id` int(10) UNSIGNED NOT NULL,
  `dog_id` int(10) UNSIGNED NOT NULL,
  `img_source` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile` enum('da','ne') NOT NULL DEFAULT 'da',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisana\r\n1-aktivna'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dog_imgs`
--

INSERT INTO `dog_imgs` (`img_id`, `dog_id`, `img_source`, `name`, `created`, `profile`, `status`) VALUES
(1, 1, 'uploads/dog_imgs/Radivoje_1.jpeg', 'test slika.jpg', '2023-07-21 19:01:11', 'da', 1),
(2, 2, 'uploads/dog_imgs/Mara_2.jpeg', 'Mara_2.jpeg', '2023-07-21 19:09:02', 'da', 1),
(3, 3, 'uploads/dog_imgs/Janko_3.jpeg', 'Janko_3.jpeg', '2023-07-21 19:10:57', 'da', 1),
(4, 4, 'uploads/dog_imgs/Ruža_4.jpeg', 'Ruža_4.jpeg', '2023-07-21 19:13:23', 'da', 1),
(5, 7, 'uploads/dog_imgs/Boki_5.jpeg', 'Boki_5.jpeg', '2023-07-21 19:16:24', 'da', 1),
(6, 8, 'uploads/dog_imgs/Rex_6.jpeg', '2023-07-25_03:21:52.jpg', '2023-07-21 19:20:30', 'da', 1),
(7, 9, 'uploads/dog_imgs/Rea_7.jpeg', '2023-07-25_03:42:24.jpg', '2023-07-21 19:25:57', 'da', 1),
(8, 10, 'uploads/dog_imgs/Laki_8.jpeg', 'Laki_8.jpeg', '2023-07-21 19:29:54', 'da', 1),
(9, 11, 'uploads/dog_imgs/Mile_9.jpeg', 'Mile_9.jpeg', '2023-07-21 19:32:24', 'da', 1),
(10, 12, 'uploads/dog_imgs/Maša_10.jpeg', 'Maša_10.jpeg', '2023-07-21 19:34:07', 'da', 1),
(11, 1, 'uploads/dog_imgs/Radivoje_11.jpeg', 'Radivoje_11.jpeg', '2023-07-21 20:28:33', 'ne', 1),
(12, 1, 'uploads/dog_imgs/Radivoje_12.jpeg', 'Radivoje_12.jpeg', '2023-07-21 20:28:48', 'ne', 1),
(13, 1, 'uploads/dog_imgs/Radivoje_13.jpeg', 'Radivoje_13.jpeg', '2023-07-21 20:29:02', 'ne', 1),
(14, 2, 'uploads/dog_imgs/Mara_14.jpeg', 'Mara_14.jpeg', '2023-07-21 20:40:52', 'ne', 1),
(15, 2, 'uploads/dog_imgs/Mara_15.jpeg', 'Mara_15.jpeg', '2023-07-21 20:43:15', 'ne', 1),
(16, 2, 'uploads/dog_imgs/Mara_16.jpeg', 'Mara_16.jpeg', '2023-07-21 20:43:28', 'ne', 1),
(17, 3, 'uploads/dog_imgs/Janko_17.jpeg', 'Janko_17.jpeg', '2023-07-21 20:52:07', 'ne', 1),
(18, 3, 'uploads/dog_imgs/Janko_18.jpeg', 'Janko_18.jpeg', '2023-07-21 20:52:21', 'ne', 1),
(19, 3, 'uploads/dog_imgs/Janko_19.jpeg', 'Janko_19.jpeg', '2023-07-21 20:52:32', 'ne', 1),
(20, 4, 'uploads/dog_imgs/Ruža_20.jpeg', 'Ruža_20.jpeg', '2023-07-21 20:53:19', 'ne', 1),
(21, 4, 'uploads/dog_imgs/Ruža_21.jpeg', 'Ruža_21.jpeg', '2023-07-21 20:53:30', 'ne', 1),
(22, 4, 'uploads/dog_imgs/Ruža_22.jpeg', 'Ruža_22.jpeg', '2023-07-21 20:53:44', 'ne', 1),
(23, 7, 'uploads/dog_imgs/Boki_23.jpeg', 'Boki_23.jpeg', '2023-07-21 20:54:40', 'ne', 1),
(24, 7, 'uploads/dog_imgs/Boki_24.jpeg', 'Boki_24.jpeg', '2023-07-21 20:54:53', 'ne', 1),
(25, 8, 'uploads/dog_imgs/Rex_25.jpeg', 'Rex_25.jpeg', '2023-07-21 21:00:07', 'ne', 1),
(26, 8, 'uploads/dog_imgs/Rex_26.jpeg', 'Rex_26.jpeg', '2023-07-21 21:00:19', 'ne', 1),
(27, 9, 'uploads/dog_imgs/Rea_27.jpeg', 'Rea_27.jpeg', '2023-07-21 21:05:34', 'ne', 1),
(28, 9, 'uploads/dog_imgs/Rea_28.jpeg', 'Rea_28.jpeg', '2023-07-21 21:05:48', 'ne', 1),
(29, 10, 'uploads/dog_imgs/Laki_29.jpeg', 'Laki_29.jpeg', '2023-07-21 21:08:44', 'ne', 1),
(30, 10, 'uploads/dog_imgs/Laki_30.jpeg', 'Laki_30.jpeg', '2023-07-21 21:08:56', 'ne', 1),
(31, 11, 'uploads/dog_imgs/Mile_31.jpeg', 'Mile_31.jpeg', '2023-07-21 21:11:27', 'ne', 1),
(32, 11, 'uploads/dog_imgs/Mile_32.jpeg', 'Mile_32.jpeg', '2023-07-21 21:11:41', 'ne', 1),
(33, 12, 'uploads/dog_imgs/Maša_33.jpeg', 'Maša_33.jpeg', '2023-07-21 21:13:09', 'ne', 1),
(34, 12, 'uploads/dog_imgs/Maša_34.jpeg', 'Maša_34.jpeg', '2023-07-21 21:13:27', 'ne', 1);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `img_id` int(10) UNSIGNED NOT NULL,
  `img_source` varchar(250) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisan\r\n1-aktivan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`img_id`, `img_source`, `name`, `created`, `status`) VALUES
(1, 'uploads/Naši volonteri/test slika.jpg', 'test slika.jpg', '2023-07-25 12:39:24', 1),
(5, 'uploads/Naši volonteri/2023-07-25_02:59:33.jpg', '2023-07-25_02:59:33.jpg', '2023-07-25 12:59:33', 1),
(6, 'uploads/Naši volonteri/2023-07-25_03:21:52.jpg', '2023-07-25_03:21:52.jpg', '2023-07-25 13:21:52', 1),
(7, 'uploads/Naši volonteri/2023-07-25_03:42:24.jpg', '2023-07-25_03:42:24.jpg', '2023-07-25 13:42:24', 1),
(8, 'uploads/Naši volonteri/2023-07-25_03:42:41.jpg', '2023-07-25_03:42:41.jpg', '2023-07-25 13:42:41', 1),
(9, 'uploads/Naši volonteri/2023-07-25_03:43:00.jpg', '2023-07-25_03:43:00.jpg', '2023-07-25 13:43:00', 1),
(10, 'uploads/Slike iz života azila/2023-07-25_03:43:21.jpg', '2023-07-25_03:43:21.jpg', '2023-07-25 13:43:21', 1),
(11, 'uploads/Slike iz života azila/2023-07-25_03:43:34.jpg', '2023-07-25_03:43:34.jpg', '2023-07-25 13:43:34', 1),
(12, 'uploads/Slike iz života azila/2023-07-25_03:43:46.jpg', '2023-07-25_03:43:46.jpg', '2023-07-25 13:43:46', 1),
(13, 'uploads/Slike iz života azila/2023-07-25_03:43:59.jpg', '2023-07-25_03:43:59.jpg', '2023-07-25 13:43:59', 1),
(14, 'uploads/Slike iz života azila/2023-07-25_03:44:12.jpg', '2023-07-25_03:44:12.jpg', '2023-07-25 13:44:12', 1),
(15, 'uploads/Slike iz života azila/2023-07-25_03:44:39.jpg', '2023-07-25_03:44:39.jpg', '2023-07-25 13:44:39', 1),
(16, 'uploads/Slike iz života azila/2023-07-25_03:44:52.jpg', '2023-07-25_03:44:52.jpg', '2023-07-25 13:44:52', 1),
(17, 'uploads/Slike iz života azila/2023-07-25_03:45:05.jpg', '2023-07-25_03:45:05.jpg', '2023-07-25 13:45:05', 1),
(18, 'uploads/Slike iz života azila/2023-07-25_03:45:30.jpg', '2023-07-25_03:45:30.jpg', '2023-07-25 13:45:30', 1),
(19, 'uploads/Slike iz života azila/2023-07-25_03:45:48.jpg', '2023-07-25_03:45:48.jpg', '2023-07-25 13:45:48', 1),
(20, 'uploads/Priče sa ulice/2023-07-25_03:46:29.jpg', '2023-07-25_03:46:29.jpg', '2023-07-25 13:46:29', 1),
(21, 'uploads/Priče sa ulice/2023-07-25_03:46:41.jpg', '2023-07-25_03:46:41.jpg', '2023-07-25 13:46:41', 1),
(22, 'uploads/Priče sa ulice/2023-07-25_03:46:53.jpg', '2023-07-25_03:46:53.jpg', '2023-07-25 13:46:53', 1),
(23, 'uploads/Priče sa ulice/2023-07-25_03:47:07.jpg', '2023-07-25_03:47:07.jpg', '2023-07-25 13:47:07', 1),
(24, 'uploads/Priče sa ulice/2023-07-25_03:47:18.jpg', '2023-07-25_03:47:18.jpg', '2023-07-25 13:47:18', 1),
(25, 'uploads/Priče sa ulice/2023-07-25_03:47:30.jpg', '2023-07-25_03:47:30.jpg', '2023-07-25 13:47:30', 1),
(26, 'uploads/Priče sa ulice/2023-07-25_03:47:43.jpg', '2023-07-25_03:47:43.jpg', '2023-07-25 13:47:43', 1),
(27, 'uploads/Priče sa ulice/2023-07-25_03:47:55.jpg', '2023-07-25_03:47:55.jpg', '2023-07-25 13:47:55', 1),
(28, 'uploads/Priče sa ulice/2023-07-25_03:48:10.jpg', '2023-07-25_03:48:10.jpg', '2023-07-25 13:48:10', 1),
(29, 'uploads/Priče sa ulice/2023-07-25_03:48:20.jpg', '2023-07-25_03:48:20.jpg', '2023-07-25 13:48:20', 1),
(30, 'uploads/Srećne priče/2023-07-25_03:49:02.jpg', '2023-07-25_03:49:02.jpg', '2023-07-25 13:49:02', 1),
(31, 'uploads/Srećne priče/2023-07-25_03:49:15.jpg', '2023-07-25_03:49:15.jpg', '2023-07-25 13:49:15', 1),
(32, 'uploads/Srećne priče/2023-07-25_03:49:27.jpg', '2023-07-25_03:49:27.jpg', '2023-07-25 13:49:27', 1),
(33, 'uploads/Srećne priče/2023-07-25_03:49:42.jpg', '2023-07-25_03:49:42.jpg', '2023-07-25 13:49:42', 1),
(34, 'uploads/Srećne priče/2023-07-25_03:49:55.jpg', '2023-07-25_03:49:55.jpg', '2023-07-25 13:49:55', 1),
(35, 'uploads/Srećne priče/2023-07-25_03:50:06.jpg', '2023-07-25_03:50:06.jpg', '2023-07-25 13:50:06', 1),
(36, 'uploads/Slike iz života azila/test slika.jpg', 'test slika.jpg', '2023-07-25 16:07:43', 1),
(37, 'uploads/Priče sa ulice/2023-07-26_11:55:50.jpg', '2023-07-26_11:55:50.jpg', '2023-07-26 09:55:50', 1),
(38, 'uploads/Naši volonteri/Nas volonter.jpg', 'Nas volonter.jpg', '2024-03-20 08:17:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `images_img_categories`
--

CREATE TABLE `images_img_categories` (
  `img_cat_id` int(10) UNSIGNED NOT NULL,
  `img_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisano\r\n1-aktivno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images_img_categories`
--

INSERT INTO `images_img_categories` (`img_cat_id`, `img_id`, `category_id`, `status`) VALUES
(1, 1, 4, 1),
(2, 2, 4, 1),
(3, 3, 4, 1),
(4, 4, 4, 1),
(5, 5, 4, 1),
(6, 6, 4, 1),
(7, 7, 4, 1),
(8, 8, 4, 1),
(9, 9, 4, 1),
(10, 10, 3, 1),
(11, 11, 3, 1),
(12, 12, 3, 1),
(13, 13, 3, 1),
(14, 14, 3, 1),
(15, 15, 3, 1),
(16, 16, 3, 1),
(17, 17, 3, 1),
(18, 18, 3, 1),
(19, 19, 3, 1),
(20, 20, 5, 1),
(21, 21, 5, 1),
(22, 22, 5, 1),
(23, 23, 5, 1),
(24, 24, 5, 1),
(25, 25, 5, 1),
(26, 26, 5, 1),
(27, 27, 5, 1),
(28, 28, 5, 1),
(29, 29, 5, 1),
(30, 30, 6, 1),
(31, 31, 6, 1),
(32, 32, 6, 1),
(33, 33, 6, 1),
(34, 34, 6, 1),
(35, 35, 6, 1),
(36, 36, 3, 1),
(37, 37, 5, 1),
(38, 38, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `img_categories`
--

CREATE TABLE `img_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `img_src` varchar(255) DEFAULT NULL COMMENT 'naslovna slika kategorije',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisan\r\n1-aktivan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `img_categories`
--

INSERT INTO `img_categories` (`category_id`, `name`, `img_src`, `status`) VALUES
(1, 'Bez posebne kategorije', 'uploads/img_categories/no_category.jpg', 1),
(2, 'Naši psi', 'uploads/img_categories/psi.jpg', 1),
(3, 'Slike iz života azila', 'uploads/img_categories/azil.jpg', 1),
(4, 'Naši volonteri', 'uploads/img_categories/volonteri.jpg', 1),
(5, 'Priče sa ulice', 'uploads/img_categories/ulica.jpg', 1),
(6, 'Srećne priče', 'uploads/img_categories/udomljeni.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages_contact_form`
--

CREATE TABLE `messages_contact_form` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `reason` enum('Generalna pitanja','Donacija','Volontiranje','Usvajanje') NOT NULL,
  `dog_id` int(10) UNSIGNED DEFAULT NULL,
  `message` tinytext NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisan\r\n1-logovan\r\n2-komunikacija u toku\r\n3-zatvoren-rešen'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages_contact_form`
--

INSERT INTO `messages_contact_form` (`message_id`, `contact`, `email`, `reason`, `dog_id`, `message`, `created`, `updated`, `status`) VALUES
(1, 'test1', 'test1@test.com', 'Generalna pitanja', 0, 'test1', '2023-07-23 09:08:03', NULL, 1),
(2, 'test2', 'test2@test.com', 'Usvajanje', 0, 'test2', '2023-07-23 09:28:16', NULL, 1),
(3, 'sima', 'ipop@gmail.com', 'Usvajanje', 0, 'test', '2023-07-23 09:29:40', NULL, 1),
(4, 'Sima', 'drasko@test.com', 'Usvajanje', 2, 'test', '2023-07-23 09:35:01', NULL, 1),
(5, 'Sima', 'drasko@test.com', 'Usvajanje', 2, 'test', '2023-07-23 09:35:44', NULL, 1),
(6, 'Sima', 'ipop@test.com', 'Usvajanje', 12, 'dfltdlutf', '2023-07-23 09:39:12', NULL, 1),
(7, 'Sima', 'Molimo Vas, unesite email adresu.', 'Usvajanje', 12, 'dfltdlutf', '2023-07-23 09:39:31', NULL, 1),
(8, 'Molimo Vas, unesite ime i prezime.', 'Molimo Vas, unesite email adresu.', 'Generalna pitanja', 0, 'test', '2023-07-24 13:29:33', NULL, 1),
(9, 'Sima', 'irena@test.com', 'Generalna pitanja', 0, 'test', '2023-07-25 16:01:44', NULL, 1),
(10, 'Sima', 'ipop@test.com', 'Generalna pitanja', 0, 'htrjrastjars', '2023-07-26 09:52:03', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reset_passwords`
--

CREATE TABLE `reset_passwords` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `valid_to` datetime NOT NULL COMMENT 'created+15mins'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reset_passwords`
--

INSERT INTO `reset_passwords` (`id`, `email`, `token`, `created`, `valid_to`) VALUES
(1, 'ipop@test.com', 'e319ed1721a1a944631aca443567fe9cfaf7ebff3c20394276d9f31236435ced', '2023-06-26 12:20:51', '2023-06-26 13:20:51'),
(2, 'ipop@test.com', '44fb0714fa73300efc520b2e6bb6ac381ce4d4c8fc92a05ae268230523ae8a70', '2023-06-26 12:22:40', '2023-06-26 13:22:40'),
(3, 'ipop@test.com', '3c04e98638f324e70bd2da069ebc0baade122034d043d1fd22e2f6be5078b5d8', '2023-06-26 12:26:24', '2023-06-26 13:26:24'),
(4, 'ipop@test.com', '26eb7b8e3943039b4cb73bfa1b8fadacf142c587d74caad6fe4106e9f7e208ec', '2023-06-26 12:26:56', '2023-06-26 13:26:56'),
(5, 'ipop@test.com', '1e28940a82c4dbb95d4615a737d0395445282a6dddcd74dac7ba850eac2f5a7b', '2023-06-26 13:14:56', '2023-06-26 14:14:56'),
(6, 'ipop@test.com', '9b036a2aeff6b338f82227875ce2e762ac1e93db2d2e0ff7d3db76a126804223', '2023-06-26 13:17:13', '2023-06-26 14:17:13'),
(7, 'ipop@test.com', 'bce6d5866345deca5972592199b5f18a1e6313fbaaf0cb0a5cf976934eca1daa', '2023-06-26 13:20:04', '2023-06-26 14:20:04'),
(8, 'ipop@test.com', 'b603cab3184442ce383d1ee31c04dd51ad851b2de78516f3ffde0275a245220d', '2023-06-26 13:22:43', '2023-06-26 14:22:43'),
(9, 'ipop@test.com', '0e4c6a42332b1569bde81663f6ce4270462c58b78cf10097dc3a83b07d1bae19', '2023-06-26 13:23:52', '2023-06-26 14:23:52'),
(10, 'ipop@test.com', '2e321a2294f35892269072d6121e625e7085b47ff3dab8ce68df0454914d126d', '2023-06-27 09:47:07', '2023-06-27 10:47:07'),
(11, 'ipop@test.com', 'f5bcc756e01e887c24f9417b361331d2b7317843a867ad7aff5b7a9c3e525abc', '2023-06-27 09:56:06', '2023-06-27 10:56:06'),
(12, 'ipop@test.com', '0a035980b90dda0ffaa5263b1cfde5921c29b4d55ab19b3183f8af8106b36b70', '2023-06-27 10:55:06', '2023-06-27 11:55:06'),
(13, 'ipop@test.com', 'f607aaf55ecf234219391334feb844b514a5f8f51408b7dfec8e22b79d98dbba', '2023-06-27 11:06:01', '2023-06-27 12:06:01'),
(14, 'ipop@test.com', '299bb6f9d09ffbb8ddddae19f24b32321546d6c68463d52e8dad7ea1ca97845e', '2023-06-27 11:23:00', '2023-06-27 12:23:00'),
(15, 'ipop@test.com', 'a9874cef7be03413c0bc483e619f4eacdbe9221a297274ae83885271fa02e9f1', '2023-06-27 11:38:40', '2023-06-27 12:38:40'),
(16, 'ipop@test.com', '1146e1b644a624bbdb23c822fe49a128074bbed4bd1a974bed453cb1974491bb', '2023-06-27 12:20:46', '2023-06-27 13:20:46'),
(17, 'ipop@test.com', '10d40f9b9e0434c21d535d7315ec64adce989931d894a4bceb5567d96ec53838', '2023-06-27 12:26:16', '2023-06-27 13:26:16'),
(18, 'ipop@test.com', 'e06a87e2cefa9656520bba1abe192c4bf1c5585e9144dff590c930a079b8ee5f', '2023-06-27 12:46:45', '2023-06-27 13:46:45'),
(19, 'ipop@test.com', 'd90f0e6a9ebcbe393390642d70e4d0a63c4950a795494a0af4ba497469877e78', '2023-06-27 12:57:50', '2023-06-27 13:57:50'),
(20, 'ipop@test.com', 'da17574d06d2d03ea84177599e1a7eb9c236ff21baf3392db794d5bb591a13e0', '2023-06-27 13:23:58', '2023-06-27 14:23:58'),
(21, 'ipop@test.com', '9294354936c57a7f9872d4fa683408de6517897aac2104c8de26cdeca83e354f', '2023-06-27 13:37:14', '2023-06-27 14:37:14'),
(22, 'ipop@test.com', '200b6db99e98aec5e1011b0a67985ca7ec8c48b947580dd6740d18fbe7e0ed68', '2023-06-27 14:26:51', '2023-06-27 15:26:51'),
(23, 'ipop@test.com', 'c9ad22dd3cb4c58439ce01aeb47c448aa1d8b32110326384901d65a5d29146f3', '2023-06-27 14:29:55', '2023-06-27 15:29:55'),
(24, 'ipop@test.com', 'ac237e528903e212e0c3cac1bef864479e293389338d248685b6619885a037b9', '2023-06-27 14:30:35', '2023-06-27 15:30:35'),
(25, 'ipop@test.com', '1b0cb2a258d05eb984b2621e66649f42daacc46d27109a1daf29992a9952586c', '2023-06-27 14:32:37', '2023-06-27 15:32:37'),
(26, 'ipop@test.com', '4c2b62e409cdcdb3460e728df1c25da63cc43910c901ad80d1ca320c69853145', '2023-06-27 15:05:11', '2023-06-27 16:05:11'),
(27, 'ipop@test.com', 'b5d20bed716e6a518d1466384f5f72120c92017c214460f54dbd495696e4b573', '2023-06-28 09:20:45', '2023-06-28 10:20:45'),
(28, 'ipop@test.com', '6d4a67de6d0cbd971d5d1758364cbf78bf12067697f2c1c616720d689377ee04', '2023-06-28 09:50:43', '2023-06-28 10:50:43'),
(29, 'ipop@test.com', 'dfc12c8b4c76c286b6fd2b4e0588d2dbfd3f9c543805cd982cbb3168ba53f6d3', '2023-06-28 09:55:36', '2023-06-28 10:55:36'),
(30, 'ipop@test.com', '7f872fe0ab861435ca8208ba6c0bff2823a1b1ec145863087b798b61e42c7b85', '2023-06-30 17:34:04', '2023-06-30 18:34:04'),
(31, 'ipop@test.com', '9392ef71a28b08e58eea66f960bbb6fdfbe2f455d92cd3e7d0b5cbec45499ed3', '2023-06-30 19:40:09', '2023-06-30 20:40:09'),
(32, 'ipop@test.com', '4d12082f517be583f3f770ccc02e898f0837615dee8a66f674a5e370268d9359', '2023-07-01 17:55:44', '2023-07-01 18:55:44'),
(33, 'ipop@test.com', 'ffe8334c9158367558e9c276ba55488da022d088db03775b31b7ab07d696b497', '2023-07-07 09:23:33', '2023-07-07 10:23:33'),
(34, 'ipop@test.com', 'b68b5e14124adfe2ff81081f96281afb79ee1797c26804f29d774c7e6e1bcf45', '2023-07-07 09:49:38', '2023-07-07 10:49:38'),
(35, 'ipop@test.com', '3bf0515e5eda986a78594973b7fb63b93f1f21bcfd229e8f31d0b3fa35204116', '2023-07-08 16:31:59', '2023-07-08 17:31:59'),
(36, 'ipop@test.com', '0045b7823cfb7d1963f26774f748e492a694fbd72357e927853a6258b48a7c32', '2023-07-08 16:45:38', '2023-07-08 17:45:38'),
(37, 'ipop@test.com', '2285e533449938838c88d60d7c2df85a708c13b84dfad064ada138cef6bede13', '2023-07-08 20:10:15', '2023-07-08 21:10:15'),
(38, 'ipop@test.com', '1c8cfa501e46c543c001823d054e1b4da84672555cd2fa10de99a9471d7bb988', '2023-07-08 20:11:05', '2023-07-08 21:11:05'),
(39, 'ipop@test.com', 'c8729f2228ea36809a16d7c4d8349897e872c889dd7b7e8e6a73029775568443', '2023-07-08 20:11:58', '2023-07-08 21:11:58'),
(40, 'ipop@test.com', '386ad3f9e1504420dc816d69d1ae40dd86cb268f7fc9fb2e87195c27d61c735d', '2023-07-08 20:37:17', '2023-07-08 21:37:17'),
(41, 'ipop@test.com', 'f0f1948fd87ab958d880f80f33dc822ed3b397f2e194b8fb20e10857ebefa316', '2023-07-08 20:48:08', '2023-07-08 21:48:08'),
(42, 'ipop@test.com', '387572c85499a6b6f80ab0cc2705105c4de8087010cbe8d41971412e5cad1102', '2023-07-08 20:53:57', '2023-07-08 21:53:57'),
(43, 'ipop@test.com', '02d7c19218c454f262ee2e208ee6af2e7e69373399a90dff7a4c118cfe621041', '2023-07-08 20:55:28', '2023-07-08 21:55:28'),
(44, 'ipop@test.com', 'dd3c6803ba4adab5971cbe6339bfd2ea6edec8d323cd94b93af8cd96801dd820', '2023-07-08 21:00:58', '2023-07-08 22:00:58'),
(45, 'ipop@test.com', '8f2337aeb3f5626bbad63f076a096a62cdf429e2626beac288fab21f6e7c2925', '2023-07-08 21:11:51', '2023-07-08 22:11:51'),
(46, 'ipop@test.com', '1395d11c7fced3e8a008602d771d92b3800b20438bf06160adfef96fee38a4b7', '2023-07-08 23:29:48', '2023-07-09 00:29:48'),
(47, 'ipop@test.com', 'cd7e89fbdb0d682f9aae4fa09e956ed52c26294618b1525752a8ad429f561690', '2023-07-11 13:31:40', '2023-07-11 14:31:40'),
(48, 'ipop@test.com', '5e11379a2b292dc6e1d1ca75e6d34ba60c1ae5035853b135d5b2e3e11e4a1355', '2023-07-12 13:02:55', '2023-07-12 14:02:55'),
(49, 'ipop@test.com', '3e74de7a5733bbf1993770dadac0740b5c26ef9eb6775667f081d19b5eb1f61f', '2023-07-12 13:34:18', '2023-07-12 14:34:18'),
(50, 'ipop@test.com', 'e573ec413ca23d343a0ba34f5bf7037cfe2e597ca516dc50dcc7abb05ddc7d7f', '2023-07-12 13:37:04', '2023-07-12 14:37:04'),
(51, 'ipop@test.com', 'aa13051fa23f4a21c609f41ed0f4659c4aac8a7b52662adf5803dc3f142a515d', '2023-07-12 13:38:18', '2023-07-12 14:38:18'),
(52, 'ipop@test.com', 'eb405e28c8cbd67c8bff8168d66b6413c2373d1e6c2ed544b680cf352936e7b2', '2023-07-12 13:39:00', '2023-07-12 14:39:00'),
(53, 'ipop@test.com', '66578b9cf054212ddec2cd94cb2154598d16f66555616a27ec40d5b4c0d4d56c', '2023-07-14 09:21:12', '2023-07-14 10:21:12'),
(54, 'ipop@test.com', '67a996eef04244b45cbacd977fbb584ec1dcdbd85f2831ed9d3c8f22d2bb6d3a', '2023-07-14 09:24:20', '2023-07-14 10:24:20'),
(55, 'ipop@test.com', '7381ee75def4008fcb87b42c4fffc1e946c358fb4823b0e2d4c712eb7ca3d2f1', '2023-07-14 09:24:30', '2023-07-14 10:24:30'),
(56, 'ipop@test.com', '310e003819795c0c2ef108297a9bcd1b90b3ead9fcb444277d08ce17604f16a6', '2023-07-14 12:26:36', '2023-07-14 13:26:36'),
(57, 'drasko@test2.com', '12f4f95113749f2463a1305f2cd19478dcd5c6e7664200a118c7ed2223117bef', '2023-07-19 15:24:03', '2023-07-19 16:24:03'),
(58, 'ipop@test.com', 'a96aaddba6dd40ebd26cd3db1c2ab00870078d17e06a3bf3aec7606f9429f4a3', '2023-07-19 15:57:12', '2023-07-19 16:57:12'),
(59, 'ipop@test.com', '3fb329d50bbbe028be7c8bbf923c8b3dfac7f9b7b05a0330e735686f4b674d7e', '2023-07-19 15:57:36', '2023-07-19 16:57:36'),
(60, 'ipop@gmail.com', '7d076cb0dfda182f459cde065a92a939a6a357b69b6204b71c50ad0253cb7f84', '2023-07-19 16:12:26', '2023-07-19 17:12:26'),
(61, 'ipop@gmail.com', '47d06a6b8fafec6fc67ccae48a869086bf6693ddac362e43137a724c6f293318', '2023-07-19 16:38:13', '2023-07-19 17:38:13'),
(62, 'drasko@test.com', '163135573519d6e18e8161249a825c411903155f42b99fa10f56ba83fa8f3d0a', '2023-07-24 17:13:14', '2023-07-24 18:13:14'),
(63, 'ipop@test.com', 'd4ccbb5f9ad370275b27b5c4550c9baabd8dff3b1f2a665d7e81cded557ca606', '2023-07-24 19:16:10', '2023-07-24 20:16:10'),
(64, 'ipop@test.com', '066d2291b691739c3ed809395ccc8d82d614001231ea9f6edb2da89a8d1bb2e9', '2023-07-24 19:17:00', '2023-07-24 20:17:00'),
(65, 'ipop@test.com', '4f131e5412ae6f51d2c2f564ffe117392232219b9f0aa684ceccfbbeda9ef0b8', '2023-07-24 19:26:28', '2023-07-24 20:26:28'),
(66, 'marko@test.com', 'b64c727d224dc83add992e5266bf30f3796bd49d37e4fe34903f935f2dc61bdf', '2023-07-24 19:30:03', '2023-07-24 20:30:03'),
(67, 'ipop@test.com', 'e54b29955715aeeb36e0a946d34d1ef030aca5969f81cab7daa34f41242cfe0b', '2023-07-24 21:56:56', '2023-07-24 22:11:56'),
(68, 'ipop@test.com', '4057174440aa2474441210470a587183fb626e0bddefc371009bedb1b8d74cb4', '2023-07-24 21:58:16', '2023-07-24 22:13:16'),
(69, 'ipop@test.com', '33469b191b88386e40d3a0ea585a402a64d11928b8015a37c18a55ca38edd78d', '2023-07-24 21:58:37', '2023-07-24 22:13:37'),
(70, 'ipop@test.com', 'f3df8b9db1e42c1ea422d110224bfa7793bfd3f5e894445704302361e6095e0e', '2023-07-24 22:01:09', '2023-07-24 22:16:09'),
(71, 'ipop@test.com', 'c3d51a9fac4954fb833527e0b18d3a35326b3b99b4e6ccb9eb6c3a18532c16f7', '2023-07-24 22:02:16', '2023-07-24 22:17:16'),
(72, 'ipop@test.com', '5ddb6827cee8660eb4d49a9d1c746a18ea6b1532aa9da9a49a399476ca800a53', '2023-07-24 22:03:33', '2023-07-24 22:18:33'),
(73, 'ipop@test.com', '0133168a53fdacd82a5c6c9835a4fbbfb2e2d2b7cbfff652382629f1d099ee48', '2023-07-24 22:04:36', '2023-07-24 22:19:36'),
(74, 'ipop@test.com', '806760d427e85cc29598d809b166761ee2071c5145759cfef2037801ff1df1ec', '2023-07-24 22:26:33', '2023-07-24 22:41:33'),
(75, 'ipop@test.com', '9fbac4e37cab676ee329ce6583d089b808fdbd8527a1c9b032f6bcbffa622e5b', '2023-07-24 23:21:42', '2023-07-24 23:36:42'),
(76, 'ipop@test.com', '21bddc935f79ed74c82d0dc19dc5c23d904e442522547f73b2fc0081713ad372', '2023-07-24 23:25:23', '2023-07-24 23:40:23'),
(77, 'ipop@test.com', '4a9481ebc6e25684565d74852ab7ea0e2cbef4ec7136af38a83675eb918602b0', '2023-07-24 23:33:01', '2023-07-24 23:48:01'),
(78, 'ipop@test.com', '8808d702afcac7d7fab9004540c3a7c65d48e221bc5be25bcaad19a572b1c0c0', '2023-07-24 23:37:19', '2023-07-24 23:52:19'),
(79, 'marko@test.com', 'ccdb937cdbf4f664a101dd9df3cc35de301650bc5aacf128b777d047cdc7e6bb', '2023-07-25 12:53:08', '2023-07-25 13:08:08'),
(80, 'marko@test.com', 'e5566f87676aa531dd4a40d462fc658aadcb89d4f9927b958869f5b20a3c7eef', '2023-07-25 13:01:45', '2023-07-25 13:16:45'),
(81, 'ipop@test.com', 'c4f4ccc4b45f115d53a76a926a7a72597bbb374ff3b264c270454ae1efcc2f3b', '2023-07-25 18:03:02', '2023-07-25 18:18:02'),
(82, 'drasko@test.com', '3ffd1f5ccf5488545f80a2a4015dc1e43a5b4fa97c85c634d7d812df6b43ffc6', '2023-07-26 11:53:57', '2023-07-26 12:08:57'),
(83, 'ipop@test.com', '2c51b41cc416d09ca3253cb283ff7aa54d439c124870daa2a42cfe3d678e5978', '2023-07-26 11:54:47', '2023-07-26 12:09:47'),
(84, 'ipop@test.com', '8642443ca950154d17ba4e1a31abfa6dbb18f4b64b83d372cefdf121be8b9a49', '2023-07-26 11:54:48', '2023-07-26 12:09:48'),
(85, 'ipop@test.com', 'cf3f4e814fecf9a7e0e500c01da6a3efc57c1b00ed0523f5df85fa8511f804a0', '2023-12-28 13:58:19', '2023-12-28 14:13:19'),
(86, 'ipop@test.com', '59d3a85d7773ef2dc7812150058c91bc9c484182f546319f5178c5ab095e18c7', '2024-03-20 12:22:17', '2024-03-20 12:37:17'),
(87, 'ipop@test.com', '42c9aa4b29146e76a2ff905dbd75b37c76db0a26a1a3ef287b5715f8a22e2477', '2024-03-20 12:25:52', '2024-03-20 12:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-deleted\r\n1-active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `status`) VALUES
(1, 'Administrator', 1),
(2, 'Urednik', 1),
(3, 'Korisnik', 1);

-- --------------------------------------------------------

--
-- Table structure for table `special_needs`
--

CREATE TABLE `special_needs` (
  `need_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-obrisana\r\n1-aktivna'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_needs`
--

INSERT INTO `special_needs` (`need_id`, `name`, `status`) VALUES
(1, 'nema posebne potrebe', 1),
(2, 'invaliditet', 1),
(3, 'zahteva medicinsku negu', 1),
(4, 'štene', 1),
(5, 'veteran', 1),
(6, 'slep pas', 1),
(7, 'gluv pas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `page` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statistics`
--

INSERT INTO `statistics` (`id`, `message`, `email`, `ip`, `page`, `created`) VALUES
(1, 'Korisnik se izlogovao', '', '::1', 'new_dog.php', '2023-07-12 11:28:02'),
(2, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-12 11:28:23'),
(3, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:03'),
(4, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:03'),
(5, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:03'),
(6, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:03'),
(7, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:03'),
(8, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:32'),
(9, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:32'),
(10, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:32'),
(11, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:32'),
(12, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:51'),
(13, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:51'),
(14, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:51'),
(15, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:29:51'),
(16, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-12 11:30:24'),
(17, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-12 11:30:24'),
(18, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-12 11:32:13'),
(19, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-12 11:32:13'),
(20, 'Korisnik se izlogovao', '', '::1', 'new_dog.php', '2023-07-12 11:34:12'),
(21, 'Uspešno promenjena lozinka korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_change_password.php', '2023-07-12 11:34:33'),
(22, 'Uspešno promenjena lozinka korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_change_password.php', '2023-07-12 11:37:18'),
(23, 'Uspešno promenjena lozinka korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_change_password.php', '2023-07-12 11:38:32'),
(24, 'Uspešno promenjena lozinka korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_change_password.php', '2023-07-12 11:39:16'),
(25, 'Uspešno promenjena lozinka korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_change_password.php', '2023-07-12 11:40:09'),
(26, 'Uspešno promenjena lozinka korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_change_password.php', '2023-07-12 11:42:04'),
(27, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-12 11:42:30'),
(28, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:43:29'),
(29, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:43:29'),
(30, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:43:29'),
(31, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:43:29'),
(32, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:43:29'),
(33, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-12 11:44:05'),
(34, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-12 11:44:05'),
(35, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-12 11:46:38'),
(36, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-12 11:46:38'),
(37, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:46:52'),
(38, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:46:52'),
(39, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:46:52'),
(40, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-12 11:47:47'),
(41, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-12 11:47:47'),
(42, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-12 11:48:01'),
(43, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-12 11:48:01'),
(44, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:48:52'),
(45, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:48:52'),
(46, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-12 11:48:52'),
(47, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-12 11:49:35'),
(48, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-12 11:49:48'),
(49, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-13 10:10:28'),
(50, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-13 10:10:51'),
(51, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-13 10:10:51'),
(52, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-13 10:10:51'),
(53, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-13 10:10:51'),
(54, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-13 10:11:08'),
(55, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-13 10:11:08'),
(56, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:34:00'),
(57, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:34:00'),
(58, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:38:31'),
(59, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:38:31'),
(60, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:39:41'),
(61, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:39:41'),
(62, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:40:21'),
(63, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:40:21'),
(64, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:46:44'),
(65, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:46:44'),
(66, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:53:08'),
(67, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:53:08'),
(68, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:54:05'),
(69, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:54:05'),
(70, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:55:53'),
(71, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:55:53'),
(72, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:57:01'),
(73, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:57:01'),
(74, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:57:58'),
(75, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 11:57:58'),
(76, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:02:57'),
(77, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:02:57'),
(78, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:03:39'),
(79, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:03:39'),
(80, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:04:06'),
(81, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:04:06'),
(82, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:04:34'),
(83, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:04:34'),
(84, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:05:10'),
(85, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:05:10'),
(86, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:05:21'),
(87, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:05:21'),
(88, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:12:20'),
(89, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-13 12:12:20'),
(90, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-14 07:11:50'),
(91, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-14 07:11:50'),
(92, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-14 09:59:43'),
(93, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_breed.php', '2023-07-14 09:59:43'),
(94, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-14 10:20:40'),
(95, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-14 10:20:40'),
(96, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-14 10:20:40'),
(97, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-14 10:25:06'),
(98, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-14 10:25:06'),
(99, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog.php', '2023-07-14 10:25:06'),
(100, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-14 10:25:36'),
(101, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-14 10:25:36'),
(102, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-14 10:25:45'),
(103, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-14 10:25:45'),
(104, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 15:24:29'),
(105, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 15:24:29'),
(106, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 15:24:29'),
(107, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 15:27:34'),
(108, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 15:27:34'),
(109, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 15:27:34'),
(110, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-14 17:05:46'),
(111, 'Uspešan unos podataka u tabelu users.', 'drasko@test.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 17:32:21'),
(112, 'Podaci su uspešno uneti u bazu.', 'drasko@test.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 17:32:21'),
(113, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-14 18:25:49'),
(114, 'Uspešan unos podataka u tabelu users.', 'ckurbla@skola.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 19:34:12'),
(115, 'Podaci su uspešno uneti u bazu.', 'ckurbla@skola.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 19:34:12'),
(116, 'Uspešan unos podataka u tabelu users.', 'bbosko@skola.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 19:36:07'),
(117, 'Podaci su uspešno uneti u bazu.', 'bbosko@skola.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 19:36:07'),
(118, 'Uspešan unos podataka u tabelu users.', 'drasko@test2.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 19:36:48'),
(119, 'Podaci su uspešno uneti u bazu.', 'drasko@test2.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 19:36:48'),
(120, 'Uspešan unos podataka u tabelu users.', 'ipop@gmail.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 19:47:06'),
(121, 'Podaci su uspešno uneti u bazu.', 'ipop@gmail.com', '::1', '/Sapice_final/ajax/ajax_new_user.php', '2023-07-14 19:47:06'),
(122, 'Uspešan unos podataka u tabelu users.', '12a@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 08:54:50'),
(123, 'Podaci su uspešno uneti u bazu.', '12a@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 08:54:50'),
(124, 'Uspešan unos podataka u tabelu users.', '12a6@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 09:02:38'),
(125, 'Podaci su uspešno uneti u bazu.', '12a6@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 09:02:38'),
(126, 'Uspešan unos podataka u tabelu users.', '12a656@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 09:10:58'),
(127, 'Podaci su uspešno uneti u bazu.', '12a656@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 09:10:58'),
(128, 'Uspešan unos podataka u tabelu users.', '12a6569@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 09:11:17'),
(129, 'Podaci su uspešno uneti u bazu.', '12a6569@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 09:11:17'),
(130, 'Uspešan unos podataka u tabelu users.', '12a65690@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 09:13:14'),
(131, 'Podaci su uspešno uneti u bazu.', '12a65690@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-15 09:13:14'),
(132, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-15 09:36:39'),
(133, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-15 09:36:39'),
(134, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_data.php', '2023-07-15 09:37:32'),
(135, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_dog_img.php', '2023-07-15 09:37:32'),
(136, 'Uspešan unos podataka u tabelu users.', '12abc@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-17 06:12:08'),
(137, 'Podaci su uspešno uneti u bazu.', '12abc@test.com', '::1', '/Sapice_final/ajax/ajax_new_user-copy.php', '2023-07-17 06:12:08'),
(138, 'Uspešan unos podataka u tabelu characteristics.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_char.php', '2023-07-17 10:40:47'),
(139, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_char.php', '2023-07-17 10:40:47'),
(140, 'Uspešan unos podataka u tabelu roles.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_role.php', '2023-07-17 11:03:29'),
(141, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_role.php', '2023-07-17 11:03:29'),
(142, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-17 14:39:15'),
(143, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog_image.php', '2023-07-18 11:39:29'),
(144, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog_image.php', '2023-07-18 11:50:41'),
(145, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog_image.php', '2023-07-18 11:53:12'),
(146, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog_image.php', '2023-07-18 11:54:52'),
(147, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog_image.php', '2023-07-18 11:56:30'),
(148, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog_image.php', '2023-07-18 11:56:52'),
(149, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog_image.php', '2023-07-18 11:57:49'),
(150, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_dog_image.php', '2023-07-18 11:57:58'),
(151, 'Podaci su uspešno uneti u bazu.', 'ckurbla@skola.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-18 16:03:33'),
(152, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:03:24'),
(153, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:04:14'),
(154, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:05:27'),
(155, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:10:01'),
(156, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:10:22'),
(157, 'Podaci su uspešno uneti u bazu.', 'ckurbla@skola.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:11:47'),
(158, 'Podaci su uspešno uneti u bazu.', 'ckurbla@skola.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:12:27'),
(159, 'Podaci su uspešno uneti u bazu.', 'bbosko@skola.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:19:36'),
(160, 'Podaci su uspešno uneti u bazu.', 'bbosko@skola.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:20:42'),
(161, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:26:24'),
(162, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:28:47'),
(163, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:29:26'),
(164, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:34:16'),
(165, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:34:25'),
(166, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:34:53'),
(167, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:35:05'),
(168, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:36:16'),
(169, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:36:36'),
(170, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_user.php', '2023-07-19 09:36:57'),
(171, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-19 09:42:54'),
(172, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-19 11:23:00'),
(173, 'Uspešno promenjena lozinka korisnika', 'drasko@test2.com', '::1', '/Sapice_final/ajax/ajax_change_password.php', '2023-07-19 14:01:57'),
(174, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-19 19:50:06'),
(175, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-19 19:50:06'),
(176, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-19 19:50:06'),
(177, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-19 19:51:43'),
(178, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-19 19:51:43'),
(179, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-19 19:51:43'),
(180, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-20 06:42:43'),
(181, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-20 06:42:43'),
(182, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-20 06:42:43'),
(183, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-20 14:06:17'),
(184, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-20 14:06:17'),
(185, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-20 14:06:17'),
(186, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-20 14:09:45'),
(187, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-20 14:09:45'),
(188, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_image.php', '2023-07-20 14:09:45'),
(189, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:15:14'),
(190, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:15:47'),
(191, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:16:35'),
(192, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:16:35'),
(193, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:16:35'),
(194, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:26:27'),
(195, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:26:27'),
(196, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:26:27'),
(197, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:26:27'),
(198, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:26:27'),
(199, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:37:21'),
(200, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:37:21'),
(201, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:37:21'),
(202, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:37:21'),
(203, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:37:21'),
(204, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:56:29'),
(205, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:56:29'),
(206, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:56:29'),
(207, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:58:12'),
(208, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:58:12'),
(209, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:58:12'),
(210, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_new_blog.php', '2023-07-20 14:58:12'),
(211, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:13:15'),
(212, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:19:21'),
(213, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:20:05'),
(214, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:21:03'),
(215, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:22:16'),
(216, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:24:56'),
(217, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:25:08'),
(218, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:29:12'),
(219, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:29:52'),
(220, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 16:32:59'),
(221, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:32:59'),
(222, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 16:33:25'),
(223, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:33:25'),
(224, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 16:33:51'),
(225, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:33:51'),
(226, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 16:39:00'),
(227, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:39:00'),
(228, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 16:41:16'),
(229, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:41:16'),
(230, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 16:55:09'),
(231, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:55:09'),
(232, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 16:57:46'),
(233, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 16:57:46'),
(234, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 17:03:11'),
(235, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 17:03:11'),
(236, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 17:12:43'),
(237, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-20 17:20:05'),
(238, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 17:46:43'),
(239, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 17:46:43'),
(240, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 17:48:16'),
(241, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 17:48:16'),
(242, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 17:49:01'),
(243, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 17:49:01'),
(244, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 17:53:11'),
(245, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 17:53:11'),
(246, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 17:53:35'),
(247, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 17:53:35'),
(248, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_data.php', '2023-07-20 17:55:51'),
(249, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_update_blog_img.php', '2023-07-20 17:55:51'),
(250, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-20 22:07:17'),
(251, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_login.php', '2023-07-21 06:35:07'),
(252, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:12:39'),
(253, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:12:39'),
(254, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:12:39'),
(255, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:17:13'),
(256, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:17:13'),
(257, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:17:13'),
(258, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:17:13'),
(259, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:17:42'),
(260, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:17:42'),
(261, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:17:42'),
(262, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:17:42'),
(263, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 08:17:42'),
(264, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-21 11:08:09'),
(265, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:18:40'),
(266, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:18:40'),
(267, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:26:46'),
(268, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:26:46'),
(269, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:26:46'),
(270, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:26:46'),
(271, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:43:38'),
(272, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:43:38'),
(273, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:43:38'),
(274, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 11:43:38'),
(275, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 11:44:24'),
(276, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 11:46:56'),
(277, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 11:50:03'),
(278, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 11:54:11'),
(279, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 11:55:46'),
(280, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 12:00:18'),
(281, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 12:11:42'),
(282, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 12:11:47'),
(283, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 12:20:30'),
(284, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 12:32:49'),
(285, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 12:32:49'),
(286, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 12:32:49'),
(287, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 12:34:51'),
(288, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-21 12:34:51'),
(289, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 12:38:01'),
(290, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 12:56:16'),
(291, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 12:59:49'),
(292, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 13:01:09'),
(293, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:17:37'),
(294, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:23:39'),
(295, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:23:39'),
(296, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:24:53'),
(297, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:24:53'),
(298, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:28:08'),
(299, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:28:08'),
(300, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:30:56'),
(301, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:30:56'),
(302, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:31:47'),
(303, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:31:47'),
(304, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:32:15'),
(305, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:32:15'),
(306, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:33:03'),
(307, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:33:03'),
(308, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:34:34'),
(309, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:34:34'),
(310, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:35:45'),
(311, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:35:45'),
(312, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:38:03'),
(313, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:38:03'),
(314, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 13:41:47'),
(315, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:42:18'),
(316, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-21 13:42:18'),
(317, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 13:49:04'),
(318, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 13:51:04'),
(319, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-21 13:51:34'),
(320, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-21 18:58:35'),
(321, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:01:11'),
(322, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:01:11'),
(323, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:01:11'),
(324, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:01:11'),
(325, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:01:11'),
(326, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:01:11'),
(327, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:09:02'),
(328, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:09:02'),
(329, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:09:02'),
(330, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:09:02'),
(331, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:09:02'),
(332, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:09:02'),
(333, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:10:57'),
(334, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:10:57'),
(335, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:10:57'),
(336, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:10:57'),
(337, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:10:57'),
(338, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:10:57'),
(339, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:10:57'),
(340, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:10:57'),
(341, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:13:23'),
(342, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:13:23'),
(343, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:13:23'),
(344, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:13:23'),
(345, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:13:23'),
(346, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:13:23'),
(347, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:16:24'),
(348, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:16:24'),
(349, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:16:24'),
(350, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:16:24'),
(351, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:16:24'),
(352, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:16:24'),
(353, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:20:30'),
(354, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:20:30'),
(355, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:20:30'),
(356, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:20:30'),
(357, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:20:30'),
(358, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:20:30'),
(359, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:25:57');
INSERT INTO `statistics` (`id`, `message`, `email`, `ip`, `page`, `created`) VALUES
(360, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:25:57'),
(361, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:25:57'),
(362, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:25:57'),
(363, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:25:57'),
(364, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:25:57'),
(365, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:29:54'),
(366, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:29:54'),
(367, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:29:54'),
(368, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:29:54'),
(369, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:29:54'),
(370, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:29:54'),
(371, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:29:54'),
(372, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:32:24'),
(373, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:32:24'),
(374, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:32:24'),
(375, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:32:24'),
(376, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:32:24'),
(377, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:32:24'),
(378, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:32:24'),
(379, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:34:07'),
(380, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:34:07'),
(381, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:34:07'),
(382, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:34:07'),
(383, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:34:07'),
(384, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:34:07'),
(385, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-21 19:34:07'),
(386, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:28:33'),
(387, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:28:48'),
(388, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:29:02'),
(389, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:40:52'),
(390, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:43:15'),
(391, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:43:28'),
(392, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:52:07'),
(393, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:52:21'),
(394, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:52:32'),
(395, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:53:19'),
(396, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:53:30'),
(397, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:53:44'),
(398, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:54:40'),
(399, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 20:54:53'),
(400, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:00:07'),
(401, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:00:19'),
(402, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:05:34'),
(403, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:05:48'),
(404, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:08:44'),
(405, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:08:56'),
(406, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:11:27'),
(407, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:11:41'),
(408, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:13:09'),
(409, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-21 21:13:27'),
(410, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-22 05:48:57'),
(411, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-22 08:13:22'),
(412, 'Podaci su uspešno uneti u bazu.', 'test1@test.com', '::1', '/Sapice_complete/Sapice_site/ajax/ajax-contact-form.php', '2023-07-23 09:08:03'),
(413, 'Podaci su uspešno uneti u bazu.', 'test2@test.com', '::1', '/Sapice_complete/Sapice_site/ajax/ajax-contact-form.php', '2023-07-23 09:28:16'),
(414, 'Podaci su uspešno uneti u bazu.', 'ipop@gmail.com', '::1', '/Sapice_complete/Sapice_site/ajax/ajax-contact-form.php', '2023-07-23 09:29:40'),
(415, 'Podaci su uspešno uneti u bazu.', 'drasko@test.com', '::1', '/Sapice_complete/Sapice_site/ajax/ajax-contact-form.php', '2023-07-23 09:35:01'),
(416, 'Podaci su uspešno uneti u bazu.', 'drasko@test.com', '::1', '/Sapice_complete/Sapice_site/ajax/ajax-contact-form.php', '2023-07-23 09:35:44'),
(417, 'Hvala Vam na interesovanju. Uskoro ćemo Vas kontaktirati.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_site/ajax/ajax-contact-form.php', '2023-07-23 09:39:12'),
(418, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-23 22:13:02'),
(419, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-23 22:13:02'),
(420, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-23 22:13:02'),
(421, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-23 22:13:29'),
(422, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-23 22:13:29'),
(423, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-23 22:13:29'),
(424, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-23 22:38:07'),
(425, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-23 22:38:07'),
(426, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-23 22:38:07'),
(427, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-23 23:02:24'),
(428, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 08:37:32'),
(429, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 08:38:01'),
(430, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 08:38:01'),
(431, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 08:38:01'),
(432, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-24 08:38:34'),
(433, 'Uspešan unos podataka u tabelu users.', 'drasko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_user-copy.php', '2023-07-24 14:31:44'),
(434, 'Podaci su uspešno uneti u bazu.', 'drasko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_user-copy.php', '2023-07-24 14:31:44'),
(435, 'Podaci su uspešno uneti u bazu.', 'drasko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-24 14:38:00'),
(436, 'Podaci su uspešno uneti u bazu.', 'drasko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-24 14:38:33'),
(437, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-24 16:39:27'),
(438, 'Korisnik se izlogovao', '', '::1', 'all_dogs.php', '2023-07-24 17:15:59'),
(439, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 17:27:30'),
(440, 'Uspešan unos podataka u tabelu users.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_user-copy.php', '2023-07-24 17:29:56'),
(441, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_user-copy.php', '2023-07-24 17:29:56'),
(442, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 18:45:42'),
(443, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 18:46:20'),
(444, 'Korisnik se izlogovao', '', '::1', 'main_admin.php', '2023-07-24 19:03:07'),
(445, 'Uspesno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 19:06:33'),
(446, 'Korisnik se izlogovao', '', '::1', 'all_dogs.php', '2023-07-24 19:43:18'),
(447, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:48:22'),
(448, 'Korisnik ne postoji', 'ipop@tes.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:48:29'),
(449, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:48:38'),
(450, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:48:43'),
(451, 'Nisu uneti svi podaci', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:48:47'),
(452, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:48:51'),
(453, 'Korisnik se izlogovao', '', '::1', 'main_admin.php', '2023-07-24 20:48:56'),
(454, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:49:13'),
(455, 'Korisnik se izlogovao', '', '::1', 'main_admin.php', '2023-07-24 20:49:18'),
(456, 'Korisnik se izlogovao', '', '::1', 'main_admin.php', '2023-07-24 20:49:23'),
(457, 'Nisu uneti svi podaci', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:53:16'),
(458, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:53:21'),
(459, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 20:53:28'),
(460, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:04:40'),
(461, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-24 21:06:25'),
(462, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:12:11'),
(463, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:12:17'),
(464, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-24 21:12:19'),
(465, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:13:18'),
(466, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-24 21:13:20'),
(467, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-24 21:13:22'),
(468, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:15:44'),
(469, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-24 21:15:45'),
(470, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-24 21:15:49'),
(471, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:19:11'),
(472, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:19:16'),
(473, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-24 21:19:22'),
(474, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:20:00'),
(475, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'all_dogs.php', '2023-07-24 21:21:34'),
(476, 'Uspešno promenjena lozinka korisnika', 'ipop@test.com', '::1', '/Sapice_final/ajax/ajax_change_password.php', '2023-07-24 21:22:11'),
(477, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:32:45'),
(478, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-24 21:42:52'),
(479, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:04:57'),
(480, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:04:57'),
(481, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:04:57'),
(482, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:11:03'),
(483, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:11:03'),
(484, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:11:03'),
(485, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:17:14'),
(486, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:17:14'),
(487, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:17:14'),
(488, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:17:14'),
(489, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:20:58'),
(490, 'Uspešan unos podataka u tabelu blogs_blog_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:20:58'),
(491, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-24 22:20:58'),
(492, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-24 22:44:43'),
(493, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 22:49:36'),
(494, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 22:49:36'),
(495, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-24 22:52:19'),
(496, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 22:53:05'),
(497, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 22:53:05'),
(498, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 22:57:16'),
(499, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 22:57:16'),
(500, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-24 23:15:37'),
(501, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:16:25'),
(502, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:16:25'),
(503, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:18:30'),
(504, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:18:30'),
(505, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:24:13'),
(506, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:24:13'),
(507, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-24 23:25:09'),
(508, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-24 23:35:46'),
(509, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-24 23:41:45'),
(510, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:42:07'),
(511, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:42:07'),
(512, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-24 23:42:44'),
(513, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:43:19'),
(514, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:43:19'),
(515, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:45:45'),
(516, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:45:45'),
(517, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog_img.php', '2023-07-24 23:46:26'),
(518, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:46:45'),
(519, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:46:45'),
(520, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:47:45'),
(521, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-24 23:47:45'),
(522, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-25 00:20:11'),
(523, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_blog.php', '2023-07-25 00:20:11'),
(524, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:39:48'),
(525, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:39:48'),
(526, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:40:02'),
(527, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:40:02'),
(528, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:41:07'),
(529, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:41:07'),
(530, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:41:15'),
(531, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:41:15'),
(532, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:41:38'),
(533, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:41:38'),
(534, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:41:46'),
(535, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:41:46'),
(536, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:43:10'),
(537, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_view_blog-newtest.php', '2023-07-25 00:43:10'),
(538, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_breed.php', '2023-07-25 00:57:48'),
(539, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_breed.php', '2023-07-25 00:57:48'),
(540, 'Uspešan unos podataka u tabelu characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_char.php', '2023-07-25 01:04:23'),
(541, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_char.php', '2023-07-25 01:04:23'),
(542, 'Uspešan unos podataka u tabelu breeds.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_breed.php', '2023-07-25 01:16:31'),
(543, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_breed.php', '2023-07-25 01:16:31'),
(544, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-25 06:55:49'),
(545, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:03:52'),
(546, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:03:52'),
(547, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:03:52'),
(548, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:03:52'),
(549, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:03:52'),
(550, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:06:34'),
(551, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:06:34'),
(552, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:06:34'),
(553, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:06:34'),
(554, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:06:34'),
(555, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:08:44'),
(556, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:08:44'),
(557, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:08:44'),
(558, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:08:44'),
(559, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:08:44'),
(560, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:25:58'),
(561, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:25:58'),
(562, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:25:58'),
(563, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:25:58'),
(564, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:25:58'),
(565, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:25:58'),
(566, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:20'),
(567, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:20'),
(568, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:20'),
(569, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:20'),
(570, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:20'),
(571, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:20'),
(572, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:41'),
(573, 'Uspešan unos podataka u tabelu dogs_characteristics.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:41'),
(574, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:41'),
(575, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:30:41'),
(576, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:32:53'),
(577, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:32:53'),
(578, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:32:53'),
(579, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:37:25'),
(580, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:37:25'),
(581, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:37:25'),
(582, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:37:39'),
(583, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:37:39'),
(584, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:37:39'),
(585, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:38:17'),
(586, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:38:17'),
(587, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:40:09'),
(588, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:40:09'),
(589, 'Uspešan unos podataka u tabelu dogs_dog_images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:40:09'),
(590, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:40:09'),
(591, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:40:21'),
(592, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:40:21'),
(593, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:40:21'),
(594, 'Uspešan unos podataka u tabelu dogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:44:35'),
(595, 'Uspešan unos podataka u tabelu dogs_needs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:44:35'),
(596, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog.php', '2023-07-25 07:44:35'),
(597, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 07:46:56'),
(598, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 07:46:56'),
(599, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 07:49:42'),
(600, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 07:49:42'),
(601, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 07:50:12'),
(602, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 07:50:12'),
(603, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 07:50:34'),
(604, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 07:50:34'),
(605, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 07:52:48'),
(606, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 07:52:48'),
(607, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 07:54:34'),
(608, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 07:54:34'),
(609, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 07:56:29'),
(610, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 07:56:29'),
(611, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 07:59:09'),
(612, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 07:59:09'),
(613, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:06:39'),
(614, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:06:39'),
(615, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:08:41'),
(616, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:08:41'),
(617, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:08:52'),
(618, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:08:52'),
(619, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:09:19'),
(620, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:09:19'),
(621, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:11:12'),
(622, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:11:12'),
(623, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:18:04'),
(624, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:18:04'),
(625, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:19:20'),
(626, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:19:20'),
(627, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:34:58'),
(628, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:34:58'),
(629, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:44:14'),
(630, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:44:14'),
(631, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:44:30'),
(632, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2023-07-25 08:44:30'),
(633, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog-copy.php', '2023-07-25 08:51:45'),
(634, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog-copy.php', '2023-07-25 08:52:19'),
(635, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 08:54:25'),
(636, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 08:54:25'),
(637, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_data.php', '2023-07-25 08:55:11'),
(638, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog_img.php', '2023-07-25 08:55:11'),
(639, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:06:40'),
(640, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:07:04'),
(641, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:09:36'),
(642, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:10:29'),
(643, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:11:05'),
(644, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:12:05'),
(645, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:12:56'),
(646, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-25 09:16:38'),
(647, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:18:38'),
(648, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:21:21'),
(649, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:22:15'),
(650, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:24:06'),
(651, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:25:19'),
(652, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:26:25'),
(653, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:27:14'),
(654, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:32:03'),
(655, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:46:50'),
(656, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:48:12'),
(657, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:49:22'),
(658, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2023-07-25 09:49:36'),
(659, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 10:22:07'),
(660, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 10:22:26'),
(661, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 10:23:11'),
(662, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 10:23:28'),
(663, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 10:23:51'),
(664, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 10:24:44'),
(665, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 10:24:50'),
(666, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 10:24:57'),
(667, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 10:56:15'),
(668, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 11:01:03'),
(669, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 11:01:20'),
(670, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 11:08:20'),
(671, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 11:14:31'),
(672, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 11:16:29'),
(673, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 11:16:39'),
(674, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 11:16:51'),
(675, 'Podaci su uspešno uneti u bazu.', 'marko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_user.php', '2023-07-25 11:17:52'),
(676, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:39:24'),
(677, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:39:24'),
(678, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:39:24'),
(679, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:39:55'),
(680, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:39:55'),
(681, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:39:55'),
(682, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:51:17'),
(683, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:51:17'),
(684, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:51:17'),
(685, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:57:39'),
(686, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:57:39'),
(687, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:57:39'),
(688, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:59:33'),
(689, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:59:33'),
(690, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 12:59:33'),
(691, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_image-copy.php', '2023-07-25 13:19:08'),
(692, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_image-copy.php', '2023-07-25 13:20:23'),
(693, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_image-copy.php', '2023-07-25 13:21:12'),
(694, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:21:52'),
(695, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:21:52'),
(696, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:21:52'),
(697, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_image.php', '2023-07-25 13:24:50'),
(698, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_image.php', '2023-07-25 13:25:16');
INSERT INTO `statistics` (`id`, `message`, `email`, `ip`, `page`, `created`) VALUES
(699, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_image.php', '2023-07-25 13:31:12'),
(700, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-25 13:35:07'),
(701, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_dog_image.php', '2023-07-25 13:36:48'),
(702, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:42:24'),
(703, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:42:24'),
(704, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:42:24'),
(705, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:42:41'),
(706, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:42:41'),
(707, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:42:41'),
(708, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:00'),
(709, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:00'),
(710, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:00'),
(711, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:21'),
(712, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:21'),
(713, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:21'),
(714, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:34'),
(715, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:34'),
(716, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:34'),
(717, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:46'),
(718, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:46'),
(719, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:46'),
(720, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:59'),
(721, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:59'),
(722, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:43:59'),
(723, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:44:12'),
(724, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:44:12'),
(725, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:44:12'),
(726, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:44:39'),
(727, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:44:39'),
(728, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:44:39'),
(729, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:44:52'),
(730, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:44:52'),
(731, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:44:52'),
(732, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:45:05'),
(733, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:45:05'),
(734, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:45:05'),
(735, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:45:30'),
(736, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:45:30'),
(737, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:45:30'),
(738, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:45:48'),
(739, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:45:48'),
(740, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:45:48'),
(741, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:46:29'),
(742, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:46:29'),
(743, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:46:29'),
(744, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:46:41'),
(745, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:46:41'),
(746, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:46:41'),
(747, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:46:53'),
(748, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:46:53'),
(749, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:46:53'),
(750, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:07'),
(751, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:07'),
(752, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:07'),
(753, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:18'),
(754, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:18'),
(755, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:18'),
(756, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:30'),
(757, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:30'),
(758, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:30'),
(759, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:43'),
(760, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:43'),
(761, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:43'),
(762, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:55'),
(763, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:55'),
(764, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:47:55'),
(765, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:48:10'),
(766, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:48:10'),
(767, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:48:10'),
(768, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:48:20'),
(769, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:48:20'),
(770, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:48:20'),
(771, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:02'),
(772, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:02'),
(773, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:02'),
(774, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:15'),
(775, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:15'),
(776, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:15'),
(777, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:27'),
(778, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:27'),
(779, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:27'),
(780, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:42'),
(781, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:42'),
(782, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:42'),
(783, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:55'),
(784, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:55'),
(785, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:49:55'),
(786, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:50:06'),
(787, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:50:06'),
(788, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 13:50:06'),
(789, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_image.php', '2023-07-25 13:57:19'),
(790, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-25 15:18:07'),
(791, 'Hvala Vam na interesovanju. Uskoro ćemo Vas kontaktirati.', 'irena@test.com', '::1', '/Sapice_complete/Sapice_site/ajax/ajax-contact-form.php', '2023-07-25 16:01:44'),
(792, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-25 16:02:50'),
(793, 'Korisnik ne postoji', 'ipop@tet.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-25 16:02:54'),
(794, 'Uspešno promenjena lozinka korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_change_password.php', '2023-07-25 16:04:28'),
(795, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-25 16:05:14'),
(796, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-25 16:05:18'),
(797, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-25 16:05:25'),
(798, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-25 16:05:46'),
(799, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-25 16:06:01'),
(800, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 16:07:43'),
(801, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 16:07:43'),
(802, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-25 16:07:43'),
(803, 'Nisu uneti svi podaci', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-26 09:47:01'),
(804, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-26 09:47:05'),
(805, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-26 09:47:11'),
(806, 'Hvala Vam na interesovanju. Uskoro ćemo Vas kontaktirati.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_site/ajax/ajax-contact-form.php', '2023-07-26 09:52:03'),
(807, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'all_dogs.php', '2023-07-26 09:53:01'),
(808, 'Nisu uneti svi podaci', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-26 09:53:07'),
(809, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-26 09:53:10'),
(810, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-26 09:53:18'),
(811, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'all_users.php', '2023-07-26 09:54:09'),
(812, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'main_admin.php', '2023-07-26 09:54:25'),
(813, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-07-26 09:55:37'),
(814, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-26 09:55:50'),
(815, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-26 09:55:50'),
(816, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2023-07-26 09:55:50'),
(817, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-12-28 12:58:07'),
(818, 'Uneta pogrešna lozinka', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2023-12-28 12:58:16'),
(819, 'Uspešno logovanje korisnika', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2024-03-20 08:15:10'),
(820, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2024-03-20 08:15:38'),
(821, 'Uspešan unos podataka u tabelu images.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2024-03-20 08:17:16'),
(822, 'Uspešan unos podataka u tabelu images_img_categories.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2024-03-20 08:17:16'),
(823, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_new_image.php', '2024-03-20 08:17:16'),
(824, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2024-03-20 08:19:43'),
(825, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2024-03-20 08:20:03'),
(826, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2024-03-20 08:20:03'),
(827, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2024-03-20 08:21:26'),
(828, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2024-03-20 08:21:26'),
(829, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2024-03-20 08:27:10'),
(830, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2024-03-20 08:27:10'),
(831, 'Uspešan unos podataka u tabelu blogs.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2024-03-20 08:29:28'),
(832, 'Podaci su uspešno uneti u bazu.', 'ipop@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_blog.php', '2024-03-20 08:29:28'),
(833, 'Korisnik se izlogovao', 'ipop@test.com', '::1', 'new_blog.php', '2024-03-20 08:41:13'),
(834, 'Uspešno logovanje korisnika', 'drasko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_login.php', '2024-03-20 08:59:08'),
(835, 'Podaci su uspešno uneti u bazu.', 'drasko@test.com', '::1', '/Sapice_complete/Sapice_admin/ajax/ajax_update_dog.php', '2024-03-20 08:59:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0-deleted\r\n1-active',
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `last_name`, `email`, `password`, `phone`, `role_id`, `status`, `created`, `updated`, `token`) VALUES
(1, 'Irena', 'Popović', 'ipop@test.com', '12345', '011234567', 1, 1, '2023-07-24 14:30:58', '2023-07-26 09:54:26', NULL),
(2, 'Drasko', 'S', 'drasko@test.com', '12345', '061 2234567', 3, 1, '2023-07-24 14:31:44', '2024-03-20 08:58:55', NULL),
(3, 'Marko ', 'Markovic', 'marko@test.com', '827ccb0eea8a706c4c34a16891f84e7b', '063 8474643', 1, 1, '2023-07-24 17:29:56', '2023-07-25 11:16:51', NULL);

-- --------------------------------------------------------

--
-- Structure for view `all_images`
--
DROP TABLE IF EXISTS `all_images`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_images`  AS SELECT concat('i_',`i`.`img_id`) AS `img_id`, `i`.`img_id` AS `original_id`, `i`.`name` AS `name`, `iic`.`category_id` AS `category_id`, `ic`.`name` AS `category`, `i`.`img_source` AS `img_source`, `i`.`created` AS `created`, `i`.`status` AS `status` FROM ((`images` `i` left join `images_img_categories` `iic` on(`i`.`img_id` = `iic`.`img_id`)) left join `img_categories` `ic` on(`iic`.`category_id` = `ic`.`category_id`)) union all select concat('di_',`di`.`img_id`) AS `img_id`,`di`.`img_id` AS `original_id`,`di`.`name` AS `name`,2 AS `category_id`,(select `img_categories`.`name` from `img_categories` where `img_categories`.`category_id` = 2) AS `category`,`di`.`img_source` AS `img_source`,`di`.`created` AS `created`,`di`.`status` AS `status` from `dog_imgs` `di`  ;

-- --------------------------------------------------------

--
-- Structure for view `blog_view`
--
DROP TABLE IF EXISTS `blog_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `blog_view`  AS SELECT `b`.`blog_id` AS `blog_id`, `b`.`title` AS `title`, `b`.`subtitle` AS `subtitle`, `b`.`blog_text` AS `blog_text`, `b`.`img_name` AS `img_name`, `b`.`img_source` AS `img_source`, group_concat(`bc`.`blog_category_id` separator ',') AS `blog_category_ids`, group_concat(`bc`.`name` separator ',') AS `blog_categories`, `b`.`status` AS `status` FROM ((`blogs` `b` left join `blogs_blog_categories` `bbc` on(`b`.`blog_id` = `bbc`.`blog_id` and `bbc`.`status` = 1)) left join `blog_categories` `bc` on(`bbc`.`blog_category_id` = `bc`.`blog_category_id`)) GROUP BY `b`.`blog_id``blog_id`  ;

-- --------------------------------------------------------

--
-- Structure for view `dogs_details`
--
DROP TABLE IF EXISTS `dogs_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dogs_details`  AS SELECT `d`.`dog_id` AS `dog_id`, `d`.`name` AS `name`, `d`.`gender` AS `gender`, `b`.`name` AS `breed`, `d`.`description` AS `description`, `d`.`age` AS `age`, `d`.`weight` AS `weight`, `d`.`found_when` AS `found_when`, `d`.`found_where` AS `found_where`, `d`.`status` AS `status`, `d`.`comment` AS `comment`, `d`.`created` AS `created`, `d`.`updated` AS `updated`, group_concat(distinct `c`.`name` order by `c`.`name` ASC separator ', ') AS `characteristics`, group_concat(distinct `sn`.`name` order by `sn`.`name` ASC separator ', ') AS `spec_needs`, `di`.`img_source` AS `profile_img`, CASE WHEN `d`.`weight` <= 10 THEN 'small' WHEN `d`.`weight` > 10 AND `d`.`weight` <= 25 THEN 'medium' ELSE 'large' END AS `size_category` FROM ((((((`dogs` `d` left join `breeds` `b` on(`d`.`breed_id` = `b`.`breed_id`)) left join `dogs_characteristics` `dc` on(`d`.`dog_id` = `dc`.`dog_id` and `dc`.`status` = 1)) left join `characteristics` `c` on(`dc`.`char_id` = `c`.`char_id`)) left join `dogs_needs` `dn` on(`d`.`dog_id` = `dn`.`dog_id` and `dn`.`status` = 1)) left join `special_needs` `sn` on(`sn`.`need_id` = `dn`.`need_id`)) left join `dog_imgs` `di` on(`d`.`dog_id` = `di`.`dog_id` and `di`.`profile` = 'da')) GROUP BY `d`.`dog_id``dog_id`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `blogs_blog_categories`
--
ALTER TABLE `blogs_blog_categories`
  ADD PRIMARY KEY (`blog_blog_cat_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Indexes for table `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`breed_id`);

--
-- Indexes for table `characteristics`
--
ALTER TABLE `characteristics`
  ADD PRIMARY KEY (`char_id`);

--
-- Indexes for table `dogs`
--
ALTER TABLE `dogs`
  ADD PRIMARY KEY (`dog_id`),
  ADD KEY `breed_id` (`breed_id`);

--
-- Indexes for table `dogs_characteristics`
--
ALTER TABLE `dogs_characteristics`
  ADD PRIMARY KEY (`dog_char_id`),
  ADD KEY `dogs_characteristics_ibfk_1` (`dog_id`),
  ADD KEY `dogs_characteristics_ibfk_2` (`char_id`);

--
-- Indexes for table `dogs_dog_images`
--
ALTER TABLE `dogs_dog_images`
  ADD PRIMARY KEY (`dog_img_id`),
  ADD KEY `img_id` (`img_id`),
  ADD KEY `dog_id` (`dog_id`);

--
-- Indexes for table `dogs_needs`
--
ALTER TABLE `dogs_needs`
  ADD PRIMARY KEY (`dog_need_id`),
  ADD KEY `dogs_needs_ibfk_1` (`dog_id`),
  ADD KEY `dogs_needs_ibfk_2` (`need_id`);

--
-- Indexes for table `dog_imgs`
--
ALTER TABLE `dog_imgs`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `dog_id` (`dog_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `images_img_categories`
--
ALTER TABLE `images_img_categories`
  ADD PRIMARY KEY (`img_cat_id`);

--
-- Indexes for table `img_categories`
--
ALTER TABLE `img_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `messages_contact_form`
--
ALTER TABLE `messages_contact_form`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `reset_passwords`
--
ALTER TABLE `reset_passwords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `special_needs`
--
ALTER TABLE `special_needs`
  ADD PRIMARY KEY (`need_id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `blogs_blog_categories`
--
ALTER TABLE `blogs_blog_categories`
  MODIFY `blog_blog_cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `blog_category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `breeds`
--
ALTER TABLE `breeds`
  MODIFY `breed_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `characteristics`
--
ALTER TABLE `characteristics`
  MODIFY `char_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dogs`
--
ALTER TABLE `dogs`
  MODIFY `dog_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `dogs_characteristics`
--
ALTER TABLE `dogs_characteristics`
  MODIFY `dog_char_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `dogs_dog_images`
--
ALTER TABLE `dogs_dog_images`
  MODIFY `dog_img_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `dogs_needs`
--
ALTER TABLE `dogs_needs`
  MODIFY `dog_need_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `dog_imgs`
--
ALTER TABLE `dog_imgs`
  MODIFY `img_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `img_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `images_img_categories`
--
ALTER TABLE `images_img_categories`
  MODIFY `img_cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `img_categories`
--
ALTER TABLE `img_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages_contact_form`
--
ALTER TABLE `messages_contact_form`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reset_passwords`
--
ALTER TABLE `reset_passwords`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `special_needs`
--
ALTER TABLE `special_needs`
  MODIFY `need_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=836;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dogs`
--
ALTER TABLE `dogs`
  ADD CONSTRAINT `dogs_ibfk_1` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`breed_id`);

--
-- Constraints for table `dogs_characteristics`
--
ALTER TABLE `dogs_characteristics`
  ADD CONSTRAINT `dogs_characteristics_ibfk_1` FOREIGN KEY (`dog_id`) REFERENCES `dogs` (`dog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dogs_characteristics_ibfk_2` FOREIGN KEY (`char_id`) REFERENCES `characteristics` (`char_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dogs_dog_images`
--
ALTER TABLE `dogs_dog_images`
  ADD CONSTRAINT `dogs_dog_images_ibfk_1` FOREIGN KEY (`dog_id`) REFERENCES `dogs` (`dog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dogs_dog_images_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `dog_imgs` (`img_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dogs_needs`
--
ALTER TABLE `dogs_needs`
  ADD CONSTRAINT `dogs_needs_ibfk_1` FOREIGN KEY (`dog_id`) REFERENCES `dogs` (`dog_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dogs_needs_ibfk_2` FOREIGN KEY (`need_id`) REFERENCES `special_needs` (`need_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
