<?php include './lib/include/header.php'; ?> 
<body>
    <main id="noticias">
    <!-- Noticias desde la mas vista a la menos -->
    </main>
    
    <?php
        include 'lib/include/footer.php';
    ?>
    <aside id="modal" class="modal">
        <div class="content-modal">
            <header class="header-modal">
                <a href="#" class="close-modal">X</a>
                <h2>PubliCity</h2>
            </header>
            <hr>
            <article>
                <!-- contenido -->
                <div class="cont-text">
                    <h2 id="titulo-modal"></h2>
                    <h4 id="subtitulo-modal"></h4>
                </div>
                <div class="contenidonoticia">
                    <p>
                    <img class="img-noti" id="img-modal" src="" alt="Noticia">
                    
                    </p>
                </div>
            </article>
            <hr>
            <footer>
                <p class="redactor">
                &nbsp;&nbsp;&nbsp;&nbsp;
                </p>
                <p class="publicado">
                    
                    &nbsp;&nbsp;
                    <span><i id="views"></i></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </p>
                <!-- final del modal -->
            </footer>
        </div>
    </aside>
    <?php 
        include 'lib/include/footer.file.php';
    ?>
    <script src="admin/noticias.js"></script>

    
</body>
</html>