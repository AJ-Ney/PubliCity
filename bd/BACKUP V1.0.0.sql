/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.7.26 : Database - dbmodulo03
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbmodulo03` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbmodulo03`;

/*Table structure for table `tb_categorias` */

DROP TABLE IF EXISTS `tb_categorias`;

CREATE TABLE `tb_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_noticias` */

DROP TABLE IF EXISTS `tb_noticias`;

CREATE TABLE `tb_noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `image` mediumblob,
  `subtitulo` varchar(100) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `redactor` varchar(50) NOT NULL,
  `nvisitas` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_titulo` (`titulo`),
  KEY `fk_idcategoria` (`categoria`),
  CONSTRAINT `fk_idcategoria` FOREIGN KEY (`categoria`) REFERENCES `tb_categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/* Procedure structure for procedure `sp_categoria_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_categoria_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_registrar`(
_categoria	VARCHAR(50)
)
BEGIN
INSERT INTO tb_categorias (categoria) VALUES (categoria);
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_noticias_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticias_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_eliminar`(
IN _id INT
)
BEGIN
UPDATE tb_noticias SET
	estado = 0
	WHERE id=_id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_noticias_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticias_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_listar`()
BEGIN
SELECT categoria, titulo, image, subtitulo, descripcion, redactor, nvisitas, created_at AS 'Publicado' FROM tb_noticias WHERE estado =1 order by nvisitas desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_noticias_modificar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticias_modificar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_modificar`(
IN _id INT,
IN _categoria	INT,
IN _titulo VARCHAR(150),
IN _image	MEDIUMBLOB,
IN _subtitulo VARCHAR(100),
IN _descripcion TEXT,
IN _redactor VARCHAR(50)
)
BEGIN
UPDATE tb_noticias SET
	categoria = _categoria,
	titulo = _titulo,
	image = _image,
	subtitulo = _subtitulo,
	descripcion = _descripcion,
	redactor = _redactor
	WHERE id = _id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_noticias_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticias_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_registrar`(
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
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_vistas_suma` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_vistas_suma` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vistas_suma`(
in _id int
)
BEGIN
UPDATE tb_noticias SET
	nvisitas=nvisitas+1
	WHERE id = _id and estado = 1;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
