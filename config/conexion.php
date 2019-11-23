<?php
#PDO - 3 TIPOS CLASES 
#PDO -> conexion con la base de datos
#PDOStatement -> Trabajar con las consultas transact - CRUD
#PDOException -> Tema de manejo de errores (3 tipos)
/**
 * Creado por Jesus Flores -- 25 de junio del 2019
 */
class Conexion
{
	#dsn data source name : nombre de origen de datos
	private  $dsn='mysql:host=localhost;dbname=dbsgi;charset=utf8';
	private  $user='root';
	private  $password='';

	public function Conectar()
	{
		try {
			#instanciando en el objeto $pdo la clase PDO
			$pdo=new PDO($this->dsn,$this->user,$this->password);
			#manejo de errores
			$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			#retornamos la conexion
			return $pdo;
		} catch (PDOException $e) {
			die($e->getMessage());
		}
	}
	
}
?>