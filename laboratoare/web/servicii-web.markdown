---
title: "Implementarea şi invocarea serviciilor Web"
permalink: /laboratoare/web/servicii-web/
group: "laboratoare.web"
layout: post
color: blue
icon: fas fa-bug
highlight: true
author: "Alexandru Coman"
date: 2019-05-15 12:00:00
---

## Consultarea resurselor

Acest laborator are la bază rezursele discutate la curs.
Suplimentar puteți parcurge informațiile prezentate în următoarele articole [Noțiuni introductive referitoare la Docker][docker-introducere], [imagini][docker-imagini] și [containere][docker-containere].

## Recapitulare

### Exercițiu de laborator

Implementați o aplicație web care să ofere utilizatorului o matrice pătratică (de o diminensiune configurabilă) populată cu puteri a lui 2 în ordine aleatorie.
Aplicația trebuie să verifice dacă utilizatorul alege numerele în ordine crescătoare, iar în caz contrar îi va afișa un mesaj corespunzător.

### Soluție incompletă

În continuare aveți la dispoziție un exemplu asemănător pe care îl puteți modifica, rescrie sau extinde după caz pentru a ajunge la rezultatul dorit.

![Exemplu de implementare][matrix-exemplu-1]
![Exemplu de implementare][matrix-exemplu-2]


**Important**: Soluția prezentată mai jos reprezintă punctul de plecare pentru exercițiul curent.
În implementarea curentă au fost intenționat introduse diverse probleme.

Structura de fișiere și directoare pentru soluția curentă este următoarea:

```
matrix
├── controller
│   └── MatrixController.php
├── index.php
├── model
│   └── MatrixModel.php
└── view
    └── MatrixView.php
```


Fișierul: `matrix/controller/MatrixController.php`:

```php
<?php

require ROOT . 'model/MatrixModel.php';

class MatrixController {

    public function __construct(int $rows=4, int $collumns=4) {
        $this->model = new MatrixModel($rows, $collumns);
    }

    private function handle_get(){
        $matrix = $this->model;
        require ROOT . 'view/MatrixView.php';
    }

    private function handle_post(){
        $matrix = $this->model;
        $maxim = 0;
        $current_item = intval($_POST['item']);
        foreach ($matrix->get_items() as $item) {
            if($matrix->get_state($item)){
                if($item > $maxim) {
                    $maxim = $item;
                }
            }
        }

        if($maxim == $matrix->get_count() - 1) {
            $matrix->clear();
            $message = 'Ai castigat!';
        }
        elseif($current_item - 1 == $maxim) {
            $message = 'Ai ales corect!';
            $matrix->set_state($current_item, TRUE);
        }
        else {
            $matrix->clear();
            $message = 'Ai raspuns gresit!';
        }
        require ROOT . 'view/MatrixView.php';
    }

    public function dispatch(){
        $request_method = strtolower($_SERVER["REQUEST_METHOD"]);
        $method_name = "handle_$request_method";
        if(method_exists($this, $method_name)){
            $this->$method_name();
        }
    }

}
?>
```

Fișierul: `matrix/model/MatrixModel.php`:

```php
<?php

class MatrixModel {

    private $rows;
    private $collumn;

    public function __construct(int $rows, int $collumns) {
        session_start();
        $this->rows = $rows;
        $this->collumns = $collumns;
    }

    public function get_count() {
        return $this->rows * $this->collumns;
    }

    public function get_rows() {
        return $this->rows;
    }

    public function get_collumns() {
        return $this->collumns;
    }

    public function get_items() {
        if(!isset($_SESSION['items'])) {
            $_SESSION['items'] = range(1, $this->get_count());
            shuffle($_SESSION['items']);
            $_SESSION['status'] = array_fill(1, $this->get_count(), FALSE);            
        }
        return $_SESSION['items'];
    }

    public function get_state(int $item) {
        if(array_key_exists($item, $_SESSION['status']))
            return $_SESSION['status'][$item];
        return NULL;
    }

    public function set_state(int $item, bool $value) {
        if(array_key_exists($item, $_SESSION['status'])) {
            $_SESSION['status'][$item] = $value;
        }
    }

    public function clear() {
        unset($_SESSION['items']);
        unset($_SESSION['status']);
    }

}
```

