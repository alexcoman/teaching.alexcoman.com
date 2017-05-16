---
layout: post
title: "Instalarea OpenStack folosind DevStack"
date: 2017-05-15 12:00:00
author: "Alexandru Coman"
categories: [tutorial, openstack]
section-type: post
excerpt_separator: <!--more-->
---

În cadrul acestui tutorial o să vorbim despre o metodă prin care putem să pregătim un mediu de dezvoltare pentru [OpenStack] folosind utilitarul [DevStack].

<!--more-->

**Avertisment**: Mediul pregătit folosind [DevStack] nu este unul persistent, utilitarul are ca scop pregătirea unui mediu de dezvoltare într-un timp foarte scurt ce facilitează utilizatorilor posibilitatea de a interacționa cu OpenStack și de a testa funcționalități experimentale. Această metodă nu este destinată pregătirii unui mediu de producție.

## Resurse necesare

Pentru pregătirea mediului de dezvoltare o să avem nevoie de o mașină virtuală cu sistemul de operare [CentOS 7][CentOS]. În tutorialul *[Instalarea sistemului de operare CentOS 7][instalare-centos]* puteți găsi toți pașii pe care trebuie să îi urmați pentru pregătirea acesteia. 

## Pregătirea mașinii virtuale

### Modulul SELinux

Pentru a ușura pregătirea mediului o să începem prin a dezactiva modulul **SELinux**(*Security-Enhanced Linux*)  din cadrul nucleului de Linux.

```bash
~ $ echo "SELINUX=disabled" > /etc/sysconfig/selinux
~ $ echo "SELINUXTYPE=minimum" >> /etc/sysconfig/selinux
```
**Avertisment**: acest lucru va scădea securitatea sistemului de operare.

Pentru ca modificările asupra *SELinux* să aibă efect, va trebui să repornim sistemul de operare.

```bash
~ $ reboot
```

### Configurația rețelei

Înainte de a trece la pasul următor, va trebui să verificăm care este starea rețelelor din cadrul sistemului de operare.

Pentru a vedea conexiunile care disponibile putem să rulăm comanda următoare:

```bash
~ $ nmcli con s
```

În cadrul mașinii pregătite în cadrul tutorialul *[Instalarea sistemului de operare CentOS 7][instalare-centos]* comanda de mai sus a afișat pe ecran:

```
NAME    UUID                                  TYPE            DEVICE
eth0    c7b645b7-4647-49ea-a2bf-d5dbeea6db89  802-3-ethernet  enp0s3
eth1    0608fbce-9e8c-40fa-aeef-6e418c8ace10  802-3-ethernet  enp0s8
```

În cazul în care conexiunile respective nu sunt active putem folosi comanda `nmcli con up <nume_conexiune>`.

```
# De exemplu
~ $ nmcli con up eth1
```

Pasul următor este să configurăm static interfața pe care o să o folosim pentru a interacționa cu Horizon, interfața web prin intermediul căreia putem interacționa cu OpenStack.

```bash
~ $ nmcli con m eth1 \
    ipv4.method manual \
    ipv4.addresses 192.168.56.101/24 \
    ipv4.gateway 192.168.56.1
~ $ nmcli con down eth1 && nmcli con up eth1
```

Pentru a vizualiza modificările făcute, putem rula comanda următoare:

```bash
~ $ ip -4 a s
```

```bash
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic enp0s3
       valid_lft 84730sec preferred_lft 84730sec
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    inet 192.168.56.101/24 brd 192.168.56.255 scope global dynamic enp0s8
       valid_lft 743sec preferred_lft 743sec
```

## Utilitarul DevStack

### Adăugarea unui utilizator

Nu este recomandat să rulăm, utilitarul [DevStack] în contextul utilizatorului *root*. Pentru a putea să îl rulăm avem nevoie de un utilizator nou, care să aibă privilegii de administrator. În cazul în care ați adăugat un utilizator nou în timpul instalării sistemului de operare, acest pas nu mai este necesar.

