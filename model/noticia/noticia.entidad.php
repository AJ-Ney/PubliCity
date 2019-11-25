<?php

    class NoticiaE{
        private $id;
        private $categoria;
        private $titulo;
        private $image;
        private $subtitulo;
        private $descripcion;
        private $redactor;
        private $nvisitas;
        private $created_at;
        private $update_at;
        private $estado;
        
        public function __GET($campo){
            return $this->$campo;
        }
        public function __SET($campo, $value){
            $this->$campo = $value;
        }
    }

?>