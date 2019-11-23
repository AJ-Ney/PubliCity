CREATE DATABASE dbmodulo03;
USE dbmodulo03;
CREATE TABLE tb_categorias(
id 			INT AUTO_INCREMENT NOT NULL,
categoria	VARCHAR(50) NOT NULL,
CONSTRAINT pk_idcategoria PRIMARY KEY(id),
CONSTRAINT uq_categoria UNIQUE(categoria)
)ENGINE=INNODB CHARSET=utf8;

CREATE TABLE tb_noticias(
id 			INT AUTO_INCREMENT NOT NULL,
categoria	INT NOT NULL,
titulo		VARCHAR(150) NOT NULL,
image			MEDIUMBLOB NULL,
subtitulo	VARCHAR(100) NULL,
descripcion	TEXT NOT NULL,
redactor		VARCHAR(50) NOT NULL,
nvisitas		INT NOT NULL,
created_at	DATE NOT NULL,
updated_at 	DATE NULL,
estado		CHAR(1),
CONSTRAINT pk_idnoticias PRIMARY KEY (id),
CONSTRAINT fk_idcategoria FOREIGN KEY(categoria) REFERENCES tb_categorias(id),
CONSTRAINT uq_titulo UNIQUE (titulo)
)ENGINE=INNODB CHARSET=utf8;