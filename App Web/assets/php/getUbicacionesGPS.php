<?php


include_once('config.php');
$especieID =  $_GET['especieID'];


function getUbicacionesGPS($especieID){

    global $dbConn;
    try{
    $sql = 'CALL getUbicacionesGPS(:especieID);';
    // prepare for execution of the stored procedure
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':especieID',$especieID,PDO::PARAM_STR);
    // execute the stored procedure ejecutivo	fecha	fuente	nombreCientifico	imagenURL	nombreColector	nombreIdentificador
    /*
    SELECT ESPECIE.muestraID as id,
    ESPECIE.nombreComun as nombreComun,
     ESPECIE.nombreCientifico as nombreCientifico,
      ESPECIE.descripcion as descripcion, FAMILIA.nombre as nombreFamilia, GENERO.nombre as nombreGenero FROM ESPECIE

    */

    $stmt->execute();
    $array = array();
    while ($row = $stmt->fetch()) {
        array_push($array,array('latitud' => $row['latitud'], 'longitud'=> $row['longitud']));
    }
    //echo json_encode($array);
    $stmt->closeCursor();
    } catch (PDOException $e) {
        die("Error occurred:" . $e->getMessage());
    }
    echo json_encode($array);
}
getUbicacionesGPS($especieID);

?>
