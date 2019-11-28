<?php

require_once "../model/categoria/categoria.entidad.php";
require_once "../model/categoria/categoria.modelo.php";


$E = new CategoriaE();
$M = new CategoriaM();

if(isset($_GET['accion'])){

    if($_GET["accion"]=="cboCategoria"){
        $data = $M->Listar();
		foreach ($data as $row) {
				echo '<option value="'.$row->id.'">'.$row->categoria.'</option>';
		}
    }
}



?>