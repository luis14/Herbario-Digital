<?php
header("Access-Control-Allow-Origin: *");
include_once('controlLogin.php');
$nombreUsuario = $_POST["username"];
$contrasena = $_POST["password"];
$resultado = ValidateUser($nombreUsuario, $contrasena);

if ($resultado != -1){
	Login($nombreUsuario, $resultado);
}

echo json_encode(array("nombreUsuario" => $nombreUsuario, "resultado"=> $resultado));

?>