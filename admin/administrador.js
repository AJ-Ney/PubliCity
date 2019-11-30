$("document").ready(function(){
    var objDescripcion = CKEDITOR.replace('descripcion');
    Listar();
    cCategoria();
    var id="";
    $("#publicar").click(function(){
        if(id>0){
            var datos = {
                'accion':'modificar',
                'id':id,
                'titulo':$("#titulo").val(),
                'subtitulo':$("#subtitulo").val(),
                'categoria':$("#categoria").val(),
                'descripcion':objDescripcion.getData(),
                'redactor':$("#redactor").val()
            }
            $.ajax({
                url:'../controller/noticia.controller.php',
                type:'GET',
                data:datos,
                success:function(e){
                    id="";
                }
            })
        }else{
            var datos = new FormData();
            datos.append("titulo",$("#titulo").val());
            datos.append("subtitulo",$("#subtitulo").val());
            datos.append("categoria",$("#categoria").val());
            datos.append("image",$("#imagen-file")[0].files[0]);
            datos.append("descripcion",objDescripcion.getData());
            datos.append("redactor",$("#redactor").val());
            $.ajax({
                url:'../controller/noticia.controller.php',
                type:'POST',
                data:datos,
                contentType:false,
                processData:false,
                cache:false,
                success:function(e){
                    
                }
            })
        }
    })/* Fin registro */

    $("#datable").on("click","a[class=modificar]",function(){
        /* Asignando el id a la variable para evaluarla */
        id=$(this).attr('data-id');
        $.ajax({
			url : '../controller/noticia.controller.php',
			type: 'GET',
			data: 'accion=verobservar&id='+id,
			success:function(rpta){
				var datos=JSON.parse(rpta);
                $("#titulo").val(datos.titulo);
                $("#subtitulo").val(datos.subtitulo);
                $("#categoria").val(datos.categoria);
                $("#imagne-file").val(datos.image);
                $("#descripcion").val(objDescripcion.setData(datos.descripcion));
                $("#redactor").val(datos.redactor);
			}
		})

    })
    $("#datable").on("click","a[class=eliminar]",function(){
        id=$(this).attr('data-id');
        $.ajax({
            url:'../controller/noticia.controller.php',
            type:'GET',
            data:'accion=eliminar&id='+id,
            success:function(rpta){
                alert("se ha eliminado");
            }
        })
    })
});
function Listar(){
    $.ajax({
        url:'../controller/noticia.controller.php',
        type:'GET',
        data:'accion=listarData',
        success:function(rpta){
            var table = $('#datable').DataTable();
            table.destroy();
            $('#data').html(rpta);
            $('#datable').DataTable();
        }
    })
}
function cCategoria(){
    $.ajax({
        url:'../controller/categoria.controler.php',
        type:'GET',
        data:'accion=cboCategoria',
        success:function(rpta){
            $("#categoria").html('<option value="">Selecciona una...</option>'+rpta);
        }
    })
}