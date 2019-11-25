<?php

    require_once '../core/core.php';

    class CategoriaM extends Core{
        private $pdo;

        public function __CONSTRUCT(){
            return $this->pdo=parent::getConexion();
        }

        public function Listar(){
            try {
                $stmt=$this->pdo->prepare("CALL sp_categoria_listar()");
                $stmt->execute();
                return $stmt->fetchAll(PDO::FETCH_OBJ);
            } catch (Exception $th) {
                die($th->getMessage());
            }
        }
    }

?>