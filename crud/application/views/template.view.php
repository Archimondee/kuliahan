<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Contoh Crud</title>
         <link rel="stylesheet" type="text/css" href="<?= BASE_PATH ?>/public/bootstrap/css/bootstrap.min.css"> 
    </head>
    <body>
        <div class="container">
            <?php
                $view = new View($viewName);
                $view->bind('data', $data);
                $view->render();
            ?>
        </div>
    </body>
</html>
