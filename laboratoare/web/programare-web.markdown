---
title: "Programare web"
permalink: /laboratoare/web/programare-web/
group: "laboratoare.web"
layout: post
color: blue
icon: fab fa-php
highlight: true
author: "Alexandru Coman"
date: 2019-02-18 12:00:00
---

## Consultarea resurselor

Acest laborator are la bază prezentarea [Programare Web – Dezvoltarea aplicaţiilor Web în PHP][0]

## Tuxy captcha

Tuxy are nevoie de un mecanism care să îi garanteze că toți utilizatorii aplicației lui știu să rezolve ecuații de gradul I.
Pentru că specialiștii din echipa lui Tuxy nu au reușit să rezolve această problemă au apelat la tine. Deoarece este o problemă destul de urgentă ai la dispoziție doar 30 de minute să rezolvi această sarcină.

Exemple: `10 - 3x = 1`, `6x * 7 = 42`, `10x - 4 * 2 = 1`.

Funcții ce ar putea fi utile [explode][2], [intval][3], [strpos][4]. Mai multe detalii pot fi găsite în [documentație][5].


## Tuxy bot

Tuxy Pinguinescu are nevoie de o unealtă web care să îi ușureze munca de zi cu zi.
Pentru că nimeni din echipa lui Tuxy nu este suficient de pregătit pentru a dezvolta **Tuxy Bot** această sarcină îți revine ție.

Tuxy Bot trebuie să știe să rezolve următoarele sarcini:

- /reține cheie valoare
    - Se va salva această informație și în toate comenzile ce vor fi trimise ulterior se va schimba orice apariție a cuvântului *cheie* cu valoarea acestuia
- /palindrom valoare
    - Verifică dacă valoarea primită este un șir palindrom
- /calculează valoare1 operator valoare2
- /evaluează expresie
- /curăță
    - Șterge toate informațiile salvate până în acest moment

Câteva exemple:

```
/reține acasă Iași
Am învățat termenul `acasă`.

/reține expresie 20 + 4 - 3 * 8
Am învățat termenul `expresie`.

/evaluează expresie
Rezultatul expresiei: '20 + 4 - 3 * 8' este 0

/palindrom acasa
Șirul 'Iași' nu este palindrom.

/curăță
Am șters toate informațiile din această sesiune.
```

[0]: https://profs.info.uaic.ro/~busaco/teach/courses/web/presentations/web05DezvoltareaAplicatiilorWeb-PHP.pdf
[1]: {{ site.baseurl }}/resurse/tutorial/git/propunerea-unei-solutii/
[2]: https://secure.php.net/manual/en/function.explode.php
[3]: https://secure.php.net/manual/en/function.intval.php
[4]: https://secure.php.net/manual/en/function.strpos.php
[5]: https://secure.php.net/manual/en/
