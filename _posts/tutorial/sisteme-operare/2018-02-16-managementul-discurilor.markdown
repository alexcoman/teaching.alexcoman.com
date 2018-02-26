---
layout: post
title: "Managementul discurilor"
date: 2018-02-16 12:00:00
author: "Andrei Sahaidac"
categories: [tutorial, sisteme-operare]
excerpt_separator: <!--more-->
layout: post
highlight: true
---

Să discutăm despre partiţii, tipuri de partiţii, partiţii primare, partiţii extinse, partiţii logice, file systems.
<!--more-->

## Ce este e partiţie

Să partiţionăm un disk înseamnă că vom împarţi spaţiul fizic disponibil în mai multe părţi logice astfel încât să putem stoca informaţii într-un mod mai intuitiv pentru tipurile de date pe care le vom folosi
Atunci când partiționăm un hard disc, calculatorul va trata fiecare partiție aproape ca pe un hard disk separat.

## Linux şi partiţiile
În Linux este nevoie de cel puţin 2 partiţii pentru a rula sistemul de operare:
- partiţia de bază (root) - */*
- partiţia de swap

În partiţia de bază veţi găsi toate fişierele necesare sistemului de operare sau utilizatorului. De obicei, se preferă ca anumite locaţii ale sistemului de operare să fie localizate într-o partiţie separată astfel încât utilizarea excesivă a spaţiului destinat utilizatorilor (/home) să nu afecteze rularea sistemului de operare sau scrierea fişierelor de auditare (/var/log/).
Astfel, s-ar putea sa vedeţi pe un sistem Linux, că directoarele sistemului de operare vor fi împărţite în partiţii diferite, de mărimi diferite, sau chiar pe discuri diferite.

Partiţia swap şi spaţiul asignat este folosit în momentul în care este nevoie de mai multă memorie RAM decât este fizic disponibil. Acest proces este făcut automat de către sistemul de operare.  

În Linux, totul este un fişier, astfel si discurile şi partiţiile vor fi reprezentate ca "device files". Aceste fişiere sunt localizate în /dev. 
Se poate observa un exemplu mai jos:

```shell
[root@linux ~]# ll /dev/
brw-rw----    1 root     disk       3,   0 Mar  7  1988 hda
brw-rw----    1 root     disk       8,   0 Mar  7  1988 sda
crw-------    1 root     tty        4,  64 Mar  7  1988 ttyS0
```

## Convenţii de numire
În Linux se poate observa următoarea convenţie de numire a disc-urilor şi partiţiilor

Dispozitivele fizice se vor găsi in /dev:

* IDE - `/dev/hd*a*`, `/dev/hd*b*`, `/dev/hd*c*` (primul disc va fi `hd*a*`, etc)
* SCSI - `/dev/sd*a*`, `/dev/sd*b*`, `/dev/sd*c*` (primul disc va fi `sd*a*`, etc)

După ce veţi partiţiona disc-ul fizic, se vor observa noi "device files"

* `/dev/hda1` - Prima partiţie a primului disc.
* `/dev/hda2` - A doua partiţie a primului disc.
* `/dev/hdb1` - Prima partiţie din al doilea disc.
* `/dev/hdb2` - A doua partiţie din al doilea disc.

## Tipuri de partiţii

1. Partiţii primare - Numărul partiţiilor primare este limitat la 4. Este o limitare care vine din modul în care a fost gândită iniţial comunicarea intre disc si restul componentelor.
2. Partiţii extinse - Este o metodă prin care se încearcă evitarea limitării partiţiilor primare. Dacă sunt necesare mai multe partiţii, faţă de cele 4 de tip primar, se pot crea si acest tip de partiţii.
3. Partiţii logice - O partiţie logică este o partiţie care se crează în interiorul unei partiţii extinse.

## Filesystem

Un filesystem este o metodă prin care datele sunt structurate, astfel încât datele să fie salvate pe disc astfel încât sistemul de operare să poată să ştie cum sunt salvate datele şi cum ar trebui să fie accesate.
Exemple de filesystem:
- ext3
- ext4
- swap

Pentru a vedea o listă de tipuri de filesystems care sunt suportate de sistemul de operare şi codul unic asignat, puteţi folosi comanda: `/sbin/sfdisk -T`

## Resurse

* [Linux pentru începători](http://ro.linux-discovery.wikia.com/wiki/2._No%C5%A3iuni_esen%C5%A3iale_I)
* [Cum se montează permanent partițiile în Linux](https://www.despre-linux.eu/montarea-permanenta-partitiilor-linux/)
* [Cum gestionăm partițiile în Linux cu ajutorul comenzii fdisk](http://mystreet7.com/linux/gestionare-partitii-linux-comanda-fdisk.html)
* [Linux disc Partition şi Format](http://ro.wondershare.com/disk-utility/linux-disk-format.html)
* [Schemă de partiționare](http://marcelbanu.blogspot.ro/2013/02/schema-de-partitionare-la-instalarea-k.html)
