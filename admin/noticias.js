$(document).ready(function(){
    var id='';
    Listar();
    $("#noticias").on("click","a[id=linknoticia]",function(){
        id=$(this).attr('data-id');
        $.ajax({
            url:'./controller/noticia.controller.php',
            type:'GET',
            data:'accion=vernoticia&id='+id,
            success:function(rpta){
                console.log(datos = JSON.parse(rpta));
                $("#titulo-modal").html(datos.titulo);
                $("#subtitulo-modal").html(datos.subtitulo);
                $(".contenidonoticia").html(datos.descripcion+'<img class="img-noti"; id="img-modal" src="'+datos.image+'" alt="Noticia">');
            }
        })
    })
});

function Listar(){
    $.ajax({
        url:'./controller/noticia.controller.php',
        type:'GET',
        data:'accion=listar',
        success:function(rpta){
            $('#noticias').html(rpta);
        }
    })
}