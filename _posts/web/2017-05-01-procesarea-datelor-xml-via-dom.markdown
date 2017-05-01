---
layout: post
title:  "Procesarea datelor XML via DOM"
date:   2017-05-01 08:00:00
author: "Alexandru Coman"
categories: [laborator, web]
navigation: "resurse_web"
syntax-highlight: true
section-type: post
tags: web
---

### I. Consultarea resurselor (*30 minute*)

Acest laborator are la bază prezentarea [Marcarea datelor pentru <Web /> Șabloane de proiectare pentru XML][prezentare].

### II. Tuxy are nevoie de ajutor (*60 minute*)

Pentru că în decursul timpului Tuxy a reușit să implementeze marea majoritate a ideilor pe care le-a avut cu ajutorul vostru, acum, în Tuxy Cloud se regăsesc câteva sute de aplicații. Până acum Tuxy ținea evidența acestor proiecte într-un fișier CSV, dar și-a dat seama că este foarte greu de extins și menținut acest fișier.

În acest scop, vă roagă să modelați un fișier XML care să conțină informațiile despre proiectele existente.

Cerințe:

- modelați un document XML pentru structurarea datelor despre proiectele lui Tuxy
- minimal, acesta trebuie să conțină următoarele elemente: dezvoltatori, proiecte, servere, probleme cunoscute.
- documentul trebuie să conțină informații despre cel puțin 5 proiecte


### III. Utilitarul tuxy-infra (*60 minute*)

Pentru ca datele modelate în fișierul din exercițiul anterior să fie mai ușor de prezentat, echipa lui Tuxy vă roagă să dezvoltați o aplicație web care să permită afișarea informațiilor despre proiecte într-o manieră cât mai intuitivă și căutarea proiectelor după o serie de criterii pe care le considerați utile.

Cerințe:

- aplicația trebuie să verifice dacă fișierul XML este unul valid
- aplicația trebuie să ofere posibilitatea utilizatorului:
    - să exploreze toate informațiile disponibile despre proiecte
    - să caute proiectele ce au anumite particularități
- *suplimentar* aplicația poate oferi posibilitatea utilizatorului să modifice datele existente

Resurse utile:
- [Procesări XML prin SAX (arhivă .zip)][procesari-sax]
- [Procesări simplificate (arhivă. zip)][procesari]
- [Exemplu de procesare a unui flux de informații][feed]

### IV. Trimiterea soluțiilor (*5 minute*)

**Important**: fiecare stundent are obligația de a rezolva cel puțin unul dintre exercițiile propuse în cadrul laboratorului și să propună soluția prin deschiderea unui *Pull Request* (pentru acest lucru se pot urma pașii din tutorialul [git - propunerea unei soluții][tutorial-git]).

**Notă**: Refuzul de a rezolva exercițiile propuse pentru laborator atrage un bonus de **-0.2**, puncte ce se vor aplica la nota finală.

Restricții:

- fiecare soluție trebuie să fie dezvoltată pe un branch separat
- pentru fiecare exercițiu va fi deschis un Pull Request
- soluțiile trebuie să respecte structura sugerată în tutorialul mai sus menționat

[tutorial-git]: {{ site.baseurl }}/resurse/tutorial/git/2017/03/11/git-propunerea-unei-solutii/
[prezentare]: https://profs.info.uaic.ro/~busaco/teach/courses/web/presentations/web-SabloaneXML.pdf
[procesari-sax]: https://profs.info.uaic.ro/~busaco/teach/courses/web/demos/xml-sax/xml-sax.zip
[procesari]: https://profs.info.uaic.ro/~busaco/teach/courses/web/demos/xml-simple/xml-simple.zip
[feed]: https://gist.github.com/alexcoman/8f982c541124a1ef371b4dd4cb00dabf
