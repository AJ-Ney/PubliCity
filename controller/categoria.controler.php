<?php

require_once "../model/categoria/categoria.entidad.php";
require_once "../model/categoria/categoria.modelo.php";


$E = new CategoriaE();
$M = new CategoriaM();

if(isset($_POST['accion'])){

    if($_POST["accion"]=="cboCategoria"){
        $data = $M->Listar();
		foreach ($data as $row) {
				echo '<option value="'.$row->id.'">'.$row->categoria.'</option>';
		}
    }
}



?>