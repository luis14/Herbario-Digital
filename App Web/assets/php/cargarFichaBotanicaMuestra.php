<?php

include_once('config.php');
$idEspecie =  $_GET['id'];


function getCaracteristicasEspecie($idEspecie){

    global $dbConn;
    try{
    $sql = 'CALL getCaracteristicasEspecie(:especieID);';
    // prepare for execution of the stored procedure
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':especieID',$idEspecie,PDO::PARAM_STR);
    // execute the stored procedure
    /*
    SELECT ESPECIE.especieID as id,
    ESPECIE.nombreComun as nombreComun,
     ESPECIE.nombreCientifico as nombreCientifico,
      ESPECIE.descripcion as descripcion, FAMILIA.nombre as nombreFamilia, GENERO.nombre as nombreGenero FROM ESPECIE

    */

    $stmt->execute();
    $array = array();
    while ($row = $stmt->fetch()) {
        $array=['id' => $row['id'], 'nombreComun'=> $row['nombreComun'], 'nombreCientifico'=> $row['nombreCientifico'], 'descripcion'=> $row['descripcion'], 'nombreFamilia'=> $row['nombreFamilia'], 'nombreGenero'=> $row['nombreGenero']];
    }
    //echo json_encode($array);
    $stmt->closeCursor();
    } catch (PDOException $e) {
        die("Error occurred:" . $e->getMessage());
    }
    return $array;
}
function getMuestras($idEspecie){

    global $dbConn;
    try{
    $sql = 'CALL getMuestrasDeEspecie(:especieID);';
    // prepare for execution of the stored procedure
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':especieID',$idEspecie,PDO::PARAM_STR);
    // execute the stored procedure
    /*
    SELECT ESPECIE.especieID as id,
    ESPECIE.nombreComun as nombreComun,
     ESPECIE.nombreCientifico as nombreCientifico,
      ESPECIE.descripcion as descripcion, FAMILIA.nombre as nombreFamilia, GENERO.nombre as nombreGenero FROM ESPECIE

    */

    $stmt->execute();
    $array = array();
    while ($row = $stmt->fetch()) {
        //muestraID	ejecutivo	fecha	imagen
        array_push($array,array('muestraID' => $row['muestraID'], 'ejecutivo'=> $row['ejecutivo'], 'fecha'=> $row['fecha'], 'imagen'=> $row['imagen']));
    }
    //echo json_encode($array);
    $stmt->closeCursor();
    } catch (PDOException $e) {
        die("Error occurred:" . $e->getMessage());
    }
    return $array;
}

function getListaCaracteristicas($idEspecie){

    global $dbConn;
    try{
    $sql = 'CALL getListaCaracteristicas(:especieID);';
    // prepare for execution of the stored procedure
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':especieID',$idEspecie,PDO::PARAM_STR);
    // execute the stored procedure
    /*
    SELECT ESPECIE.especieID as id,
    ESPECIE.nombreComun as nombreComun,
     ESPECIE.nombreCientifico as nombreCientifico,
      ESPECIE.descripcion as descripcion, FAMILIA.nombre as nombreFamilia, GENERO.nombre as nombreGenero FROM ESPECIE

    */

    $stmt->execute();
    $array = array();
    while ($row = $stmt->fetch()) {
        //nombre	resumen	imagenURL
        array_push($array,array('nombre' => $row['nombre'], 'resumen'=> $row['resumen'], 'imagenURL'=> $row['imagenURL']));
    }
    //echo json_encode($array);
    $stmt->closeCursor();
    } catch (PDOException $e) {
        die("Error occurred:" . $e->getMessage());
    }
    return $array;
}
function getMuestrasVerdes($idEspecie){

    global $dbConn;
    try{
    $sql = 'CALL getMuestrasVerdes(:especieID);';
    // prepare for execution of the stored procedure
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':especieID',$idEspecie,PDO::PARAM_STR);
    // execute the stored procedure
    /*
    SELECT ESPECIE.especieID as id,
    ESPECIE.nombreComun as nombreComun,
     ESPECIE.nombreCientifico as nombreCientifico,
      ESPECIE.descripcion as descripcion, FAMILIA.nombre as nombreFamilia, GENERO.nombre as nombreGenero FROM ESPECIE

    */

    $stmt->execute();
    $array = array();
    while ($row = $stmt->fetch()) {
        //nombre	resumen	imagenURL
        array_push($array,array('imagenURL' => $row['imagenURL']));
    }
    //echo json_encode($array);
    $stmt->closeCursor();
    } catch (PDOException $e) {
        die("Error occurred:" . $e->getMessage());
    }
    return $array;
}
$array = getCaracteristicasEspecie($idEspecie);
$muestras = getMuestras($idEspecie);
$listaCaracteristicas = getListaCaracteristicas($idEspecie);
$muestrasVerdes =  getMuestrasVerdes($idEspecie);
?>
