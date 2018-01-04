<?php
include_once('config.php');

function getFiltros(){

  global $dbConn;
  $arrFiltros =  array();
  // calling stored procedure command
  try{
      $sql = 'CALL getProcedencia();';
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array,$row['nombre']);
      }
      $arrFiltros["procedencia"]=$array;

      $sql = 'CALL getUbicacion();';
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array,$row['nombre']);
      }
      $arrFiltros["ubicacion"]=$array;

      $stmt->closeCursor();

      $sql = 'CALL getPosicionHoja();';
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array,$row['nombre']);
      }
      $arrFiltros["posicionHoja"]=$array;

      $sql = 'CALL getFormaHoja();';
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array,$row['nombre']);
      }
      $arrFiltros["formaHoja"]=$array;



      $sql = 'CALL getFlorColor();';
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array,$row['nombre']);
      }
      $arrFiltros["florColor"]=$array;

      $sql = 'CALL getFlorSimetria();';
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array,$row['nombre']);
      }
      $arrFiltros["florSimetria"]=$array;



      $sql = 'CALL getSaviaColor();';
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array,$row['nombre']);
      }
      $arrFiltros["saviaColor"]=$array;

      $sql = 'CALL getSaviaTextura();';
      $stmt = $dbConn->prepare($sql);
      $stmt->execute();
      $array = array();
      while ($row = $stmt->fetch()) {
        array_push($array,$row['nombre']);
      }
      $arrFiltros["saviaTextura"]=$array;





      echo json_encode($arrFiltros);


  }
  catch (PDOException $e) {
      die("Error occurred:" . $e->getMessage());
  }

}
getFiltros();


?>
