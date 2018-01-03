<?php
header("Access-Control-Allow-Origin: *");
include_once('config.php');

function getEspeciesPorCriterio(){
  global $dbConn;

  try{
    $sql = 'CALL getEspecieNames();';
      
    $stmt = $dbConn->prepare($sql);
    $stmt->execute();
    $array = array();
    while ($row = $stmt->fetch()) {
      array_push($array, array('nombre' => $row['nombre'], 'cientifico' => $row['cientifico'],'id'=> $row['id']));
    }
    echo json_encode($array);
    $stmt->closeCursor();

  } catch (PDOException $e) {
    die("Error occurred:" . $e->getMessage());
  }
}

getEspeciesPorCriterio();
?>