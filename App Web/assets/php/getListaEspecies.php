<?php
include_once('config.php');

$criterioBusqueda = $_GET['criterioBusqueda'];

function getEspeciesPorCriterio($criterioBusqueda){

  global $dbConn;
  // calling stored procedure command
  try{
    if ($criterioBusqueda == "cientifico") {
        $sql = 'CALL getEspeciesPorCientifico();';

          // prepare for execution of the stored procedure
          $stmt = $dbConn->prepare($sql);
          // execute the stored procedure

    }
    elseif($criterioBusqueda == "comun"){
        $sql = 'CALL getEspeciesPorComun();';
          // prepare for execution of the stored procedure
          $stmt = $dbConn->prepare($sql);
          // execute the stored procedure

    }
    elseif($criterioBusqueda == "familia") {
        $sql = 'CALL getEspeciesPorFamilia(:criterioBusqueda);';

          // prepare for execution of the stored procedure
          $stmt = $dbConn->prepare($sql);
          $stmt->bindParam(':criterioBusqueda',$criterioBusqueda,PDO::PARAM_STR);
          // execute the stored procedure

    }
    elseif($criterioBusqueda == "genero"){
        $sql = 'CALL getEspeciesPorGenero(:criterioBusqueda);';
        // prepare for execution of the stored procedure
          $stmt = $dbConn->prepare($sql);
           $stmt->bindParam(':criterioBusqueda',$criterioBusqueda,PDO::PARAM_STR);
          // execute the stored procedure

    }
  $stmt->execute();
  $array = array();
  while ($row = $stmt->fetch()) {
    array_push($array, array('nombre' => $row['nombre'], 'id'=> $row['id']));
  }
  echo json_encode($array);
  $stmt->closeCursor();


  } catch (PDOException $e) {
  die("Error occurred:" . $e->getMessage());
  }

}

getEspeciesPorCriterio($criterioBusqueda);


?>
