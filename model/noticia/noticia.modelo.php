<?php
require_once '../core/core.php';

class NoticiaM extends Core{

    private $pdo;

    public function __CONSTRUCT(){
        return $this->pdo=parent::getConexion();
    }

    public function Listar(){
        try {
            $stmt=$this->pdo->prepare("call sp_noticias_listar");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_OBJ);
        } catch (Exception $th) {
            die($th->getMessage());
        }
    }

    public function verNoticia($id){
        try {
            $stmt=$this->pdo->prepare(("call sp_noticia_listar(?)"));
            $stmt->execute(array($id));
            return $stmt->fetch(PDO::FETCH_OBJ);
        } catch (\Throwable $th) {
            //throw $th;
        }
    }
    
    public function Registrar(NoticiaE $obj){
        try{
            $imagen = $obj->image=addslashes((file_get_contents($_FILES['imagen']['tmp_name'])));
            $stmt=$this->pdo->prepare("call sp_noticias_registrar(?,?,?,?,?,?)");
            $stmt->execute(array(
                $obj->__GET('categoria'),
                trim($obj->__GET('titulo')),
                $imagen,
                trim($obj->__GET('subtitulo')),
                trim($obj->__GET('descripcion')),
                trim($obj->__GET('redactor'))
            ));//Fin Exceute
        }catch(Exception $e){
            die($e->getMessage());
        }
    }

    public function Modificar(NoticiaE $obj){
        try {
            $stmt=$this->pdo->prepare("call sp_noticias_modificar(?,?,?,?,?,?,?)");
            $stmt->execute(array(
                $obj->__GET('id'),
                $obj->__GET('categoria'),
                trim($obj->__GET('titulo')),
                $obj->__GET('image'),
                trim($obj->__GET('subtitulo')),
                trim($obj->__GET('descripcion')),
                trim($obj->__GET('redactor'))
            ));//fin execute
        } catch (Exception $th) {
            die($th->getMessage());
        }
    }

    public function Eliminar(NoticiaE $obj){
        try {
            $stmt=$this->pdo->prepare('call sp_noticias_eliminar(?)');
            $stmt->execute(array(
                $obj->__GET('id')
            ));//fin excecute
        } catch (Exception $th) {
            die($th->getMessage());
        }
    }

    public function Contador(NoticiaE $obj){
        try {
            $stmt=$this->pdo->prepare('call sp_visitas_suma(?)');
            $stmt->execute(array(
                $obj->__GET('nvisitas')
            ));//Fin execute
        } catch (Exception $th) {
            die($th->getMessage());
        }
    }

}
?>