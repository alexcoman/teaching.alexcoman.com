---
title: "Design & interacțiune Web"
permalink: /laboratoare/web/design-si-interactiune-web
group: "laboratoare.web"
layout: post
color: blue
icon: fas fa-laptop
highlight: true
author: "Alexandru Coman"
date: 2019-02-18 12:00:00
---

## Protocolul HTTP

La următoarea adresă [@alexcoman/http_server.py][0] puteți găsi o implementare rudimentară (și incompletă) a unui server web.
Pe baza utilitarului de mai sus o să discutăm despre cele mai importante aspecte referitoare la protocolul HTTP(S).

```bash
alex@laborator_web $ curl -O $HTTP_SERVER_URL
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  7695  100  7695    0     0  10534      0 --:--:-- --:--:-- --:--:-- 10541

alex@laborator_web $ python http_server.py
INFO:HTTPServer:The HTTP server is starting...
INFO:HTTPServer:The server is listening on 0.0.0.0:8080
```

Dacă accesăm dintr-un browser web adresa [http://127.0.0.1:8080][1] o să primim următorul răspuns HTTP:

```
HTTP/1.1 200 OK
Date: Mon, 12 Mar 2018 21:48:13
Content-Length: 443
Content-Type: text/plain
Connection: close
X-Laborator: Tehnologii Web
Server: HTTPWorker

GET / HTTP/1.1
Host: 127.0.0.1:8080
Connection: keep-alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.9
```

## Discuții referitoare la proiecte

Ultima parte a laboratorului va fi destinată discuțiilor referitoare la [proiecte][2] și [modalalitatea de evaluare][3].

[0]: https://gist.github.com/alexcoman/226af528b4bded9a1db2bbf55803d48c
[1]: http://127.0.0.1:8080
[2]: https://profs.info.uaic.ro/~busaco/teach/courses/web/web-projects.html#calendar
[3]: {{ site.baseurl }}/laboratoare/web/evaluare-componenta-p
