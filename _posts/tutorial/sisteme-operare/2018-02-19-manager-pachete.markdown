---
layout: post
title: "Managementul pachetelor"
date: 2018-02-19 12:00:00
author: "Andrei Sahaidac"
categories: [tutorial, sisteme-operare]
excerpt_separator: <!--more-->
layout: post
highlight: true
---

Vom instala și dez-instala programe :)
<!--more-->

## Ce este un pachet

Fiecare distributie Linux folosește pachete ca o metoda de administrare (instalare, stergere, actualizare) a software-ului.

În trecut, multe programe erau distribuite ca și cod sursă. Această metodă implică un efort suplimentar pentru utilizator pentru a aduna dependințele necesare și pentru a compila acel program.

Un răspuns pentru această problemă de distribuție si compilare a venit sub forma pachetelor, care conțin toate informațiile necesare (program, configurări, depentințe, documentație, etc) astfel încât instalarea și mentenanța unui program sa fie făcută cât mai ușor.

În continuare vom discuta în principal despre RPM, RPM-uri si Yum, dar principiile de mai jos pot fi aplicabile si pentru alte tipuri de pachete si manageri de pachete.



## Managerul de pachete

Folosim un manager de pachete pentru o interacțiune mai ușoara cu procesul de instalare, actualizare si dezinstalare a unui pachet.

RPM (Red Hat Package Manager), ca și manager de pachete, a fost folosit în distribuțiile Red Hat încă din 1995. 

El a fost gândit ca și un utilitar care poate adresa mai multe necesități:
- căutarea și validarea pachetelor
- instalarea, actualizarea si ștergerea pachetelor
- diverse acțiuni (verificare metadate pachet, listarea conținut pachet, etc)

Ne putem referi la un RPM, pe lângă utilitarul în sine, și la pachetul de date cu extensia *.rpm*  

Putem instala un RPM.
```bash
rpm -ivh cronie.rpm
```

Putem actualiza un pachet cu o versiune mai nouă
```bash
rpm -Uvh cronie.rpm
```

Putem sterge un pachet instalat
```bash
rpm -e cronie.rpm 
```

```bash
user@linux ~ $ rpm -qa | grep cron
crontabs-1.11-6.20121102git.el7.noarch
cronie-anacron-1.4.11-17.el7.x86_64
cronie-1.4.11-17.el7.x86_64
```

Putem verifica conținutul pachetului RPM

```bash
user@linux ~ $ rpm -ql cronie
/etc/cron.d
/etc/cron.d/0hourly
/etc/cron.deny
/etc/pam.d/crond
/etc/sysconfig/crond
/usr/bin/crontab
/usr/lib/systemd/system/crond.service
/usr/sbin/crond
/usr/share/doc/cronie-1.4.11
/usr/share/doc/cronie-1.4.11/AUTHORS
/usr/share/doc/cronie-1.4.11/COPYING
/usr/share/doc/cronie-1.4.11/ChangeLog
/usr/share/doc/cronie-1.4.11/INSTALL
/usr/share/doc/cronie-1.4.11/README
/usr/share/man/man1/crontab.1.gz
/usr/share/man/man5/crontab.5.gz
/usr/share/man/man8/cron.8.gz
/usr/share/man/man8/crond.8.gz
/var/spool/cron
```

Putem verifica metadatele pachetului RPM.

```bash
user@linux ~ $ rpm -qi cronie
Name        : cronie
Version     : 1.4.11
Release     : 17.el7
Architecture: x86_64
Install Date: Thu 28 Sep 2017 08:43:45 PM EEST
Group       : System Environment/Base
Size        : 220388
License     : MIT and BSD and ISC and GPLv2+
Signature   : RSA/SHA256, Thu 10 Aug 2017 06:27:51 PM EEST, Key ID 24c6a8a7f4a80eb5
Source RPM  : cronie-1.4.11-17.el7.src.rpm
Build Date  : Thu 03 Aug 2017 06:33:54 PM EEST
Build Host  : c1bm.rdu2.centos.org
Relocations : (not relocatable)
Packager    : CentOS BuildSystem <http://bugs.centos.org>
Vendor      : CentOS
URL         : https://fedorahosted.org/cronie
Summary     : Cron daemon for executing programs at set times
Description :
Cronie contains the standard UNIX daemon crond that runs specified programs at
scheduled times and related tools. It is a fork of the original vixie-cron and
has security and configuration enhancements like the ability to use pam and
SELinux.
```

