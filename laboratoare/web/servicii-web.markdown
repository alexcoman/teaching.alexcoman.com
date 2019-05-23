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


## Test de laborator - 1

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

### Alternativă simplificată

```php
<?php

define ('URL', 'https://jsonplaceholder.typicode.com/todos/');
echo '<p>Invoking Web service from <code>' . URL . '</code></p>';

$request = curl_init();
// Stabilim URL-ul serviciului
curl_setopt ($request, CURLOPT_URL, URL);
// Rezultatul cererii va fi disponibil ca șir de caractere
curl_setopt ($request, CURLOPT_RETURNTRANSFER, true);
 // Nu verificam certificatul digital
curl_setopt ($request, CURLOPT_SSL_VERIFYPEER, false);
// Executam cererea GET
$response = curl_exec ($request);
// Închidem conexiunea
curl_close ($request);
// Deserealizăm datele
$data = json_decode($response);
// Afișăm conținutul variabilei $data.
print_r($data);
?>
```

## Test de laborator - 2

Implementați o aplicație web care să consume informațiile despre
filmele Star Wars disponibile la adresa `https://swapi.co/api/`.

- Aplicația trebuie să ofere utilizatorului doar informațiile
despre planetele (`/api/planets`) ce apar în cel puțin 3
filme (`/api/films`) Star War.

- Aplicația trebuie să ofere utilizatorului doar informațiile
despre piloții (`/api/people`) care au folosit cel puțin două
nave (`/api/starships`) diferite.

- Aplicația trebuie să ofere utilizatorului doar informațiile
despre planeta natală (`/api/plantes`) a speciilor
(`/api/species`) care au culoare pielii `magenta`.

- Aplicația trebuie să ofere utilizatorului doar informațiile
despre speciile (`/api/species`) care apar în cel puțin 3
filme (`/api/films`).

- Aplicația trebuie să ofere utilizatorului numele vehiculelor
cu un număr de membrii ai echipajului mai mare de 15 și numele
filmelor în care au apărut.

**Notă**: Aplicația trebuie să facă cel puțin două cereri HTTP.

## Implementarea serviciilor web

### Exercițiu de laborator

**Important**: Fragmentele de cod prezentate mai jos reprezintă punctul
de plecare pentru exercițiul curent. În implementarea curentă au fost
intenționat introduse diverse probleme.

Pe baza discuțiilor din cadrul laboratorului va trebui să corectăm toate
problemele existente.

Structura de fișiere și directoare pentru soluția curentă este următoarea:

```
├── application
│   ├── Config
│   │   └── config.php
│   ├── Controller
│   │   └── SongsController.php
│   └── Model
│       └── SongsModel.php
├── core
│   ├── Application.php
│   ├── Controller.php
│   └── Model.php
└── index.php
```

Fișierul `application/Config/config.php`:

```php
<?php
define('DB_HOST', '<Change me: host     >');
define('DB_NAME', '<Change me: database >');
define('DB_USER', '<Change me: user     >');
define('DB_PASS', '<Change me: parola   >');
?>
```

Fișierul `application/Controller/SongsController.php`

```php
<?php

require ROOT . 'core/Controller.php';
require ROOT . 'application/Model/SongsModel.php';

class SongsController extends Controller {

    public function handle_get($song_id=NULL) {
        $song_model = new SongModel();
        if(!is_null($song_id)) {
            $song = $song_model->get_song($song_id);
            if($song) {
                return $song;
            }
        }
        else {
            $songs = $song_model->get_songs();
            $count = $song_model->get_count();
            $response = array("count" => $count, "results" => $songs);
            return $response;            
        }
        http_response_code(404);
    }

    public function handle_post() {
        // FIXME: Verificarea parametrilor !!!
        $song_model = new SongModel();
        $index = $song_model->add_song($_POST["artist"],
                                       $_POST["track"], 
                                       $_POST["link"]);
        $response = array(
            'id'     => $index,
            'artist' => htmlentities($_POST["artist"]),
            'track'  => htmlentities($_POST["track"]),
            'link'   => htmlentities($_POST["link"])
        );
        return $response;
    }

    public function handle_delete($song_id=NULL) {
        if(!is_null($song_id)) {
            $song_model = new SongModel();
            $song = $song_model->get_song($song_id);
            if($song){
                $song_model->delete_song($song_id);
                return $song;    
            }
            
        }
        http_response_code(404);
    }

    public function handle_put() {
        $song_model = new SongModel();
        # $song_model->update_song($_POST["artist"],
        #                           $_POST["track"], 
        #                           $_POST["link"],
        #                           $_POST['song_id']);
    }
}
```

Fișierul `application/Model/SongsModel.php`

