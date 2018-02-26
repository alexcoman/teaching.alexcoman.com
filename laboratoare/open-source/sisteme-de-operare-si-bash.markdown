---
layout: page
title: "Sisteme de operare și Bash"
permalink: /laboratoare/open-source/sisteme-de-operare-si-bash/
layout: post
date: 2018-02-17 12:00:00
author: "Gabriel Paiu"
excerpt_separator: <!--more-->
---

## Pregatirea mediului de lucru

Pentru laboratorul curent o să aveți nevoie de o mașină virtuală cu Centos 7.
În cazul în care întâmpinați probleme în instalarea sistemului de operare puteți consulta următorul articol [Instalarea sistemului de operare CentOS 7][1].

## Recapitulare notiuni de Bash

O scurtă recapitulare a noțiunilor de bază despre Bash ce au fost discutate în cadrul cursului de Sisteme de Operare poate fi găsită la următoarea [adresă][2].

## Exercitii

### Exercitiul 1

Sa se scrie un script Bash care sa compare structurile a doua directoare primite ca argumente din linia de comanda. Doua directoare se considera egale daca contin aceleasi subdirectoare si fisiere.
Hint: Puteti folosi comanda diff

### Exercitiul 2

Se da un fisier .csv (campuri separate prin virgula), cu linii de forma:
```
server-1.tld.com,10.10.0.1,Apache 2.4,PHP 5,MySQL 5.5
```

Sa se extraga si afiseze datele in urmatorul format

```
Host: server-1.tld.com
IP: 10.10.0.1
Web: Apache 2.4
Backend: PHP 5
Database: MySQL 5.5
```

Hint: Puteti folosi comanda cut

### Exercitiul 3

Sa se scrie un program care gestioneaza backup-uri pentru un fisier primit ca argument.
Gestionare va consta in:
- arhivarea fisierului curent
- arhiva va avea numele fisierului, concatenand data (an, luna, zi, ora, minut, secunda)
- daca exista mai mult decat 3 arhive, cea mai veche dintre ele va fi stearsa si inlocuita de cea noua

### Tema

Pregătiți-vă spațiul de lucru conform planului descris în laborator. În plus, veți scrie un ”bootstrap” pentru mașina virtuală care va primi argumente și va realiza următoarele:
- va efectua actualizări pentru programele de sistem existente
- va instala pachetul git
- va configura static adaptorul de rețea de tip host-only
- va configura procesul de SSH astfel încât autentificarea pe bază de parolă nu va mai putea fi efectuată, în schimb, veți putea folosi chei de tip RSA, pe care o veți și instala
- va reține datele de ieșire și mesajele de eroare în fișierul /var/log/system-bootstrap.log
- inspectează fișierul /etc/selinux/config și se asigură că parametrul ”SELINUX=” este ”disabled” după care va lansa comanda "setenforce 0"
- scriptul de bootstrap trebuie să fie idempotent

Sugestii:
- comenzi utile pe care le puteți folosi: nmcli (Network Manager CLI), sed, yum

[1]: {{ site.baseurl }}/resurse/tutorial/virtualbox/instalare-centos-7/
[2]: {{ site.baseurl }}/resurse/tutorial/sisteme-operare/notiuni-introductive-in-bash/

