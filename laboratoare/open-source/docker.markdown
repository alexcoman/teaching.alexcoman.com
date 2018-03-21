---
layout: page
title: "Docker"
permalink: /laboratoare/open-source/docker/
layout: post
color: pink
date: 2018-03-13 12:00:00
author: "Gabriel Paiu"
excerpt_separator: <!--more-->
highlight: true
---

## Pregătirea mediului de lucru

Pentru acest laborator vom avea nevoie de utilitarul Docker.

### Instalarea Docker

Mai întâi vom configura un repository de pachete de unde putem instala utilitarul:

```
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

După care vom instala și porni motorul de containerizare:

```
yum install docker-ce
systemctl enable docker
systemctl start docker
```
## Lucru cu containere

Pornirea primului container

```
[root@node01 ~]# docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
ca4f61b1923c: Pull complete
Digest: sha256:083de497cff944f969d8499ab94f07134c50bcf5e6b9559b27182d3fa80ce3f7
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
```

Pornirea interactivă a unui container și inspectarea acestuia:

```
[root@node01 ~]# docker run -ti centos
Unable to find image 'centos:latest' locally
latest: Pulling from library/centos
5e35d10a3eba: Pull complete
Digest: sha256:dcbc4e5e7052ea2306eed59563da1fec09196f2ecacbe042acbdcd2b44b05270
Status: Downloaded newer image for centos:latest

[root@c676b1514c76 /]# ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.1  11776  1884 pts/0    Ss   19:08   0:00 /bin/bash
root        13  0.0  0.1  47448  1660 pts/0    R+   19:09   0:00 ps aux

[root@node01 ~]# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS                        PORTS               NAMES
c676b1514c76        centos              "/bin/bash"         About a minute ago   Exited (127) 19 seconds ago                       cranky_swanson
99dc9b7dc770        hello-world         "/hello"            3 minutes ago        Exited (0) 3 minutes ago                          competent_lumiere

[root@node01 ~]# docker inspect c676b1514c76
...
```
Descărcarea și inspectarea unei imagini

```
[root@node01 ~]# docker pull haproxy
Using default tag: latest
latest: Pulling from library/haproxy
8176e34d5d92: Pull complete
a2c5d2ee06f4: Pull complete
77feadebc8c6: Pull complete
ec8ca0aa4db7: Pull complete
Digest: sha256:10c2d38f7e69a7c241b2c0559d6601b0683fb96326ae43406b43d30347f6aae9
Status: Downloaded newer image for haproxy:latest

