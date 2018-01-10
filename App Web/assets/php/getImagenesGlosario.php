<?
$id = $_GET['id'];

include_once('config.php');

function getImagenesGlosario($id){

    global $dbConn;
    try{
    $sql = 'CALL getImagenesEjGlosario(:id);';


    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':id',$id,PDO::PARAM_STR);
    $stmt->execute();
    $imgs=  new \stdClass();;
    $arrayEjemplos = array();
    $arrayTipos = array();
    while ($row = $stmt->fetch()) {
        array_push($arrayEjemplos,$row['img']);
    }
    $imgs->ejemplos = $arrayEjemplos;


    $sql = 'CALL getImagenesTiposGlosario(:id);';


    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':id',$id,PDO::PARAM_STR);
    $stmt->execute();
    while ($row = $stmt->fetch()) {
        array_push($arrayTipos,$row['img']);
    }
    $imgs->tipos = $arrayTipos;

    $stmt->closeCursor();
    } catch (PDOException $e) {
        die("Error occurred:" . $e->getMessage());
    }
    echo json_encode($imgs);
}
getImagenesGlosario($id);

?>
