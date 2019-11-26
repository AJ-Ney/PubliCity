/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.3.14-MariaDB : Database - dbmodulo03
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

insert  into `tb_categorias`(`id`,`categoria`) values (1,'Arte'),(3,'Deporte'),(4,'Entretenimiento'),(2,'Politica'),(5,'Productividad'),(7,'Sociedad'),(6,'Tecnología');

/*Table structure for table `tb_noticias` */

DROP TABLE IF EXISTS `tb_noticias`;

CREATE TABLE `tb_noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `image` text DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `tb_noticias` */

insert  into `tb_noticias`(`id`,`categoria`,`titulo`,`image`,`subtitulo`,`descripcion`,`redactor`,`nvisitas`,`created_at`,`updated_at`,`estado`) values (1,1,'Titulo1','.\\resource\\img\\1.jpg','Subtitulo1','Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!','redactor1',10,'2019-11-25',NULL,'1'),(2,2,'Titulo2','.\\resource\\img\\2.jpg','Subtitulo2','Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!','redactor2',10,'2019-11-25',NULL,'1'),(3,3,'Titulo3','.\\resource\\img\\3.jpg','Subtitulo3','Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!','redactor3',0,'2019-11-25',NULL,'1'),(4,4,'Titulo4','.\\resource\\img\\4.jpg','Subtitulo4','Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!','redactor4',0,'2019-11-25',NULL,'1'),(5,5,'Titulo5','.\\resource\\img\\57.jpg','Subtitulo5','Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!','redactor5',26,'2019-11-25',NULL,'1'),(6,6,'Titulo6','.\\resource\\img\\1.jpg','Subtitulo6','Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!','redactor6',0,'2019-11-25',NULL,'1'),(7,7,'Titulo7','.\\resource\\img\\1.jpg','Subtitulo7','Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!','redactor7',10,'2019-11-25',NULL,'1');

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
SELECT id, categoria, titulo, image, subtitulo, descripcion, redactor, nvisitas, created_at FROM tb_noticias WHERE estado =1 order by nvisitas desc;
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

/* Procedure structure for procedure `sp_noticia_listar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_noticia_listar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticia_listar`(
in _id int
)
BEGIN
SELECT categoria, titulo, image, subtitulo, descripcion, redactor, nvisitas, created_at FROM tb_noticias WHERE id=_id and estado =1 order by nvisitas desc;
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
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
