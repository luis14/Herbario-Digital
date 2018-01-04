<?php
    header("Access-Control-Allow-Origin: *"); 
    include_once('config.php');

 function getCredenciales(){
 	session_start();
 	echo json_encode('username' => $_SESSION['username'], 'resultado'  => $_SESSION['id']);
 }

 ?>
