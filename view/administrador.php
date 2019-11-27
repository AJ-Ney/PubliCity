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
    <link rel="stylesheet" href="./../lib/datatable/css/datatables.min.css">
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
                  <table class="table-bordered" id="datable" width="80%" cellspacing="0">
                    <thead class="text-center">
                      <tr>
                        <th>1</th>
                        <th>2</th>
                        <th>3</th>
                        <th>4</th>
                        <th>5</th>
                        <th>6</th>
                        <th>7</th>
                        <th>8</th>
                        <th>9</th>
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
    <script src="./../lib/datatable/js/datatables.min.js"></script>
    
</body>
</html>