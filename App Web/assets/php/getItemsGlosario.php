<?php
include_once('config.php');

function getItemsGlosario(){

    global $dbConn;
    try{
    $sql = 'CALL getItemsGlosario();';
    // prepare for execution of the stored procedure

    $stmt = $dbConn->prepare($sql);
    $stmt->execute();
    $array = array();
    while ($row = $stmt->fetch()) {
        array_push($array,array('id' => $row['id'], 'nombre'=> $row['nombre'], 'definicion'=> $row['DEFINICION']));
    }
    //echo json_encode($array);
    $stmt->closeCursor();
    } catch (PDOException $e) {
        die("Error occurred:" . $e->getMessage());
    }
    return json_encode($array);
}
echo getItemsGlosario();

?>
