---
layout: post
title: "git - propunerea unei soluții"
date: 2017-03-11 08:00:00
author: "Alexandru Coman"
categories: [tutorial, git]
section-type: post
---

În cadrul acestui tutorial vom discuta despre pașii pe care trebuie să îi urmați pentru a putea să trimiteți spre evaluare soluțiile la problemele propuse în cadrul laboratoarelor.
Toate soluțiile propuse vor fi incluse în depozitul de cod [alexcoman/labs][0].

<!--more-->

## I. Structura depozitului de cod

Pentru fiecare dintre laboratoarele propuse, structura directoarelor respectă următoarea schemă:

```bash
denumire_laborator
├── date_iesire
│   └── nume_exercițiu
│       └── date_intrare
├── date_intrare
│   └── nume_exercițiu
│       └── date_intrare
├── exemple
│   └── README.md
├── exercitii
│   └── nume_exercițiu
│       └── README.md
├── prezentare
│   └── README.md
├── README.md
└── solutii
    └── prenume_nume
        └── nume_exercițiu
            ├── soluția_propusă
            └── README.md

```

De exemplu pentru problema [blog][1] propusă în cadrul [laboratorului I][2] destinat limbajului de marcare HTML o posibilă structură pentru soluție propusă ar putea fi următoarea:

```bash
web
├── exemple
├── exercitii
└── solutii
    ├── README.md
    └── tuxy_pinguinescu
        ├── blog
        │   ├── articole
        │   │   ├── bine-ati-venit.html
        │   │   ├── index.html
        │   │   ├── retele-de-calculatoare
        │   │   │   ├── index.html
        │   │   │   └── modelul-osi.html
        │   │   └── tehnologii-web
        │   │       ├── index.html
        │   │       ├── prezentare-css.html
        │   │       └── prezentare-html.html
        │   ├── contact.html
        │   ├── despre.html
        │   └── index.html
        └── README.md
```

După cum se poate observa, studentul *Tuxy Pinguinescu* a adăugat în directorul *soluții* din cadrul laboratorului destinat *tehnologiilor web* un director cu numele său în care a adăugat soluția pentru exercițiul intitulat *blog*.

## II. Resurse necesare

### II.1. Un cont de utilizator pe GitHub

Pentru a putea propune soluțiile pe care le elaborați veți avea nevoie de un cont de utilizator pe [github.com][6].
Mai multe detalii despre acest pas putem găsi în tutorialul introductiv despre git în secțiunea [1. Crearea contului GitHub.][7]

### II.2. Utilitarul git

În cazul în care nu aveți instalat în cadrul sistemului vostru acest utilitar puteți să urmați pașii din tutorialul intoductiv despre git din secțiunea [3. Instalarea și configurarea GitHub for Windows][3].

Pentru aceia dintre voi care preferă interacțiunea cu *git* din linia de comandă puteți descărca utilitarul de pe situl [git-scm][4] sau îl puteți instala folosind managerul de pachete din sistemul de operare folosit.

```bash
~ $ sudo apt-get install git-all  # Debian
~ $ sudo yum install git-all      # Fedora
~ $ choco install git             # Windows
```
Mai multe detalii și exemple pot fi găsite [aici][5].

### II.3. Un *fork* al depozitului de cod *labs*

Depozitul de cod ce conține materialele folosite în cadrul laboratoarelor de *Tehnologii web* poate fi găsit la următoarea adresă [github.com/alexcoman/labs][0].
Pentru că utilizatorul creat de voi nu are drepturi de scriere în cadrul acestui depozit de cod veți avea nevoie de un *fork* al depozitului de cod mai sus menționat.
Pentru acest lucru va trebui să accesați cu ajutorul unui browser web [pagina depozitului de cod][0] și să apăsați pe butonul **Fork** situat în partea dreapta sus a paginii.

{: .center}
![Fork al depozitului de cod alexcoman/labs]({{ site.baseurl }}/assets/img/git-propunerea-unei-solutii/01-fork.png)

## III. Elaborarea soluției

În acest moment aveți la dispoziție toate resursele necesare pentru a putea trece la elaborarea soluției pentru problemele propuse în cadrul laboratorului.

Mai jos puteți găsi o secvență posibilă de pași pe care *Tuxy Pinguinescu* (cu numele de utilizator *tuxy_pinguinescu* pe GitHub) ar putea să îi urmeze pentru a propune o soluție.

1. Va alege un director de lucru cât mai ușor de regăsit pentru următoarele laboratoare.

    ```bash
    ~ $ cd ~/work/facultate/anul-2/semestrul-2/tweb
    ```

2.  Va face o copie locală a depozitului de cod

    ```bash
    ~ $ git clone https://github.com/tuxy_pinguinescu/labs
    ```

