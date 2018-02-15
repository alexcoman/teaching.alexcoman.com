---
layout: post
title: "git - noțiuni introductive"
date: 2017-02-26 20:00:00
author: ["Mircea Brățan", "Alexandru Coman"]
categories: [tutorial, git]
section-type: post
excerpt_separator: <!--more-->
color: blue
---

Pentru a veni în întâmpinarea celor care nu sunt familiarizați cu sistemul de versionare git am pregătit acest tutorial care vă va arăta pașii care trebuie urmați pentru a încărca proiectele voastre pe GitHub.

<!--more-->

## 0. Concepte de bază
Înainte de a începe tutorialul este util să răspundem la câteva întrebări și să definim câteva noțiuni.

### Ce este un sistem de versionare?
Un sistem de versionare este un mod de management al fișierelor care permite păstrarea istoricului tuturor modificărilor aduse fișierelor urmărite. O introducere a tipurilor de sisteme de versionare poate fi citită aici: [git-scm.com](http://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)
În continuare vom discuta despre sisteme de versionare din perspectiva folosirii lor în cadrul proiectelor software.

### Ce este github.com?
GitHub este un serviciu de hosting al proiectelor git (un proiect git este numit `repository`). Acesta permite păstrarea unei copii a proiectului online și vizualizarea tuturor fișierelor și a modificărilor aduse acestora.

### Care sunt avantajele folosirii unui sistem de versionare?
* este salvat istoricul tuturor modificărilor, astfel că se poate reveni oricând la o versiune mai veche dacă se descoperă introducerea unor defecte în ultima versiune
* prin folosirea unui serviciu de hosting, codul sursă are mereu o copie de siguranță online
* cea mai recentă versiune a codului sursă este mereu disponibilă tuturor dezvoltatorilor, făcând astfel colaborarea și sincronizarea mult mai ușoară decât în cazul trimiterii de fișiere conținând cod sursă dezvoltatorilor interesați de proiect.

### Dicționar de termeni
* `git` - sistem de versionare
* `repository` - un „proiect” git ce conține toate fișierele și istoricul modificărilor
* `commit` - un set de modicări/adăugări/ștergeri a unui sau a mai multor fișiere din cadrul repository-ului



## 1. Crearea contului GitHub
Primul pas este crearea unui cont [**GitHub**](https://github.com/), completând un username, adresa de email și o parolă. La următorul pas va trebui să selectați tipul de cont dorit. Implicit este selectat contul gratuit, care permite doar crearea de repository-uri publice. Apăsați „**Finish sign up**”.

Acesta este un moment bun pentru a valida adresa de email aleasă: tot ce trebuie să faceți este să accesați link-ul din interiorul email-ului primit de la GitHub.


## 2. Crearea unui repository
Pagina de start a GitHub va conține acum rubrica ***GitHub Bootcamp***, o colecție de resurse suplimentare despre utilizarea GitHub. Noi ne vom axa pe crearea unui repository. Pentru aceasta dați click pe **+ New Repository**

![GitHub homepage]({{ site.baseurl }}/assets/img/github-101/01-dashboard.png){:class="img-responsive"}

Următorul pas este alegerea unui nume pentru repository. În câmpul „*Description*” puteți adăuga o scurtă descriere a proiectului. Nu uitați să bifați „**Initialize this repository with a README**”. Opțional puteți alege, în partea de jos a paginii, adăugarea unui fișier .gitignore și/sau a unei licențe.

Fișierul `.gitignore` este folosit de git pentru a ignora fișierele pe care nu le doriți în repository, de exemplu: fișiere generate la compilare, fișiere private, etc. Mai multe detalii puteți găsi aici: [help.github.com](https://help.github.com/articles/ignoring-files/).

Licența folosită determină condițiile în care o altă persoană poate folosi proiectul vostru. Un ghid alegerea unei licențe poate fi găsit aici: [choosealicense.com](http://choosealicense.com/).

![Crearea unui nou repository]({{ site.baseurl }}/assets/img/github-101/02-new-repo.png){:class="img-responsive"}

După apăsarea butonului „**Create Repository**” veți ajunge pe pagina repository-ului nou creat.

![Repository-ul a fost creat]({{ site.baseurl }}/assets/img/github-101/03-repo-created.png){:class="img-responsive"}
