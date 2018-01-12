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
        getAllEspecies();
        break;
    case 'getCatalogos':
        getCatalogos();
        break;
    case 'delete':
        $id = $_GET["id"];
        deleteEspecie($id);
        break;
    case 'edit':
        $id = $_GET["id"];
        $nombreComun = $_GET["nombreComun"];
        $nombreCientifico = $_GET["nombreCientifico"];
        $descripcion = $_GET["descripcion"];
        $pubescencia = $_GET["pubescencia"];
        $yemaFloral = $_GET["yemaFloral"];
        $procedencia = $_GET["procedencia"];
        $genero = $_GET["genero"];
        $familia = $_GET["familia"];
        $colorSavia = $_GET["colorSavia"];
        $texturaSavia = $_GET["texturaSavia"];
        $formaHoja = $_GET["formaHoja"];
        $posicionHoja = $_GET["posicionHoja"];
        $ubicacion = $_GET["ubicacion"];
        $florColor = $_GET["florColor"];
        $florSimetria = $_GET["florSimetria"];
        editEspecie($id,$nombreComun,$nombreCientifico,$descripcion,$pubescencia,$yemaFloral,$procedencia,$genero,$familia,$colorSavia,$texturaSavia,$formaHoja,$posicionHoja,$ubicacion,$florColor,$florSimetria);
        break;
    case 'loguear':
        $user  = $_GET["user"];
        $password  = $_GET["password"];
        loguearAdmin($user,$password);
        break;

    default:
        break;
}
function getCatalogos(){
     $procedencias = array();
     $generos = array();
     $familias = array();
     $colorSavias = array();
     $texturaSavias = array();
     $formaHojas = array();
     $posicionHojas = array();
     $ubicacions = array();
     $florColors = array();
     $florSimetrias = array();
     $descripcions = array();
    global $dbConn;
    $ans=  new \stdClass();
    try{

            $sql = 'CALL getprocedencias();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($procedencias,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->procedencia = $procedencias;

            $sql = 'CALL getgeneros();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($generos,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->genero = $generos;

            $sql = 'CALL getfamilias();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($familias,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->familia = $familias;

            $sql = 'CALL getcolorSavias();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($colorSavias,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->colorSavia = $colorSavias;

            $sql = 'CALL gettexturaSavias();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($texturaSavias,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->texturaSavia = $texturaSavias;

            $sql = 'CALL getformaHojas();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($formaHojas,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->formaHoja = $formaHojas;

            $sql = 'CALL getposicionHojas();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($posicionHojas,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->posicionHoja = $posicionHojas;

            $sql = 'CALL getubicacions();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($ubicacions,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->ubicacion = $ubicacions;

            $sql = 'CALL getflorColors();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($florColors,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->florColor = $florColors;

            $sql = 'CALL getflorSimetrias();';
            $stmt  = $dbConn->prepare($sql);
            $stmt->execute();
            while ($row = $stmt->fetch()) {
                array_push($florSimetrias,array("id"=>$row["id"],"nombre"=>$row["nombre"]));
            }
            $ans->florSimetria = $florSimetrias;


    } catch (PDOException $e) {
        $ans->status = "error";
    }
    $ans->status="ok";
    echo json_encode($ans);
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
function editEspecie($id,$nombreComun,$nombreCientifico,$descripcion,$pubescencia,$yemaFloral,$procedencia,$genero,$familia,$colorSavia,$texturaSavia,$formaHoja,$posicionHoja,$ubicacion,$florColor,$florSimetria){
    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL updateEspecie(:id,:nombreComun,:nombreCientifico,:descripcion,:pubescencia,:yemaFloral,:procedencia,:genero,:familia,:colorSavia,:texturaSavia,:formaHoja,:posicionHoja,:ubicacion,:florColor,:florSimetria);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':id',$id,PDO::PARAM_STR);
    $stmt->bindParam(':nombreComun',$nombreComun,PDO::PARAM_STR);
    $stmt->bindParam(':nombreCientifico',$nombreCientifico,PDO::PARAM_STR);
    $stmt->bindParam(':descripcion',$descripcion,PDO::PARAM_STR);
    $stmt->bindParam(':pubescencia',$pubescencia,PDO::PARAM_STR);
    $stmt->bindParam(':yemaFloral',$yemaFloral,PDO::PARAM_STR);
    $stmt->bindParam(':procedencia',$procedencia,PDO::PARAM_STR);
    $stmt->bindParam(':genero',$genero,PDO::PARAM_STR);
    $stmt->bindParam(':familia',$familia,PDO::PARAM_STR);
    $stmt->bindParam(':colorSavia',$colorSavia,PDO::PARAM_STR);
    $stmt->bindParam(':texturaSavia',$texturaSavia,PDO::PARAM_STR);
    $stmt->bindParam(':formaHoja',$formaHoja,PDO::PARAM_STR);
    $stmt->bindParam(':posicionHoja',$posicionHoja,PDO::PARAM_STR);
    $stmt->bindParam(':ubicacion',$ubicacion,PDO::PARAM_STR);
    $stmt->bindParam(':florColor',$florColor,PDO::PARAM_STR);
    $stmt->bindParam(':florSimetria',$florSimetria,PDO::PARAM_STR);
    $stmt->execute();
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);
}
function deleteEspecie($pid){
    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL deleteEspecie(:id);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':id',$pid,PDO::PARAM_STR);
    $stmt->execute();
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);

}
function getAllEspecies(){//,"pubescencia"=>row["pubescencia"],"yemaFloral"=>row["yemaFloral"],"nombreComun"=>row["nombreComun"],"nombreCientifico"=>row["nombreCientifico"],"descripcion"=>row["descripcion"],"imagenURL"=>row["imagenURL"],"f_procedenciaID"=>row["f_procedenciaID"],"f_generoID"=>row["f_generoID"],"f_familiaID"=>row["f_familiaID"],"f_saviaColorID"=>row["f_saviaColorID"],"f_saviaTexturaID"=>row["f_saviaTexturaID"],"f_formaHojaID"=>row["f_formaHojaID"],"f_posicionHojaID"=>row["f_posicionHojaID"],"f_ubicacionID"=>row["f_ubicacionID"],"f_florColorID"=>row["f_florColorID"],"f_florSimetriaID"=>row["f_florSimetriaID"]
    global $dbConn;
    $ans=  new \stdClass();
    try{
        $sql = 'CALL getEspecies();';
        $stmt = $dbConn->prepare($sql);
        $stmt->execute();
        $array = array();
        while ($row = $stmt->fetch()) {
            array_push($array,array("especieID"=>$row["especieID"],"pubescencia"=>$row["pubescencia"],"yemaFloral"=>$row["yemaFloral"],
            "nombreComun"=>$row["nombreComun"],"nombreCientifico"=>$row["nombreCientifico"],"descripcion"=>$row["descripcion"],
            "imagenURL"=>$row["imagenURL"],"f_procedenciaID"=>$row["f_procedenciaID"],"f_generoID"=>$row["f_generoID"],
            "f_familiaID"=>$row["f_familiaID"],"f_saviaColorID"=>$row["f_saviaColorID"],
            "f_saviaTexturaID"=>$row["f_saviaTexturaID"],"f_formaHojaID"=>$row["f_formaHojaID"],
            "f_posicionHojaID"=>$row["f_posicionHojaID"],"f_ubicacionID"=>$row["f_ubicacionID"],
            "f_florColorID"=>$row["f_florColorID"],"f_florSimetriaID"=>$row["f_florSimetriaID"]));
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
