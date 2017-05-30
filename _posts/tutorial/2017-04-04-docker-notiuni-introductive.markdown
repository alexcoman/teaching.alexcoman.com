# Tutorial Docker

## Ce este docker?

## Cum sa instalati Docker pe Linux

1. Instalati urmatoarele dependinte pentru repozitoriu

```bash
~ $ sudo apt-get update -y
~ $ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

```

2. Adaugati cheia oficiala GPG

```
~ $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

3. Setati repozitoriul "stable" pentru docker

```
~ $ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

4. Instalati Docker(Community Edition)

```
~ $ sudo apt-get update
~ $ sudo apt-get install docker-ce
```

5. Asigurati-va ca Docker s-a instalat cu success

```
~ $ sudo docker run hello-world
```

## Exemple cum sa folositi docker

1. Creati un folder nou pentru proiect

```
~ $ mkdir proiect
~ $ cd proiect
~ $ mkdir src
```

2. Adaugam fisierele necesare

```
~ $ touch src/index.php
~ $ touch Dockerfile
```

3. Modificam fisierele

- adauga screenshots

4. Construim container-ul de Docker

```
~ $ sudo docker build -t proiect-php .
```

5. Rulam docker pe noul container

```
~ $ sudo docker run -p 80:80 -v /home/stefanc/proiect/src/:/var/www/html/ proiect-php
```