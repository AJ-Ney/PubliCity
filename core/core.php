<?php
require_once '../config/conexion.php';
/**
* 
*/
class Core 
{
	// private $pdo;

	public function getConexion()
	{
		try {
			$conexion=new Conexion();
			$pdo=$conexion->Conectar();
			$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			return $pdo;
		} catch (Exception $e) {
			echo $e->getMessage();
		}
	}
}

?>