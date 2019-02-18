---
title: "Limbajul de marcare HTML"
permalink: /laboratoare/web/limbajul-de-marcare-html
group: "laboratoare.web"
layout: post
color: blue
icon: fab fa-html5
highlight: true
author: "Alexandru Coman"
date: 2019-02-18 12:00:00
---

## Pregătirea mediului de lucru

Pentru laboratorul curent o să aveți nevoie de următoarele resurse:
 - utilitarul [git][0] și un cont pe [GitHub]\(puteți opta pentru beneficiile pentru [studenți][1]\)
    - În cazul în care întâmpinați probleme puteți consulta următorul articol [git - noțiuni introductive][3]
 - un depozit de cod pentru laboratorul de Tehnologii Web
 - un [editor text][2] la alegere

## Consultarea resurselor

Această laborator are la bază prezentarea [HTML5 în XXX de minute](https://www.slideshare.net/busaco/html5-in-xxx-de-minute).

## Exerciții

### 1. Tablă de șah

Scrieți un document HTML care să modeleze o tablă de șah.
Cerințe:
- documentul HTML trebuie să fie valid ([validator.w3.org]);
- pe tabla de șah trebuie să fie prezente toate piesele de joc (în poziția inițială);

### 2. Jocuri celebre

Pornind de la documentul dezvoltat la punctul anterior modelați ultima mutare din cel puțin 2 jocuri celebre de șah. 

### 3. Propuneți structura de fișiere pentru blogul lui Tuxy

Tuxy își dorește foarte mult un blog prin intermediul căruia să poată împărtăși cu comunitatea resurse interesante despre tehnologie. Din păcate încă nu a avut contact cu tehnologiile web și are nevoie de ajutor.
Sarcina de-al ajuta pe Tuxy vă revine vouă. Va trebuie să pregătiți minim 5 fișiere HTML ce să-i servească lui Tuxy ca exemplu pentru blogul său.

Un exemplu de structură de fișiere pentru blogul lui Tuxy ar putea fi:

```
./index.html
./articole
    ./index.html
    ./bine-ați-venit.html
    ./tehnologii-web
        ./index.html
        ./prezentare-html.html
        ./prezentare-css.html
    ./rețele-de-calculatoare
        ./index.html
        ./modelul-osi.html
./contact.html
```

## Temă acasă

### Alegerea proiectului

1. Consultați lista de [proiecte propuse][7] și alegeți o serie de proiecte ce vi se par interesante;
2. Discutați cu colegii de grupă lista de proiecte aleasă și încercați să formați o echipă cu care să lucrați la unul dintre ele;

Mențiuni:
- Fiecare proiect va fi dezvoltat în echipă -- formată din 2-4 studenţi ce aparţin grupelor având acelaşi titular de laborator.
- O propunere de proiect poate fi aleasă de maxim 6 echipe -- [detalii][6]. Studenţii care nu-şi aleg la timp o temă de proiect vor avea asignat unul dintre proiectele nealese şi vor fi penalizaţi cu 2 puncte pentru fiecare componentă evaluată.


[GitHub]: https://github.com/
[validator.w3.org]: https://validator.w3.org/

[0]: https://git-scm.com/
[1]: https://education.github.com/pack
[2]: https://github.com/collections/text-editors
[3]: {{ site.baseurl }}/resurse/tutorial/git/notiuni-introductive/
[6]: https://profs.info.uaic.ro/~busaco/teach/courses/web/web-projects.html
[7]: {{ site.baseurl }}/laboratoare/web/proiecte
