<?php


include_once('config.php');
$idMuestra =  $_GET['muestraID'];


function getDetalleMuestra($idMuestra){

    global $dbConn;
    try{
    $sql = 'CALL getDetalleMuestra(:muestraID);';
    // prepare for execution of the stored procedure
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':muestraID',$idMuestra,PDO::PARAM_STR);
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
        $array=['ejecutivo' => $row['ejecutivo'], 'fecha'=> $row['fecha'], 'fuente'=> $row['fuente'], 'nombreCientifico'=> $row['nombreCientifico'], 'imagenURL'=> $row['imagenURL'], 'nombreColector'=> $row['nombreColector'], 'nombreIdentificador'=> $row['nombreIdentificador']];
    }
    //echo json_encode($array);
    $stmt->closeCursor();
    } catch (PDOException $e) {
        die("Error occurred:" . $e->getMessage());
    }
    echo json_encode($array);
}
getDetalleMuestra($idMuestra);

?>
