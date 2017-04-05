---
layout: post
title:  "Programare Web"
date:   2017-04-04 12:00:00
author: "Alexandru Coman"
categories: [laborator, web]
tags: web
section-type: post
navigation: "resurse_web"
---

### I. Consultarea resurselor (*20 minute*)

Pentru pregătirea mediului de execuție vă recomand să consultați următoarele tutoriale:

 - [VirtualBox - noțiuni introductive][0]
 - [Vagrant - noțiuni introductive][1]
 - [Vagrant - Server web (PHP5 & MySQL)][2]

### II. Tuxy are nevoie de ajutor (*45 minute*)

Nici unul dintre membrii echipei lui Tuxy nu știe să folosească o bază de date așa că Tuxy este nevoit să apeleze din nou la ajutorul vostru.

Tuxy are nevoie de o aplicație care să îi permită să își gestioneze notițele:
- să adauge o notiță nouă (care să conțină minimal un titlu și un termen limită)
- să poată să vizualizeze toate notițele adăugate de el (sortate după termenul limită)
- să poată să șteargă / editeze o notiță existentă

Echipa a primit următorul fragment de cod ca exemplu, dar nu a știut ce să facă cu el:

```php
<?php
//Obținem o conexiune către baza de date
$conexiune = new mysqli($host_name, $user_name, $pass_word, $database_name, $port);

//Informații referitoare la baza de date
$rezultat = $conexiune->query("SHOW TABLES");
if($rezultat && $rezultat->num_rows > 0){
    echo '<ul>Table existente în baza de date:';
    while($rand = $rezultat->fetch_row()){
        foreach($rand as $cheie){
            echo "<li>{$cheie}</li>";
        }
    }
    echo '</ul>';
    $rezultat->free();
}

//Informații referitoare la structura unui table
$rezultat = $conexiune->query("SELECT COLUMN_NAME, COLUMN_TYPE ".
                              "FROM information_schema.COLUMNS ".
                              "WHERE TABLE_NAME = 'notite'");
if($rezultat && $rezultat->num_rows > 0){
    echo '<ul>Câmpurile din tabelul notițe:';
    while($rand = $rezultat->fetch_object()){
        echo "<li>{$rand->COLUMN_NAME} - {$rand->COLUMN_TYPE}</li>";
    }
    echo '</ul>';
    $rezultat->free();
}

//Informații din tabela notițe
$rezultat = $conexiune->query("SELECT titlu, termen_limita
                               FROM notite
                               LIMIT 10");

if($rezultat && $rezultat->num_rows > 0){
    while ($notita = $rezultat->fetch_assoc()){
       echo "{$notita['titlu']} trebuie rezolvata pana {$notita['termen_limita']}.<br>";;
    }
    $rezultat->free();
}

//Inchidem conexiunea
$conexiune->close();

?>
```

### III. Trimiterea soluțiilor (*5 minute*)

Pentru acest lucru puteți urma pașii din tutorialul [git - propunerea unei soluții][3].

Restricții:

- fiecare soluție trebuie să fie dezvoltată pe un branch separat ( de exemplu: *solutie/tuxy-notes*)
- pentru fiecare exercițiu va fi deschis un Pull Request (exemplu de titlu: *Soluția lui Tuxy Pinguinescu pentru exercițiul tuxy-notes*)
- soluțiile trebuie să respecte structura sugerată în tutorialul mai sus menționat

## IV. Discuții despre proiecte (*30 minute*)

Lista finală de proiecte propuse poate fi găsit [aici][4].

[0]: {{ site.baseurl }}/resurse/tutorial/virtualbox/2017/04/01/virtualbox-notiuni-introductive/
[1]: {{ site.baseurl }}/resurse/tutorial/vagrant/2017/03/19/vagrant-notiuni-introductive/
[2]: {{ site.baseurl }}/resurse/tutorial/vagrant/2017/04/04/vagrant-server-web-php5-mysql/
[3]: {{ site.baseurl }}/resurse/tutorial/git/2017/03/11/git-propunerea-unei-solutii/
[4]: https://goo.gl/nMPrNj
