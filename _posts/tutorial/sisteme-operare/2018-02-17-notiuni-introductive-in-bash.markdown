---
title: "Noțiuni introductive în Bash"
date: 2018-02-17 12:00:00
author: ["Gabriel Paiu", "Alexandru Coman"]
categories: [tutorial, sisteme-operare]
excerpt_separator: <!--more-->
layout: post
highlight: true
---

Acest totorial este o scurtă recapitulare a noțiunilor referitoare la Bash ce au fost predate în cadrul cursului de Sisteme de Operare.
<!--more-->

## Despre

Bash (Bourne Again Shell) este un superset al Shell Command Language (SH) care permite o sintaxa mai usoara si mai lizibila si care aduce imbunatatiri. La baza, o comanda bash sau un script bash primeste date de intrare de la un terminal, de la un descriptor de fisier sau dintr-un sir de caractere, apoi ruleaza si produce date de iesire.

In bash nu exista decat variabile ca si structuri de date, care nu pot fi altceva decat siruri de caractere. Orice comanda sau operator care simuleaza alte structuri de date sau tipuri de variabile (de exemplu compararea intregilor sau declararea vectorilor) sunt doar implementari peste siruri de caractere care se pot comporta in anumite situatii ca si vectori sau intregi.

## Ordinea evenimentelor în execuția comenzilor in shell

- Shell-ul citește input (din fișier, terminal, șir de caractere) și le separă in cuvinte si operatori cu metacaractere
- Expansiunea aliasurilor
- Shell-ul analizeaza si reconstruiește informațiile în comenzi compuse
- Expansiunea elementelor de Shell
- Redirectarea descriptorilor. Operatorii și operanzii acestora sunt eliminați din argumente
- Comenzile sunt executate
- Cod de ieșire (definit sau ultimul rezultat returnat de ultima comanda executată)

## Expansiunea elementelor de Shell

1. Expansiunea acoladelor În acest pas, elementele componente definite între acolade sunt concatenate în mod repetat la șirul ce le conține
- Concatenează fiecare element definit într-o listă la șirul precedent
- Exemplu: echo a{1,2,3} -> a1 a2 a3
2. Expansiunea tilda: ~PREFIX/string
Intre ~ (tidla) și primul slash (/) se poate insera opțional un prefix. Există mai multe variante de substituție in acest caz. Exemple:
- ~/ sau ~ va fi substituit cu $HOME/director $ echo ~ /Users/gpaiu
- ~+/ sau ~+ va fi substituit de $PWD $ echo ~+ /Users/gpaiu/Music
- ~-/ sau ~- va fi substituit de $OLDPWD
- ~USER/ va fi substituit de $HOME aferent utilizatorului USER
3. Parametrii de shell si substituirea variabilelor
4. Substituirea argumentelor primite in formă de comenzi -- pentru comenzile executate folosind sintaxa $(ls -1A) sau \`ls -1A\`
5. Expansiunea operațiilor aritmentice -- exemplu: $((VAR++)) sau [ $EXPRESSION ]
6. Substituirea proceselor (redirecționarea canalelor) -- exempluȘ 1>/dev/null 2>&1
7. Separarea cuvintelor
- Shell-ul scanează rezultatele operațiunilor de expansiune a parametrilor de shell, variabilelor, substituția argumentelor in formă de comenzi și a operațiilor aritmetice (pașii 3, 4 si 5) care nu au fost incapsulate între ghilimele
- Șirurile sunt separate in cuvinte, iar caracterele din parametrul de shell $IFS (Internal Field Separator) vor servi ca delimitatoare
8. Expansiunea numelor de fișiere. Pentru tipare definite cu caracterele asterisk (*), semnul intrebării (?) sau paranteză unghiulară deschisă ([)
9. Eliminarea ghilimelelor

## Sintaxa

Orice script invocat intr-un shell trebuie sa contina la inceput un shebang. Shebang-ul incepe ca un comentariu, cu caracterul diez (#) dar este urmat de un semn de excalamare (!) si programul care va executa secventa de cod ce urmeaza. Fiecare secventa de cod poate fi apelata si in terminal. In cazul Bash, vom folosi ca shebang #!/bin/bash.

```bash
#!/bin/bash
# o variabila este referentiata fara '$' atunci cand se face asignarea
variabila="1"
# o variabila este referentiata cu '$' cand este nevoie de continutul ei
echo $variabila
```

### Compararea variabilelor

```bash
#!/bin/bash
var1="1"
var2="2"

if [[ $var1 -gt $var2 ]]; then
  # -gt sau "greater than"
  echo "$var1 este mai mare decat $var2"
elif [[ $var1 -eq $var2 ]]; then
  # -eq sau "equal"
  echo "Variabilele sunt egale"
else
  echo "$var1 este mai mic decat $var2"
fi
```

```bash
$> ./laborator1.sh
1 este mai mic decat 2
```

Similar pentru siruri de caractere

```bash
if [[ "$var1" == "$var2" ]]; then
  echo "Sirurile sunt identice"
fi
```

Aplicarea conditiilor multiple ( folosind operatorii logici && (si) sau || (sau) )

```bash
if [[ $var1 -gt 0 ]] && [[ $var1 -lt $var2 ]]; then
  echo "$var1 > 0 si $var1 < $var2"
fi
```

### Iterarea

```bash
# sau for i in $(seq 1 5); do
for i in 1 2 3 4 5; do
  echo -n $i;
