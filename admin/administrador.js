$("document").ready(function(){
    Listar();
});
function Listar(){
    $.ajax({
        url:'./../controller/noticia.controller.php',
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