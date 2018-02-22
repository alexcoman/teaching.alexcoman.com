---
layout: post
title: "Instalarea sistemului de operare CentOS 7"
date: 2017-05-14 12:00:00
author: ["Alexandru Coman", "Gabriel Paiu"]
categories: [tutorial, virtualbox]
section-type: post
excerpt_separator: <!--more-->
highlight: true
---

Acest tutorial vine în ajutorul studenților ce doresc să își pregătească o mașină virtuală care va rula sistemul de operare CentOS 7.

<!--more-->

## Resurse necesare

Pentru pregătirea mediului de execuție o să folosim utilitarul  hypervisorul [VirtualBox] și o [imagine ISO][centos-iso] cu sistemul de operare pe care o putem descărca de [aici][centos-iso].

[VirtualBox] este o aplicație ce ne permite să virtualizăm o mașină fizică (un computer). Cu ajutorul său, putem să creăm o mașină virtuală după specificațiile oferite de noi, ce va conține un sistem de operare izolat de sistemul de operare al mașinii gazdă. Mai multe detalii pot fi găsite în tutorialul [VirtualBox - noțiuni introductive][virtualbox-101].

## Instalarea VritualBox

Peste procedura de instalare a VirtualBox nu vom trece in amănunt. deoarece este suficient sa urmați pașii de instalare cu setările implicite, nefiind nevoie de configurări adiționale. Pentru fiecare sistem de operare este disponibil un utilitar care vă va ghida in procesul de instalare

## Specificațiile mașinii virtuale

Setări privitoare la prcesoare: 1 CPU cu 1 nucleu
Setări privitoare la memorie: 1GB RAM
Setări privitoare la spațiul de stocare: 15GB prealocați
Setări privitoare la rețea:
- Adaptor de rețea 1: NAT (asigura comunicarea cu exteriorul)
- Adaptor de rețea 2: Host Only (faciliteaza comunicarea cu sistemul de operare gazdă)

## Instalarea sistemului de operare

### Crearea mașinii si setarea resurselor

Pentru început, vom deschide aplicația VirtualBox si vom crea o mașina nouă. Putem opta fie pentru ”Guided Mode” sau ”Expert Mode”, ambele fiind potrivie pentru ceea ce avem de realizat. În cadrul acestui tutorial, am ales ”Expert Mode”.

Vom completa câmpul cu numele mașinii pe care o vom crea, după care din dropdown vom selecta Linux si RedHat, deoarece CentOS este o distribuție de RedHat. Vom aloca apoi 1024MB de RAM si vom alege să creem si un hard disk odată cu mașina virtuală

{% include _utils/picture 
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-02.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-02.png"
    title="Informații generale referitoare la mașina virtuală."
%}


La pasul urmator vom fi prezentați cu opțiuni referitoare la unde va fi alocat efectiv spațiul pe discul mașinii gazdă. Puteți selecta locația in funcție de preferința organizatorie, având grijă sa alocăm spațiul menționat in specificațiile precedente.

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-03.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-03.png"
%}

După acest pas, ar trebui să aveți deja alocate resurse, iar mașina virtuală este creată.

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-04.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-04.png"
%}

Înainte de a porni procesul de instalare al sistemului de operare, vom aloca si adaptorii de rețea. Asadar in opțiunile mașinii virtuale, la secțiunea Network, veți găsi posibilitatea de a adăuga și de a asigna adaptorii conform specificațiilor.

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-05.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-05.png"
%}
{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-06.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-06.png"
%}

Deasemenea, la rubrica Storage, va trebui să montăm imaginea de CentOS descărcata în prealabil, ca mașina virtuală să poată accesa secvența de pornire a acesteia. In consecință, vom adăuga un disc optic ce ne va permite sa incărcăm imaginea desărcată.

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-07.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-07.png"
%}
{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-08.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-08.png"
%}

Dupa acest pas, suntem pregătiți pentru a trece mai departe la instalarea efectiva a sistemului de operare.

### Instalarea sistemului de operare

Dupa ce am pornit mașina virtuală vom fi prezentați cu 3 opțiuni dintre care vom alege sa instalăm CentOS 7. La pasul următor, veți avea posibilitatea sa alegeți limba in care vă va fi oferit ghidul de instalare.

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-09.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-09.png"
%}
{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-10.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-10.png"
%}

Setările privitoare la schema de partiționare o vom alege noi, pentru a putea folosi volume logice ce ne vor fi necesare în laboratoarele ulterioare.

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-11.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-11.png"
%}
{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-12.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-12.png"
%}

Schema de partiționare:
- /boot - 200MB - Standard Partition
- / - 10GB - Logical Partition
- swap - 1GB - swap

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-13.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-13.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-14.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-14.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-15.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-15.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-16.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-16.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-17.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-17.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-18.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-18.png"
%}

Ulterior, vom activa adaptorii de rețea, și vom seta hostname-ul mașinii virtuale, dupa care putem porni procedura de instalare.

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-19.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-19.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-20.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-20.png"
%}

În timpul acesteia, vom putea seta si parola pentru utilizatorul ”root” (cu drepturile depline pe sistem) dar si pentru un utilizator ”normal”, pentru care veți putea introduce si informații descriptive.

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-21.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-21.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-22.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-22.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-23.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-23.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-24.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-24.png"
%}

Odată ce instalarea se va finaliza, veți putea reporni mașina virtuală. Rezultatul final va fi o consolă în care veți putea introduce datele de autentificare pentru sistem, cele pe care le-ați configurat la pașii precedenți.

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-25.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-25.png"
%}

{% include _utils/picture
    picture="/assets/images/tutorial/virtualbox/instalare-centos-7/vm-install-26.png"
    thumbnail="/assets/images/tutorial/virtualbox/instalare-centos-7/small/vm-install-26.png"
%}

[VirtualBox]: https://www.virtualbox.org/
[virtualbox-101]: {{ site.baseurl }}/resurse/tutorial/vagrant/notiuni-introductive/
[centos-iso]: https://www.centos.org/download/
[pasul-4]: #pasul-iv-gestiunea-utilizatorilor
