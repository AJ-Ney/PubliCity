<?php

require_once '../model/noticia/noticia.entidad.php';
require_once '../model/noticia/noticia.modelo.php';

$E = new NoticiaE();
$M = new NoticiaM();
if(isset($_POST['titulo'])){
        date_default_timezone_set('UTC');
        date_default_timezone_set("America/Lima");
        $img = $_POST['titulo'].date('dmy').date('his');
        $dir='../resource/img/';
        $E->__SET('titulo',$_POST['titulo']);
        $E->__SET('subtitulo',$_POST['subtitulo']);
        $E->__SET('categoria',$_POST['categoria']);
        $E->__SET('image',$dir.$img.'.jpg');
        $E->__SET('descripcion',$_POST['descripcion']);
        $E->__SET('redactor',$_POST['redactor']);
        $M->Registrar($E);
        
        $file_upload = $dir.$img.".jpg";
        if(move_uploaded_file($_FILES['image']['tmp_name'],$file_upload)){
            echo"se subio";
            echo($_FILES['image']['tmp_name'].' '.$file_upload);
        }else{
            echo "no se subio";
        }
}
if(isset($_GET['accion'])){

    if($_GET['accion']=='listar'){
        $data = $M->Listar();
        foreach($data as $row){
            echo '<section class="banner">';
                echo '<img src="'.substr($row->image,3).'" alt="">';
                echo '<div class="contenedortexto">';
                    echo '<a data-id="'.$row->id.'" href="#modal" id="linknoticia">';
                        echo '<h2>'.$row->titulo.'</h2>';
                        echo '<p>'.$row->subtitulo.'</p>';
                        echo '<p class="redactor">&nbsp;&nbsp;&nbsp;&nbsp;'.$row->redactor.'</p>';
                        echo '<p class="publicado">Publicado el:'.$row->created_at.'<span><i>&nbsp;&nbsp;&nbsp;&nbsp;Leidas: '.$row->nvisitas.'</i></span>'.'</p>';
                    echo '</a>';
                echo '</div>';
            echo '</section>';
        }
    }//Fin listar

    if($_GET['accion']=='vernoticia'){
        echo json_encode($M->verNoticia($_GET['id']));
    }

    if($_GET['accion']=='verobservar'){
        echo json_encode($M->observarNoticia($_GET['id']));
    }

    if($_GET['accion']=='listarData'){
        $data=$M->noticiasListar();
        $c=1;
        foreach($data as $row){
            if($row->updated_at==""){
                $modificado = "Aun no se ha modificado.";
            }else{
                $modificado = $row->updated_at;
            }
            echo

                '<tr>'.
                    '<td class="text-center">'.$c++.'</td>'.
                    '<td>'.substr($row->titulo,0,15).'...'.'</td>'.
                    '<td>'.substr($row->subtitulo,0,15).'...'.'</td>'.
                    '<td>'.substr($row->descripcion,0,15).'...'.'</td>'.
                    '<td>'.substr($row->redactor,0,15).'...'.'</td>'.
                    '<td class="text-center">'.$row->created_at.'</td>'.
                    '<td class="text-center">'.$modificado.'</td>'.
                    '<td class="text-center">'.$row->nvisitas.'</td>'.
                    '<td>
                    <div class="imagen"><img src="./'.$row->image.'" alt=""></div>
                    </td>'.
                    '<td class="centro">
                    <a href="#modal" class="modificar" data-id="'.$row->id.'" title="Modificar"><i class="fa fa-edit text-primary"></i></a>
                    <a href="#" class="eliminar" data-id="'.$row->id.'" title="Eliminar"><i class="fas fa-trash-alt text-danger"></i></a>
                    </td>'.
                '</tr>'
                ;
        }
    }    

    if($_GET['accion']=='modificar'){
        $E->__SET('id',$_GET['id']);
        $E->__SET('titulo',$_GET['titulo']);
        $E->__SET('subtitulo',$_GET['subtitulo']);
        $E->__SET('categoria',$_GET['categoria']);
        $E->__SET('descripcion',$_GET['descripcion']);
        $E->__SET('redactor',$_GET['redactor']);
        $M->Modificar($E);
    }

    if($_GET['accion']=='eliminar'){
        $E->__SET('id', $_GET['id']);
        $M->Eliminar($E);
    }
}//fin isset = accion
?>