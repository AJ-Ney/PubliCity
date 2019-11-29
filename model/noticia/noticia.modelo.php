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
            $stmt=$this->pdo->prepare(("call sp_noticia_ver(?)"));
            $stmt->execute(array($id));
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
            $tmp_name = $obj->__GET('image');
            $rutagurd = './../resource/img/';
            $rutalec = '';
            move_uploaded_file('titulo',$rutagurd);
            $stmt=$this->pdo->prepare("call sp_noticias_registrar(?,?,?,?,?,?)");
            $stmt->execute(array(
                $obj->__GET('categoria'),
                trim($obj->__GET('titulo')),
                $ruta,
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