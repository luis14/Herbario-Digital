<?php
include_once('config.php');

/*nombreComunAgregar
nombreCientificoAgregar
imgInpAgregar
pubescenciaAgregar
yemaFloralAgregar
procedenciaAgregar
generoAgregar
familiaAgregar
colorSaviaAgregar
texturaSaviaAgregar
formaHojaAgregar
posicionHojaAgregar
ubicacionAgregar
florColorAgregar
florSimetriaAgregar
descripcionAgregar
*/
function addEspecie(){
    $now = new DateTime();
    $time = $now->getTimestamp();
    $sourcePath = $_FILES['imgInpAgregar']['tmp_name'];       // Storing source path of the file in a variable
    $targetPath = "/home/u327793104/public_html/AppWeb/assets/img/".$time.$_FILES['imgInpAgregar']['name']; // Target path where file is to be stored
    $imageIsUp = move_uploaded_file($sourcePath,$targetPath) ;    // Moving Uploaded file
    $pathImagen = "http://herbariodigital.xyz/AppWeb/assets/img/".$time.$_FILES['imgInpAgregar']['name'];
    $ans=  new \stdClass();
    if ($imageIsUp) {
        global $dbConn;
        try{
        $sql = 'CALL addEspecie(:nombreComun,:nombreCientifico,:imgInp,:pubescencia,:yemaFloral,:procedencia,:genero,:familia,:colorSavia,:texturaSavia,:formaHoja,:posicionHoja,:ubicacion,:florColor,:florSimetria,:descripcion);';
        $stmt = $dbConn->prepare($sql);
        $stmt->bindParam(':nombreComun',$_POST['nombreComunAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':nombreCientifico',$_POST['nombreCientificoAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':imgInp',$pathImagen,PDO::PARAM_STR);
        $stmt->bindParam(':pubescencia',$_POST['pubescenciaAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':yemaFloral',$_POST['yemaFloralAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':procedencia',$_POST['procedenciaAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':genero',$_POST['generoAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':familia',$_POST['familiaAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':colorSavia',$_POST['colorSaviaAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':texturaSavia',$_POST['texturaSaviaAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':formaHoja',$_POST['formaHojaAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':posicionHoja',$_POST['posicionHojaAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':ubicacion',$_POST['ubicacionAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':florColor',$_POST['florColorAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':florSimetria',$_POST['florSimetriaAgregar'],PDO::PARAM_STR);
        $stmt->bindParam(':descripcion',$_POST['descripcionAgregar'],PDO::PARAM_STR);
        $stmt->execute();
        $ans->status = "ok";
        } catch (PDOException $e) {
            $ans->status = "error";
        }
    }
    else {
        $ans->status = "error";
    }
    //$ans->status = "ok";
    //$ans->path = $targetPath;

    echo json_encode($ans);
}

 addEspecie();

?>
