---
layout: post
title: "Docker - Containere"
date: 2017-03-13 08:00:00
author: "Gabriel Paiu"
categories: [tutorial, docker]
excerpt_separator: <!--more-->
highlight: true
---

<!--more-->
## Ce este un container
Ne putem referi la un container ca la un proces sau un set de procese care rulează într-un mod izolat față de mașina gazdă, interacțiunea între cele două fiind facută doar la nivel de kernel. Ce inseamnă asta? Atunci când un proces containerizat va fi nevoit să interacționeze cu kernel-ul sistemului, o va face cu kernel-ul mașinii gazdă.

Totodata, un astfel de proces poate avea acces la un set de librării disponibil doar containerului, astfel evitând poluarea host-ului cu date ce nu sunt necesare sistemului de operare sau altor aplicații.

Pentru a containeriza un proces, avem nevoie de un set de caracteristici și resurse de care acest proces va avea nevoie. Suma acestora se numește imagine. Un spațiu de stocare pentru imagini se numește registru (registry).

## Interactiunea cu containere

La nivelul liniei de comandă, putem interacționa cu containere prin mai multe metode:
- sistemul de management al containerelor oferit de sub-comanda "docker container"
- sub-comenzi ale comenzii "docker" care se adresează containerelor în mod explicit
- alte utilitare de orchestrare care interacționeaza cu Docker

## Resurse
[docker container][1]

[docker run][2]

[docker ps][3]

[docker rm][4]

[docker restart][5]

[docker logs][6]

[docker exec][7]

[Getting started with Docker, Part 2: Containers][8]

[1]:https://docs.docker.com/engine/reference/commandline/container/
[2]:https://docs.docker.com/engine/reference/run/#general-form
[3]:https://docs.docker.com/engine/reference/commandline/ps/
[4]:https://docs.docker.com/engine/reference/commandline/rm/
[5]:https://docs.docker.com/engine/reference/commandline/restart/
[6]:https://docs.docker.com/engine/reference/commandline/logs/
[7]:https://docs.docker.com/engine/reference/commandline/exec/
[8]:https://docs.docker.com/get-started/part2/