În versiunile recente de RedHat se recomandă să interacționăm cu pachetele RPM prin intermediul utilitarului *yum*.

YUM (Yellowdog Updater Modified) este un manager de pachete open source recomandat pentru modul în care adresează problema dependințelor între pachete și pentru modul în care poate interacționa cu depozite de software (repositories). 

Puteți observa mai jos un mod prin care *yum* se conectează automat la un depozit de software, caută programul pe care noi dorim să îl instalăm și instalează și dependințele necesare pentru această aplicație.

```bash
[user@linux ~]# yum install vim-enhanced -y
Loaded plugins: fastestmirror, presto
Loading mirror speeds from cached hostfile
 * base: mirrors.hostemo.com
 * extras: mirrors.hostemo.com
 * updates: mirrors.hostemo.com
Setting up Install Process
Resolving Dependencies
--> Running transaction check
---> Package vim-enhanced.i686 2:7.2.411-1.8.el6 will be installed
--> Processing Dependency: vim-common = 2:7.2.411-1.8.el6 for package: 2:vim-enhanced-7.2.411-1.8.el6.i686
--> Processing Dependency: libgpm.so.2 for package: 2:vim-enhanced-7.2.411-1.8.el6.i686
--> Running transaction check
---> Package gpm-libs.i686 0:1.20.6-12.el6 will be installed
---> Package vim-common.i686 2:7.2.411-1.8.el6 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================
 Package               Arch          Version                    Repository                     Size
====================================================================================================
Installing:
 vim-enhanced          i686          2:7.2.411-1.8.el6          CentOS6.3-Repository          837 k
Installing for dependencies:
 gpm-libs              i686          1.20.6-12.el6              CentOS6.3-Repository           28 k
 vim-common            i686          2:7.2.411-1.8.el6          CentOS6.3-Repository          6.0 M

Transaction Summary
====================================================================================================
Install       3 Package(s)

Total download size: 6.8 M
Installed size: 19 M
Downloading Packages:
Setting up and reading Presto delta metadata
Processing delta metadata
Package(s) data still to download: 6.8 M
----------------------------------------------------------------------------------------------------
Total                                                                20 MB/s | 6.8 MB     00:00
Running rpm_check_debug
Running Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing : gpm-libs-1.20.6-12.el6.i686                                                      1/3
  Installing : 2:vim-common-7.2.411-1.8.el6.i686                                                2/3
  Installing : 2:vim-enhanced-7.2.411-1.8.el6.i686                                              3/3
  Verifying  : 2:vim-common-7.2.411-1.8.el6.i686                                                1/3
  Verifying  : 2:vim-enhanced-7.2.411-1.8.el6.i686                                              2/3
  Verifying  : gpm-libs-1.20.6-12.el6.i686                                                      3/3

Installed:
  vim-enhanced.i686 2:7.2.411-1.8.el6

Dependency Installed:
  gpm-libs.i686 0:1.20.6-12.el6                  vim-common.i686 2:7.2.411-1.8.el6

Complete!
```

Yum aduce mai multe îmbunătațiri față de metoda anterioară de management al pachetelor, prin faptul ca poate ține un istoric al acțiunilor asupra pachetelor instalate

```bash
user@linux ~ # yum history
Loaded plugins: fastestmirror, langpacks
ID     | Command line             | Date and time    | Action(s)      | Altered
-------------------------------------------------------------------------------
   219 | update                   | 2018-01-02 17:53 | E, I, U        |  163 EE
   218 | update                   | 2017-11-01 20:35 | E, I, O, U     |   86 EE
   217 | update                   | 2017-10-18 00:07 | Update         |    8 EE
```

