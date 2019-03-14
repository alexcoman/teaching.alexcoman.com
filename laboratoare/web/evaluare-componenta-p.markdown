---
title: "Evaluare - Componenta P"
permalink: /laboratoare/web/evaluare-componenta-p
group: "laboratoare.web"
layout: post
color: blue
icon: fas fa-bell
author: Alexandru Coman
date: 2019-02-18 12:00:00
---

În săptămâna a V-a fiecare echipă înscrisă va prezenta interfața web a proiectului ales. Pentru ca proiectul ales să poată fi evaluat, acesta trebuie să îndeplinească toate cerințele prezentate în secțiunile de mai jos (de asemenea, trebuie să țineți cont și de [aspecte privind evaluarea][evaluare]).

<!--more-->

## Cerințe

- Proiectarea şi implementarea interfeţei Web *responsive* folosind **HTML5** şi **CSS3**.
    - Vor fi oferite motivaţii asupra alegerii unei anumite idei de design.
    - Toate fișierele trebuie să fie valide (pentru a verifica fișierele redactate puteți folosi [w3/markup-validator] și respectiv [w3/css-validator]).
- Se va utiliza obligatoriu un sistem de stocare şi management online al codului-sursă -- e.g., utilizarea de soluţii populare precum [Bitbucket] ori [GitHub] etc.

### Licența folosită
- Sursele proiectelor vor trebui să conţină exclusiv cod aflat sub incidenţa unei [licenţe libere][opensource].
- Conţinutul pus la dispoziţie va respecta termenii stipulaţi de [Creative Commons][CC].
- Depozitul de cod trebuie să conțină un fișier **LICENSE** care să conțină informații despre licența aleasă (de exemplu [@alexcoman/labs/LICENSE][licenta-labs])

### Codul-sursă
- Codul-sursă trebuie să fie comentat şi modularizat
- Codul-sursă trebuie să fi redactat urmând un singur standard de scriere

### Depozitul de cod
- Depozitul de cod trebuie să fie disponibil public începând cu săptămâna a IV-a.
- Depozitul de cod trebuie să conțină toate versiunile / stările intermediare ale proiectului.
- Fiecare membru al echipei trebuie să adauge propriile contribuții.
- Fiecare *commit* trebuie să fie atomic (să conțină o suită de modificări independente -- de exemplu rezolvarea unui bug, adăugarea unei funcționalități specifice, îmbunătățirea unei funcționalități existente, adăugarea unui modul nou etc)
- Descrierea *commit*-ului trebuie să respecte același model în tot istoricul depozitului de cod. Recomandarea este ca fiecare mesaj de *commit* să respecte următorul șablon
    - Titlu: primul rând din mesajul de commit ce va prezenta cât mai succint posibil modificarea adăugată
    - Descriere: un bloc de text care va descrie în amănunt modicarea adăugată și motivația pentru această modificare
    - Un exemplu de mesaj ar putea fi:
        ```
        Adaugă structura inițială pentru procesatori

        În cadrul proiectului o să fie nevoie de o suită de procesatori pentru
        diverse acțiuni (de exemplu, pentru obținerea informațiilor de la diverse
        servicii web externe, pentru prelucrarea datelor regăsite etc).

        Acest patch adaugă clasele contract pentru fiecare tip de procesator,
        specificațiile pentru aceștia și documentația pentru maniera în care
        aceștia trebuiesc folosiți.
        ```

- Depozitul de cod trebuie să conțină un fișier **README** care să conțină descrierea proiectului și problema pe care încearcă să o rezolve.
- Depozitul de cod trebuie să conțină un fișier **CONTRIBUTING** care să specifice modul în care membrii echipei propun modificări (un exemplu poate fi găsit la următoarea adresă [@alexcoman/labs/CONTRIBUTING.md][contributing-labs].

## Alte observații

- În cazul în care în istoricul depozitului de cod există commit-uri sau modificări care încalcă specificațiile de mai sus, acestea trebuie revizuite
- Nu vor fi punctate acele părţi ale proiectului care nu sunt concepute de autor (de exemplu, design bazat pe template-uri, recurgerea la cod preluat din alte surse etc.).
- În cazul în care autorul își asumă realizarea unor părți care apoi se dovedesc a nu fi de concepție proprie, acesta va fi depunctat.

[w3/markup-validator]: https://jigsaw.w3.org/css-validator/
[w3/css-validator]: https://jigsaw.w3.org/css-validator/
[issue]: https://github.com/alexcoman/teaching.alexcoman.com/issues
[opensource]: http://opensource.org/licenses
[CC]: http://creativecommons.org/licenses/
[Bitbucket]: https://bitbucket.org/
[GitHub]: https://github.com/
[contributing-labs]: https://github.com/alexcoman/labs/blob/master/CONTRIBUTING.md
[licenta-labs]: https://github.com/alexcoman/labs/blob/master/LICENSE
[evaluare]: https://profs.info.uaic.ro/~busaco/teach/courses/web/web-exam.html
