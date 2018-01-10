<?php
include_once('config.php');
$action = $_GET["action"];

switch ($action) {
    case 'add':
        $email = $_GET["email"];
        $password = $_GET["password"];
        addAdmin($email,$password);
        break;
    case 'getAll':
        getAllMuestras();
        break;
    case 'delete':
        $id = $_GET["id"];
        deleteMuestra($id);
        break;
    case 'edit':
        $id = $_GET["id"];
        $Identificador = $_GET["Identificador"];
        $Colector = $_GET["Colector"];
        $Ejecutivo = $_GET["Ejecutivo"];
        $Fuente = $_GET["Fuente"];
        $fecha = $_GET["fecha"];
        $Especie = $_GET["Especie"];
        editMuestra($id,$Identificador,$Colector,$Ejecutivo,$Fuente,$fecha,$Especie);
        break;
    case 'getEspecies':
        getEspecies();
        break;
    case 'loguear':
        $user  = $_GET["user"];
        $password  = $_GET["password"];
        loguearAdmin($user,$password);
        break;

    default:
        break;
}
function loguearAdmin($user,$password){
    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL validarLogin(:user,:password);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':user',$user,PDO::PARAM_STR);
    $stmt->bindParam(':password',$password,PDO::PARAM_STR);
    $stmt->execute();
    $email = "";
    $id = "";
    $validUser=false;
    while ($row = $stmt->fetch()) {
        $validUser=true;
        $id = $row["usuarioID"];
        $email = $row["email"];
    }
    if($validUser){
        session_start();
        $_SESSION['email'] = $email;
        $_SESSION['id'] = $id;
        $ans->result = "logged";
    }else{
        $ans->result = "notLogged";
    }
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);
}
function editMuestra($id,$Identificador,$Colector,$Ejecutivo,$Fuente,$fecha,$Especie){
    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL updateMuestra(:id,:Identificador,:Colector,:Ejecutivo,:Fuente,:fecha,:Especie);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':id',$id,PDO::PARAM_STR);
    $stmt->bindParam(':Identificador',$Identificador,PDO::PARAM_STR);
    $stmt->bindParam(':Colector',$Colector,PDO::PARAM_STR);
    $stmt->bindParam(':Ejecutivo',$Ejecutivo,PDO::PARAM_STR);
    $stmt->bindParam(':Fuente',$Fuente,PDO::PARAM_STR);
    $stmt->bindParam(':fecha',$fecha,PDO::PARAM_STR);
    $stmt->bindParam(':Especie',$Especie,PDO::PARAM_STR);
    $stmt->execute();
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);
}

function deleteMuestra($pid){
    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL deleteMuestra(:id);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':id',$pid,PDO::PARAM_STR);
    $stmt->execute();
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);

}
function getAllMuestras(){
    global $dbConn;
    $ans=  new \stdClass();
    try{ //muestraID	nombreIdentificador	nombreColector	fuente	fecha	imagenURL nombreCientifico	ejecutivo
        $sql = 'CALL getMuestras();';
        $stmt = $dbConn->prepare($sql);
        $stmt->execute();
        $array = array();
        while ($row = $stmt->fetch()) {
            array_push($array,array("muestraID"=>$row["muestraID"],"nombreIdentificador"=>$row["nombreIdentificador"],"nombreColector"=>$row["nombreColector"],"fuente"=>$row["fuente"],"fecha"=>$row["fecha"],"imagenURL"=>$row["imagenURL"],"nombreCientifico"=>$row["nombreCientifico"],"ejecutivo"=>$row["ejecutivo"]));
        }
        $ans->status="ok";
        $ans->items=$array;
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);
}

function getEspecies(){
    global $dbConn;
    $ans=  new \stdClass();
    try{ // id	nombre
        $sql = 'CALL GetEspeciesPorCientifico();';
        $stmt = $dbConn->prepare($sql);
        $stmt->execute();
        $array = array();
        while ($row = $stmt->fetch()) {
            array_push($array,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
        }
        $ans->status="ok";
        $ans->items=$array;
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);
}
function addAdmin($pEmail,$pPassword){

    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL insertAdministrador(:pCorreoElectronico,:contrasena);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':pCorreoElectronico',$pEmail,PDO::PARAM_STR);
    $stmt->bindParam(':contrasena',$pPassword,PDO::PARAM_STR);
    $stmt->execute();
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);

}


?>