```bash
~ $ useradd -s /bin/bash -d /opt/stack -m stack
```

### Privilegii de administrare

Oferim privilegii de administrare utilizatorului creat și îi dăm posibilitatea de a rula comenzi elevate fără a i se cere parola.

```bash
~ $ echo "stack ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
```

### Instalarea OpenStack
```bash
~ $ su stack    # Schimbăm utilizatorul din root în stack
~ $ cd          # Schimbăm directorul de lucru
~ $ git clone https://git.openstack.org/openstack-dev/devstack
```

După ce am făcut o copie locală a utilitarului [DevStack] mai trebuie să adăugăm un fișier de configurare (numit *local.conf*) în care putem specifica modul în care dorim ca [OpenStack] să fie instalat.

În cadrul acestui tutorial vom opta spre a instala toate componentele OpenStack în cadrul aceleași mașini virtuale.

```bash
~ $ cd devstack
~ $ vi local.conf
```

Un exemplu de fișier de configurare pentru configurația mașinii virtuale curente și a rețelelor din aceasta, ar putea fi:

```[[local|localrc]]
HOST_IP=192.168.56.101
FLOATING_RANGE=192.168.56.101/27
FIXED_RANGE=10.10.10.0/24
FIXED_NETWORK_SIZE=256
FLAT_INTERFACE=eth0
ADMIN_PASSWORD=supersecret
DATABASE_PASSWORD=iheartdatabases
RABBIT_PASSWORD=flopsymopsy
SERVICE_PASSWORD=iheartksl
[[local|localrc]]
FLOATING_RANGE=192.168.1.224/27
FIXED_RANGE=10.11.12.0/24
FIXED_NETWORK_SIZE=256
FLAT_INTERFACE=enp0s8
ADMIN_PASSWORD=supersecret
DATABASE_PASSWORD=iheartdatabases
RABBIT_PASSWORD=flopsymopsy
SERVICE_PASSWORD=iheartksl
```

După ce am specificat modul în care dorim să fie pregătit mediul de dezvoltare cu OpenStack, putem să începem instalarea:

```bash
~ $ ./stack
``` 

După aproximativ 15 minute, instalarea ar trebui să se finalizeze și să primim un raport cu detalii despre mediul creat.

```bash
=========================
DevStack Component Timing
=========================
Total runtime    994

run_process       27
test_with_retry    4
pip_install      169
wait_for_service  20
yum_install       33
=========================



This is your host IP address: 192.168.56.101
This is your host IPv6 address: ::1
Horizon is now available at http://192.168.56.101/dashboard
Keystone is serving at http://192.168.56.101/identity/
The default users are: admin and demo
The password: supersecret
Services are running under systemd unit files.
For more information see:
https://docs.openstack.org/developer/devstack/systemd.html
2017-05-15 13:47:09.207 | stack.sh completed in 994 seconds.
```

## După instalarea

Pentru a putea accesa interfața web (*Horizon*) din afara mașinii virtuale, va trebui să adăugăm două reguli noi în fișierul */etc/sysconfig/iptables*. Cele două reguli vor permite conexiuni din exterior pe porturile *80* și respectiv *443*.

```bash
-A INPUT -p tcp -m multiport --dports 443 -j ACCEPT
-A INPUT -p tcp -m multiport --dports 80 -j ACCEPT
```

Pentru ca modificările făcute să aibă efect, va trebuie să repornim serviciul *iptables*.

```bash
~ $ service iptables restart
```

{: .center}
![Am terminat]({{ site.baseurl }}/assets/img/devstack/openstack.png)

[CentOS]: https://www.centos.org/
[OpenStack]: https://www.openstack.org/
[DevStack]: https://docs.openstack.org/developer/devstack/
[instalare-centos]: {{ site.baseurl }}/resurse/tutorial/virtualbox/instalare-centos-7/
