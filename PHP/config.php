<?php
//ini_set('display_errors','off');
$databaseHost = 'mysql.hostinger.com';
$databaseName = 'u327793104_hd';
$databaseUsername = 'u327793104_hd';
$databasePassword = 'HD12345';

try {
	// http://php.net/manual/en/pdo.connections.php
	$dbConn = new PDO("mysql:host={$databaseHost};dbname={$databaseName}", $databaseUsername, $databasePassword);
	$dbConn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Setting Error Mode as Exception
	// More on setAttribute: http://php.net/manual/en/pdo.setattribute.php
} catch(PDOException $e) {
	echo $e->getMessage();
}

?>
