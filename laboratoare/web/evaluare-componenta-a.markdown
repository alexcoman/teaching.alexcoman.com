---
title: "Evaluare - Componenta A"
permalink: /laboratoare/web/evaluare-componenta-a/
group: "laboratoare.web"
layout: post
color: blue
icon: fas fa-bell
author: Alexandru Coman
date: 2018-03-07 00:00:00
---

În săptămâna a XI-a fiecare echipă înscrisă va prezenta arhitectura aplicației web aleasă. Pentru ca aceasta să poată fi evaluată, trebuie să îndeplinească toate cerințele prezentate în secțiunile de mai jos (de asemenea, trebuie să țineți cont de [evaluarea componentei P][componenta-p] și de [aspecte privind evaluarea][evaluare]).

<!--more-->

## Proiectarea arhitecturală

Poate unul dintre cei mai importanți pași în dezvoltarea unei aplicații este proiectarea arhitecturală. În cadrul acestui pas se alege maniera de implementare a proiectului, dar și tehnologiile ce avantajează dezvoltarea acestuia.

### Aspecte urmărite în evaluare

 - alegerea tehnologiilor potrivite pentru tipul de proiect ales;
 - folosirea paradigmelor de programare obiectuală şi/sau funcţională -- *acolo unde este cazul*;
 - folosirea unor tehnologii open source (acolo unde esta cazul, ca alternativă la a nu reinventa roata);
 - crearea unor noi servicii / tehnologii.

### Alte observații

- În cazul în care în istoricul depozitului de cod există modificări care încalcă specificațiile de mai sus, acestea trebuie revizuite
- Nu vor fi punctate acele părţi ale proiectului care nu sunt concepute de autor (de exemplu, design bazat pe template-uri, recurgerea la cod preluat din alte surse etc.).
- În cazul în care autorul își asumă realizarea unor părți care apoi se dovedesc a nu fi de concepție proprie, acesta va fi depunctat.


## Cerințe

- Prezentarea arhitecturii de ansamblu (e.g., via diagrame UML), plus etapele intermediare ale dezvoltării proiectului.
- Consideraţii preliminare privind structura (modelarea) datelor şi provenienţa lor – de exemplu, recurgerea la anumite servicii Web ori API-uri publice.

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

[componenta-p]: {{ site.baseurl }}/laboratoare/web/evaluare-componenta-p
[opensource]: http://opensource.org/licenses
[CC]: http://creativecommons.org/licenses/
[contributing-labs]: https://github.com/alexcoman/labs/blob/master/CONTRIBUTING.md
[licenta-labs]: https://github.com/alexcoman/labs/blob/master/LICENSE
[evaluare]: https://profs.info.uaic.ro/~busaco/teach/courses/web/web-exam.html
