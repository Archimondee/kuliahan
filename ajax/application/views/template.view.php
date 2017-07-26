<!doctype html>
<html>
   <head>
      <title>Contoh CRUD dengan AJAX</title>
      <link rel="stylesheet" type="text/css" href="<?= BASE_PATH ?>/public/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="<?= BASE_PATH ?>/public/dataTables/css/dataTables.bootstrap.min.css">
				
      <script type="text/javascript" src="<?= BASE_PATH ?>/public/jquery/jquery-2.0.2.min.js"></script>
   </head>
   
   <body>
      <div class="container">
		
<?php
$view = new View($viewName);
$view->bind('data', $data);
$view->render();
?>

      </div>
		
      <script type="text/javascript" src="<?= BASE_PATH ?>/public/bootstrap/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="<?= BASE_PATH ?>/public/dataTables/js/jquery.dataTables.min.js"></script>
      <script type="text/javascript" src="<?= BASE_PATH ?>/dataTables/js/dataTables.bootstrap.min.js"></script>

   </body>
</html>
