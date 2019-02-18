---
layout: post
title: "Sisteme pentru controlul versiunii"
date: 2018-10-01 08:00:00
author: "Alexandru Coman"
categories: [tutorial, git]
excerpt_separator: <!--more-->
highlight: true
---

**Ce este un sistem pentru controlul versiunii și de ce ar trebui să știm despre acestea?**

Un sistem pentru controlul versiuni este un sistem care înregistrează modificările suferite de un fișier sau un grup de fișiere în decursul timpului pentru a facilita revenirea la o versiune specifică ulterior.
<!--more-->

**Ce tipuri de sisteme pentru controlul versiunii există?**

Există trei categorii de sisteme pentru controlul versiunii: **locale**, **centralizate** și **distribuite**.

## Sisteme locale pentru controlul versiunii
O bună parte dintre dezvoltatori aleg ca metodă de control al versiuni copierea fișierelor într-un director separat de cel de lucru (eventual un director care să conțină informații despre versiune, sau data în care a fost făcută copia curentă). Această abordare este foarte răspândită pentru că este simplă și facilă dar din păcate este foarte predispusă la probleme (este foarte ușor de încurcat directorul în care ar trebui să facem copia, sau fișierele pe care dorim să le suprascriem).

{% include _utils/picture
    picture="https://git-scm.com/book/en/v2/images/local.png"
    title="Figura 1. Sisteme locale pentru controlul versiunii"
%}

Acum mult timp în urmă, pentru a rezolva această problemă, programatorii au dezvoltat sisteme locale pentru controlul versiunii (VCS -- Version Control Systems), ce salvau informații despre toate modificările suferite de fișierele monitorizate într-o bază de date simplă. 

## Sisteme centralizate pentru controlul versiunii 
Sistemele locale pentru controlul versiunii au oferit o soluție pentru gestiunea versiuniii pentru aplicații dezvoltate de o singură persoană pe un anume sistem. Din păcate această soluție nu vine în ajutorul persoanelor ce trebuie să colaboreze cu alți dezvoltatori și să interacționeze cu alte sisteme.
Pentru a rezolva și această problemă sistemele centralizate pentru controlul versiunii (CVCS -- Centralized Version Control Systems) au fost dezvoltate. 
Aceste sisteme (precum [CVS], [Subversion], [Perforce] etc) au un singur server care conține toate fișierele versionate și un număr de clienți care preiau fișierele de la acesta. 

{% include _utils/picture
    picture="https://git-scm.com/book/en/v2/images/centralized.png"
    title="Figura 1. Sisteme centralizate pentru controlul versiunii"
%}

Aceasta soluție oferă numeroase avantaje comparativ cu sistemele locale pentru controlul versiunii.  De exemplu, toată lumea știe până la un anumit nivel ce fac restul contribuitorilor în cadrul proiectului; administratorii au la dispoziție o manieră eficientă de a gestiona accesul la resurse și este mult mai ușor de gestionat o bază de date centrală decât una locală pentru fiecare client.

Pe lângă avantajele aduse acestea vin cu o serie notabilă de probleme. Cea mai evidentă problemă este legată de disponibilitatea nodului central, dacă acesta întâmpină orice fel de problemă o să împiedice orice acțiune din partea clienților până problema va fi rezolvată. Mai mult decât atât fiind singurul sistem care conține toate stările fișierelor din cadrul unui proiect, în cazul în care aceste date sunt prierdute (de exemplu din cauza unor probleme tehnice -- defactarea mediului de stocare) recuperarea acestora este de foarte multe ori imposibilă.

## Sisteme distribuite pentru controlul versiunii
Dezavantajele și riscurile ridicate de un sistem centralizat pentru controlul versiunii a codus la apariția sistemelor distribuite pentru controlul versiunii (Distributed Version Control Systems -- DVCS). În cadrul unui astfel de sistem (precum [Git], [Mercurial], [Bazaar], [Darcs] etc) clienții nu obțin doar ultima versiune a fișierelor din cadrul unui proiect, ci primesc o copie a proiectului, ce include tot istoricul acestuia. În acest fel în cazul în care unul dintre colaboratori pierde datele, sau serverul ce facilitează colaborarea între dezvoltatori pierde datele, oricare dintre ceilalți contribuitori poate restaura proiectul.

{% include _utils/picture
    picture="https://git-scm.com/book/en/v2/images/distributed.png"
    title="Figura 3. Sisteme distribuite pentru controlul versiunii"
%}

## Referințe
Acest articol se bazează pe capitolul [Getting Started - About Version Control][git-vcs] din cartea [*Pro Git*][git-book] scrisă de *[Scott Chacon]* și *[Ben Straub]*.

[CVS]: https://www.nongnu.org/cvs/
[Subversion]: https://subversion.apache.org/
[Perforce]: https://www.perforce.com/
[Mercurial]: https://www.mercurial-scm.org/
[Bazaar]: http://bazaar.canonical.com/en/
[Darcs]: http://darcs.net/
[Git]: https://git-scm.com/
[Scott Chacon]: https://github.com/schacon
[Ben Straub]: https://github.com/ben
[git-book]: https://git-scm.com/book/
[git-vcs]: https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control
