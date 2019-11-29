$("document").ready(function(){
    var objDescripcion = CKEDITOR.replace('descripcion');
    Listar();
    cCategoria();
    
    $("#publicar").click(function(){
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
    })/* Fin registro */
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