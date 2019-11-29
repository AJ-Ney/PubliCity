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
                echo '<img src="./'.$row->image.'" alt="">';
                echo '<div class="contenedortexto">';
                    echo '<a data-id="'.$row->id.'" href="#modal" id="linknoticia">';
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
    
    if($_POST['accion']=='listarData'){
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
                    '<td class="centro">'.$c++.'</td>'.
                    '<td>'.$row->titulo.'</td>'.
                    '<td>'.$row->subtitulo.'</td>'.
                    '<td>'.substr($row->descripcion,0,15).'...'.'</td>'.
                    '<td>'.$row->redactor.'</td>'.
                    '<td class="centro">'.$row->created_at.'</td>'.
                    '<td class="centro">'.$modificado.'</td>'.
                    '<td class="centro">'.$row->nvisitas.'</td>'.
                    '<td>
                    <div class="imagen"><img src="./../'.$row->image.'" alt=""></div>
                    </td>'.
                    '<td class="centro">
                    <a href="#" class="modificar" data-id="'.$row->id.'" title="Modificar"><i class="fa fa-edit text-primary"></i></a>
                    <a href="#" class="eliminar" data-id="'.$row->id.'" title="Eliminar"><i class="fas fa-trash-alt text-danger"></i></a>
                    </td>'.
                '</tr>'
                ;
        }
    }
    
    if($_POST["accion"]=="registrar"){
        date_default_timezone_set('UTC');
        date_default_timezone_set("America/Lima");
        $img = $_POST['titulo']."-".date('dmy')."-".date('his');

        $E->__SET('titulo',$_POST['titulo']);
        $E->__SET('subtitulo',$_POST['subtitulo']);
        $E->__SET('categoria',$_POST['categoria']);
        $E->__SET('image',$img);
        $E->__SET('descripcion',$_POST['descripcion']);
        $E->__SET('redactor',$_POST['redactor']);
        $M->Registrar($E);
        $dir='../resource/img/';
        $file_upload = $dir.$img."jpg";
        if(move_uploaded_file($_FILES['image']['tmp_name'],$file_upload)){
            echo"se subio";
        }else{
            echo "no se subio";
        }
    }
}//fin isset = accion
?>