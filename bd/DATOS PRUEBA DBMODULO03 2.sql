CALL sp_noticias_registrar(1,'Titulo1','','Subtitulo1','descripcion1','redactor1');
CALL sp_noticias_registrar(2,'Titulo2','','Subtitulo2','descripcion2','redactor2');
CALL sp_noticias_registrar(3,'Titulo3','','Subtitulo3','descripcion3','redactor3');
CALL sp_noticias_registrar(4,'Titulo4','','Subtitulo4','descripcion4','redactor4');
CALL sp_noticias_registrar(5,'Titulo5','','Subtitulo5','descripcion5','redactor5');
CALL sp_noticias_registrar(6,'Titulo6','','Subtitulo6','descripcion6','redactor6');
CALL sp_noticias_registrar(7,'Titulo7','','Subtitulo7','descripcion7','redactor7');

CALL sp_noticias_listar();

CALL sp_vistas_suma(7);