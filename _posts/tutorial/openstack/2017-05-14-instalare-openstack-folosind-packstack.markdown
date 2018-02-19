---
layout: post
title: "Instalare Openstack(RDO) folosind Packstack"
date: 2017-05-15 12:00:00
author: "Matei-Marius Micu"
categories: [tutorial, openstack]
highlight: true
---


Acest tutorial vine în ajutorul studenților ce doresc să își pregătească o mașină virtuală care va contine un mediu de execuție OpensStack RDO([RedHat Deployment of OpenStack](RDO))

## Resurse necesare

Pentru pregătirea mașinei virtuale puteți urmari tutorialul despre [VirtualBox și Cent OS 7]({{ site.baseurl }}/resurse/tutorial/virtualbox/2017/05/14/instalare-centos-7/).
Două mențiune trebuie făcută: 
 - la pasul **Specificații pentru mașina virtuală** este indicat să aveți minim 6GB RAM.
 - ISO-ul pe care il folosiți trebuie sa contină GUI(interfață grafică)

Deoarece rețelele de tip **NAT** din [VirtualBox] sunt izolate(nu pot fi accesate din mașina gazdă) trebuie să facem port forwarding a portului 80 (cel pe care este expus [Horizon], interfața web prin care se poate interacționa cu OpenStack).
**Atenție** Acești pasi trebuie făcuți cat timp mașina este închisă!

Pentru acest lucru accesăm **Port Forwarding** din meniul **Settings** > **Network** și adăugam urmatoarele reguli:
![Reguli de Port Forwarding]({{ site.baseurl }}/assets/img/virtualbox/openstack/instalare-openstack-cu-packstack/0-port-forwarding.png)


### Pasul I. Setarea unui IP static
Deoarece [OpenStack] este compus din mai multe servicii (care pot rula pe masini diferite), fiecare serviciu se bazeaza pe cunoașterea IP-ului serviciilor cu care interacționeaza, dacă IP-ul s-ar schimba atunci nu s-ar mai putea realiza comunicarea corect.

In CentOS pentru a seta un IP static putem modifica fișierul `/etc/sysconfig/network-scripts/ifcfg-enp0s3`(unde `enp0s3` este numele interfeței de tip **NAT**). 
In acest fișier trebuie adăugate urmatoarele opțiuni(pe langa cele existente):
```vim
BOOTPROTO="static"

IPADDR=10.0.2.200 # IP-ul este ales de noi, trebuie doar sa faca parte din sub-rețea
NETMASK=255.255.255.0 
GATEWAY=10.0.2.1
DNS1=8.8.8.8
DNS1=8.8.4.4
```
![Setarea unui IP static]({{ site.baseurl }}/assets/img/virtualbox/openstack/instalare-openstack-cu-packstack/1-ip-static.png)

### Pasul II. Pregatirea rețelei
**Atenție**: acest pas va scădea securitatea sistemului de operare, această mașina nu trebuie să fie accesibilă din exterior.
Dezactivăm și oprim firewall-ul (pentru a nu avea probleme cu port-urile folosite de OpenStack)
```bash
$ sudo systemctl disable firewalld
$ sudo systemctl stop firewalld
```
Dezactivăm și oprim NetworkManager (deoarece încă nu suportă bridging)
```bash
$ sudo systemctl disable NetworkManager
$ sudo systemctl stop NetworkManager
```
Activăm și pornim serviciul vechi de networking
```bash
$ sudo systemctl enable network
$ sudo systemctl start network
```

### Pasul III. Instalarea pachetului care conține utilitarul de instalare și a utilitarului
Instalăm pachetul care contine utilitarul
```bash
$ sudo yum install -y centos-release-openstack-ocata
$ sudo yum update -y
```
Unde `ocata` este ultima versiune de [OpenStack].

Instalăm ultilitarul care ne va ajuta să facem instalarea de [OpenStack].
```bash
$ sudo yum install -y openstack-packstack
```
### Pasul IV. Instalam OpenStack folosind Packstack
Pentru a configura detaliile instalări [Packstack] foloseste un fișier care poate fi generat folosind următoarea comandă:
```bash
$ packstack --gen-answer-file=answer.txt
```
Rezultatul comenzi de mai sus este un fișier asemănător cu urmatoarea imagine:
![Setarea unui IP static]({{ site.baseurl }}/assets/img/virtualbox/openstack/instalare-openstack-cu-packstack/4-answer-file.png)
In acest fișier o să dezactivăm anumite servicii de care nu avem nevoie:
- [Cinder] proiectul care ofera Block Storage
    ```vim
    CONFIG_CINDER_INSTALL=n
    ```

- [Swift] proiectul care ofera Object Storage
    ```vim
    CONFIG_SWIFT_INSTALL=n
    ```

- [Ceilometer] proiectul care permite colectarea de metrici despre Openstack
    ```vim
    CONFIG_CEILOMETER_INSTALL=n
    ```

- [Aodh] proiectul care ofera setarea de alarme/notificari în OpenStack(se foloseste de [Ceilometer] pentru a notifica administratorul daca anumite metrici trec de un anumit prag) 
    ```vim
    CONFIG_AODH_INSTALL=n
    ```

- [Gnocchi] proiectul care permite stocarea de metrici cu o dimensiune foarte mare
    ```vim
    CONFIG_GNOCCHI_INSTALL=n
    ```
După personalizarea fișierului de configurare putem porni instalarea folosind comanda:
```bash
$ sudo packstack --answer-file=answer.txt
```
Acest proces durează aproximativ **30 minute**!


### Pasul V. Finalizarea instalării

După finalizarea instalări putem accesa [Horizon] la urmatoarea adresă `localhost:8080`.
Credențialele pentru userul `admin` se află în fișierul `/root/keystonerc_admin` în variabila `OS_PASSWORD`.

![Horizon-Dashboard]({{ site.baseurl }}/assets/img/virtualbox/openstack/instalare-openstack-cu-packstack/5-horizon.png)


[RDO]: https://www.rdoproject.org/
[Packstack]: https://www.rdoproject.org/install/quickstart/
[VirtualBox]: https://www.virtualbox.org/
[OpenStack]: http://www.openstack.org/
[Cinder]: https://wiki.openstack.org/wiki/Cinder
[Swift]: https://wiki.openstack.org/wiki/Swift
[Ceilometer]: https://wiki.openstack.org/wiki/Telemetry#Ceilometer
[Aodh]: https://wiki.openstack.org/wiki/Telemetry#Aodh
[Gnocchi]: https://wiki.openstack.org/wiki/Telemetry#Gnocchi
[Horizon]: https://wiki.openstack.org/wiki/Horizon
