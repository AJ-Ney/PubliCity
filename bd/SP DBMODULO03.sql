USE dbmodulo03;
DELIMITER $$
CREATE PROCEDURE sp_categoria_registrar(
_categoria	VARCHAR(50)
)
BEGIN
INSERT INTO tb_categorias (categoria) VALUES (categoria);
END $$

DELIMITER $$
CREATE PROCEDURE sp_noticias_registrar(
IN _categoria	INT,
IN _titulo VARCHAR(150),
IN _image	MEDIUMBLOB,
IN _subtitulo VARCHAR(100),
IN _descripcion TEXT,
IN _redactor VARCHAR(50)
)
BEGIN
INSERT INTO tb_noticias(categoria, 
								titulo, 
								image, 
								subtitulo, 
								descripcion,
								redactor, 
								created_at,
								estado) 
					VALUES ( _categoria, 
								_titulo, 
								_image, 
								_subtitulo, 
								_descripcion,
								_redactor,
								CURDATE(),
								1);
END $$

DELIMITER $$
CREATE PROCEDURE sp_noticias_listar()
BEGIN
SELECT categoria, titulo, image, subtitulo, descripcion, redactor, nvisitas, creadted_at AS 'Publicado' FROM tb_noticias WHERE estado = 1;
END $$

DELIMITER $$
CREATE PROCEDURE sp_noticias_modificar(
IN _id INT,
IN _categoria	INT,
IN _titulo VARCHAR(150),
IN _image	MEDIUMBLOB,
IN _subtitulo VARCHAR(100),
IN _descripcion TEXT,
IN _redactor VARCHAR(50)
)BEGIN
UPDATE tb_noticias SET
	categoria = _categoria,
	titulo = _titulo,
	image = _image,
	subtitulo = _subtitulo,
	descripcion = _descripcion,
	redactor = _redactor
	WHERE id = _id;
END $$

DELIMITER $$
CREATE PROCEDURE sp_noticias_eliminar(
IN _id INT
)BEGIN
UPDATE tb_noticias SET
	estado = 0
	WHERE id=_id;
END $$


DELIMITER $$
CREATE PROCEDURE sp_vistas_suma(
)BEGIN
UPDATE tb_noticias SET
	nvisita=nvisita+1
	WHERE estado = 1;
END $$





























