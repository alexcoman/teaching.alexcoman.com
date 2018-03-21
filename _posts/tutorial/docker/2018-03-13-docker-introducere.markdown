---
layout: post
title: "Docker - Introducere"
date: 2017-03-13 08:00:00
author: "Gabriel Paiu"
categories: [tutorial, docker]
excerpt_separator: <!--more-->
highlight: true
---

<!--more-->

## Scurt istoric și privire de ansamblu

Docker este un utilitar apărut în 2013 care efectuează operațtii de virtualizare la nivel de sistem de operare numit și containerizare. Noțiunea de container nu este nouă, Docker folosind la bază - ca metodă de containerizare - LXC (Linux Containers), lansat în anul 2008. Atât LXC, cât și implicit Docker, folosesc componente ale kernel-ului precum cgroups, kernel namespaces, chroot pentru a izola și a limita procesul sau procesele ce vor rula într-un mod containerizat.

De aici, putem efectua o comparație între containere și mașini virtuale din mai multe puncte de vedere. Primul punct de vedere ar fi consumul de resurse. Pentru a rula un sistem virtualizat complet, acesta are nevoie de propriul kernel, secvență de pornire, librării, și lista poate continua. Pentru a containeriza un proces, nu avem nevoie decât de sistemul de containerizare (fie el LXC, LXD, Docker).

Aceeași idee se aplică și în momentul în care vom calcula timpul de pornire al unei mașini virtuale cu cel al unui container. Căt timp o mașină virtuală are nevoie de timp pentru a parcurge secvența de pornire, un container pentru a ajunge in stare de funcționare are nevoie de atăt timp cât are nevoie procesul de a porni.

Ca și privire de ansamblu, ne putem referi la imaginea de mai jos:

{% include _utils/picture
    picture="/assets/images/tutorial/docker/introducere/vms_vs_containers.png"
    thumbnail="/assets/images/tutorial/docker/introducere/vms_vs_containers.png"
%}

Ce diferă? Diferența majoră între cele două situații constă în stratul reprezentat de lipsa sistemului de operare guest, și anume sistemul de operare virtualizat. Un container nu va fi niciodată un sistem de operare, ci va fi un proces sau un set de procese izolate care va conține, cel mult, librarii adiționale pentru a putea funcționa.

## Avantaje
Într-un mediu mai larg Docker oferă unele avantaje, precum:
- Immutable infrastructure - un concept susținut de containerizare în care componentele unei infrastructuri  nu suferă modificări, este bazată pe microservicii si foarte puține date care au nevoie de persistență. În momentul în care există schimbări ce trebuiesc efectuate, componentele vor fi înlocuite.
- Testabilitate și replicabilitate  - capacitatea oricărui individ parte dintr-o echipă de a replica un mediu, fie el de testare sau chiar de producție
- Consistența mediilor - prin containerizare se obține ușor consistență între medii datorita diferenței principiale numită și **"Pets vs. Cattle"**. În acest concept există doua noțiuni: pets - fiecare componentă din angrenaj are caracteristicile ei proprii și se comportă într-un mod distinctiv, și deci va fi tratată diferit, și cattle - fiecare tip de componentă este proiectată astfel încât atunci când un membru al unei componente eșuează, efectul nu va fi simțit.


