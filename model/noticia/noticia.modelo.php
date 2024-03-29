<?php
require_once '../core/core.php';

class NoticiaM extends Core{

    private $pdo;

    public function __CONSTRUCT(){
        return $this->pdo=parent::getConexion();
    }
    /* Usuario */
    public function Listar(){
        try {
            $stmt=$this->pdo->prepare("call sp_noticias_mostrar");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_OBJ);
        } catch (Exception $th) {
            die($th->getMessage());
        }
    }

    public function verNoticia($id){
        try {
            /* Ver noticia */
            $stmt=$this->pdo->prepare("call sp_noticia_ver(?)");
            $stmt->execute(array($id));
            /* Sumar visita */
            return $stmt->fetch(PDO::FETCH_OBJ);
        } catch (Exception $th) {
            die($th->getMessage());
        }
    }
    public function observarNoticia($id){
        try {
            /* Ver noticia */
            $stmt=$this->pdo->prepare("call sp_noticia_observar(?)");
            $stmt->execute(array($id));
            /* Sumar visita */
            return $stmt->fetch(PDO::FETCH_OBJ);
        } catch (Exception $th) {
            die($th->getMessage());
        }
    }
    /* Administrador */
    public function noticiasListar(){
        try{
            $stmt=$this->pdo->prepare("call sp_noticias_listar");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_OBJ);
        }catch (Exception $e){
            die($e->getMessage());
        }
    }
    
    public function Registrar(NoticiaE $obj){
        try{
            $stmt=$this->pdo->prepare("call sp_noticias_registrar(?,?,?,?,?,?)");
            $stmt->execute(array(
                $obj->__GET('categoria'),
                trim($obj->__GET('titulo')),
                $obj->__GET('image'),
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
            $stmt=$this->pdo->prepare("call sp_noticias_modificar(?,?,?,?,?,?)");
            $stmt->execute(array(
                $obj->__GET('id'),
                $obj->__GET('categoria'),
                trim($obj->__GET('titulo')),
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


}
?>