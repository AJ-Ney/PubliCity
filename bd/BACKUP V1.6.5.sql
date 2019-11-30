/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.24 : Database - dbmodulo03
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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

/*Data for the table `tb_categorias` */

insert  into `tb_categorias`(`id`,`categoria`) values (1,'Arte'),(3,'Deporte'),(4,'Entretenimiento'),(2,'Politica'),(5,'Productividad'),(7,'Sociedad'),(6,'TecnologÃ­a');

/*Table structure for table `tb_noticias` */

DROP TABLE IF EXISTS `tb_noticias`;

CREATE TABLE `tb_noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `image` text,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tb_noticias` */

insert  into `tb_noticias`(`id`,`categoria`,`titulo`,`image`,`subtitulo`,`descripcion`,`redactor`,`nvisitas`,`created_at`,`updated_at`,`estado`) values (1,5,'222222222222222','../resource/img/rwerewr301119052444.jpg','ewrewrerewr','<p>ewrewrewrerewrew</p>','rewrewrwrwere',1,'2019-11-30','2019-11-30','0'),(2,7,'titulo 01',NULL,'sub titulo 01','<p>descripcion 02</p>','redactor 01',0,'2019-11-30',NULL,'0'),(3,1,'111111111111111111111111',NULL,'ewrewrerewrrewrewreererer','<p>ewrewrewrerewrewwerwerewrewrrewrerere</p>','rewrewrwrwereewrewrewrerr33434',0,'2019-11-30',NULL,'0'),(5,1,'La masacre en SENATI','../resource/img/Prueba 001301119060444.jpg','Más de 100 alumnos internados en el hospital, tras enterarse de sus notas','<p><s><em><u>sadadsadsadsadsadsad</u></em></s></p>','AJ.',2,'2019-11-30','2019-11-30','1'),(6,5,'fdsfdsfds','../resource/img/fdsfdsfds301119060614.jpg','fdsfdsf','<p>dsfsdfsdfdsfdsfsdfdsf</p>','dfsdfdsfdsfd',1,'2019-11-30',NULL,'1');

/* Procedure structure for procedure `sp_categoria_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_categoria_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_listar`()
begin
	select * from tb_categorias order by id desc;
end */$$
DELIMITER ;

/* Procedure structure for procedure `sp_categoria_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_categoria_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_registrar`(`_categoria` VARCHAR(50))
BEGIN
INSERT INTO tb_categorias (categoria) VALUES (categoria);
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_noticias_eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticias_eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_eliminar`(IN `_id` INT)
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
SELECT * FROM `v_noticias` */$$
DELIMITER ;

/* Procedure structure for procedure `sp_noticias_modificar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticias_modificar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_modificar`(IN `_id` INT, IN `_categoria` INT, IN `_titulo` VARCHAR(150), IN `_subtitulo` VARCHAR(100), IN `_descripcion` TEXT, IN `_redactor` VARCHAR(50))
BEGIN
UPDATE tb_noticias SET
	categoria = _categoria,
	titulo = _titulo,
	subtitulo = _subtitulo,
	descripcion = _descripcion,
	redactor = _redactor,
	updated_at = curdate()
	WHERE id = _id;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_noticias_mostrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticias_mostrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_mostrar`()
BEGIN
SELECT id, categoria, titulo, image, subtitulo, descripcion, redactor, nvisitas, created_at FROM tb_noticias WHERE estado =1 order by nvisitas desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_noticias_registrar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticias_registrar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_registrar`(IN `_categoria` INT, IN `_titulo` VARCHAR(150), IN `_image` MEDIUMBLOB, IN `_subtitulo` VARCHAR(100), IN `_descripcion` TEXT, IN `_redactor` VARCHAR(50))
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

/* Procedure structure for procedure `sp_noticia_observar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticia_observar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticia_observar`(IN `_id` INT)
BEGIN
SELECT categoria, titulo, image, subtitulo, descripcion, redactor, nvisitas, created_at FROM tb_noticias WHERE id=_id and estado =1 order by nvisitas desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_noticia_ver` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticia_ver` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticia_ver`(IN `_id` INT)
BEGIN
update tb_noticias set
	nvisitas=nvisitas+1
where id=_id;
SELECT categoria, titulo, image, subtitulo, descripcion, redactor, nvisitas, created_at FROM tb_noticias WHERE id=_id and estado =1 order by nvisitas desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_vistas_suma` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_vistas_suma` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vistas_suma`(IN `_id` INT)
BEGIN
UPDATE tb_noticias SET
	nvisitas=nvisitas+1
	WHERE id = _id and estado = 1;
END */$$
DELIMITER ;

/*Table structure for table `v_noticias` */

DROP TABLE IF EXISTS `v_noticias`;

/*!50001 DROP VIEW IF EXISTS `v_noticias` */;
/*!50001 DROP TABLE IF EXISTS `v_noticias` */;

/*!50001 CREATE TABLE  `v_noticias`(
 `id` int(11) ,
 `categoria` varchar(50) ,
 `titulo` varchar(150) ,
 `subtitulo` varchar(100) ,
 `descripcion` text ,
 `redactor` varchar(50) ,
 `created_at` date ,
 `updated_at` date ,
 `nvisitas` int(11) ,
 `image` text 
)*/;

/*View structure for view v_noticias */

/*!50001 DROP TABLE IF EXISTS `v_noticias` */;
/*!50001 DROP VIEW IF EXISTS `v_noticias` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_noticias` AS select `n`.`id` AS `id`,`c`.`categoria` AS `categoria`,`n`.`titulo` AS `titulo`,`n`.`subtitulo` AS `subtitulo`,`n`.`descripcion` AS `descripcion`,`n`.`redactor` AS `redactor`,`n`.`created_at` AS `created_at`,`n`.`updated_at` AS `updated_at`,`n`.`nvisitas` AS `nvisitas`,`n`.`image` AS `image` from (`tb_noticias` `n` join `tb_categorias` `c` on((`c`.`id` = `n`.`categoria`))) where (`n`.`estado` = 1) order by `n`.`id` desc */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
