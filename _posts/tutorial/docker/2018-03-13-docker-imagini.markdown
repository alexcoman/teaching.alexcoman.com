---
layout: post
title: "Docker - Imagini"
date: 2017-03-13 08:00:00
author: "Gabriel Paiu"
categories: [tutorial, docker]
excerpt_separator: <!--more-->
highlight: true
---

<!--more-->
## Ce este o imagine
O imagine reprezinta contextul unui proces containerizat.

O imagine poate fi una de bază sau extinsă - pornind de la oricare tip de imagine (fie de bază, fie extinsă). Ca referință pentru construcția unei imagini de bază va puteți consulta cu documentația menționata in referințe.

Extinderea imaginilor se face folosind un fișier care conține una sau mai multe instrucțiuni prin care vom specifica descrierea containerului precum și a contextului acestuia. Generic, acest tip de fișier se numește Dockerfile și este numele implicit pe care comanda ”docker build” îl va căuta atunci cand va fi executată.

## Dockerfile
Fiecare linie din Dockerfile va respecta urmatoarea sintaxă:

INSTRUCȚIUNE conținut

O trecere în revistă a unor instrucțiuni folosite frecvent, precum și un exemplu de folosire pentru fiecare:

```bash
# construiește imaginea pornind de la o imagine existentă numita ”centos”, versiunea ”latest”
FROM centos:latest

# execută o comandă în timpul construirii imaginii
RUN yum install git

# din acest punct, orice comandă ulterioară va fi executată sub user-ul ”gpaiu”
USER gpaiu`

# atunci când vom porni containerul, va fi executată comanda /usr/sbin/haproxy cu parametrii respectivi
ENTRYPOINT /usr/sbin/haproxy -f /etc/haproxy.cfg

# copie haproxy.cfg de pe host în container la locația /etc/haproxy.cfg
COPY haproxy.cfg /etc/haproxy.cfg

# Publică doar la nivel informativ porturile pe care există aplicații în container
EXPOSE 80/tcp
```

Concret, cum se extinde o imagine? Pornind de la premiza că am creat un Dockerfile valid, putem executa ”docker build .” în directorul curent. Punctul din comanda rulată va specifica ”build context”. Cand procesul de construcție va fi inițializat, întregul director va fi trimis către Docker, recursiv. În consecință, un sfat ar fi sa ținem în directorul ”build context” doar Dockerfile și doar fișiere relevante pentru imaginea respectivă.

Totodată ne putem gândi că repetarea acestui proces poate crea confuzii din cauza numărului mare de imagini ce va fi acumulat. În consecință, unei imagini îi putem atribui un tag pentru a o putea diferenția de celelalte sau mai ales pentru a implementa versionare la nivel de aplicații. Presupunând că intenția noastră este sa creem o aplicație de tip front-end, tag-ul nostru și versiunea pot fi ”frontend:1.0”. În consecință, comanda noastra devine:

```
docker build -t ”frontend:1.0” .
```

## Interactiunea cu imagini
Se poate realiza prin următoarele metode:
- sistemul de management al imaginilor oferit de sub-comanda “docker image”
- sub-comenzi ale comenzii “docker” care se adresează imaginilor în mod explicit (docker build, pull, push, rmi etc.)

Spre deosebire de lucru cu containere, imaginile - definind un context pentru containere - sunt stocate fizic într-o locație, într-un mod similar cu pachetele de Linux care sunt stocate în repository-uri. Aceste locații se numesc regiștri iar Docker oferă un registru public numit DockerHub, care este și opțiunea implicită atunci cand efectuăm un "docker pull IMAGE:TAG" fară a specifica registrul în care vrem să căutăm acea imagine.

Nu este strict necesar să folosim un registru public, dat fiind că, cel mai probabil, nu vrem ca informațiile noastre sa ajungă publice tot timpul. În consecință, avem opțiunea de a configura un registru în cadrul infrastructurii noastre, care să nu fie făcut public, cu disponibil numai nouă.

## Resurse
[docker image][1] - Modul al comenzii "docker" dedicat interacțiunii cu imagini

[docker build][2] - Construiește o imagine cu un anumit context

[docker rmi][3] - Șterge o imagine

[docker search][4] - Caută o imagine într-un registru

[docker pull][5] - Descarcă local o imagine dintr-un registru

[docker tag][6] - Aplică un tag unei imagini

[1]:https://docs.docker.com/engine/reference/commandline/image/
[2]:https://docs.docker.com/engine/reference/commandline/build/
[3]:https://docs.docker.com/engine/reference/commandline/rmi/
[4]:https://docs.docker.com/engine/reference/commandline/search/
[5]:https://docs.docker.com/engine/reference/commandline/pull/
[6]:https://docs.docker.com/engine/reference/commandline/tag/
