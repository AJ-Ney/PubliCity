<?php

require_once '../model/noticia/noticia.entidad.php';
require_once '../model/noticia/noticia.modelo.php';

$E = new NoticiaE();
$M = new NoticiaM();

if(isset($_POST['accion'])){
    if($_POST['accion']=='listar'){
        $data = $M->Listar();
        foreach($data as $row){
            echo '<section class="banner">';
                echo '<img src="'.$row->image.'" alt="">';
                echo '<div class="contenedortexto">';
                    echo '<a data-id="'.$row->id.'" href="#" id="linknoticia">';
                        echo '<h2>'.$row->titulo.'</h2>';
                        echo '<p>'.$row->subtitulo.'</p>';
                        echo '<p class="redactor">&nbsp;&nbsp;&nbsp;&nbsp;'.$row->redactor.'</p>';
                        echo '<p class="publicado">'.$row->created_at.'<span><i>&nbsp;&nbsp;&nbsp;&nbsp;Leidas: '.$row->nvisitas.'</i></span>'.'</p>';
                    echo '</a>';
                echo '</div>';
            echo '</section>';
        }
    }//Fin listar

    if($_POST['accion']=='vernoticia'){
		echo json_encode($M->verNoticia($_GET['id']));
	}
}//fin isset = accion

?>