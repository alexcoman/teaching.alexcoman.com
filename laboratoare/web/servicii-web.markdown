---
title: "Implementarea şi invocarea serviciilor Web"
permalink: /laboratoare/web/servicii-web/
group: "laboratoare.web"
layout: post
color: blue
icon: fas fa-bug
highlight: true
author: "Alexandru Coman"
date: 2019-05-09 12:00:00
---

## Consultarea resurselor

Acest laborator are la bază rezursele discutate la curs.
Suplimentar puteți parcurge informațiile prezentate în următoarele articole [Noțiuni introductive referitoare la Docker][docker-introducere], [imagini][docker-imagini] și [containere][docker-containere].

## Recapitulare

Implementați o aplicație web care să ofere utilizatorului o matrice pătratică (de o diminensiune configurabilă) populată cu puteri a lui 2 în ordine aleatorie.
Aplicația trebuie să verifice dacă utilizatorul alege numerele în ordine crescătoare, iar în caz contrar îi va afișa un mesaj corespunzător.


În continuare aveți la dispoziție un exemplu asemănător pe care îl puteți modifica, rescrie sau extinde după caz pentru a ajunge la rezultatul dorit.

![Exemplu de implementare][matrix-exemplu-1]
![Exemplu de implementare][matrix-exemplu-2]

## Soluție incompletă

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

### MatrixController.php

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

        if($maxim == $matrix->get_count()) {
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
            $this->${method_name}();
        }
    }

}
?>
```

### MatrixModel.php

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
        return $this->rows;
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

### MatrixView.php

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

### index.php

Fișierul: `matrix/index.php`:

```php
<?php
    define('ROOT', __DIR__ . DIRECTORY_SEPARATOR);

    require ROOT . 'controller/MatrixController.php';
    $controller = new MatrixController(4, 4);
    $controller->dispatch();
?>
```

[matrix-exemplu-1]: {{ site.baseurl }}/assets/images/laborator/web/servicii-web/matrix-exemplu-1.png
[matrix-exemplu-2]: {{ site.baseurl }}/assets/images/laborator/web/servicii-web/matrix-exemplu-2.png

[docker-introducere]: {{ site.baseurl }}/resurse/tutorial/docker/docker-introducere/
[docker-imagini]: {{ site.baseurl }}/resurse/tutorial/docker/docker-imagini/
[docker-containere]: {{ site.baseurl }}/resurse/tutorial/docker/docker-containere/
