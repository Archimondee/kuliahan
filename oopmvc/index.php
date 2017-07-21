<?php // file: oopmvc/index.php

$request = preg_replace("|/*(.+?)/*$|", "\\1", $_SERVER['PATH_INFO']);
$uri = explode('/', $request);

// Cek apakah controller dan method ada pada segment URI.
// Itu untuk mengarahkan ke controller dan method yang benar.
$uri0 = isset($uri[0]);
$uri1 = isset($uri[1]);

// Memanggil semua resource yang diperlukan.
require_once "lib/Database.php";
require_once "controller/Anggota.php";
require_once "model/AnggotaModel.php";
$db = new Database();
$model = new AnggotaModel($db);
$controller = new Anggota($model);

// Routing dan menjalankan method yang sesuai dengan URL.
// Pada framework MVC, routing biasanya dilakukan oleh Library tersendiri,
// Biasanya "Router".
if ($uri0 && $uri1 && $uri[0] === 'anggota' && $uri[1] === 'detail') {         // Detail
    $id = $_GET['id'];
    $controller->detail($id);
} elseif ($uri0 && $uri1 && $uri[0] === 'anggota' && $uri[1] === 'edit') {     // Edit
    $id = $_GET['id'];
    $controller->edit($id);
} elseif ($uri0 && $uri1 && $uri[0] === 'anggota' && $uri[1] === 'delete') {   // Delete
    $id = $_GET['id'];
    $controller->delete($id);
} elseif ($uri0 && $uri1 && $uri[0] === 'anggota' && $uri[1] === 'create') {   // Create
    $controller->create();
} elseif ($uri[0] === 'anggota') {                                             // Index
    $controller->index();
} else {                                                                       // 404
    header('HTTP/1.1 404 Not Found');
    echo '<html><body><h1>404 Bro!</h1></body></html>';
}