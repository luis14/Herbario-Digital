<?php
include_once('config.php');


function addMuestra(){
    $now = new DateTime();
    $time = $now->getTimestamp();
    $sourcePath = $_FILES['imgInp']['tmp_name'];       // Storing source path of the file in a variable
    $targetPath = "/home/u327793104/public_html/AppWeb/assets/img/".$time.$_FILES['imgInp']['name']; // Target path where file is to be stored
    $imageIsUp = move_uploaded_file($sourcePath,$targetPath) ;    // Moving Uploaded file
    $pathImagen = "http://herbariodigital.xyz/AppWeb/assets/img/".$time.$_FILES['imgInp']['name'];
    $ans=  new \stdClass();
    if ($imageIsUp) {
        global $dbConn;
        try{
        $sql = 'CALL addMuestra(:Identificador,:Colector,:Ejecutivo,:Fuente,:fecha,:Especie,:img);';
        $stmt = $dbConn->prepare($sql);
        $stmt->bindParam(':Identificador',$_POST['Identificador'],PDO::PARAM_STR);
        $stmt->bindParam(':Colector',$_POST['Colector'],PDO::PARAM_STR);
        $stmt->bindParam(':Ejecutivo',$_POST['Ejecutivo'],PDO::PARAM_STR);
        $stmt->bindParam(':Fuente',$_POST['Fuente'],PDO::PARAM_STR);
        $stmt->bindParam(':fecha',$_POST['fecha'],PDO::PARAM_STR);
        $stmt->bindParam(':Especie',$_POST['Especie'],PDO::PARAM_STR);
        $stmt->bindParam(':img',$pathImagen,PDO::PARAM_STR);
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

 addMuestra();

?>
