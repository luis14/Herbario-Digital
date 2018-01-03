<?php
    header("Access-Control-Allow-Origin: *"); 
    include_once('config.php');

 function Existencia($nombreUsuario){
     try{
     global $dbConn;
        // calling stored procedure command
        $sql = 'CALL sp_Valida_Correo(:nombreUsuario, @existe);';

        // prepare for execution of the stored procedure
        $stmt = $dbConn->prepare($sql);

        // pass value to the command
        $stmt->bindParam(':nombreUsuario', $nombreUsuario, PDO::PARAM_STR);

        // execute the stored procedure
        $stmt->execute();

        $stmt->closeCursor();

        // execute the second query to get customer's level
        $row = $dbConn->query("SELECT @existe AS existe")->fetch(PDO::FETCH_ASSOC);
        $resultado = $row['existe'];
        return $resultado;
        
    } catch (PDOException $e) {
        die("Error occurred 1:" . $e->getMessage());
  }
 }

 ?>