[
    {
        "Id": "sha256:fec0a3082e12293f9d95ba838f24c2aaee60aee4237cf92265d399c9d7805c9d",
        "RepoTags": [
            "haproxy:latest"
        ],
        "RepoDigests": [
            "haproxy@sha256:10c2d38f7e69a7c241b2c0559d6601b0683fb96326ae43406b43d30347f6aae9"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2018-02-17T08:07:52.705027598Z",
        "Container": "ebfe2fbd03e68e6360dc51fc77617f6a647132f0d440c84311b391e2d63e362e",
        "ContainerConfig": {
            "Hostname": "ebfe2fbd03e6",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "HAPROXY_MAJOR=1.8",
                "HAPROXY_VERSION=1.8.4",
                "HAPROXY_MD5=540cd21169e8828d5d11894b2fa74ab4"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"haproxy\" \"-f\" \"/usr/local/etc/haproxy/haproxy.cfg\"]"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:19844aed4cf58f372d60ccc42fd8b0713361e51c07e703259861341b82dadb7b",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "/docker-entrypoint.sh"
            ],
            "OnBuild": [],
            "Labels": {}
        },
        "DockerVersion": "17.06.2-ce",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "HAPROXY_MAJOR=1.8",
                "HAPROXY_VERSION=1.8.4",
                "HAPROXY_MD5=540cd21169e8828d5d11894b2fa74ab4"
            ],
            "Cmd": [
                "haproxy",
                "-f",
                "/usr/local/etc/haproxy/haproxy.cfg"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:19844aed4cf58f372d60ccc42fd8b0713361e51c07e703259861341b82dadb7b",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "/docker-entrypoint.sh"
            ],
            "OnBuild": [],
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 71004366,
        "VirtualSize": 71004366,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/28fc0c8c0a1a64ad3949a8e4756dd87ea1b0bd6a437c591adb209b691c71a8c9/diff:/var/lib/docker/overlay2/991169a4777e027a1279bae8459ca400dd410817ede1d52dd3ddbdaf6c3bfe64/diff:/var/lib/docker/overlay2/7cee440917bae805ba2bbed929be3945eb900b5577b8ae4a2cf409423f8c657d/diff",
                "MergedDir": "/var/lib/docker/overlay2/2e89dd05c7a49d63da54d7a637cf566254296f2762d225ddf7671e76ebd77fb9/merged",
                "UpperDir": "/var/lib/docker/overlay2/2e89dd05c7a49d63da54d7a637cf566254296f2762d225ddf7671e76ebd77fb9/diff",
                "WorkDir": "/var/lib/docker/overlay2/2e89dd05c7a49d63da54d7a637cf566254296f2762d225ddf7671e76ebd77fb9/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:014cf8bfcb2d50b7b519c4714ac716cda5b660eae34189593ad880dc72ba4526",
                "sha256:babf9af79bcf29b0c617bef189b2fb9af1fef2b2ec463046beaff1aa08148e55",
                "sha256:49add22b538490853a566fd9a43bcac4395e606a82de2e2b8a3140123af4538b",
                "sha256:4f64e3bdfad36eee935f0948892cf88a95764159f79d81ba4c737ad7af339cd5"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
```
## Scenariu

În acest scenariu, va trebui să rulăm în container o aplicație care va rula în spatele unui proxy. Aplicația o puteți alege, în acest caz noi vom folosi Visualizer, o aplicație NodeJS care comunica cu Docker printr-un socket montat ca volum și afișeaza date despre serviciile care rulează într-un Swarm.

### Pornirea containerului Visualizer

```
docker run -it -d --name visualizer -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock dockersamples/visualizer
```

Parametrii explicați:
- -d: Detached. Consola nu va fi conectată interactiv la container
- -t: Un pseudo-terminal va fi alocat
- -i: Va ține STDIN deschis ca și descriptor chiar dacă nu există un STDIN atașat. Acești ultimi doi parametri sunt necesari pentru a putea ulterior să atașăm o consolă și pentru a putea interacționa cu un container
- --name: Stabilește un nume pentru container
- -v: Montează /var/run/docker.sock (primul argument) de pe Host în locația /var/run/docker.sock (al doilea argument) în container
- -p: Publică un port pe interfața de rețea a host-ului care va redirecționa către un port de pe interfața containerului
- dockersamples/visualizer: Numele imaginii pe baza căreia se va crea containerul

### Pornirea containerului HAProxy

```
docker run -d --name haproxy -v /docker/volumes/haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg -p=80:80/tcp --link visualizer haproxy
```

Parametrii explicați:
- -d: Detached. Consola nu va fi conectată interactiv la container
- --name: Stabilește un nume pentru container
- -v: Montează /docker/volumes/haproxy/haproxy.cfg de pe host în locația /usr/local/etc/haproxy/haproxy.cfg în container
- -p: Publică portul 80 pe interfața de rețea a hostului
- --link: Crează o legatură între containere astfel încât să se poată realiza o interogare DNS pentru serviciul ”visualizer”
- haproxy: Numele imaginii pe baza căreia se va crea containerul

### Fisierul de configurare haproxy.cfg

```
global
  log 127.0.0.1 local0
  log 127.0.0.1 local1 notice
  daemon

defaults
  log global
  mode http
  option httplog
  option dontlognull
  timeout connect 5000ms
  timeout client 50000ms
  timeout server 50000ms

frontend http_in
  bind *:80
  default_backend visualizer

backend visualizer
  server visualizer visualizer:8080
```

### Concluzii și observații
- Publicarea portului 80 de către containerul HAProxy are ca scop captarea traficului web atunci cand vom accesa prin browser IP-ul mașinii virtuale
- Prin setarea corecta a fișiserului de configurare pentru serviciul HAProxy, vom putea repartiza traficul în funcție de necesitate. În cazul de față, am folosit default_backend fara access control lists (ACL) pentru a trimite tot traficul către un singur backend, și anume visualizer - cel care ne servește aplicația
- Pentru orice tip de informații persistente sau care ulterior vor sau pot suferi modificări, este necesară folosirea unui volum fie de pe host fie dintr-o sursă externă. Altfel, reconstrucția containerelor ar fi prea costisitoare din punctul de vedere a resurselor cât și a timpului de livrare

## Lucru cu imagini

În exercițiul anterior am observat că fiecare container folosit a fost pornit din imagini de pe Docker Hub. Acum vom vedea ce înseamna să extindem noi o imagine pe care sa o folosim în cadrul infrastructurii.

Procesul de extindere a unei imagini este bazat pe straturi. Un strat reprezintă o imagine care pana la pasul respectiv a implementat un set de instrucțiuni.

Să presupunem urmatorul scenariu:

```
[root@node01 imagine1]# cat Dockerfile
FROM centos:latest
MAINTAINER gabriel.paiu@gmail.com

RUN useradd alex
```

Un Dockerfile în care folosim imaginea deja existentă centos:latest, adaugăm metadata MAINTAINER pentru a oferi informații cu privire la cine este reponsabil pentru menținerea la zi a imaginii, după care adaugăm un utilizator.

Ce se întamplă în momentul în care vom construi imaginea?

```
[root@node01 imagine1]# docker build -t image1 .
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM centos:latest
 ---> 2d194b392dd1
Step 2/3 : MAINTAINER gabriel.paiu@gmail.com
 ---> Running in 32f93fc1af1e
Removing intermediate container 32f93fc1af1e
 ---> d57fd2aee3a4
Step 3/3 : RUN useradd alex
 ---> Running in 8d4ea98dc038
Removing intermediate container 8d4ea98dc038
 ---> 8ee3fdf43ef4
Successfully built 8ee3fdf43ef4
Successfully tagged image1:latest
```

Observăm ca pentru fiecare instrucțiune specificată, se crează o un container intermediar, ultimul container (ID 8ee3fdf43ef4) reprezentând rezultatul final.

```
[root@node01 imagine1]# docker image ls | grep 8ee3fdf43ef4
image1                     latest              8ee3fdf43ef4        13 minutes ago      196MB
```

## Exercitiu

- Veți crea un Dockerfile în care veți adauga scriptul de la acest [link][1] peste imaginea de alpine:latest
- Scriptul va fi folosit ca și punct de intrare pentru container
- Veți crea o imagine pornind de la acest Dockerfile, imagine care se va numi "webserver", versiunea "1.0"
- Veți porni un container sub numele de "web" fără a publica nici un port, container ce va folosi imaginea "webserver:1.0"
- Veți porni un container pornind de la imaginea de HAProxy oferită de Docker Hub, și veți monta un fișier de configurare care să trimită toate conexiunile către containerul "web" 

Sugestii:
- Instrucțiuni pe care le puteți folosi în cadrul extinderii imaginii alpine: RUN
- Utilitarul pe care Alpine Linux îl folosește se numește "apk"

[1]:https://gist.github.com/alexcoman/226af528b4bded9a1db2bbf55803d48c
