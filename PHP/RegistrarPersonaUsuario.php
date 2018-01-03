<?php
include_once('config.php');
header("Access-Control-Allow-Origin: *");

 function RegistrarPersonaUsuario($nombre, $apellido1, $apellido2,$email,$contrasena){
     try{
     global $dbConn;
        // calling stored procedure command
        $sql = 'CALL sp_Insertar_PersonaUsuario(:nombre,:apellido1,:apellido2,:contrasena,:email, @existe);';

        // prepare for execution of the stored procedure
        $stmt = $dbConn->prepare($sql);

        // pass value to the command
        $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->bindParam(':apellido1', $apellido1, PDO::PARAM_STR);
        $stmt->bindParam(':apellido2', $apellido2, PDO::PARAM_STR);
        $stmt->bindParam(':contrasena', $contrasena, PDO::PARAM_STR);
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);

        // execute the stored procedure
        $stmt->execute();

        $stmt->closeCursor();

        $row = $dbConn->query("SELECT @existe AS ultimo")->fetch(PDO::FETCH_ASSOC);
        $resultado = $row['ultimo'];

        if ($resultado > 1) {
            session_start();
            $_SESSION['username'] = u;
            echo '<script language="javascript">alert('+ u +');</script>';
        }


        return $resultado;

        // execute the second query to get customer's level
        /*$row = $dbConn->query("SELECT @existe AS existe")->fetch(PDO::FETCH_ASSOC);
        if ($row['existe']== "FALSE") {
            
            return -1;

        }
        else{
            $sql = 'CALL registrarUsuario(:nombreUsuario,:contrasena);';
        
            // prepare for execution of the stored procedure
            $stmt = $dbConn->prepare($sql);
        
            // pass value to the command
            $stmt->bindParam(':nombreUsuario', $nombreUsuario, PDO::PARAM_STR);
            
            $stmt->bindParam(':contrasena', $contrasena, PDO::PARAM_STR);
        
            // execute the stored procedure
            $stmt->execute();
        
            $stmt->closeCursor();
       
        }*/
    } catch (PDOException $e) {
        die("Error occurred 1:" . $e->getMessage());
  }
    return 1;
 }
 ?>