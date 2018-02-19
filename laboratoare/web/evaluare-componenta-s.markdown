---
title: "Evaluare - Componenta S"
permalink: /laboratoare/web/evaluare-componenta-s
group: "laboratoare.web"
layout: post
color: blue
icon: fas fa-bell
author: Alexandru Coman
date: 2018-02-15 00:00:00
---

În sesiune fiecare echipă înscrisă va prezenta implementarea **completă** a proiectului ales. Pentru ca proiectul ales să poată fi evaluat, acesta trebuie să îndeplinească cerințele prezentate în secțiunile de mai jos (de asemenea, trebuie să țineți cont de [evaluarea componentei P][componenta-p], [componentei A][componenta-a] și de [aspecte privind evaluarea][evaluare]).

<!--more-->

## Proiectarea arhitecturală

Poate unul dintre cei mai importanți pași în dezvoltarea unei aplicații este proiectarea arhitecturală. În cadrul acestui pas se alege maniera de implementare a proiectului, dar și tehnologiile ce avantajează dezvoltarea acestuia.
Aspecte ce pot fi punctate:

 - alegerea tehnologiilor potrivite pentru tipul de proiect ales;
 - folosirea paradigmelor de programare obiectuală şi/sau funcţională -- *acolo unde este cazul*;
 - folosirea unor tehnologii open source (acolo unde esta cazul, ca alternativă la a nu reinventa roata);
 - crearea unor noi servicii / tehnologii.

## Implementarea aplicației

### Eleganța implementării

Încurajăm studenții să proiecteze și să implementeze aplicația într-o manieră care să faciliteze posibilitatea extinderii cu ușurință a funcționalităților aplicației.

### Funcționalitate

Aplicația web trebuie să își atingă scopul și să fie cât mai ușor de folosit de către utilizatorii pentru care a fost creată.
În acest scop, putem puncta următoarele:

- aplicația să se adapteze la diverse rezoluții, în funcție de dispozitiv, platformă și parametrii acesteia, având grijă ca aplicația să nu necesite resetarea pentru a obține această funcționalitate -- *acolo unde este cazul*;
- aplicația să se adapteze la schimbarea orientării ecranului, având grijă ca datele să nu se piardă atunci când se realizează reorientarea -- *acolo unde este cazul*;
- cât de eficient și responsabil se utilizează resursele sistemului - CPU, RAM, spațiu pe disk, baterie etc. -- *acolo unde este cazul*;
- cât de bine sunt folosiți senzorii disponibili - accelerometru, giroscop, GPS -- *acolo unde este cazul*.
- cât de eficient și responsabil sunt folosite capabilitățile de networking - WIFI direct, Bluetooth, infraroșu etc. -- *doar acolo unde este cazul*;
- posibilitatea de a oferi un minim de funcționalitate în cazul pierderii conexiunii la internet -- *acolo unde este cazul*;
- eficiența comunicării prin canale externe - folosirea unui cache, folosirea unor cereri de tip batch etc. -- *acolo unde este cazul*.

### Tehnologiile folosite

În vederea evaluării acestui criteriu se va ține cont atât de necesitatea folosirii fiecărei tehnologii în realizarea proiectului, cât și de alegerea tehnologiilor potrivite pentru aplicația prezentată.

### Securitatea aplicației

În cadrul acestei secțiuni se vor urmări modalitățile abordate de autori pentru a evita executarea de scenarii nedorite în cadrul aplicației. Elemente ce pot fi punctate:

- validarea datelor de intrare și mecanisme de prevenție și protecție împotriva diverselor vulnerabilități (injecții, părăsirea sandbox-ului, escaladarea privilegiilor etc);
- tratarea erorilor și a excepțiilor;
- mecanisme de detecție și, eventual, blocare a atacurilor.

**Atenție** - Această secțiune va fi punctată direct proporțional cu complexitatea și necesitatea de securitate a aplicației.

### Testarea aplicației

Elemente ce pot fi punctate în această secțiune:
- modalitățile de testare funcțională a proiectului (unit testing, integration testing etc.);
- modalitățile de testare non-funcționale ale proiectului (scalabilitate, performanță, securitate, portabilitate pe platforme multiple etc);
- eventuale defecțiuni ale sistemelor de care proiectul depinde (internet, baza de date etc);
- modalități de automatizare a întregului proces de testare;
- folosirea unui sistem de bug tracking sau task tracking pentru realizarea proiectului ("issues" de pe [GitHub] sau [BitBucket]).

### Folosirea unui sistem de versionare

În cadrul acestei secțiuni vom puncta următoarele aspecte:

- existența de stări intermediare pentru proiectul dezvoltat;
- folosirea corespunzătoare a capacităților sistemului de versionare (branch, tags etc);
- mesaje relevante în istoria proiectului.

## Codul sursă

Maniera în care este structurat codul sursă este foarte importantă în dezvoltarea unei aplicații. Cu cât aplicația este scrisă într-o manieră mai organizată și elegantă, cu atât se va putea dezvolta pe viitor mai ușor. Elemente ce pot fi apreciate:

- structurarea și folosirea standardelor de programare în limbajele alese pentru implementare;
- prezența docstring-urilor și a comentariilor ce descriu funcționalitatea fragmentelor de cod;
- ușurința prin care se poate desfășura procedeul de mentenanță a codului și design pattern-urile folosite.

[componenta-a]: {{ site.baseurl }}/laboratoare/web/evaluare-componenta-a
[componenta-p]: {{ site.baseurl }}/laboratoare/web/evaluare-componenta-p
[evaluare]: https://profs.info.uaic.ro/~busaco/teach/courses/web/web-exam.html
[GitHub]: https://github.com/
[BitBucket]: https://bitbucket.org/
