$("document").ready(function(){
    var objDescripcion = CKEDITOR.replace('descripcion',{
        toolbar: [
            { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
            { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
            { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
            { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
            '/',
            { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
            { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
            { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
            { name: 'insert', items: ['HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
            '/',
            { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
            { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
            { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
            { name: 'others', items: [ '-' ] },
            { name: 'about', items: [ 'About' ] }
        ]
    });
    Listar();
    cCategoria();
    $("#publicar").click(function(){
        var forData = new FormData
        var img = $("#imagen-file").prop("files");
        var datos = {
            'accion':'registrar',
            'titulo':$("#titulo").val(),
            'subtitulo':$("#subtitulo").val(),
            'categoria':$("#categoria").val(),
            'image':img['tmp_name', 'name'],
            'descripcion':objDescripcion.getData(),
            'redactor':$("#redactor").val()
        }
        $.ajax({
            url:'./../controller/noticia.controller.php',
            type:'GET',
            data:datos,
            success:function(rpta){
                console.log(rpta);
            }
        })
    })/* Fin registro */
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
function cCategoria(){
    $.ajax({
        url:'./../controller/categoria.controler.php',
        type:'GET',
        data:'accion=cboCategoria',
        success:function(rpta){
            $("#categoria").html('<option value="">Selecciona una...</option>'+rpta);
        }
    })
}