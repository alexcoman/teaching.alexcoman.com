---
layout: post
title: "Vagrant - Server web (PHP5 & MySQL)"
date: 2017-04-04 12:00:00
author: "Alexandru Coman"
categories: [tutorial, vagrant]
section-type: post
excerpt_separator: <!--more-->
---

În cadrul acestui tutorial o să discutăm despre modul în care putem pregăti într-o manieră cât mai ușoară un mediu de execuție pentru o aplicație [PHP] ce folosește [MySQL] ca și bază de date.
<!--more-->

## Resurse necesare

Pentru pregătirea mediului de execuție o să folosim utilitarul [Vagrant] și hypervisorul [VirtualBox].

[VirtualBox] este o aplicație ce ne permite să virtualizăm o mașină fizică (un computer). Cu ajutorul său, putem să creăm o mașină virtuală după specificațiile oferite de noi, ce va conține un sistem de operare izolat de sistemul de operare al mașinii gazdă. Mai multe detalii pot fi găsite în tutorialul [VirtualBox - noțiuni introductive][virtualbox-101].

[Vagrant] este un sistem de configurare, distribuție și virtualizare a mediilor de lucru, dezvoltare și publicare. El permite prin o mulțime de aplicații externe, configurarea, aprovizionarea și distribuirea ușoară a mașinilor virtuale, cu scopul de a standardiza și ușura pregătirea unui mediu pentru dezvoltarea sau publicarea unei aplicații sau a obține accesul la unelte necesare lucrului, disponibile doar pe anumite sisteme de operare. Mai multe detalii pot fi găsite în tutorialul [Vagrant - Noțiuni introductive][vagrant-101].


## Pregătirea mediului de lucru

Pentru pregătirea mediului de execuție o să avem nevoie de un fișier de configurare (fișierul `Vagrantfile`) și o serie de scripturi care să se ocupe de pregătirea mediului de execuție.

```bash
# Alegem un director de lucru cât mai convenabil
~ $ mkdir -p ~/tehnologii-web/tuxy-bot
~ $ cd ~/tehnologii-web/tuxy-bot

# Facem o copie locală a depozitului de cod labs
~ $ git clone https://github.com/alexcoman/labs

# Copiem din depozitul de cod fișierele de interes
~ $ cp -r labs/web/unelte/vagrant/webserver/. .

# Ștergem depozitul de cod
~ $ rm -rf labs
```

Acum în directorul curent ar trebui să avem următoarea structură de directoare:

```bash
.
├── provision
│   ├── nginx
│   │   ├── conf.d
│   │   │   └── sauce.conf
│   │   ├── fastcgi_params
│   │   ├── koi-utf
│   │   ├── koi-win
│   │   ├── mime.types
│   │   ├── nginx.conf
│   │   ├── scgi_params
│   │   ├── uwsgi_params
│   │   └── win-utf
│   ├── nginx.sh
│   ├── php.ini
│   └── vagrant.sh
├── README.md
└── Vagrantfile
```

### Fișierul de configurare

Înainte de a trece la pasul următor, va trebui să verificăm dacă fișierul de configurare `Vagrantfile` conține specificațiile pe care ni le dorim (de exemplu: numărul de procesoare, adresa ip etc).

```ruby
api_version = '2'
provider    = 'virtualbox'
box         = 'hashicorp/precise64'
hostname    = 'webserver'
ip_address  = '192.168.50.210'
ram         = '1024'
cpus        = '2'

Vagrant.configure(api_version) do |config|
    config.vm.define "webserver" do |webserver|
    end

    config.vm.box = box
    config.vm.host_name = hostname
    config.vm.network :private_network, ip: ip_address

    config.vm.provider :virtualbox do |virtualbox|
        virtualbox.name = hostname
        virtualbox.memory = ram
        virtualbox.cpus = cpus
    end

    config.vm.provision "shell" do |setup|
        setup.path = "provision/vagrant.sh"
        setup.privileged = true
    end

    config.vm.provision "shell" ,run: "always" do |setup|
        setup.path = "provision/nginx.sh"
        setup.privileged = true
    end
end
```

## Pregătirea mediului de execuție

După ce am descărcat și modificat după caz toate fișierele de care avem nevoie, putem să pregătim mediul de execuție pentru aplicația dorită.

### Crearea mașinii virtuale

Pentru a începe pregătirea mediului de execuție putem folosi comanda `vagrant up`:

```bash
~ $ vagrant up

==> webserver: Adăugăm sursa de pachete pentru PHP5.
==> webserver: + echo 'Adăugăm sursa de pachete pentru nginx.'
==> webserver: Adăugăm opțiunile dorite pentru serverul de mysql.
==> webserver: Instalăm pachetele dorite
==> webserver: Configurăm serverul web.
==> webserver: Deschidem portul 80.
==> webserver: Repornim serviciile.
==> webserver: Am terminat.
```

### Interacțiunea cu mediul de execuție

După ce execuția comenzii anterioare s-a finalizat putem observa că au fost create două directoare noi:
```bash
.
├── .log
│   ├── nginx-access.log
│   ├── nginx-error.log
│   └── php-access.log
└── .www
```

- `.www` care va conține aplicația dumneavoastră
- `.logs` care va conține fișierele de log

#### Verificăm dacă serverul web este funțional

Pentru a ușura interacțiunea cu serverul web putem adăuga o nouă intrare în fișierul `/etc/hosts`.

```bash
sudo echo "192.168.50.210	webserver.local" >> /etc/hosts
```

Pregătim un script PHP de test:
```bash
~ $ echo "<?php echo 'OK.'; ?>" > .www/index.php
~ $ chmod 755 .www/index.php
```

Trimitem o cerere HTTP către serverul web.
```
~ $ wget http://webserver.local/
Resolving webserver.local (webserver.local)... 192.168.50.210
Connecting to webserver.local (webserver.local)|192.168.50.210|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/html]
Saving to: ‘index.html’
(488 KB/s) - ‘index.html’ saved [3]
```

Verificăm dacă răspunsul este cel așteptat.
```
~ $ cat index.html
OK.
```

[vagrant-101]: {{ site.baseurl }}/resurse/tutorial/vagrant/notiuni-introductive/
[virtualbox-101]: {{ site.baseurl }}/resurse/tutorial/virtualbox/notiuni-introductive/
[PHP]: http://php.net/
[MySQL]: https://www.mysql.com/
[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/
