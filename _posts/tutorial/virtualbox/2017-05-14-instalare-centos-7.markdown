---
layout: post
title: "Instalarea sistemului de operare CentOS 7"
date: 2017-05-14 12:00:00
author: "Alexandru Coman"
categories: [tutorial, virtualbox]
section-type: post
excerpt_separator: <!--more-->
---

Acest tutorial vine în ajutorul studenților ce doresc să își pregătească o mașină virtuală care va rula sistemul de operare CentOS 7.

<!--more-->

## Resurse necesare

Pentru pregătirea mediului de execuție o să folosim utilitarul  hypervisorul [VirtualBox] și o [imagine ISO][centos-iso] cu sistemul de operare pe care o putem descărca de [aici][centos-iso].

[VirtualBox] este o aplicație ce ne permite să virtualizăm o mașină fizică (un computer). Cu ajutorul său, putem să creăm o mașină virtuală după specificațiile oferite de noi, ce va conține un sistem de operare izolat de sistemul de operare al mașinii gazdă. Mai multe detalii pot fi găsite în tutorialul [VirtualBox - noțiuni introductive][virtualbox-101].

## Specificații pentru mașina virtuală

Pentru pregătirea mașinii virtuale puteți urma pașii prezentați în cadrul tutorialului [VirtualBox - Noțiuni introductive][virtualbox-101] menționat mai sus.

- Setări privitoare la procesoare:
	- Numărul de procesoare: 2 (*Recomandat*)
	- Numărul de nuclee pentru fiecare procesor: 1
- Setări privitoare la memorie: 1GB RAM (*Recomandat*)
- Setări privitoare la spațiu de stocare: HDD - SATA - Minim 20 GB (Este recomandat ca spațiul să fie *prealocat*)
- Setări privitoare la rețea:
	- Adaptorul de rețea 1:  **NAT**
	- Adaptorul de rețea 2:  **Host Only** (pentru a facilita accesul la mașina virtuală)


## Instalarea sistemului de operare

### Pasul I. Începem instalarea sistemului de operare

După ce o să pornim mașina virtuală, utilitarul pentru instalarea sistemului de operare va fi pornit de pe *ISO*-ul montat folosind suportul pentru DVD.
{: .center}
![Începem instalarea sistemului de operare]({{ site.baseurl }}/assets/img/instalare-centos-7/0-install-centos-7.png)

### Pasul II. Setări privitoare la localizare

În cadrul acestui pas trebuie să selectăm limba în care dorim să parcurgem pașii de instalare. Pentru acest tutorial am optat pentru limba *română*. 
{: .center}

![Setări privitoare la localizare]({{ site.baseurl }}/assets/img/instalare-centos-7/1-setari-referitoare-la-localizare.png)

### Pasul III. Instalarea sistemului de operare

După ce am ales limba în care dorim să ne fie prezentate informațiile, ne este oferită posibilitatea de a personaliza o parte dinte aspectele legate de modul în care sistemul de operare va fi instalat.
Pentru acest tutorial vom opta spre instalarea minimală a sistemului de operare, fără interfață grafică.

{: .center}
![Începe instalarea sistemului de operare]({{ site.baseurl }}/assets/img/instalare-centos-7/3-incepem-instalarea.png)

În cazul în care nu dorim să personalizăm nici un alt aspect din cele disponibile, singurul lucru pe care trebuie să-l mai facem înainte de a trece la pasul următor, este să alegem modul în care va fi structurat sistemul de fișiere.

Pentru ușurință sau din lipsa unor altor specificații, putem opta să lăsăm utilitarul să partiționeze spațiul disponibil pentru noi.

{: .center}
![Setări privitoare la disk-uri]({{ site.baseurl }}/assets/img/instalare-centos-7/2-setari-privitoare-la-disk-uri.png)

### Pasul IV. Gestiunea utilizatorilor

În acest pas, utilitarul a terminat de instalat sistemul de operare și ne dă posibiltiatea să gestionăm utilizatorii.
{: .center}
![Se instalează pachetele necesare]({{ site.baseurl }}/assets/img/instalare-centos-7/6-instalarea-sistemului-de-operare.png)

O să adăugăm o parolă ușor de reținut (*nu este recomandat acest lucru pe o mașină accesibilă în afara mediului nostru local, din motive de securitate*). În cazul în care parola nu este suficient de complexă, ca în exemplul de mai jos, o să primim un mesaj de avertizare și va trebui să apăsăm de două ori pe butonul **Done** pentru a trece la pasul următor.

{: .center}
![Setăm parola pentru utilizatorul root]({{ site.baseurl }}/assets/img/instalare-centos-7/5-setam-parola-pentru-root.png)

După ce am adăugat parola pentru utilizatorul **root** (care este un cont cu privilegii depline asupra sistemului) o să adăugăm un utilizator nou.

{: .center}
![Adăugam un utilizator nou]({{ site.baseurl }}/assets/img/instalare-centos-7/4-adaugam-un-utilizator-nou.png)

### Pasul V. Finalizarea instalării

O dată cu acest pas, instalarea sistemului de operare a luat sfârșit.
Pentru a putea folosi sistemul nou instalat va trebui să repornim mașina virtuală.

{: .center}
![Repornim mașina virtuală]({{ site.baseurl }}/assets/img/instalare-centos-7/7-repornim-sistemul.png)

## Interacțiunea cu CentOS 7

După ce mașina virtuală va reporni, putem să ne autentificăm în cadrul sistemului de operare.

{: .center}
![Ne autentificăm]({{ site.baseurl }}/assets/img/instalare-centos-7/8-autentificare.png)


Pentru acest lucru putem folosi utilizatorul adăugat în cadrul [pasului IV][pasul-4] (în cazul nostru *Tuxy Pinguinescu* cu numele de utilizator *tuxy*).

{: .center}
![Am terminat]({{ site.baseurl }}/assets/img/instalare-centos-7/9-am-terminat.png)

[VirtualBox]: https://www.virtualbox.org/
[virtualbox-101]: {{ site.baseurl }}/resurse/tutorial/vagrant/notiuni-introductive/
[centos-iso]: https://www.centos.org/download/
[pasul-4]: #pasul-iv-gestiunea-utilizatorilor
