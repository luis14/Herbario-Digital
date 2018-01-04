<?php

include_once('config.php');
header("Access-Control-Allow-Origin: *");
include_once('RegistrarPersonaUsuario.php');

$nombre = $_POST["nombre"];
$apellido1 = $_POST["papellido"];
$apellido2 = $_POST["sapellido"];
$email = $_POST["email"];
$contrasena = $_POST["contrasena"];

$resultado = RegistrarPersonaUsuario($nombre,$apellido1,$apellido2,$email,$contrasena);
echo $resultado;


?>