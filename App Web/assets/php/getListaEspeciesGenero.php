<?php
include_once('config.php');

function getEspeciesPorGenero(){

  global $dbConn;
  // calling stored procedure command
  try{

      $sql = 'CALL getEspeciesOrderedByGenero();';

      // prepare for execution of the stored procedure nombreGenero	especieID	nombreComun	nombreCientifico	img
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array, array('generoID' => $row['generoID'],'nombreGenero' => $row['nombreGenero'], 'especieID'=> $row['especieID'],
        'nombreComun'=> $row['nombreComun'], 'nombreCientifico'=> $row['nombreCientifico'],'img'=> $row['img'],
        'procedencia'=> $row['procedencia'],'ubicacion'=> $row['ubicacion'],
        'posicionHoja'=> $row['posicionHoja'],'formaHoja'=> $row['formaHoja'],
        'florColor'=> $row['florColor'],'florSimetria'=> $row['florSimetria'],
        'saviaColor'=> $row['saviaColor'],'saviaTextura'=> $row['saviaTextura']));
      }

      $stmt->closeCursor();
      echo json_encode($array);


  }
  catch (PDOException $e) {
      die("Error occurred:" . $e->getMessage());
  }

}

getEspeciesPorGenero();


?>