```php
<?php

require ROOT . 'core/Model.php';

class SongModel extends Model {

    public function get_songs() {
        $sql = "SELECT id, artist, track, link FROM song";
        $query = $this->connection->prepare($sql);
        $query->execute();
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }

    public function get_song($song_id) {
        $sql = "SELECT id, artist, track, link FROM song WHERE id = :song_id LIMIT 1";
        $query = $this->connection->prepare($sql);
        $parameters = array(':song_id' => $song_id);
        $query->execute($parameters);
        return ($query->rowcount() ? $query->fetch(PDO::FETCH_ASSOC) : false);
    }

    public function add_song($artist, $track, $link) {
        $sql = "INSERT INTO song (artist, track, link) VALUES (:artist, :track, :link)";
        $query = $this->connection->prepare($sql);
        $parameters = array(':artist' => $artist, ':track' => $track, ':link' => $link);
        $query->execute($parameters);
        return $this->connection->lastInsertId();
    }

    public function delete_song($song_id) {
        $sql = "DELETE FROM song WHERE id = :song_id";
        $query = $this->connection->prepare($sql);
        $parameters = array(':song_id' => $song_id);
        $query->execute($parameters);
    }

    public function update_song($artist, $track, $link, $song_id) {
        $sql = "UPDATE song SET artist = :artist, track = :track, link = :link WHERE id = :song_id";
        $query = $this->connection->prepare($sql);
        $parameters = array(':artist' => $artist, ':track' => $track, ':link' => $link, ':song_id' => $song_id);
        $query->execute($parameters);
    }

    public function get_count() {
        $sql = "SELECT COUNT(id) AS count FROM song";
        $query = $this->connection->prepare($sql);
        $query->execute();
        return $query->fetch(PDO::FETCH_ASSOC)['count'];
    }
}

?>
```

Fișierul `core/Application.php`:

```php
<?php

class Application {
    
    private $controller = null;
    private $controller_name = null;
    private $params = array();

    public function __construct() {
        $this->parse_url();
        $this->get_controller();
    }

    private function get_controller() {
        if(!$this->controller_name)
            return null;
        if(!ctype_alpha($this->controller_name))
            return null;
        
        $controller_name = ucfirst($this->controller_name) . 
                           'Controller';
        $controller_path = ROOT . 'application/Controller/' .
                           $controller_name . '.php';
        if(!file_exists($controller_path))
            return null;

        require $controller_path;
        $this->controller = new $controller_name;
    }

    private function parse_url() {
        if (isset($_GET['url'])) {
            $url = trim($_GET['url'], '/');
            $url = filter_var($url, FILTER_SANITIZE_URL);
            $url = explode('/', $url);
            $this->controller_name = isset($url[0]) ? $url[0] : null;
            unset($url[0]);
            $this->params = array_values($url);
        }
    }

    public function dispatch() {
        if($this->controller) {
            return $this->controller->dispatch($this->params);
        }
        http_response_code(404);
    }
}

?>
```

Fișierul `core/Controller.php`:

```php
<?php

class Controller {

    public function dispatch($params=array()){
        $request_method = strtolower($_SERVER["REQUEST_METHOD"]);
        $method_name = "handle_$request_method";
        if(method_exists($this, $method_name)){
            if (!empty($params)) {
                return call_user_func_array(array($this, $method_name),
                                            $params);
            } else {
                return $this->$method_name();
            }
        }
        else {
            http_response_code(405);
        }
    }
}

?>
```

Fișierul `core/Model.php`:

```php
<?php

class Model {

    public $connection = null;

    function __construct() {
        try {
            $this->connect();
        } catch (\PDOException $exc) {
            exit('Database connection could not be established.' . $exc);
        }
    }

    private function connect() {
        $connection_string = 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';';
        $this->connection = new PDO($connection_string, DB_USER, DB_PASS);
    }
}
```

Fișierul `.htaccess`:

```
RewriteEngine on

RewriteRule ^(.+)$ index.php?url=$1 [QSA,L]
```

Fișierul `index.php`:

```php
<?php
    define('ROOT', dirname(__FILE__) . DIRECTORY_SEPARATOR);
    require ROOT . 'application/Config/config.php';
    require ROOT . 'core/Application.php';

    if(!isset($_GET['url']) or $_GET['url'] == 'index.php') {
        header('Location: /songs');
    }

    header('Content-Type: application/json');
    $application = new Application();
    $response = $application->dispatch();
    echo json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);
?>
```

Baza de date:

```sql
CREATE DATABASE IF NOT EXISTS `tw_rest`;
CREATE TABLE `tw_rest`.`song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist` text COLLATE utf8_unicode_ci NOT NULL,
  `track` text COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```

[matrix-exemplu-1]: {{ site.baseurl }}/assets/images/laborator/web/servicii-web/matrix-exemplu-1.png
[matrix-exemplu-2]: {{ site.baseurl }}/assets/images/laborator/web/servicii-web/matrix-exemplu-2.png

[docker-introducere]: {{ site.baseurl }}/resurse/tutorial/docker/docker-introducere/
[docker-imagini]: {{ site.baseurl }}/resurse/tutorial/docker/docker-imagini/
[docker-containere]: {{ site.baseurl }}/resurse/tutorial/docker/docker-containere/
