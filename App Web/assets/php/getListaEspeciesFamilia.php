<?php
include_once('config.php');

function getEspeciesPorFamilia(){

  global $dbConn;
  // calling stored procedure command
  try{

      $sql = 'CALL getEspeciesOrderedByFamilia();';

      //nombreGenero.especieID.nombreComun.nombreCientifico.img.procedencia.ubicacion.posicionHoja.formaHoja.florColor.florSimetria.saviaColor.saviaTextura
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array, array('familiaID' => $row['familiaID'],'nombreFamilia' => $row['nombreFamilia'],
        'especieID'=> $row['especieID'], 'nombreComun'=> $row['nombreComun'],
        'nombreCientifico'=> $row['nombreCientifico'], 'img'=> $row['img'],
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

getEspeciesPorFamilia();


?>
