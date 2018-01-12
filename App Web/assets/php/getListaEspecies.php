<?php
include_once('config.php');

$criterioBusqueda = $_GET['criterioBusqueda'];
$brincar = false;
function getEspeciesPorCriterio($criterioBusqueda){

  global $dbConn;
  // calling stored procedure command
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
    elseif ($criterioBusqueda =="all") {
        $brincar =true;
        $sql = 'CALL getEspeciesOrderedByEspecie();';

        //	especieID	nombreComun	nombreCientifico	img	procedencia	ubicacion	posicionHoja	formaHoja	florColor	florSimetria	saviaColor	saviaTextura
        $stmt = $dbConn->prepare($sql);
        $stmt->execute();
        $array = array();
        while ($row = $stmt->fetch()) {
          array_push($array, array(
              "especieID"=>$row["especieID"],"nombreComun"=>$row["nombreComun"],
              "nombreCientifico"=>$row["nombreCientifico"],"img"=>$row["img"],
              "procedencia"=>$row["procedencia"],"ubicacion"=>$row["ubicacion"],
              "posicionHoja"=>$row["posicionHoja"],"formaHoja"=>$row["formaHoja"],
              "florColor"=>$row["florColor"],"florSimetria"=>$row["florSimetria"],
              "saviaColor"=>$row["saviaColor"],"saviaTextura"=>$row["saviaTextura"]
          ));
        }

        $stmt->closeCursor();
        echo json_encode($array);

    }
    if (!$brincar) {
        $stmt->execute();
        $array = array();
        while ($row = $stmt->fetch()) {
          array_push($array, array('nombre' => $row['nombre'], 'id'=> $row['id']));
        }
        echo json_encode($array);
        $stmt->closeCursor();


    }

}

getEspeciesPorCriterio($criterioBusqueda);


?>
