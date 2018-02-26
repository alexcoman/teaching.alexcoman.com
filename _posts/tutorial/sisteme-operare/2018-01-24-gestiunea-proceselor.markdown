---
layout: post
title: "Gestiunea proceselor"
date: 2018-01-24 12:00:00
author: "Andrei Sahaidac"
categories: [tutorial, sisteme-operare]
excerpt_separator: <!--more-->
layout: post
highlight: true
---

Un proces îl putem defini ca un program in execuţie. Ele sunt unităţi prin care sistemul de operare alocă resurse utilizatorilor.
<!--more-->

## Componentele unui proces

- instrucţiunile programului
- date citite de pe disc sau din memorie, necesare acelui program (exemplu: fişiere de configurare)
- instrucţiuni care sunt apelate din afara programului de bază (exemplu: librarii externe)
- input de la utilizator

Putem vorbi despre două tipuri de procese:
- procese de foreground - sunt acele procese interactive, care pot fi iniţializate şi controlate de utilizatori printr-o sesiune pe sistem.
- procese de background - aici vorbim de procesele non-interactive/automate; la aceste procese nu ar trebui să ne aşteptăm că vor avea nevoie de input-ul utilizatorilor

## Daemons
Procesele de tip "daemons" sunt o categorie aparte de procese de background, care pornesc la începutul sistemului de operare si vor rula pe toata durata sesiunii (servicii). 

Procesele "daemon", in schimb, pot fi controlate (repornit, reîncărcat) de către utilizator prin intermediul programului de iniţializare.

Un proces este creat cand un alt proces deja existent va face o nouă instaţă a sa în memorie. Procesul copil va avea aceleaşi proprietăţi în mediul de funcţionare, dar va avea un identificator
 de proces (PID) diferit faţă de procesul părinte.

## PID & PPID
Deoarece vorbim despre sisteme de operare cu suport pentru mai mulţi utilizatori, a fost nevoie să putem diferenţia între instanţe diferite ale aceluiaşi program, pornite de utilizatori diferiţi. 
Astfel am ajuns la PID (identificatorul de proces) si PPID (identificatorul părintelui procesului).
Vom discuta în continuare despre proces părinte şi proces copil.

Primul proces părinte care este pornit este "Init". Este primul program care se execută în secventa de iniţializare a sistemului de operare. Acesta va administra restul proceselor şi este pornit de către kernel. 
Procesul "Init" va avea PID-ul 1 şi va functiona ca si "părinte adoptiv" pentru procesele copil care rămân fără un proces părinte.

## Starile unui proces

Un proces poate avea mai multe stări, care descriu etapa de rulare:
- Running - aici vorbim despre etapa în care procesul fie este rulat, fie aşteaptă sa fie rulat de către sistem
- Waiting - in această stare, un proces aşteaptă un anumit eveniment pentru a îşi continua activitatea
- Stopped - în această stare, un proces a fost oprit, după ce a primit un semnal de oprire
- Zombie - în acest caz, procesul este oprit complet, dar a rămas în evidenţa tabelului de procesare

Putem controla procesele prin intermediul unor utilitare de sistem - [kill], [pkill], [pgrep] sau [killall]
Linux are mai multe tipuri de semnale pentru terminarea proceselor:
- SIGTERM (15), varianta implicită dacă nu specificăm altceva; este o variantă sigură din punct de vedere al salvării informațiilor;
- SIGHUP (1), varianta care va reîncărca fișierele de configurare specifice și va redeschide fișiere log;
- SIGKILL (9), varianta pentru închiderea imediată, fără salvarea datelor.

## Comenzi utile
Pentru a vizualiza procesele active de pe sistem, putem folosi comenzi precum **[ps]** sau **[top]**

1. **[ps]** -- va afişa informatii despre procesele active de pe un sistem, la momentul executării comenzii.

2. **[top]** -- este un program care va afişa dinamic informaţii referitor la procesele care rulează pe sistem, împreună cu informaţii precum consumul de resurse (procesor, memorie, etc) al fiecărui proces.

## Resurse

* [Procese si Fire de execuţie Linux](http://control.aut.utcluj.ro/iatr/lab1/procese.htm)
* [Sisteme de operare - Procese](http://www.islavici.ro/cursuriold/Sisteme%20de%20operare%20-%20laborator/Cap6-Procese.pdf)
* [Universitatea tehnică din Cluj - Procese în Linux](http://www.ubm.ro/~adip/Sisteme%20de%20operare/Laborator%203%20Procese.pdf)
* [Open CourseWare - Procese](https://ocw.cs.pub.ro/courses/so/laboratoare/laborator-03)

[kill]: https://linux.die.net/man/1/kill
[killall]: https://linux.die.net/man/1/killall
[pgrep]: https://linux.die.net/man/1/pgrep
[pkill]: https://linux.die.net/man/1/pkill
[pg]: https://linux.die.net/man/1/ps
[ps]: https://linux.die.net/man/1/ps
[top]: https://linux.die.net/man/1/top
