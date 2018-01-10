<?php
include_once('config.php');


function addMuestra(){
    $imgTip =array();
    $imgEj=array();
    $itemID = -1;
    $ans=  new \stdClass();
    global $dbConn;

    foreach ($_FILES['imgTip']['tmp_name'] as $key => $value) {
        $now = new DateTime();
        $time = $now->getTimestamp();
        $sourcePath = $_FILES['imgTip']['tmp_name'][$key];       // Storing source path of the file in a variable
        $targetPath = "/home/u327793104/public_html/AppWeb/assets/img/".$time.$_FILES['imgTip']['name'][$key]; // Target path where file is to be stored
        $imageIsUp = move_uploaded_file($sourcePath,$targetPath) ;    // Moving Uploaded file
        if ($imageIsUp) {
            $pathImagen = "http://herbariodigital.xyz/AppWeb/assets/img/".$time.$_FILES['imgTip']['name'][$key];
            array_push($imgTip,$pathImagen);
        }
    }
    foreach ($_FILES['imgEj']['tmp_name'] as $key => $value) {
        $now = new DateTime();
        $time = $now->getTimestamp();
        $sourcePath = $_FILES['imgEj']['tmp_name'][$key];       // Storing source path of the file in a variable
        $targetPath = "/home/u327793104/public_html/AppWeb/assets/img/".$time.$_FILES['imgEj']['name'][$key]; // Target path where file is to be stored
        $imageIsUp = move_uploaded_file($sourcePath,$targetPath) ;    // Moving Uploaded file
        if ($imageIsUp) {
            $pathImagen = "http://herbariodigital.xyz/AppWeb/assets/img/".$time.$_FILES['imgEj']['name'][$key];
            array_push($imgEj,$pathImagen);
        }
    }
    try{
        $sql = 'CALL addItemGlosario(:Nombre,:Definicion);';
        $stmt = $dbConn->prepare($sql);
        $stmt->bindParam(':Nombre',$_POST['Nombre'],PDO::PARAM_STR);
        $stmt->bindParam(':Definicion',$_POST['Definicion'],PDO::PARAM_STR);
        $stmt->execute();
        while ($row = $stmt->fetch()) {
            $itemID=$row["id"];
        }
        $ans->status = "ok";
    }catch (PDOException $e) {
        $ans->status = "error";
    }

    foreach ($imgEj as $value) {
        try{
            $sql = 'CALL addImgEjGlosario(:id,:url);';
            $stmt = $dbConn->prepare($sql);
            $stmt->bindParam(':id',$itemID,PDO::PARAM_STR);
            $stmt->bindParam(':url',$value,PDO::PARAM_STR);
            $stmt->execute();
            $ans->status = "ok";
        }catch (PDOException $e) {
            $ans->status = "error";
        }
    }
    foreach ($imgTip as $value) {
        try{
            $sql = 'CALL addImgTipGlosario(:id,:url);';
            $stmt = $dbConn->prepare($sql);
            $stmt->bindParam(':id',$itemID,PDO::PARAM_STR);
            $stmt->bindParam(':url',$value,PDO::PARAM_STR);
            $stmt->execute();
            $ans->status = "ok";
        }catch (PDOException $e) {
            $ans->status = "error";
        }
    }

    echo json_encode($ans);
}

 addMuestra();

?>
