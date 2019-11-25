<?php

class CategoriaE{

    private $id;
    private $categoria;


    public function __GET($campo){
        return $this->$campo;
    }
    public function __SET($campo, $value){
        $this->$campo = $value;
    }
}

?>