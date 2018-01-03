<?php
header("Access-Control-Allow-Origin: *");
include_once('controlExistencia.php');
$nombreUsuario = $_POST["username"];
$resultado = Existencia($nombreUsuario);
echo $resultado;

?>