
<?php
    header("Access-Control-Allow-Origin: *");
    echo 1;
/*   
include_once('config.php');

Registrar($nombreUsuario,$contrasena);
 function Registrar($nombreUsuario, $contrasena){
     try{
     global $dbConn;
        // calling stored procedure command
        $sql = 'CALL verificarUsuario(:nombreUsuario,@existe);';

        // prepare for execution of the stored procedure
        $stmt = $dbConn->prepare($sql);

        // pass value to the command
        $stmt->bindParam(':nombreUsuario', $nombreUsuario, PDO::PARAM_STR);

        // execute the stored procedure
        $stmt->execute();

        $stmt->closeCursor();

        // execute the second query to get customer's level
        $row = $dbConn->query("SELECT @existe AS existe")->fetch(PDO::FETCH_ASSOC);
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
       
        }
    } catch (PDOException $e) {
        die("Error occurred 1:" . $e->getMessage());
  }
    return 1;
 }
 */

 ?>

