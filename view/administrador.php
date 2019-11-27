<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./../lib/css/estilos.modal.css">
    <link rel="stylesheet" href="./../lib/css/header.css">
    <link rel="stylesheet" href="./../lib/css/body.css">
    <link rel="stylesheet" href="./../lib/css/footer.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="./../lib/fontawesome/css/all.css"> 
    <title>PubliCity</title>
    
</head>
<header class="cabezera">
		<div class="contenedorheader">
			<h1 class="logo"><a href="#">PubliCity</a></h1>
		</div>
</header>

<body>
    
<section class="rows">
            <div class="card shadow border border-bottom-success">
              <div class="card-header">
                <h3 class="text-center"></h3>
              </div>
              <div class="card-body">
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
                        <th>Administrar</th>
                    </tr>
                    </thead>
                    <tbody id="data"></tbody>
                  </table>
                </section>
              </div>
            </div>
          </section>
    


    <?php include './../lib/include/footer.php' ?>
    <script src="./../lib/jquery/jquery-3.4.1.min.js"></script>
    <script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="./../lib/fontawesome/js/all.js"></script>
    <script src="./../admin/administrador.js"></script>
    
</body>
</html>