3. Va actualiza directorul de lucru
    ```bash
    cd labs
    ```

4. Se va asigura că *fork*-ul său conține ultima versiune a codului
    ```bash
    ~ $ # Adăugăm o referință către depozitul de cod sursă
    ~ $ git remote add upstream https://github.com/alexcoman/labs

    ~ $ # Ne poziționăm pe branch-ul `master`
    ~ $ git checkout master

    ~ $ # Obținem ultimile modificări din cadrul depozitului de cod sursă
    ~ $ # upstream - numele remote-ului pe care l-am adăugat
    ~ $ # master - branch-ul care ne interesează
    ~ $ git pull upstream master

    ~ $ # Actualizăm informațiile din cadrul fork-ului nostru
    ~ $ git push origin master
    ```

5. Va adăuga un *branch* nou special pentru acest laborator
    ```bash
    git checkout -b tweb/laborator-html
    ```

6.  Se va asigura că structura de directoare pentru soluțiile sale există
    ```bash
    mkdir -p web/solutii/tuxy_pinguinescu
    ```

7. Toate fișierele cu rezolvările vor fi plasate în directoarele corespunzătoare

## IV. Propunerea soluției

După redactarea fișierelor ce reprezintă soluția pentru unul dintre exercițiile propuse în cadrul unui laborator va trebui să încapsulați acele modificări în cadrul unui *commit*.

Pentru început trebuie să selectați și să adăugați toate modificările care vă interesează.

```bash
~ $ git status     # pentru a vedea starea curentă a depozitului de cod
~ $ git add fișier # pentru fiecare fișier pe care dorim să îl adăugăm
~ $ git status     # pentru a verifica că toate resursele pe care le dorim sunt prezente
```

Un exemplu de rezultat al comenzilor de mai sus ar putea fi:

```bash
On branch tweb/laborator-html
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   solutii/tuxy_pinguinescu/README.md
    new file:   solutii/tuxy_pinguinescu/blog/articole/bine-ati-venit.html
    new file:   solutii/tuxy_pinguinescu/blog/articole/index.html
    new file:   solutii/tuxy_pinguinescu/blog/articole/retele-de-calculatoare/index.html
    new file:   solutii/tuxy_pinguinescu/blog/articole/retele-de-calculatoare/modelul-osi.html
    new file:   solutii/tuxy_pinguinescu/blog/articole/tehnologii-web/index.html
    new file:   solutii/tuxy_pinguinescu/blog/articole/tehnologii-web/prezentare-css.html
    new file:   solutii/tuxy_pinguinescu/blog/articole/tehnologii-web/prezentare-html.html
    new file:   solutii/tuxy_pinguinescu/blog/contact.html
    new file:   solutii/tuxy_pinguinescu/blog/despre.html
    new file:   solutii/tuxy_pinguinescu/blog/index.html
```

După ce am adăugat toate modificările pe care le dorim putem să le încapsulăm într-un commit folosind următoarea comandă:

```
~ $ git commit -m "Mesajul pe care dorim să îl atașăm acestor modificări"
```

Pentru a urca aceste modificări în cadrul depozitului de cod de pe Github puteți folosi comanda `git push`.

```bash
# origin - este referința către fork-ul nostru
# tweb/laborator-html - este numele branch-ului în cadrul căruia am redactat soluția
~ $ git push origin tweb/laborator-html
```

După ce ați trimis modificările propuse către fork-ul vostru, va trebui să deschideți un *Pull request* către [depozitul de cod sursă][0].

Pentru a face acest lucru va trebui să accesați pagina destinată branch-urilor din cadrul depozitului vostru de cod.
Pentru Tuxy Pinguinescu această pagini este `https://github.com/tuxy_pinguinescu/labs/branches`.

În cadrul acestei pagini vor fi afișate toate *branch*-urile existente în cadrul depozitului vostru de cod cu o serie de acțiuni pentru fiecare dintre ele. În cazul nostru acțiunea care ne interesează este **New pull request**.

{: .center}
![New pull request]({{ site.baseurl }}/assets/img/git-propunerea-unei-solutii/02-new-pull-request.png)


[0]: https://github.com/alexcoman/labs
[1]: https://github.com/alexcoman/labs/tree/master/web/exercitii/blog
[2]: https://www.w3.org/html/
[3]: {{ site.baseurl }}/resurse/tutorial/git/notiuni-introductive/#3-instalarea-și-configurarea-github-for-windows
[4]: https://git-scm.com/downloads
[5]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[6]: https://github.com/
[7]: {{ site.baseurl }}/resurse/tutorial/git/notiuni-introductive/#1-crearea-contului-github