Datorită acestei auditări putem să ne răzgândim, după ce facem o actalizare la 163 de pachete și să revenim la versiunile anterior instalate.

```bash
user@linux ~ # yum history undo 219
Loaded plugins: fastestmirror, langpacks
Undoing transaction 219, from Tue Jan  2 17:53:28 2018
    Updated accountsservice-0.6.45-2.el7.x86_64                           @base
    Update                  0.6.45-3.el7_4.1.x86_64                       @updates
    Updated accountsservice-libs-0.6.45-2.el7.x86_64                      @base
    Update                       0.6.45-3.el7_4.1.x86_64                  @updates
    Updated apr-1.4.8-3.el7.x86_64                                        @anaconda
    Update      1.4.8-3.el7_4.1.x86_64                                    @updates
    Updated autofs-1:5.0.7-69.el7.x86_64                                  @base
    Update         1:5.0.7-70.el7_4.1.x86_64                              @updates
    Updated bind-libs-32:9.9.4-51.el7.x86_64                              @updates
    Update            32:9.9.4-51.el7_4.1.x86_64                          @updates
......
```

## Depozit de software (repository)

Pentru a putea descărca sau actualiza pachete, sistemul pe care lucrați se va conecta prin internet către o locație centralizată pe care o vom numi un depozit de software (repository).

Pentru a se putea conecta la o asemenea locație, este necesar să fie definită locația asta într-o locație unde *yum* va verifica de fiecare dată, înainte sa ruleze, către ce surse de software ar trebui să se conecteze.
```bash
user@linux ~ # ll /etc/yum.repos.d/
total 60
-rw-r--r--. 1 root root 1664 Aug 30 18:53 CentOS-Base.repo
-rw-r--r--. 1 root root 1309 Aug 30 18:53 CentOS-CR.repo
-rw-r--r--. 1 root root  649 Aug 30 18:53 CentOS-Debuginfo.repo
-rw-r--r--. 1 root root  314 Aug 30 18:53 CentOS-fasttrack.repo
-rw-r--r--. 1 root root  630 Aug 30 18:53 CentOS-Media.repo
-rw-r--r--. 1 root root 1331 Aug 30 18:53 CentOS-Sources.repo
-rw-r--r--. 1 root root 3830 Aug 30 18:53 CentOS-Vault.repo
```

Aceste fisiere de tip *.repo* conțin informații referitoare la sursa de software pe care o vom interoga, dar și informații de securitate (key GPG) pentru a verifica validitatea acestor surse.

Exemple precum cele de mai sus vin pre-instalate cu sistemul de operare. Putem adauga și alte surse, neoficiale, menținute de către comunitate sau utilizatori individuali, astfel încât să putem accesa și alte aplicații decât cele distribuite oficial în depozitele de software ale producătorului sistemului de operare (exemple [Plex](https://support.plex.tv/articles/235974187-enable-repository-updating-for-supported-linux-server-distributions/) sau [Nginx](http://nginx.org/en/linux_packages.html)) 

```bash
user@linux ~ # cat /etc/yum.repos.d/CentOS-Base.repo
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-$releasever - Base
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#released updates
[updates]
name=CentOS-$releasever - Updates
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
```

## Resurse

* [https://ro.wikipedia.org/wiki/Gestionar_de_pachete](https://ro.wikipedia.org/wiki/Gestionar_de_pachete)
* [https://ocw.cs.pub.ro/courses/so-etti/laboratoare/lab2](https://ocw.cs.pub.ro/courses/so-etti/laboratoare/lab2)
* [https://en.wikipedia.org/wiki/Rpm_(software)](https://en.wikipedia.org/wiki/Rpm_(software))
* [https://www.ibm.com/developerworks/library/l-lpic1-102-5/index.html](https://www.ibm.com/developerworks/library/l-lpic1-102-5/index.html)
* [http://koala.cs.pub.ro/training/wiki/linux-admin/capitole/capitol-12](http://koala.cs.pub.ro/training/wiki/linux-admin/capitole/capitol-12)