Fișierul: `matrix/view/MatrixView.php`:

```php
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Matrix View</title>
        <style>
            .matrix {
              margin: 0 auto;
              display: grid;
              grid-gap: 0;
              grid-template-columns: repeat(<?= $matrix->get_collumns() ?>, 80px);
              grid-template-rows: repeat(<?= $matrix->get_rows() ?>, 80px);
              grid-auto-flow: row;
            }

            .cell {
              padding: 16px;
              text-align: center;
            }

            input[type=submit] {
              height: 64px;
              width: 64px;
              background-color: #fff;
              border-radius: 3px;
              border: 1px solid black;
              font-size: 32px;
            }
        </style>
    </head>
    <body>
        <form action="#" method="POST">
            <div class="matrix">
            <?php foreach($matrix->get_items() as $item) {
                $disabled='';
                if($matrix->get_state($item)){
                    $disabled='disabled';
                }
            ?>
                <div class="cell">
                    <input <?= $disabled ?> type="submit" name="item" value="<?= $item ?>">
                </div>
            <?php } ?>
            </div>
            <?php if(isset($message)) { ?>
                <div><p><?= $message ?></p></div>
            <?php } ?>
        </form>
    </body>
</html>
```

Fișierul: `matrix/index.php`:

```php
<?php
    define('ROOT', __DIR__ . DIRECTORY_SEPARATOR);

    require ROOT . 'controller/MatrixController.php';
    $controller = new MatrixController(4, 4);
    $controller->dispatch();
?>
```


## Test de laborator

### Enunț

Scrieți o aplicație web care să-i permită utilizatorului să ghicească suma obținută prin aruncarea a două zaruri.
Utilizatorul va avea posibilitatea să ghicească suma obținută prin aruncarea celor două zaruri de maxim 5 ori.
Pentru fiecare dintre cele 5 încercări utilizatorul va primi un mesaj care să-l ajute să afle rezultatul corect.

Cerințe:
- Informațiile despre valorile obținute în urma aruncării celor două zaruri vor fi stocate la nivel de server folosind sesiuni.
- În momentul în care utilizatorul ghicește sau consumă cele trei încercări pe lângă mesajul corespunzător va primi informații și despre valoarea celor două zaruri și i se oferă posibilitatea să încerce din nou după o nouă "aruncare de zaruri".
- Procesarea datelor se va face la nivel de server


Exemplu de feedback din partea aplicației, dacă pentru această etapă de joc cele două zaruri au valorile (6, 2):

```
Răspuns: 6
Suma propusă este mai mică.

Răspuns: 7
Suma propusă este mai mică.

Răspuns: 8
Felicitări ai răspuns corect!

Valorile obținute după aruncarea zarurilor sunt (6, 2).
```

sau

```
Răspuns: 1
Suma propusă este mai mare.

Răspuns: 2
Suma propusă este mai mică.

Răspuns: 3
Suma propusă este mai mică.

Răspuns: 3
Suma propusă este mai mică.

Răspuns: 5
Răspuns greșit. Din păcate nu ai ghicit.

Valorile obținute după aruncarea zarurilor sunt (6, 2).
```

### Soluție posibilă

