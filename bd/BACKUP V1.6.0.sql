-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-11-2019 a las 16:36:24
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbmodulo03`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_categoria_listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_listar` ()  begin
	select * from tb_categorias order by id desc;
end$$

DROP PROCEDURE IF EXISTS `sp_categoria_registrar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_registrar` (`_categoria` VARCHAR(50))  BEGIN
INSERT INTO tb_categorias (categoria) VALUES (categoria);
END$$

DROP PROCEDURE IF EXISTS `sp_noticias_eliminar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_eliminar` (IN `_id` INT)  BEGIN
UPDATE tb_noticias SET
	estado = 0
	WHERE id=_id;
END$$

DROP PROCEDURE IF EXISTS `sp_noticias_listar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_listar` ()  SELECT * FROM `v_noticias`$$

DROP PROCEDURE IF EXISTS `sp_noticias_modificar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_modificar` (IN `_id` INT, IN `_categoria` INT, IN `_titulo` VARCHAR(150), IN `_image` MEDIUMBLOB, IN `_subtitulo` VARCHAR(100), IN `_descripcion` TEXT, IN `_redactor` VARCHAR(50))  BEGIN
UPDATE tb_noticias SET
	categoria = _categoria,
	titulo = _titulo,
	image = _image,
	subtitulo = _subtitulo,
	descripcion = _descripcion,
	redactor = _redactor
	WHERE id = _id;
END$$

DROP PROCEDURE IF EXISTS `sp_noticias_mostrar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_mostrar` ()  BEGIN
SELECT id, categoria, titulo, image, subtitulo, descripcion, redactor, nvisitas, created_at FROM tb_noticias WHERE estado =1 order by nvisitas desc;
END$$

DROP PROCEDURE IF EXISTS `sp_noticias_registrar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticias_registrar` (IN `_categoria` INT, IN `_titulo` VARCHAR(150), IN `_image` MEDIUMBLOB, IN `_subtitulo` VARCHAR(100), IN `_descripcion` TEXT, IN `_redactor` VARCHAR(50))  BEGIN
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
END$$

DROP PROCEDURE IF EXISTS `sp_noticia_ver`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_noticia_ver` (IN `_id` INT)  BEGIN
SELECT categoria, titulo, image, subtitulo, descripcion, redactor, nvisitas, created_at FROM tb_noticias WHERE id=_id and estado =1 order by nvisitas desc;
END$$

DROP PROCEDURE IF EXISTS `sp_vistas_suma`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vistas_suma` (IN `_id` INT)  BEGIN
UPDATE tb_noticias SET
	nvisitas=nvisitas+1
	WHERE id = _id and estado = 1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categorias`
--

DROP TABLE IF EXISTS `tb_categorias`;
CREATE TABLE IF NOT EXISTS `tb_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_categorias`
--

INSERT INTO `tb_categorias` (`id`, `categoria`) VALUES
(1, 'Arte'),
(3, 'Deporte'),
(4, 'Entretenimiento'),
(2, 'Politica'),
(5, 'Productividad'),
(7, 'Sociedad'),
(6, 'Tecnología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_noticias`
--

DROP TABLE IF EXISTS `tb_noticias`;
CREATE TABLE IF NOT EXISTS `tb_noticias` (
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
  KEY `fk_idcategoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tb_noticias`
--

INSERT INTO `tb_noticias` (`id`, `categoria`, `titulo`, `image`, `subtitulo`, `descripcion`, `redactor`, `nvisitas`, `created_at`, `updated_at`, `estado`) VALUES
(1, 1, 'Titulo1', '.\\resource\\img\\1.jpg', 'Subtitulo1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!', 'redactor1', 10, '2019-11-25', NULL, '1'),
(2, 2, 'Titulo2', '.\\resource\\img\\2.jpg', 'Subtitulo2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!', 'redactor2', 10, '2019-11-25', NULL, '1'),
(3, 3, 'Titulo3', '.\\resource\\img\\3.jpg', 'Subtitulo3', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!', 'redactor3', 0, '2019-11-25', NULL, '1'),
(4, 4, 'Titulo4', '.\\resource\\img\\4.jpg', 'Subtitulo4', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!', 'redactor4', 0, '2019-11-25', NULL, '1'),
(5, 5, 'Titulo5', '.\\resource\\img\\57.jpg', 'Subtitulo5', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!', 'redactor5', 26, '2019-11-25', NULL, '1'),
(6, 6, 'Titulo6', '.\\resource\\img\\1.jpg', 'Subtitulo6', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!', 'redactor6', 0, '2019-11-25', NULL, '1'),
(7, 7, 'Titulo7', '.\\resource\\img\\1.jpg', 'Subtitulo7', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis illo officia eveniet. Velit aliquid natus excepturi. Deserunt aut itaque neque! Provident cum odio maxime molestiae suscipit expedita quod natus exercitationem!\r\n                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae aliquam sequi ex? Facilis voluptates vero blanditiis voluptatem? Reiciendis incidunt maiores eos labore sit at dolores quaerat tempora ducimus rerum?\r\n                    Delectus, quibusdam. Laudantium dolores cumque corrupti animi quo error sequi, unde excepturi optio molestiae eligendi deserunt corporis quis hic, reprehenderit, eveniet pariatur eaque ut perspiciatis vel voluptas! Aperiam, vitae tempore?\r\n                    Ratione quo architecto atque ab officia blanditiis earum dolore aspernatur veniam deserunt itaque eveniet non est hic dolorem id, quidem magnam debitis incidunt? Sit neque obcaecati beatae velit accusantium perspiciatis!', 'redactor7', 10, '2019-11-25', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_noticias`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `v_noticias`;
CREATE TABLE IF NOT EXISTS `v_noticias` (
`id` int(11)
,`categoria` varchar(50)
,`titulo` varchar(150)
,`subtitulo` varchar(100)
,`descripcion` text
,`redactor` varchar(50)
,`created_at` date
,`updated_at` date
,`nvisitas` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_noticias`
--
DROP TABLE IF EXISTS `v_noticias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_noticias`  AS  select `n`.`id` AS `id`,`c`.`categoria` AS `categoria`,`n`.`titulo` AS `titulo`,`n`.`subtitulo` AS `subtitulo`,`n`.`descripcion` AS `descripcion`,`n`.`redactor` AS `redactor`,`n`.`created_at` AS `created_at`,`n`.`updated_at` AS `updated_at`,`n`.`nvisitas` AS `nvisitas` from (`tb_noticias` `n` join `tb_categorias` `c` on((`c`.`id` = `n`.`categoria`))) order by `n`.`id` desc ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_noticias`
--
ALTER TABLE `tb_noticias`
  ADD CONSTRAINT `fk_idcategoria` FOREIGN KEY (`categoria`) REFERENCES `tb_categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
