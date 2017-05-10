# Tutorial
# Cum să instalați Openstack Mitaka folosind Packstack

## Specificații mașinii virtuale(VMWare) pe care vom instala Openstack sunt următoarele:

- Centos 7 (versiunea minimală de server, fără GUI)
- 6GB de memorie RAM (minim 4GB)
- spațiu stocare HDD 50 GB (minim 20GB)
- un adaptor de internet de tip NAT

**Observație: ** Permiteți in setările procesorului opțiunea următoare ```Virtualize Intel VT-x/EPT or AMD-V/RVI```. De asemenea, vom presupune ca deja aveți instalat sistemul de operare pe mașina virtuală(Centos 7).

# Pregătim sistemul de instalare

```bash
# Adăugăm pachetul
~ $ sudo yum install -y centos-release-openstack-mitaka

# Actualizăm sistemul
~ $ sudo yum update -y
~ $ sudo yum upgrade -y

# Instalăm pachete folositoare și alte dependințe
~ $ sudo yum install -y git vim openssh-server python-devel openstack-packstack deltarpm yum-utils yum-cron net-tools qemu-kvm qemu-kvm-tools wget
```

# Modificăm specificații ale rețelei

```bash
~ $ sudo vim /etc/hosts
Adaugă screenshot
```

```bash
~ $ sudo nmtui
Adaugă screenshot
```


```bash
# Restartăm sistemul
~ $ sudo reboot
# Adaugăm un bridge extern
# Schimbă valorile cu IP-ul mașinii
# Ar trebui adăugat un screenshot
~ $ ifconfig br-ex 127.0.0.1/24 up
~ $ route add default gw 127.0.0.1 br-ex
```

# Instalăm Openstack folosind Packstack

```bash
# Instalăm Openstack folosind un fișier de configurare
# Mențiune - IP-urile cu 192.168.133.x ar trebui schimbate
~ $ wget https://raw.githubusercontent.com/stefan-caraiman/packstack-tutorial/master/packstack-answers.txt
# Începem instalare folosindu-ne de fișierul de configurare modificat
~ $ sudo packstack --answer-file=packstack-answers.txt
# Adaugă screenshot
~ $ sudo su
~ $ source ~/keystonerc_admin
```
