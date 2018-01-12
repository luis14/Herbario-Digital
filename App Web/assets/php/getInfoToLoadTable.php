<?php
$criterio =  $_POST["criterio"];
$ids = json_decode($_POST["ids"],true);


include_once('config.php');

if ($criterio =="familia") {
    echo getInfoFamilias($ids);
}
elseif ($criterio == "genero") {
    echo getInfoGenero($ids);
}
elseif ($criterio == "especie") {
    echo getInfoEspecie($ids);
}

function getInfoFamilias($pIds){

  global $dbConn;
  // calling stored procedure command
  $array = array();

  foreach ($pIds as $id) {

  try{

          $sql = 'CALL getInfoFamila(:familiaID);';
          $stmt = $dbConn->prepare($sql);
          $stmt->bindParam(':familiaID',$id,PDO::PARAM_STR);
          $stmt->execute();
          //.nombreFamilia.procedencia.ubicacion.posicionHoja.formaHoja.florColor.florSimetria.saviaColor.saviaTextura
          while ($row = $stmt->fetch()) {
            array_push($array, array('nombre'=> $row['nombreFamilia'], 'procedencia'=> $row['procedencia'],
            'ubicacion'=> $row['ubicacion'], 'posicionHoja'=> $row['posicionHoja'],
            'formaHoja'=> $row['formaHoja'],'florColor'=> $row['florColor'],
            'florSimetria'=> $row['florSimetria'],'saviaColor'=> $row['saviaColor'],'saviaTextura'=> $row['saviaTextura']));
          }

          $stmt->closeCursor();


      }
      catch (PDOException $e) {
          die("Error occurred:" . $e->getMessage());
      }
    }

    return json_encode($array);


}
function getInfoEspecie($pIds){

  global $dbConn;
  // calling stored procedure command
  $array = array();

  foreach ($pIds as $id) {

  try{

          $sql = 'CALL getInfoEspecie(:especieID);';
          $stmt = $dbConn->prepare($sql);
          $stmt->bindParam(':especieID',$id,PDO::PARAM_STR);
          $stmt->execute();
          //nombreCientifico	procedencia	ubicacion	posicionHoja	formaHoja	florColor	florSimetria	saviaColor	saviaTextura
          while ($row = $stmt->fetch()) {
            array_push($array, array('nombre'=> $row['nombreCientifico'], 'procedencia'=> $row['procedencia'],
            'ubicacion'=> $row['ubicacion'], 'posicionHoja'=> $row['posicionHoja'],
            'formaHoja'=> $row['formaHoja'],'florColor'=> $row['florColor'],
            'florSimetria'=> $row['florSimetria'],'saviaColor'=> $row['saviaColor'],'saviaTextura'=> $row['saviaTextura']));
          }

          $stmt->closeCursor();


      }
      catch (PDOException $e) {
          die("Error occurred:" . $e->getMessage());
      }
    }

    return json_encode($array);


}
function getInfoGenero($pIds){

  global $dbConn;
  // calling stored procedure command
  $array = array();

  foreach ($pIds as $id) {

  try{

          $sql = 'CALL getInfoGenero(:generoID);';
          $stmt = $dbConn->prepare($sql);
          $stmt->bindParam(':generoID',$id,PDO::PARAM_STR);
          $stmt->execute();
          //.nombreFamilia.procedencia.ubicacion.posicionHoja.formaHoja.florColor.florSimetria.saviaColor.saviaTextura
          while ($row = $stmt->fetch()) {
            array_push($array, array('nombre'=> $row['nombreGenero'], 'procedencia'=> $row['procedencia'],
            'ubicacion'=> $row['ubicacion'], 'posicionHoja'=> $row['posicionHoja'],
            'formaHoja'=> $row['formaHoja'],'florColor'=> $row['florColor'],
            'florSimetria'=> $row['florSimetria'],'saviaColor'=> $row['saviaColor'],'saviaTextura'=> $row['saviaTextura']));
          }

          $stmt->closeCursor();


      }
      catch (PDOException $e) {
          die("Error occurred:" . $e->getMessage());
      }
    }

    return json_encode($array);


}


?>
