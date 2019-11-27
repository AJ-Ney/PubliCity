<?php include './lib/include/header.php'; ?> 
<body>
    <main id="noticias">
    <!-- Noticias desde la mas vista a la menos -->
    </main>
    
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
                    <h2 id="titulo-modal">Titulo 1</h2>
                    <h4 id="subtitulo-modal">Subtituli Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla omnis unde, voluptate, nisi beatae dolores veritatis iusto earum ducimus recusandae ulla</h4>
                </div>
                <div class="contenidonoticia">
                    <img class="img-noti" id="img-modal" src="https://i.ytimg.com/vi/n4RMu7CZ5ow/maxresdefault.jpg" alt="Noticia">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?
                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?
                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!
                </div>
            </article>
            <hr>
            <footer>
                <p class="redactor">
                &nbsp;&nbsp;&nbsp;&nbsp;Redactor 1
                </p>
                <p class="publicado">
                    Publicado el: 24/11/2019
                    &nbsp;&nbsp;
                    <span><i id="views">Leidas:</i></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </p>
                <!-- final del modal -->
            </footer>
        </div>
    </aside>


    <?php 
        include 'lib/include/footer.php';
        include 'lib/include/footer.file.php';
    ?>
    <script src="admin/noticias.js"></script>

    
</body>
</html>