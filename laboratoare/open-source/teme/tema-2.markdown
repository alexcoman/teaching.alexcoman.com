---
title: "Tema - Docker"
permalink: /laboratoare/open-source/teme/tema-2/
group: "laboratoare.opensource"
layout: post
color: pink
icon: fas fa-laptop
highlight: true
author: "Alexandru Coman"
date: 2018-03-15 12:00:00
---

## Consultarea resurselor

Pentru rezolvarea acestei teme aveți la dispoziție următoarele tutoriale:
- [Docker -- Noțiuni introductive][12]
- [Docker -- Containere][13]
- [Docker -- Imagini][14]

De asemenea puteți consulta și resursele propuse pentru laboratoarele precedente: 
- [Gestiunea utilizatorilor][0]
- [Managementul discurilor][1]
- [Managementul pachetelor][2]
- [Gestiunea proceselor][3]
- [Noțiuni introductive de rețelistică][4]
- [Instalarea sistemului de operare CentOS 7][5]
- [Noțiuni introductive în Bash][6]
- [git - noțiuni introductive][7]

## Resurse necesare

Pentru a începe lucrul la temă o să aveți nevoie de următoarele resurse:
 - utilitarul [git][8] și un cont pe [GitHub] (puteți opta pentru beneficiile pentru [studenți][9])
    - În cazul în care întâmpinați probleme puteți consulta următorul articol [git - noțiuni introductive][7]
 - un depozit de cod (pentru modul de lucru cu git vă puteți inspira din tutorialul [git - propunerea unei soluții][10])

## Jocuri vechi

Ne dorim să oferim posibilitatea pasionaților de jocuri vechi -- în linia de comandă, de exemplu [Hunt the Wumpus][15] -- să poată juca unul dintre aceste jocuri într-un browser.

În acest scop va trebui să pregătiți o imagine de docker care să conțină un server web care să expună jocul ales de voi. 

### Resurse utile: 

- [@lanhel/pywumpus] -- o implementare în Python a jocului Hunt the Wumpus propusă de Finn Helsten
- [@paradoxxxzero/butterfly] -- un terminal ce rulează în browser
	![butterfly 3.0](http://paradoxxxzero.github.io/assets/butterfly_2.0_1.gif)

[0]: {{ site.baseurl }}/resurse/tutorial/sisteme-operare/gestiunea-utilizatorilor/
[1]: {{ site.baseurl }}/resurse/tutorial/sisteme-operare/managementul-discurilor/
[2]: {{ site.baseurl }}/resurse/tutorial/sisteme-operare/manager-pachete/
[3]: {{ site.baseurl }}/resurse/tutorial/sisteme-operare/gestiunea-proceselor/
[4]: {{ site.baseurl }}/resurse/tutorial/sisteme-operare/retea/
[5]: {{ site.baseurl }}/resurse/tutorial/virtualbox/instalare-centos-7/
[6]: {{ site.baseurl }}/resurse/tutorial/sisteme-operare/notiuni-introductive-in-bash/
[7]: {{ site.baseurl }}/resurse/tutorial/sisteme-operare/notiuni-introductive-in-bash/
[8]: https://git-scm.com/
[9]: https://education.github.com/pack
[10]: {{ site.baseurl }}/resurse/tutorial/git/propunerea-unei-solutii/
[11]: https://www.virtualbox.org/sdkref/index.html
[12]: {{ site.baseurl }}/resurse/tutorial/docker/docker-introducere/
[13]: {{ site.baseurl }}/resurse/tutorial/docker/docker-containere/
[14]: {{ site.baseurl }}/resurse/tutorial/docker/docker-imagini/
[15]: https://en.wikipedia.org/wiki/Hunt_the_Wumpus

[@paradoxxxzero/butterfly]: https://github.com/paradoxxxzero/butterfly
[@lanhel/pywumpus]: https://github.com/lanhel/pywumpus