```php
<?php
    // Definim numărul de încercări disponibile pentru utilizator.
    define(RETRY_COUNT, 5);

    // Pentru stocarea informațiilor o să folosim sesiuni.
    session_start();

    // Verificăm dacă utilizatorul dorește să înceapă un nou joc.
    if(isset($_POST['reset'])){
        // O să ștergem toate informațiile din sesiunea curentă.
        unset($_SESSION['suma']);
    }

    // Definim o serie de variabile care o să definească starea
    // în care se află acum aplicația.
    $flag_game_over = FALSE; // Jocul este în derulare.
    $flag_winner    = FALSE; // Implicit utilizatorul a pierdut jocul.


    // Verificam daca au fost obținute informațiile referitoare la
    // cele două zaruri.
    if(!isset($_SESSION['suma'])) {
        // Inițializăm valoarea pentru primul zar.
        $_SESSION['zar1'] = random_int(1, 6);
        // Inițializăm valoarea pentru al doilea zar.
        $_SESSION['zar2'] = random_int(1, 6);
        // Calculăm suma pe care trebuie să o ghicească utilizatorul.
        $_SESSION['suma'] = $_SESSION['zar1'] + $_SESSION['zar2'];
        // Inițializăm contorul care o să rețină numărul de încercări
        // pentru utilizatorul curent.
        $_SESSION['count'] = 0;
        $message = 'S-au aruncat două zaruri, ghicește suma acestora.';
    }

    // Verificăm dacă utilizatorul mai are la dispoziție încercări
    // de a răspunde.
    if($_SESSION['count'] >= RETRY_COUNT - 1) {
        // Utilizatorul a epuizat toate încercările pe care le avea
        // la dispoziție.
        $flag_game_over = TRUE;
        $message = 'Din păcate nu ai ghicit suma.';
    }

    // Verificăm informațiile pe are le-am primit de la utilizator.
    elseif(isset($_POST['raspuns'])){
        // Incrementăm contorul ce reține numărul de încercări
        $_SESSION['count'] = $_SESSION['count'] + 1;
        // Obținem valoare pe care a propus-o utilizatorul.
        $suma = intval($_POST['raspuns']);
        if($suma == $_SESSION['suma']){
            $message = 'Felicitări ai ghicit suma.';
            // Notificăm faptul că jocul s-a terminat.
            $flag_game_over = TRUE;
            // Notificăm faptul că utilizatorul a câștigat jocul.
            $flag_winner = TRUE;
        }
        elseif($suma < $_SESSION['suma']){
            $message = 'Suma propusa este mai mica.';
        }
        else {
            $message = 'Suma propusa este mai mare.';
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Tehnologii web - Test 1</title>
    </head>
    <body>
        <div><p><?= $message ?></p></div>
        <?php
            if($flag_game_over) { 
                // Jocul s-a terminat. O să afișăm mesajul corespunzător
                // stării jocului urmate de valorile pentru cele două
                // zaruri.
        ?>
            <div>
                <p>Valorile pentru cele două zaruri au fost:</p>
                <ul>
                    <li>Zarul 1: <?= $_SESSION['zar1'] ?></li>
                    <li>Zarul 2: <?= $_SESSION['zar2'] ?></li>
                </ul>
                <form action="" method="POST">
                    <input type="submit" name="reset" value="Incepe un nou joc!">
                </form>
            </div>
        <?php 
            } else { 
                // Jocul este în derulare. O să afișăm utilizatorului formularul
                // prin intermediul căruia poate să trimită răspunsul către 
                // server și o serie de informații care să-l ghideze pe parcursul
                // jocului.
        ?>
            <form action="#" method="POST">
                <input type="text" name="raspuns">
                <input type="submit" name="submit" value="Raspunde">
            </form>
            <div>
                <p>
                    Numărul de încercări rămase este:
                    <?= RETRY_COUNT - $_SESSION['count'] ?>    
                </p>
            </div>
        <?php } ?>
    </body>
</html>
```

## Invocarea serviciilor web

### Exercițiu de laborator

Scrieți o aplicație web care să proceseze conținutul în format JSON
oferit de `https://jsonplaceholder.typicode.com/todos/`.

Aplicația va trebuie să afișeze în format JSON următoarele informații:

- Numărul total de utilizatori
- ID-ul utilizatorului cu cele mai multe TODOs

### Punct de plecare

Fișierul `index.php`:

