$(document).ready(function(){
    var id='';
    Listar();
    $("#linknoticia").click(function(){
        alert('asdsadasdasd');
        id=$(this).attr('data-id');
        /* $.aja({
            url:'./controller/noticia.controller.php',
            type:'POST',
            data:'accion=vernoticia&id='+id,
            success:function(rpta){
                var datos = JSON.parse(rpta);
                alert(datos);
            }
        }) */
    })
});

function Listar(){
    $.ajax({
        url:'./controller/noticia.controller.php',
        type:'POST',
        data:'accion=listar',
        success:function(rpta){
            $('#noticias').html(rpta);
        }
    })
}