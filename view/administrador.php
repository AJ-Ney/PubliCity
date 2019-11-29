<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="./../lib/fontawesome/css/all.css">
    <link rel="stylesheet" href="./../lib/css/estilos.modal.css">
    <link rel="stylesheet" href="./../lib/css/header.css">
    <link rel="stylesheet" href="./../lib/css/body.css">
    <link rel="stylesheet" href="./../lib/css/footer.css">
    <link rel="stylesheet" href="./../lib/css/estilosDataTable.css">
    <link rel="stylesheet" href="./../lib/css/estilos.modal.registros.css">
    <link rel="stylesheet" href="./../lib/css/form.css">
    <title>PubliCity</title>
    
</head>
<header class="cabezera">
		<div class="contenedorheader">
      <div class="cont-logo"><h1 class="logo"><a href="#">PubliCity</a></h1></div>
      <div class="nav">
      <a href="#modal">Nueva noticia</a>
      <a href="#">Ver noticias</a>
      </div>
    </div>
</header>

<body>
    
  <section class="main">      
        <section class="table-responsive">
          <table class="table-bordered" id="datable" width="100%" cellspacing="0">        
            <thead class="text-center">                
              <tr>
                <th>N°</th>
                <th>Titulo</th>
                <th>Sub-Titulo</th>
                <th>Descripción</th>
                <th>Redactor</th>
                <th>Publicado</th>
                <th>Modificado</th>
                <th>Vistas</th>
                <th>Imagen</th>
                <th>Administrar</th>
              </tr>
            </thead>        
            <tbody id="data"></tbody>        
          </table>       
  </section>        <br><br>
                  
  </section>  
    
  <aside id="modal" class="modal">
        <div class="content-modal">
            <header class="header-modal">
              <div class="d">
                <a href="#" class="close-modal">X</a>
                <h2>Nueva noticia</h2>
              </div>
            </header>
            <hr>
            <article>
                <!-- Datos ha registrar -->
                <div class="contenedor1">
                  <div class="cont-R-titulo">
                    <label for="titulo">Titulo</label>
                    <input id="titulo" name="titulo" type="text">
                  </div>
                  <div class="cont-R-subtitulo">
                    <label for="subtitulo">Sub-Titulo</label>
                    <input id="subtitulo" name="subtitulo" type="text">
                  </div>
                  <div class="cont-R-categori">
                    <label for="categoria">Categoria</label>
                    <select name="categoria" id="categoria">
                      <!-- Categorias vargar dinamica -->
                    </select>
                  </div>
                  <div class="cont-R-imagen">
                    <label for="imagen-file">Subir imagen</label>
                    <input id="imagen-file" name="imagen-file" type="file">
                  </div>
                  <div class="cont-R-descripcion">
                    <textarea name="descripcion" id="descripcion" cols="30" rows="10"></textarea>
                  </div>
                  <div class="cont-R-redactor">
                    <label for="">Redactor</label>
                    <input id="redactor" name="redactor" type="text">
                  </div>
                </div>
            </article>
            <footer id="probando">
                <div class="cont-botones">
                  <div class="boton-1">
                    <a class="botones" id="publicar" href="#">Publicar</a>
                  </div>
                  <div class="boton-2">
                    <a class="botones"  id="cancelar" href="#">Cancelar</a>
                  </div>
                </div>
            </footer>
        </div>
    </aside>

    <?php include './../lib/include/footer.php' ?>
    <script src="./../lib/jquery/jquery-3.4.1.min.js"></script>
    <script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="./../lib/fontawesome/js/all.js"></script>
    <script src="./../lib/ckeditor/ckeditor.js"></script>
    <script src="./../admin/administrador.js"></script>
    
</body>
</html>