done
```
```bash
$> ./laborator1.sh
1 2 3 4 5
```

### Parsarea argumentelor

```bash
#!/bin/bash
# Afiseaza toate argumentele primite din linia de comanda
echo $@
```
```bash
$> bash laborator1.sh 1 2 3
1 2 3
```
```bash
#!/bin/bash
# Afiseaza primul si al treilea argument
echo "$1 $3"
```
```bash
bash laborator1.sh 1 2 3
1 3
```

### Input si output

Trimiterea datelor de iesire catre un fisier:
```bash
#!/bin/bash
echo "Primul laborator" > fisier.txt
```

Date de intrare citite din fisier:
```bash
#!/bin/bash
while read line; do
  echo $line
done < fisier.txt
```

### Named pipe 
Permite pasarea datelor de iesire de la o comanda ca date de intrare pentru alta comanda):
```bash
#!/bin/bash
# grep afiseaza liniile care contin text, iar wc le numara
grep "text" fisier.txt | wc -l
```

### Manipularea descriptorilor de fisier
```bash
#!/bin/bash

exec 4>stdout.log
exec 2>error.log
exec 1>&4

echo "Fisier sau terminal?"
echo "Eroare" >&2
```
```bash
$> cat stdout.log
Fisier sau terminal
$> cat error.log
Eroare
```

## Comenzi utile

### ls (list)

```bash
$> ls
courses.tss-yonder.com  laborator1
```

```bash
# Listarea fisierelor din directorul curent, inclusiv cele ascunse
$> ls -la
total 0
drwxr-xr-x   5 gpaiu  staff  160 Feb 12 17:29 .
drwxr-xr-x  18 gpaiu  staff  576 Jan 31 10:28 ..
-rw-r--r--   1 gpaiu  staff    0 Feb 12 17:29 .fisier_ascuns
drwxr-xr-x  23 gpaiu  staff  736 Jan 24 15:48 courses.tss-yonder.com
drwxr-xr-x   5 gpaiu  staff  160 Feb 12 17:26 laborator1
```

```bash
# Afisarea directorului curent, in forma de lista detaliata, fara a lista fisierele
$> ls -ld $(pwd)
drwxr-xr-x  4 gpaiu  staff  128 Feb 12 17:26 /Users/gpaiu/Documents/Work/MLMOS
```

```bash
# Afisarea fisierelor, cu omiterea . si .., cate unul pe linie
$> ls -1A
.fisier_ascuns
courses.tss-yonder.com
laborator1
```

### cd (change directory)

```bash
$> pwd
/Users/gpaiu/Documents/Work/MLMOS
$> cd .. && pwd
/Users/gpaiu/Documents/Work
$> cd /Users/gpaiu/Documents && pwd
/Users/gpaiu/Documents
$> cd && pwd
/Users/gpaiu
$> cd . && pwd
/Users/gpaiu
```

### cp (copy)

```bash
$> cp stdout.log stdout.log.backup
$> ls stdout*
stdout.log      stdout.log.backup
```

### mv (move), rm (remove)

```bash
# Sterge fisierul creat precedent
$> rm -f stdout.log.backup
$> mv stdout.log stdout.log.backup
$> ls stdout*
stdout.log.backup
$> mkdir logs
$> mv stdout.log.backup logs
$> ls logs
stdout.log
```

### grep

```bash
# Cauta aparitia sirului de caractere intr-un fisier
$> grep root /etc/passwd
root:*:0:0:System Administrator:/var/root:/bin/sh
daemon:*:1:1:System Services:/var/root:/usr/bin/false
_cvmsroot:*:212:212:CVMS Root:/var/empty:/usr/bin/false

# Poate fi folosit impreuna cu named pipe
$> cat /etc/passwd | grep root

# Case insensitive
$> grep -i administrator /etc/passwd
root:*:0:0:System Administrator:/var/root:/bin/sh
_cyrus:*:77:6:Cyrus Administrator:/var/imap:/usr/bin/false
_dovecot:*:214:6:Dovecot Administrator:/var/empty:/usr/bin/false

# Suport pentru expresii regulate
$> grep -i "^root:" /etc/passwd
root:*:0:0:System Administrator:/var/root:/bin/sh
```

### cat

```bash
# Afiseaza continutul unui fisier
$> cat fisier.txt
Primul laborator
```

### tail, head

```bash
$> for i in $(seq 1 10); do echo "Linia $i" >> lista.txt; done
$> cat lista.txt
Linia 1
Linia 2
Linia 3
Linia 4
Linia 5
Linia 6
Linia 7
Linia 8
Linia 9
Linia 10
```

```bash
$> head -5 lista.txt
Linia 1
Linia 2
Linia 3
Linia 4
Linia 5
```

```bash
$> tail -3 lista.txt
Linia 8
Linia 9
Linia 10
$> head -7 lista.txt | tail -1
Linia 7
```

## Functii

Program Bash care preia doua argumente, le valideaza sa fie numere intregi si le adauga, printand suma. Programul ilustreaza urmatoarele concepte:
- functii
- variabile locale vs. variabile globale
- compararea unei variabile cu o expresie regulata
- coduri de iesire returnate de functii

```bash
#!/bin/bash

este_intreg() {
  local arg=$1
  [[ $arg =~ ^-?[0-9]+$ ]] && return 0
  return 1
}

argument_valid() {
  local arg=$1
  if [[ "$arg" ]] && este_intreg $arg; then
    return 0
  fi
  echo "Argumentul $arg nu este valid"
  return 1
}

adauga() {
  local arg1=$1
  local arg2=$2

  if argument_valid $arg1 && argument_valid $arg2; then
    sum=$(($arg1+$arg2))
    echo $sum
    return 0
  fi
  return 1
}

usage() {
  echo "$(basename $0) ARGUMENT1 ARGUMENT2"
}

if [[ $# -ne 2 ]]; then
  usage
  exit 1
else
  adauga $1 $2
fi
```