```php
<?php
    require 'request.php';
    $request = new HTTPRequest();
    $response = $request->get('https://jsonplaceholder.typicode.com/todos/');

    $message = array(
        'meta' => array(
            'error'  => $request->get_last_error(),
            'status' => array(
                'code'    => $response->status_code,
                'message' => $response->status_message,
            ),
            'headers' => $response->headers,
        ),
        'response' => json_decode($response->body),
    );

    header('Content-type: text/javascript');
    echo json_encode($message, JSON_PRETTY_PRINT);
?>
```

Fișierul `request.php`:

```php
<?php

class HTTPResponse {
    public $body;
    public $headers;
    public $status_code;
    public $status_message;
    protected $raw_response;

    function __construct($response) {
        $this->raw_response = $response;
        $this->headers = array();
        $this->status_code = '';
        $this->status_message = '';
        $this->body = '';

        $this->parse();
    }

    private function parse_headers($raw_headers){
        $headers = explode("\r\n", $raw_headers);
        
        $status = array_shift($headers);
        preg_match('#HTTP/(\d\.\d)\s(\d\d\d)\s(.*)#', $status, $matches);
        $this->status_code = $matches[2];
        $this->status_message = $matches[3];

        foreach($headers as $raw_header){
            $header = explode(':', $raw_header);
            $this->headers[trim($header[0])] = trim($header[1]);
        }
        
    }

    private function parse(){
        $response = explode("\r\n\r\n", $this->raw_response);
        $this->parse_headers($response[0]);
        $this->body = $response[1];
    }
    
}


class HTTPRequest {
    
    protected $user_agent;
    protected $error;
    protected $request;
    protected $headers;

    function __construct() {
        $this->user_agent = 'Curl/Exerciții Tehnologii Web';
        if(isset($_SERVER['HTTP_USER_AGENT'])){
            $this->user_agent = $_SERVER['HTTP_USER_AGENT'];    
        }
        $this->headers = array();
        $this->error = '';
    }

    private function set_method($method){
        switch (strtoupper($method)) {
            case 'GET':
                curl_setopt($this->request, CURLOPT_HTTPGET, true);
                break;
            case 'POST':
                curl_setopt($this->request, CURLOPT_POST, true);
                break;
            default:
                curl_setopt($this->request, CURLOPT_CUSTOMREQUEST, $method);
        }
    }

    private function set_options(){
        curl_setopt($this->request, CURLOPT_HTTPHEADER, $this->headers);
        curl_setopt($this->request, CURLOPT_HEADER, true);
        curl_setopt($this->request, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($this->request, CURLOPT_USERAGENT, $this->user_agent); 
    }

    function request($method, $url, $vars = array()) {
        $this->error = '';
        $this->request = curl_init();
        $this->set_method($method);
        $this->set_options();

        curl_setopt($this->request, CURLOPT_URL, $url);
        if(is_array($vars) and !empty($vars)){
            $vars = http_build_query($vars, '', '&');
            curl_setopt($this->request, CURLOPT_POSTFIELDS, $vars);
        }
       
        $response = curl_exec($this->request);
        if ($response) {
            $response = new HTTPResponse($response);
        } else {
            $this->error = curl_error($this->request);
        }
        
        curl_close($this->request);
        return $response;
    }

    function get_last_error() {
        return $this->error;
    }    

    function get($url, $vars = array()) {
        if (!empty($vars)) {
            $url .= (stripos($url, '?') !== false) ? '&' : '?';
            $url .= (is_string($vars)) ? $vars : http_build_query($vars, '', '&');
        }
        return $this->request('GET', $url);
    }
    
    function post($url, $vars = array()) {
        return $this->request('POST', $url, $vars);
    }

}
```

[matrix-exemplu-1]: {{ site.baseurl }}/assets/images/laborator/web/servicii-web/matrix-exemplu-1.png
[matrix-exemplu-2]: {{ site.baseurl }}/assets/images/laborator/web/servicii-web/matrix-exemplu-2.png

[docker-introducere]: {{ site.baseurl }}/resurse/tutorial/docker/docker-introducere/
[docker-imagini]: {{ site.baseurl }}/resurse/tutorial/docker/docker-imagini/
[docker-containere]: {{ site.baseurl }}/resurse/tutorial/docker/docker-containere/
