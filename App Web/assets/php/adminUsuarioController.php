<?php
include_once('config.php');
$action = $_GET["action"];

switch ($action) {
    case 'add':
        $email = $_GET["email"];
        $password = $_GET["password"];
        addAdmin($email,$password);
        break;
    case 'getAll':
        getAllAdmins();
        break;
    case 'delete':
        $id = $_GET["id"];
        deleteAdmin($id);
        break;
    case 'edit':
        $id = $_GET["id"];
        $user  = $_GET["user"];
        $password  = $_GET["password"];
        editAdmin($id,$user,$password);
        break;
    case 'loguear':
        $user  = $_GET["user"];
        $password  = $_GET["password"];
        loguearAdmin($user,$password);
        break;

    default:
        break;
}
function loguearAdmin($user,$password){
    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL validarLogin(:user,:password);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':user',$user,PDO::PARAM_STR);
    $stmt->bindParam(':password',$password,PDO::PARAM_STR);
    $stmt->execute();
    $email = "";
    $id = "";
    $validUser=false;
    while ($row = $stmt->fetch()) {
        $validUser=true;
        $id = $row["usuarioID"];
        $email = $row["email"];
    }
    if($validUser){
        session_start();
        $_SESSION['email'] = $email;
        $_SESSION['id'] = $id;
        $ans->result = "logged";
    }else{
        $ans->result = "notLogged";
    }
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);
}
function editAdmin($id,$user,$password){
    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL updateAdministrador(:user,:password,:id);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':user',$user,PDO::PARAM_STR);
    $stmt->bindParam(':password',$password,PDO::PARAM_STR);
    $stmt->bindParam(':id',$id,PDO::PARAM_STR);
    $stmt->execute();
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);
}
function deleteAdmin($pid){
    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL deleteAdministrador(:id);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':id',$pid,PDO::PARAM_STR);
    $stmt->execute();
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);

}
function getAllAdmins(){
    global $dbConn;
    $ans=  new \stdClass();
    try{
        $sql = 'CALL getAdministradores();';
        $stmt = $dbConn->prepare($sql);
        $stmt->execute();
        $array = array();
        while ($row = $stmt->fetch()) {
            array_push($array,array("usuarioID"=>$row["usuarioID"],"contrasena"=>$row["contrasena"],"email"=>$row["email"]));
        }
        $ans->status="ok";
        $ans->items=$array;
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);
}
function addAdmin($pEmail,$pPassword){

    global $dbConn;
    $ans=  new \stdClass();
    try{
    $sql = 'CALL insertAdministrador(:pCorreoElectronico,:contrasena);';
    $stmt = $dbConn->prepare($sql);
    $stmt->bindParam(':pCorreoElectronico',$pEmail,PDO::PARAM_STR);
    $stmt->bindParam(':contrasena',$pPassword,PDO::PARAM_STR);
    $stmt->execute();
    $ans->status = "ok";
    } catch (PDOException $e) {
        $ans->status = "error";
    }
    echo json_encode($ans);

}


?>
