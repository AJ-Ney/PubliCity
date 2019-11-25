<?php

class Conexion
{
	private  $dsn='mysql:host=localhost;dbname=dbmodulo03;charset=utf8';
	private  $user='root';
	private  $password='';

	public function Conectar()
	{
		try {
			$pdo=new PDO($this->dsn,$this->user,$this->password);
			$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			return $pdo;
		} catch (PDOException $e) {
			die($e->getMessage());
		}
	}
	
}
?>