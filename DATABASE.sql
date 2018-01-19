-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 19-01-2018 a las 05:33:04
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u327793104_hd`
--
CREATE DATABASE IF NOT EXISTS `u327793104_hd` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `u327793104_hd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BITACORA`
--

CREATE TABLE `BITACORA` (
  `bitacoraID` int(11) NOT NULL,
  `nombreComun` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombreCientifico` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `lugar` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacionFuste` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacionHoja` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacionSemilla` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacionFlor` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacionExtra` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_personaID` int(11) DEFAULT NULL,
  `flagFavorito` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_giraID` int(11) DEFAULT NULL,
  `f_especieID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `BITACORA`
--

INSERT INTO `BITACORA` (`bitacoraID`, `nombreComun`, `nombreCientifico`, `fecha`, `lugar`, `observacionFuste`, `observacionHoja`, `observacionSemilla`, `observacionFlor`, `observacionExtra`, `f_personaID`, `flagFavorito`, `f_giraID`, `f_especieID`) VALUES
(1, 'Corteza Amarilla', 'Tabebuia ochracea', '2018-01-03 00:00:00', 'Rincón de Zaragoza, Palmares, Alajuela', 'Frondoso', 'Hoja con bordes irregulares', 'Fruto grande y semi-amarillo', 'Gran numero de flores de un amarillo intenso, ver foto', 'No aplica', 1, '0', 1, 8),
(2, 'Saura Aromática', 'Saurauia aromatica', '2018-01-09 00:00:00', 'Bajo Rodriguez', 'Leñoso', 'Con variaciones en las puntas', 'No posee ', 'Conjuntos de flores en grupos de 5', 'Ninguna', 1, '0', 3, 1),
(3, 'Hidnotria', 'Hydnotrya tulasnei', '2018-01-09 00:00:00', 'La tigra, San Carlos', 'Corteza gruesa ', 'No posee', 'No posee', 'Vino, con hojas modificadas', 'Ninguna', 7, '1', 3, 2),
(4, 'Licaria', 'Licaria Aubl', '2018-01-07 00:00:00', 'Bosque del Niño', 'Leñoso delgado', 'Ovalada ', 'Fruto verde con semilla en el interior', 'Blanca, pequeña ', 'Se encontraba un grupo de 6 plantas juntas', 1, '0', 3, 3),
(5, 'Dillenia', 'Dillenia L', '2018-01-05 00:00:00', 'Reserva ManualAlberto Brenes', 'Delgado marron', 'Alargadas con canales profundos', 'Fruto verde compuesto por capas', 'Blanca con un grupo de panteras amarillas', 'Ninguna', 7, '1', 4, 6),
(6, 'Eucalipto', 'Eucalyptus Greenery', '2018-01-08 00:00:00', 'La granja, Palmares, Alajuela', 'Fuste con manchas blancas y verdosas ', 'Hoja Bicolor', 'No posee', 'No posee', 'Ninguna', 1, '0', 5, 7),
(16, 'Licaria', 'Licaria Aubl', '2018-01-13 00:00:00', 'Latitud: 9.952395 & Longitud: -84.1394969', '    Fuerte y verde', '    Alargada con espenas\r\n    ', '   Seco y amargo', '    Vibrente color verde ', '    Un especimen inmaduro', 1, '0', 5, 3),
(17, 'saura aromática', 'Saurauia aromatica', '2018-01-13 13:00:07', 'Latitud: 9.9523877 & Longitud: -84.1394925', 'Fuste', 'Hoja', 'Fruto', 'Flor    ', ' Extra', 1, '1', 5, 1),
(22, 'Eucalipto', 'Eucalyptus Greenery', '2018-01-13 21:49:30', 'Latitud: 9.9523476 & Longitud: -84.13944140000001, Poasito', '    Verde', '    \r\n    Alargada', '    Dulce', '    Amarilla', '    Espinas', 1, '0', 5, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CARACTERISTICA`
--

CREATE TABLE `CARACTERISTICA` (
  `caracteristicaID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resumen` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagenURL` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_especieID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `CARACTERISTICA`
--

INSERT INTO `CARACTERISTICA` (`caracteristicaID`, `nombre`, `resumen`, `imagenURL`, `f_especieID`) VALUES
(1, 'Ascocarpos', 'Presentan formas irregulares', 'https://sites.google.com/site/hongoshipogeos/_/rsrc/1303813625553/home/2---caracteristicas/peridio/Elaphomyces-muricatus.jpg', 2),
(2, 'peridio', 'liso o ligeramente escamoso', 'https://4.bp.blogspot.com/-e4lgnLvNXUI/WZ1n0c0553I/AAAAAAAAOxc/qEtKo_JTPbwzYh_U8o7pfnrjBeP1AzPOgCLcBGAs/s1600/Tuber%2Bnitidum%2B%2BVitta..jpg', 2),
(3, 'gleba', 'hueca', 'https://sites.google.com/site/hongoshipogeos/_/rsrc/1305202311049/home/2---caracteristicas/gleba/Genea-verrucosa-Masa-BU-%289%29.jpg', 2),
(4, 'ornamentación', 'varía de espinas a verrugas', 'https://sites.google.com/site/hongoshipogeos/_/rsrc/1303296428508/home/2---caracteristicas/peridio/Tuber-aestivum-%285%29A.jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ESPECIE`
--

CREATE TABLE `ESPECIE` (
  `especieID` int(11) NOT NULL,
  `pubescencia` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yemaFloral` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombreComun` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombreCientifico` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagenURL` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_procedenciaID` int(11) DEFAULT NULL,
  `f_generoID` int(11) DEFAULT NULL,
  `f_familiaID` int(11) DEFAULT NULL,
  `f_saviaColorID` int(11) DEFAULT NULL,
  `f_saviaTexturaID` int(11) DEFAULT NULL,
  `f_formaHojaID` int(11) DEFAULT NULL,
  `f_posicionHojaID` int(11) DEFAULT NULL,
  `f_ubicacionID` int(11) DEFAULT NULL,
  `f_florColorID` int(11) DEFAULT NULL,
  `f_florSimetriaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ESPECIE`
--

INSERT INTO `ESPECIE` (`especieID`, `pubescencia`, `yemaFloral`, `nombreComun`, `nombreCientifico`, `descripcion`, `imagenURL`, `f_procedenciaID`, `f_generoID`, `f_familiaID`, `f_saviaColorID`, `f_saviaTexturaID`, `f_formaHojaID`, `f_posicionHojaID`, `f_ubicacionID`, `f_florColorID`, `f_florSimetriaID`) VALUES
(1, 'sí', 'no', 'saura aromática', 'Saurauia aromatica', 'descripcion de la Saurauia aromatica', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Saurauia_madrensis_2.jpg/220px-Saurauia_madrensis_2.jpg', 1, 1, 1, 2, 3, 1, 1, 4, 1, 1),
(2, 'sí', 'no', 'Hidnotrialia', 'Hydnotrya tulasnei', 'Descripción de la Hydnotrya tulasnei ', 'https://sites.google.com/site/hongoshipogeos/_/rsrc/1472762501096/ascomycetes/hydnotrya-tulasnei-berk-berk-broome/Hydnotrya-tulasnei-03-a.jpg', 1, 2, 3, 2, 1, 2, 2, 2, 1, 2),
(3, 'sí', 'sí', 'Licaria', 'Licaria Aubl', 'descripcion de la Licaria Aubl.  ', 'http://lauraceae.myspecies.info/sites/lauraceae.myspecies.info/files/Licaria_spec_JR53468.jpg', 2, 1, 4, 3, 2, 1, 4, 3, 1, 2),
(6, 'sí', 'sí', 'Dillenia', 'Dillenia L', 'descripcion de la Dillenia L  ', 'http://www.photomazza.com/IMG/jpg_I_frutti_della_Dillenia_indica_derivano_dall_ingrossamento_di_15-20_ovari_con_sepali_carnosi_persistenti_c_Mazza.jpg', 2, 3, 4, 4, 2, 5, 4, 5, 4, 3),
(7, 'sí', 'sí', 'Eucalipto', 'Eucalyptus Greenery', 'descripcion del Eucalyptus Greenery  ', 'https://www.fiftyflowers.com/site_files/FiftyFlowers/Image/Product/Baby-Eucalyptus-closeup-500_a055444e.jpg', 1, 4, 1, 2, 3, 2, 1, 1, 1, 2),
(8, 'sí', 'sí', 'Corteza Amarilla', 'Tabebuia ochracea', 'Descripción de Tabebuia ochracea', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Ip%C3%AA_amarelo_Tabebuia_Goi%C3%A2nia.jpg/240px-Ip%C3%AA_amarelo_Tabebuia_Goi%C3%A2nia.jpg', 1, 1, 2, 1, 1, 1, 1, 5, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FAMILIA`
--

CREATE TABLE `FAMILIA` (
  `familiaID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_procedenciaID` int(11) DEFAULT NULL,
  `f_ubicacionID` int(11) DEFAULT NULL,
  `f_posicionHojaID` int(11) DEFAULT NULL,
  `f_formaHojaID` int(11) DEFAULT NULL,
  `f_florColorID` int(11) DEFAULT NULL,
  `f_florSimetriaID` int(11) DEFAULT NULL,
  `f_saviaColorID` int(11) DEFAULT NULL,
  `f_saviaTexturaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `FAMILIA`
--

INSERT INTO `FAMILIA` (`familiaID`, `nombre`, `f_procedenciaID`, `f_ubicacionID`, `f_posicionHojaID`, `f_formaHojaID`, `f_florColorID`, `f_florSimetriaID`, `f_saviaColorID`, `f_saviaTexturaID`) VALUES
(1, 'ACANTHACEAE', 1, 6, 4, 4, 5, 2, 4, 5),
(2, 'familia2', 2, 1, 4, 3, 4, 3, 5, 3),
(3, 'familia3', 1, 4, 5, 3, 5, 2, 4, 2),
(4, 'familia4', 1, 5, 3, 3, 5, 1, 3, 3),
(5, 'familia5', 2, 4, 5, 3, 3, 2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FLORCOLOR`
--

CREATE TABLE `FLORCOLOR` (
  `florColorID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `FLORCOLOR`
--

INSERT INTO `FLORCOLOR` (`florColorID`, `nombre`) VALUES
(1, 'blanca'),
(2, 'roja'),
(3, 'amarilla'),
(4, 'violeta'),
(5, 'morada'),
(6, 'azul');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FLORSIMETRIA`
--

CREATE TABLE `FLORSIMETRIA` (
  `florSimetriaID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `FLORSIMETRIA`
--

INSERT INTO `FLORSIMETRIA` (`florSimetriaID`, `nombre`) VALUES
(1, 'actinomorfa'),
(2, 'cigomorfa'),
(3, 'asimetrica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FORMAHOJA`
--

CREATE TABLE `FORMAHOJA` (
  `formaHojaID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `FORMAHOJA`
--

INSERT INTO `FORMAHOJA` (`formaHojaID`, `nombre`) VALUES
(1, 'formahoja1'),
(2, 'formahoja2'),
(3, 'formahoja3'),
(4, 'formahoja4'),
(5, 'formahoja5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FOTOPORBITACORA`
--

CREATE TABLE `FOTOPORBITACORA` (
  `FotoID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlServer` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_bitacoraID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `FOTOPORBITACORA`
--

INSERT INTO `FOTOPORBITACORA` (`FotoID`, `nombre`, `urlServer`, `descripcion`, `f_bitacoraID`) VALUES
(1, 'flor.jpg', 'http://static.panoramio.com/photos/large/73528394.jpg', 'Conjunto de flores', 1),
(2, 'arbor.jpg', 'https://cdn.crhoy.net/wp-content/uploads/2014/04/P1080408.jpg', 'Arbol', 1),
(3, 'imag_01', 'http://www.abcviajes.com/turismo/images/718_1_flores%20de%20corteza%20amarilla.jpg', 'Es un árbol caducifolio, de hasta 15 m de altura. Sus flores son amarillas claras con líneas rojas en el cuello. La floración se produce dos veces al año en abril y en diciembre y es cuando el árbol ha perdido sus hojas, quedando muy vistoso. El fruto son cápsulas largas y cilíndricas de 1,5 a 3 dm de largo que maduran entre mayo a junio, adquieren color pardo oscuro y las semillas son aladas y pequeñas, varios cientos de ellas por cápsula.\r\n\r\nMadera pardo oscura, pesada y resistente, fuerte y tenaz con una textura fina o mediana. Es difícil de trabajarla tiende a astillarse, pero toma un buen lijado.', 1),
(4, 'saurea.jpg', 'https://cdn.elnougarden.com/tienda/plantas/aromaticas/tomillo-limon-aurea-thymus-citriodorus-aurea/image_1_large', 'Conjuto de hojas', 2),
(5, 'sau.jpg', 'http://www.viverolosmaitenes.com.ar/catalogo/images/aromaticas/oregano_aurea.jpg', NULL, 2),
(6, 'h.jpg', 'http://www.biodiversidadvirtual.org/hongos/data/media/8816/Hydnotrya-tulasnei-(Berk.)-Berk.-y-Broome-108043.jpg', NULL, 3),
(7, 'hidrio.jpg', 'http://mycoweb.narod.ru/fungi/Submitted/SAE/Hydnotrya_tulasnei_1_3_SAE_20080723.jpg', NULL, 3),
(8, 'sds3.jpg', 'https://static.inaturalist.org/photos/2183980/medium.jpg?1444785557', 'Grupo de flores', 4),
(9, '24.jpg', 'http://unibio.unam.mx/irekani/bitstream/123456789/49119/1/70761_S1_HJ1_20130612_001_001.jpg', 'Conjunto de hojas', 4),
(10, 'ytrewq.jpg', 'https://i.ytimg.com/vi/Sxg2YK0y2DA/hqdefault.jpg', 'Fruto', 5),
(11, 'qwerty.jpg', 'https://www.exotic-plants.de/auktionsbilder/Dillenia_indica1.jpg', 'Flor', 5),
(12, 'ddfdf.jpg', 'https://4.bp.blogspot.com/-_a3oLQ_wj4I/Wc9U34qNqfI/AAAAAAABIjw/CVeAsQgR9O8mrk9ASCHzkdVDhosUTt7iQCEwYBhgL/s1600/como-conservar-ramas-eucalipto.jpg', 'Hojas', 6),
(13, 'kmskms.jpg', 'http://4.bp.blogspot.com/_Yhr7v9jaBbc/TGQjtLkVQFI/AAAAAAAAAA4/vp0L4WO3TX8/s1600/eucalyptus-gunnii-hojas.jpg', NULL, 6),
(15, NULL, 'http://herbariodigital.xyz/AppMovil/images/1515834154book.png', NULL, NULL),
(16, NULL, 'http://herbariodigital.xyz/AppMovil/images/1515834154edit.png', NULL, NULL),
(17, NULL, 'http://herbariodigital.xyz/AppMovil/images/1515865316Laur_RF_7522.jpg', NULL, 16),
(18, NULL, 'http://herbariodigital.xyz/AppMovil/images/1515865316licaria_misantlae_4052_01.jpg', NULL, 16),
(19, NULL, 'http://herbariodigital.xyz/AppMovil/images/1515865316original.jpeg', NULL, 16),
(20, NULL, 'http://herbariodigital.xyz/AppMovil/images/1515870007saurauia_gigantifolia.jpg', NULL, 17),
(21, NULL, 'http://herbariodigital.xyz/AppMovil/images/1515901770eucalipto-thumb2.jpg', NULL, 22),
(22, NULL, 'http://herbariodigital.xyz/AppMovil/images/1515901770eucalipto.png', NULL, 22),
(23, NULL, 'http://herbariodigital.xyz/AppMovil/images/1516137526DILENIA.jpeg', NULL, NULL),
(24, NULL, 'http://herbariodigital.xyz/AppMovil/images/1516137526images (1).jpeg', NULL, NULL),
(25, NULL, 'http://herbariodigital.xyz/AppMovil/images/1516137526images.jpeg', NULL, NULL),
(26, NULL, 'http://herbariodigital.xyz/AppMovil/images/1516150317DILENIA.jpeg', NULL, NULL),
(27, NULL, 'http://herbariodigital.xyz/AppMovil/images/1516150317images (1).jpeg', NULL, NULL),
(28, NULL, 'http://herbariodigital.xyz/AppMovil/images/1516150317images.jpeg', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GENERO`
--

CREATE TABLE `GENERO` (
  `generoID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_procedenciaID` int(11) DEFAULT NULL,
  `f_ubicacionID` int(11) DEFAULT NULL,
  `f_posicionHojaID` int(11) DEFAULT NULL,
  `f_formaHojaID` int(11) DEFAULT NULL,
  `f_florColorID` int(11) DEFAULT NULL,
  `f_florSimetriaID` int(11) DEFAULT NULL,
  `f_saviaColorID` int(11) DEFAULT NULL,
  `f_saviaTexturaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `GENERO`
--

INSERT INTO `GENERO` (`generoID`, `nombre`, `f_procedenciaID`, `f_ubicacionID`, `f_posicionHojaID`, `f_formaHojaID`, `f_florColorID`, `f_florSimetriaID`, `f_saviaColorID`, `f_saviaTexturaID`) VALUES
(1, 'genero1', 2, 3, 2, 4, 1, 3, 4, 2),
(2, 'genero2', 2, 6, 2, 4, 2, 3, 3, 3),
(3, 'genero3', 2, 5, 4, 3, 2, 2, 4, 3),
(4, 'genero4', 1, 1, 5, 3, 6, 3, 3, 2),
(5, 'genero5', 2, 6, 2, 5, 1, 3, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `GIRA`
--

CREATE TABLE `GIRA` (
  `giraID` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombreProfesor` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `lugar` varchar(2000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `GIRA`
--

INSERT INTO `GIRA` (`giraID`, `fecha`, `nombre`, `nombreProfesor`, `lugar`) VALUES
(1, '2018-01-03', 'Madre Verde', 'Gustavo Gutierrez', 'La Granja, Palmares, Alajuela'),
(2, '2017-12-01', 'Corcovado', 'Federico Herrera', 'Peninsula de Osa'),
(3, '2017-11-01', 'Bosque del Niño', 'Juan Carlos Gomez', 'Grecia'),
(4, '2017-10-01', 'Reserva Manuel Alberto Brenes', 'Miguel Rodriguez', 'San Ramón, Alajuela'),
(5, '2018-01-16', 'Reserva Poasito', 'Macarena Alegria', 'Poasito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `IMAGENBITACORA`
--

CREATE TABLE `IMAGENBITACORA` (
  `imagenBitacoraID` int(11) NOT NULL,
  `imagenURL` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_muestraBitacoraID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `IMAGENESEJEMLOS`
--

CREATE TABLE `IMAGENESEJEMLOS` (
  `imagenesEjemplosID` int(11) NOT NULL,
  `imagenURL` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_itemGlosarioID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `IMAGENESEJEMLOS`
--

INSERT INTO `IMAGENESEJEMLOS` (`imagenesEjemplosID`, `imagenURL`, `f_itemGlosarioID`) VALUES
(1, 'https://diseno-casa.com/wp-content/uploads/2017/05/Hojas-De-Arboles-Lesiones-En-Los-%C3%AD%C2%A1rboles-Contaminantes-Atmosf%C3%AD%C2%A9ricos.jpg', 1),
(2, 'https://diseno-casa.com/wp-content/uploads/2017/05/Hojas-De-Arboles-C%C3%AD%C2%B3mo-Hacer-Una-Cromatograf%C3%AD%C2%ADa-De-Hojas-De-%C3%AD%C2%A1rboles-Taringa.jpg', 1),
(3, 'https://t1.ev.ltmcdn.com/es/posts/7/8/4/img_identificar_arboles_a_partir_de_las_hojas_487_paso_6_600.jpg', 1),
(4, 'https://t2.ev.ltmcdn.com/es/posts/7/8/4/img_identificar_arboles_a_partir_de_las_hojas_487_paso_14_600.jpg', 1),
(5, 'http://conceptodefinicion.de/wp-content/uploads/2014/04/connado.jpg', 51),
(6, 'http://herbariodigital.xyz/AppWeb/assets/img/15156074765.jpg', NULL),
(7, 'http://herbariodigital.xyz/AppWeb/assets/img/15156074766.jpg', NULL),
(8, 'http://herbariodigital.xyz/AppWeb/assets/img/15156074767.jpg', NULL),
(9, 'http://herbariodigital.xyz/AppWeb/assets/img/15156074768.jpg', NULL),
(10, 'http://herbariodigital.xyz/AppWeb/assets/img/15156074769.jpg', NULL),
(11, 'http://herbariodigital.xyz/AppWeb/assets/img/15156092968.jpg', NULL),
(12, 'http://herbariodigital.xyz/AppWeb/assets/img/15156092969.jpg', NULL),
(13, 'http://herbariodigital.xyz/AppWeb/assets/img/151560929610.jpg', NULL),
(14, 'http://herbariodigital.xyz/AppWeb/assets/img/151560929611.jpg', NULL),
(15, 'http://herbariodigital.xyz/AppWeb/assets/img/15156097573.jpg', 269),
(16, 'http://herbariodigital.xyz/AppWeb/assets/img/15156097574.jpg', 269),
(17, 'http://herbariodigital.xyz/AppWeb/assets/img/15156097575.jpg', 269),
(18, 'http://herbariodigital.xyz/AppWeb/assets/img/15156097576.jpg', 269),
(19, 'http://herbariodigital.xyz/AppWeb/assets/img/15156097577.jpg', 269),
(20, 'http://herbariodigital.xyz/AppWeb/assets/img/15156097578.jpg', 269),
(21, 'http://herbariodigital.xyz/AppWeb/assets/img/15159008036.jpg', NULL),
(22, 'http://herbariodigital.xyz/AppWeb/assets/img/15159008037.jpg', NULL),
(23, 'http://herbariodigital.xyz/AppWeb/assets/img/15159008038.jpg', NULL),
(24, 'http://herbariodigital.xyz/AppWeb/assets/img/15159008039.jpg', NULL),
(25, 'http://herbariodigital.xyz/AppWeb/assets/img/151590080310.jpg', NULL),
(26, 'http://herbariodigital.xyz/AppWeb/assets/img/151590080311.jpg', NULL),
(27, 'http://herbariodigital.xyz/AppWeb/assets/img/15161369411 copy.jpg', 271),
(28, 'http://herbariodigital.xyz/AppWeb/assets/img/15161369411.jpg', 271),
(29, 'http://herbariodigital.xyz/AppWeb/assets/img/15161369412.jpg', 271),
(30, 'http://herbariodigital.xyz/AppWeb/assets/img/15161369413.jpg', 271),
(31, 'http://herbariodigital.xyz/AppWeb/assets/img/15161369414.jpg', 271);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `IMAGENESTIPOS`
--

CREATE TABLE `IMAGENESTIPOS` (
  `imagenesTiposID` int(11) NOT NULL,
  `imagenURL` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_itemGlosarioID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `IMAGENESTIPOS`
--

INSERT INTO `IMAGENESTIPOS` (`imagenesTiposID`, `imagenURL`, `f_itemGlosarioID`) VALUES
(1, 'https://t2.ev.ltmcdn.com/es/posts/7/8/4/img_identificar_arboles_a_partir_de_las_hojas_487_paso_14_600.jpg', 1),
(2, 'https://diseno-casa.com/wp-content/uploads/2017/05/Hojas-De-Arboles-C%C3%AD%C2%B3mo-Hacer-Una-Cromatograf%C3%AD%C2%ADa-De-Hojas-De-%C3%AD%C2%A1rboles-Taringa.jpg', 1),
(3, 'https://diseno-casa.com/wp-content/uploads/2017/05/Hojas-De-Arboles-Lesiones-En-Los-%C3%AD%C2%A1rboles-Contaminantes-Atmosf%C3%AD%C2%A9ricos.jpg', 1),
(4, 'https://t1.ev.ltmcdn.com/es/posts/7/8/4/img_identificar_arboles_a_partir_de_las_hojas_487_paso_6_600.jpg', 1),
(5, 'http://conceptodefinicion.de/wp-content/uploads/2014/04/connado.jpg', 51),
(6, 'http://herbariodigital.xyz/AppWeb/assets/img/15156074761.jpg', NULL),
(7, 'http://herbariodigital.xyz/AppWeb/assets/img/15156074762.jpg', NULL),
(8, 'http://herbariodigital.xyz/AppWeb/assets/img/15156074763.jpg', NULL),
(9, 'http://herbariodigital.xyz/AppWeb/assets/img/15156074764.jpg', NULL),
(10, 'http://herbariodigital.xyz/AppWeb/assets/img/151560747613.jpg', NULL),
(11, 'http://herbariodigital.xyz/AppWeb/assets/img/151560975711.jpg', 269),
(12, 'http://herbariodigital.xyz/AppWeb/assets/img/151560975712.jpg', 269),
(13, 'http://herbariodigital.xyz/AppWeb/assets/img/151560975713.jpg', 269),
(14, 'http://herbariodigital.xyz/AppWeb/assets/img/151560975714.jpg', 269),
(15, 'http://herbariodigital.xyz/AppWeb/assets/img/151560975715.jpg', 269),
(16, 'http://herbariodigital.xyz/AppWeb/assets/img/151560975716.jpg', 269),
(17, 'http://herbariodigital.xyz/AppWeb/assets/img/151560975717.jpg', 269),
(18, 'http://herbariodigital.xyz/AppWeb/assets/img/151560975718.jpg', 269),
(19, 'http://herbariodigital.xyz/AppWeb/assets/img/15159008036.jpg', NULL),
(20, 'http://herbariodigital.xyz/AppWeb/assets/img/15159008037.jpg', NULL),
(21, 'http://herbariodigital.xyz/AppWeb/assets/img/15159008038.jpg', NULL),
(22, 'http://herbariodigital.xyz/AppWeb/assets/img/15159008039.jpg', NULL),
(23, 'http://herbariodigital.xyz/AppWeb/assets/img/151590080310.jpg', NULL),
(24, 'http://herbariodigital.xyz/AppWeb/assets/img/151590080311.jpg', NULL),
(25, 'http://herbariodigital.xyz/AppWeb/assets/img/151590080312.jpg', NULL),
(26, 'http://herbariodigital.xyz/AppWeb/assets/img/151590080313.jpg', NULL),
(27, 'http://herbariodigital.xyz/AppWeb/assets/img/15161369419.jpg', 271),
(28, 'http://herbariodigital.xyz/AppWeb/assets/img/151613694110.jpg', 271),
(29, 'http://herbariodigital.xyz/AppWeb/assets/img/151613694111.jpg', 271),
(30, 'http://herbariodigital.xyz/AppWeb/assets/img/151613694112.jpg', 271),
(31, 'http://herbariodigital.xyz/AppWeb/assets/img/151613694113.jpg', 271);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ITEMGLOSARIO`
--

CREATE TABLE `ITEMGLOSARIO` (
  `itemGlosarioID` int(11) NOT NULL,
  `nombre` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `definicion` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ITEMGLOSARIO`
--

INSERT INTO `ITEMGLOSARIO` (`itemGlosarioID`, `nombre`, `definicion`) VALUES
(1, 'Abrazadora', 'Se refiere a la hoja que se prolonga en la base abrazando el tallo.'),
(2, 'Acodado', 'Doblada en ángulo.'),
(4, 'Acúleo', 'Protuberancia rígida y punzante, de origen epidérmico; sinónimo de aguijón.'),
(5, 'Acuminada', 'Hoja que se estrecha paulatinamente en un ápice alargado.'),
(6, 'Adpreso', 'Situado muy próximo, en paralelo, sin llegar a unirse.'),
(7, 'Aguijón', 'Protuberancias rígidas y punzantes en la epidermis de un órgano (tallo, hoja, etc.).'),
(9, 'Alterna', 'Referido a las hojas, cuando éstas se insertan en el tallo a distintos niveles, una en cada nudo.'),
(10, 'Amplexicaule', 'Referido a las hojas, cuando éstas abrazan por su base al tallo.'),
(11, 'Androceo', 'Conjunto de órganos masculinos de una flor: estambres.'),
(12, 'Angustisepta', 'Se dice de la silícula (fruto de las crucíferas), cuando el tabique que separa las dos valvas es perpendicular a su parte más ancha, como en Capsella bursa-pastoris.'),
(13, 'Antera', 'Parte apical del estambre, donde se encuentra el polen, dentro de los sacos polínicos.'),
(14, 'Antrorso', 'Dirigido hacia la parte apical del órgano al que se refiere.'),
(15, 'Anual', 'Plantas completan su ciclo en un año; sólo tienen tallos fértiles, portadores de flores o esporangios; ver terófito.'),
(16, 'Apical', 'Situado hacia la parte más alejada de donde se origina un órgano.'),
(17, 'Apice', 'Extremo de un órgano situado en el punto opuesto de donde se origina.'),
(18, 'Apiculado', 'Hoja que se estrecha bruscamente en el ápice.'),
(19, 'Aquenio', 'Fruto seco, monospermo e indehiscente, como los de la familia Compositae, también denominado cipsela.'),
(20, 'Araenosa', 'Cubierta de pelos largos y entrecruzados, de modo que recuerdan a la tela de una araña.'),
(21, 'Arista', 'Estructura linear, rígida que se inserta en diversas posiciones en las glumas y glumelas de las gramíneas.'),
(22, 'Articulado', 'Dividido en segmentos.'),
(23, 'Arvense', 'Planta que vive en los campos de cultivo.'),
(24, 'Aserrada', 'Con dientes en el margen al modo de una sierra.'),
(25, 'Asurcado', 'Con surcos a lo largo de las ramas o el tallo.'),
(26, 'Aurícula', 'Expansión lateral en la base de las hojas; son características las de las gramíneas y que junto a la lígula resultan útiles para su identificación en estado vegetativo.'),
(27, 'Axilar', 'Situado junto al punto de inserción de una hoja, bráctea o rama en el tallo.'),
(28, 'Basal', 'En la parte de debajo de un órgano.'),
(29, 'Baya', 'Fruto carnoso, indehiscente y polispermo; presenta el epicarpio delgado, y el mesocarpio y endocarpio carnosos.'),
(30, 'Bienal', 'Planta que necesita dos años para completar su ciclo; en el primero desarrollan un tallo con hojas y la raíz, y en el segundo el tallo con flores que producirán las semillas.'),
(31, 'Bilabiada', 'Corola o cáliz que presenta dispuestos los pétalos y sépalos en dos grupos, como los labios.'),
(32, 'Bráctea', 'Estructura laminar situada en la base de la inflorescencia; normalmente menores y más sencillas que las normales.'),
(33, 'Bracteola', 'órgano laminar, más sencillo que una hoja, que se sitúa en la base de una flor.'),
(34, 'Bulbo', 'Tallo subterráneo de reserva, carnoso; normalmente está formado por la base engrosada de hojas o escamas. En su parte interna se encuentra la yema apical y en su base desarrolla raíces adventicias.'),
(35, 'Cáliz', 'Verticilo floral formado por los sépalos.'),
(36, 'Caméfito', 'Planta con las yemas de recambio situadas hasta una altura 0,25 m; suelen ser pequeñas matas o herbáceas perennes.'),
(37, 'Canaliculado', 'Que forma una canaladura, como en la base de algunas hojas.'),
(38, 'Capítulo', 'Inflorescencia con el eje ensanchado en su extremo (receptáculo), donde se insertan las flores, rodeadas por brácteas (involucro). El conjunto es funcionalmente como una flor. Esta inflorescencia es característica de la familia Compositae. En el capítulo puede haber sólo flores flosculosas, sólo liguladas, o una combinación de flósculos en el centro del capítulo (disco) y lígulas en el exterior (radios).'),
(39, 'Cápsula', 'Fruto seco, polispermo y dehiscente derivado de la fusión de 2 o más carpelos; la dehiscencia puede ser por poros (poricida en Papaver), a lo largo de suturas (loculicida), etc..'),
(40, 'Carinado', 'Que al plegarse sobre sí mismo da lugar a un canto o cresta marcada.'),
(41, 'Cariópside', 'Fruto seco, monospermo e indehiscente en el que la cubierta seminal se suelda a la pared del gineceo. Es característico de la familia Gramineae.'),
(42, 'Carnoso', 'Fruto que presenta alguna parte del pericarpio carnosa.'),
(43, 'Carpelo', 'Hojas transformadas que componen el gineceo de las flores; cuando son varios pueden formar un sólo pistilo, con una o varias cavidades, o varios pistilos independientes.'),
(44, 'Ciatio', 'Inflorescencia que consta de 5 brácteas y 4-5 nectarios entorno a 5 flores masculinas reducidas a 1 estambre y una flor femenina central con gineceo tricarpelar. Es característico de las Euphorbiaceae.'),
(45, 'Cigomorfa', 'Que presenta un solo plano de simetría, como la flor de las violetas o los pensamientos.'),
(46, 'Cilio', 'Pelos rígidos y finos del margen de las hojas.'),
(47, 'Cima', 'Inflorescencia en la que el extremo de la rama florífera acaba en una flor y las restantes flores proceden de ramas laterales.'),
(48, 'Cipsela', 'Fruto característico de la familia Compositae; sinónimo de aquenio.'),
(49, 'Compuesta', 'Hoja con el limbo dividido en foliolos.'),
(50, 'Concrescente', 'Que se suelda con otro órgano.'),
(51, 'Connado', 'Muy próximos entre sí, aunque sin llegar a soldarse.'),
(52, 'Cordada', 'Con forma de corazón; acorazonada.'),
(53, 'Coriácea', 'Con una consistencia similar al cuero.'),
(54, 'Corimbiforme', 'Con aspecto de corimbo.'),
(55, 'Corimbo', 'Inflorescencia racemosa en la que las flores se disponen a distinta altura a lo largo del eje; los pedicelos tienen una longitud tal que el conjunto de las flores forma una superficie plana, cóncava o convexa.'),
(56, 'Corola', 'Conjunto de pétalos que constituyen el verticilo interior del perianto.'),
(57, 'Cosmopolita', 'Especie distribuida por todo el mundo, sin estar restringida a un territorio concreto.'),
(58, 'Cotiledón', 'Hoja embrionaria presente en la semilla; en las de las dicotiledóneas son dos y en los de las monocotiledóneas uno; en las plántulas de las dicotiledóneas son las hojas que inicialmente realizan la fotosíntesis y resultan útiles para su identificación.'),
(59, 'Crenado', 'Margen de la hoja con protuberancias redondeadas.'),
(60, 'Cuerpo', 'En el fruto de las crucíferas parte que alberga las semillas.'),
(61, 'Cuneada', 'Hoja que en su base se estrecha paulatinamente.'),
(62, 'Decumbente', 'Con el tallo tendido sobre el suelo, sin arraigar en él.'),
(63, 'Decurrente', 'Hoja sésil con el limbo prolongado en su base y soldado al tallo.'),
(64, 'Decusadas', 'Hojas opuestas que giran 90° con respecto a las del nudo adyacente.'),
(65, 'Dehiscente', 'Fruto que se abre espontáneamente una vez maduro para dispersar sus semillas.'),
(66, 'Dentada', 'Hoja con prominencias en el margen a modo de dientes de sierra, pero menos afilados.'),
(67, 'Denticulado', 'Hoja con el margen dentado con pequeños dientes.'),
(68, 'Diadelfos', 'Estambres que están soldados por sus filamentos formando dos grupos.'),
(69, 'Dídimo', 'Que está formado por una pareja, en el caso de los frutos, de mericarpos.'),
(70, 'Digitada', 'Hoja compuesta con 4 o más foliolos todos ellos insertos en el extremo del peciolo.'),
(71, 'Dioica', 'Plantas en las que las flores unisexuales se encuentran en pies másculinos y femeninos independientes.'),
(72, 'Dística', 'Se aplica a cualquier órgano dispuesto en dos filas, como las hojas de las gramíneas.'),
(73, 'Elíptico', 'Con el contorno con forma de elipse.'),
(74, 'Emarginado', 'Hoja con una pequeña depresión en su ápice; sinónimo de escotado.'),
(75, 'Embudada', 'Corola con forma de embudo.'),
(76, 'Endocarpio', 'Capa más interna del fruto; en el melocotón, un fruto tipo drupa, es la pared leñosa que está en contacto con la semilla, y se conoce vulgarmente con el nombre de hueso.'),
(77, 'Enrollada', 'Tipo de prefoliación en el que la hoja externa enrollada sobre sí misma contiene a la otra, también enrollada a su vez.'),
(78, 'Entero', 'Margen de la hoja, pétalo o sépalo liso, carente de dientes, festones u otro tipo de división.'),
(79, 'Entomógama', 'Planta que para la fertilización de los óvulos necesita la participación de los insectos.'),
(80, 'Epicáliz', 'Conjunto de apéndices situados en la base del cáliz semejantes a un segundo cáliz.'),
(81, 'Escábrida', 'Que tiene la superficie áspera.'),
(82, 'Escapo', 'Tallo sin hojas que porta en su extremo una flor o inflorescencia.'),
(83, 'Escarioso', 'De consistencia membranosa, seco, y normalmente algo translúcido.'),
(84, 'Escorpioidea', 'Con forma de espiral, como algunas inflorescencias.'),
(85, 'Escotado', 'Con una hendidura en el ápice; sinónimo de emarginado.'),
(86, 'Espádice', 'Espiga, generalmente con flores unisexuales, con el eje engrosado y carnoso.'),
(87, 'Espatulado', 'Con forma de espátula.'),
(88, 'Espicastro', 'Inflorescencia formada por verticilastros muy próximos.'),
(89, 'Espiciforme', 'Con aspecto de espiga.'),
(90, 'Espiga', 'Inflorescencia en la que las flores se encuentran sentadas a lo largo del eje.'),
(91, 'Espiguilla', 'Unidad básica de la inflorescencia de las gramíneas consistente en 2(1) glumas y una raqutilla a lo largo de la cual se disponen las flores.'),
(92, 'Espiniscente', 'Que tiene pequeñas espinas.'),
(93, 'Espinoso', 'Que tiene espinas.'),
(94, 'Espolón', 'Prolongación tubulosa y cerrada en la base de algunas corolas.'),
(95, 'Esporangio', 'En los helechos órganos que producen las espora.'),
(96, 'Esquizocarpo', 'Fruto procedente de un gineceo formado por 2 o más carpelos monospermos que se dispersan individualmente en la madurez, como el característico de las umbelíferas.'),
(97, 'Estambre', 'órgano reproductor masculino de las plantas, que consta de un filamento y la antera, donde se encuentran los sacos polínicos que contienen el polen; el conjunto de estambres forman el androceo.'),
(98, 'Estaminodio', 'Estambre estéril, generalmente rudimentario.'),
(99, 'Estigma', 'En el gineceo, zona donde germinan los granos de polen, normalmente situado en el extremo del estilo.'),
(100, 'Estilopodio', 'Base sobre la que se sitúan los estilos en las umbelíferas.'),
(101, 'Estípula', 'Estructuras laminares, en ocasiones glándulas o espinas, situadas en la base del peciolo de algunas hojas.'),
(102, 'Estolón', 'Tallo que crece paralelo al suelo y que enraíza cada cierto trecho, bien sea por encima del suelo o enterrado; pueden presentar escamas (catáfilos).'),
(103, 'Estolonífera', 'Planta que desarrolla estolones.'),
(104, 'Estrellado', 'Referido a los pelos del indumento, cuando éstos presentan 3 o más ramas.'),
(105, 'Estróbilo', 'Inflorescencia con un eje rígido entorno al cual se disponen brácteas en helicoidal o cíclicamente y entre ellas esporangios (en algunos helechos) o escamas seminíferas (en las coníferas).'),
(106, 'Eurosiberiana', 'Que se distribuye por Eurasia, excluyendo los territorios meridionales con clima mediterráneo.'),
(107, 'Exerta', 'Que sale al exterior de la estructura en la que se desarrolla, como sucede con los estabres de las gramíneas.'),
(108, 'Exocarpio', 'Capa externa del fruto; en el melocotón, un fruto tipo drupa, es la piel.'),
(109, 'Farinosa', 'Con una cubierta que parece de harina.'),
(110, 'Fistuloso', 'Tallo hueco en su interior.'),
(111, 'Flor', 'órgano especializado en la reproducción, y en la que se pueden reconocer cuatro verticilos: cáliz, corola, androceo y gineceo, que se insertan en el receptáculo floral y se unen al tallo por medio del pedicelo. Presenta una gran variedad morfológica y uno o varios de los verticilos pueden estar ausentes.'),
(112, 'Flósculo', 'Flosculosa: flor de las compuestas (Compositae) con los pétalos de la corola soldados en forma de tubo.'),
(113, 'Foliáceo', 'Con aspecto de hoja.'),
(114, 'Foliolo', 'Cada uno de los elementos individuales en los que se divide el limbo de una hoja compuesta.'),
(115, 'Fruto', 'órgano especializado en la dispersión de las semillas formado a partir de las paredes del gineceo y en el que también puede participar el receptáculo u otras estructuras florales; más ráramente procede de una inflorescencias, constituyendo entonces una infrute.ia.'),
(116, 'Geniculada', 'Se refiere a las aristas que presentan un ángulo marcado.'),
(117, 'Geófito', 'Planta con las yemas enterradas dunante la estación desfavorable, en forma de bulbo, rizoma, etc..'),
(118, 'Gineceo', 'Conjunto de órganos femeninos de una flor; está formado por uno o más carpelos que pueden formar uno o varios pistilos independientes.'),
(119, 'Glabrescente', 'Casi sin pelos.'),
(120, 'Glabro', 'Sin pelo.'),
(121, 'Glándula', 'órgano especializado en la dispersión de las semillas formado a partir de las paredes del gineceo y en el que también puede participar el receptáculo u otras estructuras florales; más ráramente procede de una inflorescencias, constituyendo entonces una infrutescencia.'),
(122, 'Glauca', 'De color verde azulado.'),
(123, 'Glomérulo', 'Inflorescencia globosa y muy contraída.'),
(124, 'Glumas', 'órgano especializado en la dispersión de las semillas formado a partir de las paredes del gineceo y en el que también puede participar el receptáculo u otras estructuras florales; más ráramente procede de una inflorescencias, constituyendo entonces una infrutescenci.'),
(125, 'Hastada', 'Hojas que presentan en su base dos lóbulos divergentes; ; los lóbulos son menos agudos y más divergentes que en el caso de las hojas hastadas.'),
(126, 'Haustorio', 'órgano desarrollado por una planta parásita para obtener nutrientes del huésped que parasita.'),
(127, 'Hemicriptófito', 'Planta con las yemas de recambio situadas en la superficie del suelo durante la estación desfavorable; es una de las formas biológicas de Raunkiaer.'),
(128, 'Herbácea', 'Que no desarrolla tejidos leñosos.'),
(129, 'Hermafrodita', 'Flor con androceo y gineceo fértiles.'),
(130, 'Hialino', 'Fino y traslúcido, como el ápice de algunas hojas.'),
(131, 'Hidrófito', 'Planta que presenta sus yemas de recambio bajo el agua durante la estación desfavorable.'),
(132, 'Hilo', 'Cicatriz que queda en la semilla al desprenderse del tejido que la une a la pared del gineceo.'),
(133, 'Hirsuta', 'Cubierta de pelos rígidos y ásperos.'),
(134, 'Híspido', 'Cubierto por pelos ásperos y rígidos.'),
(135, 'Hoja', 'órgano laminar especializado en realizar la fotosíntesis, que normalmente consta de limbo o lámina y peciolo; el peciolo puede ensancharse en su base, formando una vaina, y presentar estípulas.'),
(136, 'Imparipinnada', 'Hoja compuesta y pinnada cuyo raquis termina en un foliolo.'),
(137, 'Indehiscente', 'Fruto que una vez maduro no se abre espontáneamente para dispersar las semillas; en este caso se dispersan conjuntamente fruto y semillas.'),
(138, 'ínfero', 'Gineceo cuyo punto de inserción está por debajo del resto de los verticilos florales: cáliz, corola y androceo; la flor es entonces epigina.'),
(139, 'Inflorescencia', 'Agrupaciones de flores estructuradas de formas muy diversas.'),
(140, 'Infrutescencia', 'Fruto que deriva de una inflorescencia.'),
(141, 'Introducida', 'Planta introducida en el territorio por el hombre y que se asilvestra.'),
(142, 'Involucro', 'Conjunto de brácteas que rodean a las flores en una inflorescencia.'),
(143, 'Laciniada', 'Hoja, pétalo u otro órgano laminar dividido en segmentos muy finos.'),
(144, 'Lanceolado', 'Con forma de lanza, es decir con forma elíptica y alargada, y estrechado en el ápice y la base.'),
(145, 'Lateeurosiberiana', 'De distribución principalmente eurosiberiana, pero que penetra en territorios próximos.'),
(146, 'Latemediterránea', 'De distribución principalmente mediterránea, pero que penetra en territorios próximos.'),
(147, 'Látex', 'Líquido espeso y viscoso que presentan algunas plantas y que se observa al partir alguno de sus órganos.'),
(148, 'Latisepta', 'Se dice de la silícula (fruto de las crucíferas), cuando el tabique que separa las dos valvas es paralelo a su parte más ancha, como en Erophila verna.'),
(149, 'Legumbre', 'Fruto seco, polispermo y dehiscente por sus dos suturas, característico de la mayor parte de las leguminosas.'),
(150, 'Lema', 'Bráctea inferior, membranosa, de las dos que se encuentran en la flor de las gramíneas; también se denomina glumela inferior.'),
(151, 'Lenticular', 'Con forma de lenteja.'),
(152, 'Lígula', 'Ligulada: flor de las compuestas (Compositae) con los pétalos de la corola soldados en forma de lengüeta; en las hojas de las gramíneas estructura membranosa o pelosa que puede encontrarse en la zona de contacto entre el limbo y la vaina.'),
(153, 'Limbo', 'Parte laminar de la hoja; sinónimo de lámina.'),
(154, 'Linear', 'Hoja con los bordes paralelos y mucho más larga que ancha, como el limbo de las gramíneas.'),
(155, 'Lirada', 'Hoja de pinnaticompuesta con el foliolo terminal mayor que los inferiores, que además van aumentando de tamaño desde la base hacia el ápice.'),
(156, 'Lóculo', 'En los frutos, las cavidades donde se encuentran las semillas.'),
(157, 'Lomento', 'Fruto seco, polispermo, con estrechamientos en las zonas donde no hay semillas y que se fragmentan transversalmente.'),
(158, 'Mediterránea', 'Que se distribuye por los territorios con clima mediteráneo que se sitúan alrededor del mar Mediterráneo.'),
(159, 'Membranosa', 'Que forma una lámina fina y flexible.'),
(160, 'Mericarpo', 'Cada una de las porciones individuales en las que se divide un esquizocarpo.'),
(161, 'Mesocarpio', 'Capa media del fruto; en el melocotón, un fruto tipo drupa, es la pulpa del fruto.'),
(162, 'Micropilo', 'En la semilla, orificio de la testa; es el lugar por donde penetra el tubo polínico para fertilizar el óvulo.'),
(163, 'Monadelfos', 'Estambres que están soldados por sus filamentos formando un solo grupo.'),
(164, 'Monoica', 'Planta que en un mismo pie tiene flores unisexuales masculinas y femeninas.'),
(165, 'Monospermo', 'Fruto con una sola semilla.'),
(166, 'Monospermo', 'Fruto con una sola semilla.'),
(167, 'Mucrón', 'Prolongación linear en el ápice de la hoja.'),
(168, 'Napiforme', 'Con forma de nabo, es decir, engrosada y con un eje principal.'),
(169, 'Nectario', 'órgano que segrega néctar para atraer a los insectos.'),
(170, 'Núcula', 'Nuez de pequeño tamaño.'),
(171, 'Nudo', 'En el tallo puntos donde se insertan las hojas o las ramas.'),
(172, 'Nuez', 'Fruto seco, monospermo e indehiscente, normalmente con el pericarpio endurecido.'),
(173, 'Oblongo', 'Hojas alargadas, más largas que anchas.'),
(174, 'Obovado', 'Con el contorno ovado, con forma de huevo, pero con la parte más ancha en la zona apical.'),
(175, 'Ócrea', 'Estructura membranosa que rodea el tallo procedente de la soldadura de las estípulas, característica de las poligonáceas.'),
(176, 'Opuestas', 'Referido a las hojas, cuando éstas se insertan a lo largo del tallo una enfrente de otra, es decir, dos en cada nudo; si giran 90° con respecto a las del nudo adyacente, se denominan decusadas.'),
(177, 'Ovado', 'Con el contorno en forma de huevo, con la parte más ancha en la zona basal.'),
(178, 'Palea', 'Bráctea superior, membranosa, de las dos que se encuentran en la flor de las gramíneas; también se denomina glumela superior.'),
(179, 'Panícula', 'Inflorescencia muy ramificada consistente en un racimo de racimos.'),
(180, 'Parásita', 'Planta que obtiene sus nutrientes de otra especie, el huésped.'),
(181, 'Paripinnada', 'Hoja pinnaticompuesta con dos foliolos en su extremo; entre ambos puede encontrarse un zarcillo.'),
(182, 'Patente', 'Estructura que se inserta en otra con un ángulo muy abierto, como puede suceder en una rama respecto un tallo.'),
(183, 'Peciolo', 'Parte de la hoja que une el limbo al tallo.'),
(184, 'Pedicelo', 'El rabillo que une cada flor al eje de la inflorescencia (pedúnculo).'),
(185, 'Pedúnculo', 'Eje principal de una inflorescencia.'),
(186, 'Péndula', 'Colgante.'),
(187, 'Perenne', 'Planta que desarrolla órganos de reserva y estrategias como la pérdida de hojas en la estación desfavorable, que le permiten vivir más de dos años. Poseen tallos fértiles, portadores de flores o esporangios, y tallos estériles.'),
(188, 'Perennizante', 'Planta que siendo habitualmente anual, vive dos o más años.'),
(189, 'Perianto', 'Conjunto de estructuras florales estériles que protegen al androceo y gineceo durante su desarrollo. En las dicotiledóneas suele estar formado por dos envueltas diferenciadas, el cáliz y la corola. En muchas monocotiledóneas estas envueltas son similares y sus componentes se denominan tépalos.'),
(190, 'Pericarpio', 'Conjunto de las paredes del fruto, que derivan de las del gineceo y en ocasiones también de otras estructuras de la flor, como el receptáculo.'),
(191, 'Petaloideo', 'Con aspecto de pétalo, es decir coloreado y vistoso.'),
(192, 'Pétalos', 'Piezas de la flor que en conjunto forman la corola; normalmente suelen presentar colores vistosos para atraer a los insectos y permitir la polinización; junto a los sépalos del cáliz forman el perianto.'),
(193, 'Pico', 'Prolongación estrecha en el fruto de las compuestas, normalmente provista de vilano en su extremo.'),
(194, 'Pinnada', 'Nerviación de la hoja en la que hay un nervio medio principal y a ambos lados se disponen varios nervios laterales secundarios.'),
(195, 'Pinnaticompuesta', 'Hoja compuesta en la que los foliolos se encuentran a ambos lados del raquis, en dos hileras.'),
(196, 'Pinnatífida', 'Hoja con nerviación pinnada, con el limbo dividido en lóbulos que como mucho llegan a la mitad del espacio entre el margen de la hoja el nervio medio.'),
(197, 'Pinnatipartida', 'Hoja con nerviación pinnada con el limbo dividido en lóbulos que superan la mitad del espacio entre el margen de la hoja y el nervio medio, aunque sin alcanzar a éste.'),
(198, 'Pinnatisecta', 'Hoja con nerviación pinnada con el limbo dividido en lóbulos que alcanzan el nervio medio.'),
(199, 'Piriforme', 'Con forma de pera.'),
(200, 'Pistilo', 'órgano con frecuencia con forma de botella, compuesto por un carpelo o por varios carpelos soldados, en el que suele distinguirse el ovario, donde se encuentran los óvulos que darán lugar a las semillas, el estilo, y el estigma.'),
(201, 'Pixidio', 'Fruto seco y polispermo con dehiscencia transversal.'),
(202, 'Plegada', 'Tipo de prefoliación en el que la hoja externa doblada sobre sí misma contiene a la otra, también doblada a su vez.'),
(203, 'Plumoso', 'Referido al vilano cuando los pelos que lo componen están ramificados en largos pelos más finos.'),
(204, 'Plurirregional', 'Planta que se distribuye por dos o más regiones biogeográficas.'),
(205, 'Poliaquenio', 'Fruto formado por varios aquenios.'),
(206, 'Polispermo', 'Fruto con numerosas semillas.'),
(207, 'Polispermo', 'Fruto con dos o más semillas.'),
(208, 'Póntica', 'Planta procedente de la región de las estepas, en el SE de Europa y el W de Asia.'),
(209, 'Prefoliación', 'Modo en el que se disponen unas hojas respecto a las otras en la yema; este carácter es útil para identificar gramíneas en estado vegetativo.'),
(210, 'Pubescente', 'Con pelos finos y cortos.'),
(211, 'Quilla', 'Los dos pétalos inferiores, conniventes o soldados, de la corola papilionácea, característica de las leguminosas.'),
(212, 'Racimo', 'Inflorescencia en la que las flores, todas ellas pediceladas, se insertan directamente en su eje.'),
(213, 'Raquis', 'En las hojas compuestas eje en el que se insertan los foliolos; eje principal de la inflorescencia de las gramíneas (Gramineae).'),
(214, 'Rastrero', 'Que crece tumbado sobre el suelo.'),
(215, 'Receptáculo', 'Extremo del pedicelo o del pedúnculo, más o menos ensanchado, en el que se insertan los verticilos florales (cáliz, corola, androceo o gineceo) o las flores en el caso de los capítulos.'),
(216, 'Reniforme', 'Con forma de riñón.'),
(217, 'Reticulada', 'Con aspecto de red, como la nerviación entre los nervios principales de una hoja.'),
(218, 'Retrorso', 'Dirigido hacia la parte basal del órgano al que se refiere.'),
(219, 'Revoluto', 'Que se vuelve sobre sí mismo, como las hojas en sus márgenes o algunas brácteas en su extremo.'),
(220, 'Rizoma', 'Tallos subterráneos alargados, más o menos engrosados, que dan lugar a tallos aéreos y raíces; suelen presentar escamas (catáfilos).'),
(221, 'Roseta', 'Conjunto de hojas que aparecen muy próximas al no crecer los entrenudos.'),
(222, 'Rotácea', 'Corola con los pétalos córtamente soldados en su base y extendidos en un plano, como en el género Solanum.'),
(223, 'Sagitada', 'Hoja puntiaguda con dos lóbulos divergentes en la base; los lóbulos son más agudos y menos divergentes que en las hojas hastadas.'),
(224, 'Seco', 'Fruto que presenta todo el pericarpio seco.'),
(225, 'Segmento', 'Porciones en las que se divide una hoja o un fruto.'),
(226, 'Semiamplexicaule', 'Hoja sésil que abraza al tallo hasta su mitad.'),
(227, 'Sepaloideo', 'Con aspecto de sépalo.'),
(228, 'Sépalos', 'Piezas de la flor que en conjunto forman el cáliz; suelen ser verdosos y tienen una función protectora; junto a los pétalos de la corola forman el perianto.'),
(229, 'Sésil', 'Sentada, carente de peciolo en el caso de las hojas o de pedúnculo o pedicelo en las flores.'),
(230, 'Seta', 'Pelo rígido no muy corto.'),
(231, 'Silícua', 'Fruto seco, dehiscente y polispermo consistente en 2 valvas separadas por un tabique denominado replo, de origen placentario; es 3(4) veces más largo que ancho y es característico de la familia Cruciferae.'),
(232, 'Silícula', 'Fruto seco, dehiscente y polispermo consistente en 2 valvas separadas por un tabique denominado replo, de origen placentario; su longitud es menor que 3(4) veces su anchura y es característico de la familia Cruciferae; en función de la posición del tabique respecto a la máxima anchura, pueden ser latiseptas o angustiseptas.'),
(233, 'Simple', 'Referido a las hojas, aquellas que no presentan el limbo dividido en varios foliolos; referido a los pelos, aquéllos no ramificados.'),
(234, 'Subcordado', 'Hoja con la base algo cordada.'),
(235, 'Subcosmopolita', 'Especie distribuida por casi todas las regiones del mundo.'),
(236, 'Subentera', 'Hoja con el margen casi entero.'),
(237, 'Suborbicular', 'Con forma de medio círculo.'),
(238, 'Subsésil', 'Casi sésil, es decir, con el peciolo casi inapreciable.'),
(239, 'Suculenta', 'Carnosa.'),
(240, 'Sufruticosa', 'Planta con tejidos leñosos sólo en su base.'),
(241, 'Súpero', 'Gineceo cuyo punto de inserción está por encima del resto de los verticilos florales: cáliz, corola y androceo; la flor es entonces hipogina.'),
(242, 'Tépalo', 'Piezas del periantio en flores en las que no se distinguen cáliz y corola, al presentar las piezas de ambos verticilos una consistencia, color y forma semejante; esto sucede en algunas liliáceas, como los ajos (Allium).'),
(243, 'Terminal', 'Situada en un extremo de la planta o del órgano del que se trate.'),
(244, 'Terófito', 'Planta anual que durante la estación desfavorable se encuentra en forma de semilla.'),
(245, 'Testa', 'Cubierta de la semilla.'),
(246, 'Tetranúcula', 'Grupo de cuatro núculas.'),
(247, 'Trepador', 'Tallo que crece apoyándose en diversos soportes como otras plantas, muros, etc..'),
(248, 'Tricarpelar', 'Gineceo formado por tres carpelos.'),
(249, 'Trígono', 'Con tres caras, como algunos tallos o frutos.'),
(250, 'Truncada', 'Con el extremo aplanado.'),
(251, 'Tuberculado', 'Con pequeñas protuberancias en la superficie.'),
(252, 'Tubérculo', 'Tallo subterráneo o raíz hinchados que almacenan sustancias de reserva.'),
(253, 'Umbela', 'Inflorescencia en la que los pedicelos de todas las flores se insertan en un mismo punto de su eje, de modo semejante a las varillas de un paraguas. Las ramas de una umbela pueden dividirse sucesivamente (umbela compuesta) y en situarse en su extremo umbelas de segundo orden denominadas umbélulas. Este tipo de inflorescencia es característica de las umbelíferas (Umbelliferae).'),
(254, 'Umbélula', 'Umbelas de segundo orden en las umbelas compuestas.'),
(255, 'Uncinado', 'Con forma de gancho, como algunos pelos y espinas.'),
(256, 'Unisexual', 'Flor que consta sólo de androceo o gineceo; se opone a hermafrodita.'),
(257, 'Urceolada', 'Corola con los pétalos soldados casi en toda su longitud y ensanchada en su parte media de modo que asemeja la tulipa de un quinqué.'),
(258, 'Vaina', 'Ensanchamiento en la base del peciolo; en algunas monocotiledóneas, como las gramíneas, parte basal de las hojas, que envuelve al tallo.'),
(259, 'Verticilastro', 'Conjunto de flores muy próximas, como sucede en las labiadas, que parecen agruparse en verticilos.'),
(260, 'Verticilo', 'Referido a las hojas, cuando éstas, en número de tres o más, se insertan al mismo nivel en el tallo; también se emplea para referirse a los elementos que constituyen la flor, cáliz, corola, androceo y gineceo, como verticilos florales.'),
(261, 'Vilano', 'Conjunto de pelos o escamas situados en el extremo del fruto de algunas compuestas (Compositae), y que facilita su dispersión.'),
(262, 'Voluble', 'Tallo o rama que en su crecimiento crece helicoidalmente, como los tallos trepadores que se enroscan en el tallo de otras plantas.'),
(263, 'Zarcillo', 'Estructura filiforme que permite el soporte de la planta al enrollarse sobre diversos objetos, como otras plantas próximas; pueden formarse en las hojas, ramas, etc.'),
(264, 'hola', 'hola'),
(265, 'hola', '0'),
(269, 'arraaazaaaaandooooo', 'arraazadnkjsnvkd'),
(271, 'Barra', 'Descripción de la Barra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MUESTRA`
--

CREATE TABLE `MUESTRA` (
  `muestraID` int(11) NOT NULL,
  `nombreIdentificador` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombreColector` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fuente` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaRecoleccion` date DEFAULT NULL,
  `imagenURL` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_especieID` int(11) DEFAULT NULL,
  `ejecutivo` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `MUESTRA`
--

INSERT INTO `MUESTRA` (`muestraID`, `nombreIdentificador`, `nombreColector`, `fuente`, `fechaRecoleccion`, `imagenURL`, `f_especieID`, `ejecutivo`) VALUES
(1, 'Johan Venegas', 'Mario Gómez', 'Tecnológico de Costa Rica', '2005-02-27', 'http://asociacionvallisoletanademicologia.com/wordpress/wp-content/uploads/2015/03/Hydnotrya-tulasnei.-Puebla-de-Lillo.-P9196185.jpg', 2, '47594383'),
(2, 'Juan Golobio', 'Mario Gómez', 'Universidad Nacional', '2003-11-02', 'https://www.researchgate.net/profile/Hans_Peter_Klenk/publication/227264347/figure/fig2/AS:515584749838336@1499936391303/Fig-2-Hydnotrya-tulasnei-Picture-G-Hensel.png', 2, '83998489504'),
(3, 'Mauro Fernández', 'Mario Gómez', 'Universidad Nacional', '2004-04-12', 'https://lh3.googleusercontent.com/0PsAfJC89NA6nubIHU2jNwn20t7biaGYFIjmy-jSWkLOK-N8Y-p0akPIgaBcp6sLiHJsucd_sRztV-o9Tg=w293-h220', 2, '922856826'),
(6, 'Daniel Zapata', 'Julissa Franco Navarro', 'Tecnológico de Costa  Rica', '2008-11-26', 'http://herbariodigital.xyz/AppWeb/assets/img/15155742249.jpg', 7, '29348202');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MUESTRABITACORA`
--

CREATE TABLE `MUESTRABITACORA` (
  `muestraBitacoraID` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `f_recolectaID` int(11) DEFAULT NULL,
  `f_especieID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MUESTRAVERDE`
--

CREATE TABLE `MUESTRAVERDE` (
  `muestraVerdeID` int(11) NOT NULL,
  `imagenURL` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_especieID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `MUESTRAVERDE`
--

INSERT INTO `MUESTRAVERDE` (`muestraVerdeID`, `imagenURL`, `f_especieID`) VALUES
(1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pseudorhizina_sphaerospora_338724_wb.jpg/1200px-Pseudorhizina_sphaerospora_338724_wb.jpg', 2),
(2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkMcECxZq1niws_W0pWA1LkZjx9Lc922fQ6Cg66Ze3wwPAJZYm', 2),
(3, 'https://sites.google.com/site/hongoshipogeos/_/rsrc/1472762499266/ascomycetes/hydnotrya-tulasnei-berk-berk-broome/Hydnotria-tulasnei-%284%29.jpg', 2),
(4, 'https://sites.google.com/site/hongoshipogeos/_/rsrc/1472762505491/ascomycetes/hydnotrya-tulasnei-berk-berk-broome/Hydnotrya-tulasnei-%284%29A.jpg', 2),
(5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4SZgfHpjUqeWS8oy_7asbkozpByn-CEp0exqv87at-UUFQVV9', 2),
(6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrHKEcmMXOFMmI10Y2-sK0nJPA-nlHwHHM9Ngd57vJKeupdHvEgQ', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PERSONA`
--

CREATE TABLE `PERSONA` (
  `personaID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primerApellido` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `segundoApellido` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `PERSONA`
--

INSERT INTO `PERSONA` (`personaID`, `nombre`, `primerApellido`, `segundoApellido`) VALUES
(1, 'Test', 'Test', 'Test'),
(2, 'Luis', 'Castillo', NULL),
(3, 'Ariel', 'Montero', 'Monestel'),
(4, 'Juan', 'Castro', 'Blanco'),
(5, 'Juanito', 'Mora', 'Gonzales'),
(6, 'Alberto', 'Salas', 'Salas'),
(7, 'Luis', 'Rojas', 'Alfaro'),
(8, 'Marco', 'Mora', 'Mora'),
(9, 'Mario', 'Marin', 'Chinchilla'),
(10, 'Luis', 'Rojas', 'Alfaro'),
(11, 'Mario', 'Villalobos', 'Mata'),
(12, NULL, NULL, NULL),
(13, 'Ariel', 'Castro', 'Castro'),
(14, 'Samuel', 'Alfaro', 'Ruiz'),
(15, 'Luis', 'Pacheco', 'Núñez'),
(16, 'Kerlin', 'Chacon', 'Murillo'),
(17, 'Maria', 'Estrada', 'Sánchez'),
(18, 'Joshua', 'Rojas', 'Alfaro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PERSONASXGIRA`
--

CREATE TABLE `PERSONASXGIRA` (
  `f_personaID` int(11) DEFAULT NULL,
  `f_giraID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `PERSONASXGIRA`
--

INSERT INTO `PERSONASXGIRA` (`f_personaID`, `f_giraID`) VALUES
(15, 4),
(3, 2),
(7, 3),
(15, 2),
(15, 1),
(1, 1),
(1, 4),
(1, 2),
(1, 3),
(7, 4),
(NULL, NULL),
(1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `POSICIONHOJA`
--

CREATE TABLE `POSICIONHOJA` (
  `posicionHojaID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `POSICIONHOJA`
--

INSERT INTO `POSICIONHOJA` (`posicionHojaID`, `nombre`) VALUES
(1, 'posicionhoja1'),
(2, 'posicionhoja2'),
(3, 'posicionhoja3'),
(4, 'posicionhoja4'),
(5, 'posicionhoja5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROCEDENCIA`
--

CREATE TABLE `PROCEDENCIA` (
  `procedenciaID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `PROCEDENCIA`
--

INSERT INTO `PROCEDENCIA` (`procedenciaID`, `nombre`) VALUES
(1, 'endémico'),
(2, 'externo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RECOLECTA`
--

CREATE TABLE `RECOLECTA` (
  `recolectaID` int(11) NOT NULL,
  `zonaVida` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coberturaTierra` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fuente` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaRecoleccion` date DEFAULT NULL,
  `f_personaID` int(11) DEFAULT NULL,
  `f_giraID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SAVIACOLOR`
--

CREATE TABLE `SAVIACOLOR` (
  `saviaColorID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `SAVIACOLOR`
--

INSERT INTO `SAVIACOLOR` (`saviaColorID`, `nombre`) VALUES
(1, 'saviacolor1'),
(2, 'saviacolor2'),
(3, 'saviacolor3'),
(4, 'saviacolor4'),
(5, 'saviacolor5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SAVIATEXTURA`
--

CREATE TABLE `SAVIATEXTURA` (
  `saviaTexturaID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `SAVIATEXTURA`
--

INSERT INTO `SAVIATEXTURA` (`saviaTexturaID`, `nombre`) VALUES
(1, 'saviatextura1'),
(2, 'saviatextura2'),
(3, 'saviatextura3'),
(4, 'saviatextura4'),
(5, 'saviatextura5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UBICACION`
--

CREATE TABLE `UBICACION` (
  `ubicacionID` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `UBICACION`
--

INSERT INTO `UBICACION` (`ubicacionID`, `nombre`) VALUES
(1, 'AC Huetar Norte'),
(2, 'AC Guanacaste'),
(3, 'AC Tortuguero'),
(4, 'AC Tempisque'),
(5, 'AC Pacífico Central'),
(6, 'AC Osa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UBICACIONGPS`
--

CREATE TABLE `UBICACIONGPS` (
  `ubicacionGpsID` int(11) NOT NULL,
  `latitud` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitud` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_especieID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `UBICACIONGPS`
--

INSERT INTO `UBICACIONGPS` (`ubicacionGpsID`, `latitud`, `longitud`, `f_especieID`) VALUES
(1, '9.901121', '-84.068611', 2),
(2, '9.501121', '-84.017932', 2),
(3, '9.923121 ', '-85.156932', 2),
(4, '9.623121', '-85.156932', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UBICACIONGPSBITACORA`
--

CREATE TABLE `UBICACIONGPSBITACORA` (
  `ubicaciongGpsBitacoraID` int(11) NOT NULL,
  `latitud` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitud` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_muestraBitacoraID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `usuarioID` int(11) NOT NULL,
  `contrasena` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_personaID` int(11) DEFAULT NULL,
  `esAdmin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`usuarioID`, `contrasena`, `email`, `f_personaID`, `esAdmin`) VALUES
(1, 'test123', 'test@mail.com', 1, NULL),
(2, '1234', 'L@mail.com', 2, NULL),
(3, '1234', 'ariel@mail.com', 3, NULL),
(4, '1234', 'juan@mail.com', 4, NULL),
(5, '1234', 'juanito@mail.com', 5, NULL),
(6, '1234', 'alberto@mail.com', 6, NULL),
(7, 'luis123', 'luis@mail.co', 7, NULL),
(8, 'marcomarco', 'test@email.com', 8, NULL),
(10, 'luisito', 'testt@mail.com', 10, NULL),
(11, 'marito123', 'mvm@mail.com', 11, NULL),
(12, NULL, NULL, 12, NULL),
(13, '123456', 'joseC@mail.com', 13, NULL),
(14, '123456', 'tester@mail.com', 14, NULL),
(15, 'luis123', 'luis@mail.com', 15, NULL),
(16, 'ker123', 'ker@mail.com', 16, NULL),
(17, 'maria123', 'maria@mail.com', 17, NULL),
(18, 'abcdefg', 'administrador@mail.com', NULL, 1),
(20, 'abcdefghijolkmno[pqrstuvwxyz', 'maureen.mones@mail.com', NULL, 1),
(21, 'abc12', 'ivonnemadrigal@mail.com', NULL, 1),
(22, 'joshua123', 'joshua@mail.com', 18, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `BITACORA`
--
ALTER TABLE `BITACORA`
  ADD PRIMARY KEY (`bitacoraID`),
  ADD KEY `bitacora_persona` (`f_personaID`),
  ADD KEY `bitacora_gira` (`f_giraID`),
  ADD KEY `bitacora_especie` (`f_especieID`);

--
-- Indices de la tabla `CARACTERISTICA`
--
ALTER TABLE `CARACTERISTICA`
  ADD PRIMARY KEY (`caracteristicaID`),
  ADD KEY `caracteristica_especieID` (`f_especieID`);

--
-- Indices de la tabla `ESPECIE`
--
ALTER TABLE `ESPECIE`
  ADD PRIMARY KEY (`especieID`),
  ADD KEY `especie_procedenciaID` (`f_procedenciaID`),
  ADD KEY `especie_generoID` (`f_generoID`),
  ADD KEY `especie_familiaID` (`f_familiaID`),
  ADD KEY `especie_saviaColorID` (`f_saviaColorID`),
  ADD KEY `especie_saviaTexturaID` (`f_saviaTexturaID`),
  ADD KEY `especie_formaHojaID` (`f_formaHojaID`),
  ADD KEY `especie_posicionHojaID` (`f_posicionHojaID`),
  ADD KEY `especie_ubicacionID` (`f_ubicacionID`),
  ADD KEY `especie_florColorID` (`f_florColorID`),
  ADD KEY `especie_florSimetriaID` (`f_florSimetriaID`);

--
-- Indices de la tabla `FAMILIA`
--
ALTER TABLE `FAMILIA`
  ADD PRIMARY KEY (`familiaID`),
  ADD KEY `generoProcedencia` (`f_procedenciaID`),
  ADD KEY `gen_ubicacionID` (`f_ubicacionID`),
  ADD KEY `gen_posicionHojaID` (`f_posicionHojaID`),
  ADD KEY `gen_formaHojaID` (`f_formaHojaID`),
  ADD KEY `gen_florColorID` (`f_florColorID`),
  ADD KEY `gen_florSimetriaID` (`f_florSimetriaID`),
  ADD KEY `gen_saviaColorID` (`f_saviaColorID`),
  ADD KEY `gen_saviaTexturaID` (`f_saviaTexturaID`);

--
-- Indices de la tabla `FLORCOLOR`
--
ALTER TABLE `FLORCOLOR`
  ADD PRIMARY KEY (`florColorID`);

--
-- Indices de la tabla `FLORSIMETRIA`
--
ALTER TABLE `FLORSIMETRIA`
  ADD PRIMARY KEY (`florSimetriaID`);

--
-- Indices de la tabla `FORMAHOJA`
--
ALTER TABLE `FORMAHOJA`
  ADD PRIMARY KEY (`formaHojaID`);

--
-- Indices de la tabla `FOTOPORBITACORA`
--
ALTER TABLE `FOTOPORBITACORA`
  ADD PRIMARY KEY (`FotoID`),
  ADD KEY `fotoporbitacora_bitacora` (`f_bitacoraID`);

--
-- Indices de la tabla `GENERO`
--
ALTER TABLE `GENERO`
  ADD PRIMARY KEY (`generoID`),
  ADD KEY `familiaProcedencia` (`f_procedenciaID`),
  ADD KEY `fam_ubicacionID` (`f_ubicacionID`),
  ADD KEY `fam_posicionHojaID` (`f_posicionHojaID`),
  ADD KEY `fam_formaHojaID` (`f_formaHojaID`),
  ADD KEY `fam_florColorID` (`f_florColorID`),
  ADD KEY `fam_florSimetriaID` (`f_florSimetriaID`),
  ADD KEY `fam_saviaColorID` (`f_saviaColorID`),
  ADD KEY `fam_saviaTexturaID` (`f_saviaTexturaID`);

--
-- Indices de la tabla `GIRA`
--
ALTER TABLE `GIRA`
  ADD PRIMARY KEY (`giraID`);

--
-- Indices de la tabla `IMAGENBITACORA`
--
ALTER TABLE `IMAGENBITACORA`
  ADD PRIMARY KEY (`imagenBitacoraID`),
  ADD KEY `f_muestraBitacoraID` (`f_muestraBitacoraID`);

--
-- Indices de la tabla `IMAGENESEJEMLOS`
--
ALTER TABLE `IMAGENESEJEMLOS`
  ADD PRIMARY KEY (`imagenesEjemplosID`),
  ADD KEY `imagenesEjemplos_itemGlosarioID` (`f_itemGlosarioID`);

--
-- Indices de la tabla `IMAGENESTIPOS`
--
ALTER TABLE `IMAGENESTIPOS`
  ADD PRIMARY KEY (`imagenesTiposID`),
  ADD KEY `imagenesTipos_itemGlosarioID` (`f_itemGlosarioID`);

--
-- Indices de la tabla `ITEMGLOSARIO`
--
ALTER TABLE `ITEMGLOSARIO`
  ADD PRIMARY KEY (`itemGlosarioID`);

--
-- Indices de la tabla `MUESTRA`
--
ALTER TABLE `MUESTRA`
  ADD PRIMARY KEY (`muestraID`),
  ADD KEY `muestra_especieID` (`f_especieID`);

--
-- Indices de la tabla `MUESTRABITACORA`
--
ALTER TABLE `MUESTRABITACORA`
  ADD PRIMARY KEY (`muestraBitacoraID`),
  ADD KEY `f_recolectaID` (`f_recolectaID`),
  ADD KEY `f_especieID` (`f_especieID`);

--
-- Indices de la tabla `MUESTRAVERDE`
--
ALTER TABLE `MUESTRAVERDE`
  ADD PRIMARY KEY (`muestraVerdeID`),
  ADD KEY `muestraVerde_especieID` (`f_especieID`);

--
-- Indices de la tabla `PERSONA`
--
ALTER TABLE `PERSONA`
  ADD PRIMARY KEY (`personaID`);

--
-- Indices de la tabla `PERSONASXGIRA`
--
ALTER TABLE `PERSONASXGIRA`
  ADD KEY `personaxgira_persona` (`f_personaID`),
  ADD KEY `personaxgira_gira` (`f_giraID`);

--
-- Indices de la tabla `POSICIONHOJA`
--
ALTER TABLE `POSICIONHOJA`
  ADD PRIMARY KEY (`posicionHojaID`);

--
-- Indices de la tabla `PROCEDENCIA`
--
ALTER TABLE `PROCEDENCIA`
  ADD PRIMARY KEY (`procedenciaID`);

--
-- Indices de la tabla `RECOLECTA`
--
ALTER TABLE `RECOLECTA`
  ADD PRIMARY KEY (`recolectaID`),
  ADD KEY `f_personaID` (`f_personaID`),
  ADD KEY `f_giraID` (`f_giraID`);

--
-- Indices de la tabla `SAVIACOLOR`
--
ALTER TABLE `SAVIACOLOR`
  ADD PRIMARY KEY (`saviaColorID`);

--
-- Indices de la tabla `SAVIATEXTURA`
--
ALTER TABLE `SAVIATEXTURA`
  ADD PRIMARY KEY (`saviaTexturaID`);

--
-- Indices de la tabla `UBICACION`
--
ALTER TABLE `UBICACION`
  ADD PRIMARY KEY (`ubicacionID`);

--
-- Indices de la tabla `UBICACIONGPS`
--
ALTER TABLE `UBICACIONGPS`
  ADD PRIMARY KEY (`ubicacionGpsID`),
  ADD KEY `ubicacionGPS_especieID` (`f_especieID`);

--
-- Indices de la tabla `UBICACIONGPSBITACORA`
--
ALTER TABLE `UBICACIONGPSBITACORA`
  ADD PRIMARY KEY (`ubicaciongGpsBitacoraID`),
  ADD KEY `f_muestraBitacoraID` (`f_muestraBitacoraID`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`usuarioID`),
  ADD KEY `f_personaID` (`f_personaID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `BITACORA`
--
ALTER TABLE `BITACORA`
  MODIFY `bitacoraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `CARACTERISTICA`
--
ALTER TABLE `CARACTERISTICA`
  MODIFY `caracteristicaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ESPECIE`
--
ALTER TABLE `ESPECIE`
  MODIFY `especieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `FAMILIA`
--
ALTER TABLE `FAMILIA`
  MODIFY `familiaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `FLORCOLOR`
--
ALTER TABLE `FLORCOLOR`
  MODIFY `florColorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `FLORSIMETRIA`
--
ALTER TABLE `FLORSIMETRIA`
  MODIFY `florSimetriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `FORMAHOJA`
--
ALTER TABLE `FORMAHOJA`
  MODIFY `formaHojaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `FOTOPORBITACORA`
--
ALTER TABLE `FOTOPORBITACORA`
  MODIFY `FotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `GENERO`
--
ALTER TABLE `GENERO`
  MODIFY `generoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `GIRA`
--
ALTER TABLE `GIRA`
  MODIFY `giraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `IMAGENBITACORA`
--
ALTER TABLE `IMAGENBITACORA`
  MODIFY `imagenBitacoraID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `IMAGENESEJEMLOS`
--
ALTER TABLE `IMAGENESEJEMLOS`
  MODIFY `imagenesEjemplosID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `IMAGENESTIPOS`
--
ALTER TABLE `IMAGENESTIPOS`
  MODIFY `imagenesTiposID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `ITEMGLOSARIO`
--
ALTER TABLE `ITEMGLOSARIO`
  MODIFY `itemGlosarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT de la tabla `MUESTRA`
--
ALTER TABLE `MUESTRA`
  MODIFY `muestraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `MUESTRABITACORA`
--
ALTER TABLE `MUESTRABITACORA`
  MODIFY `muestraBitacoraID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `MUESTRAVERDE`
--
ALTER TABLE `MUESTRAVERDE`
  MODIFY `muestraVerdeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `PERSONA`
--
ALTER TABLE `PERSONA`
  MODIFY `personaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `POSICIONHOJA`
--
ALTER TABLE `POSICIONHOJA`
  MODIFY `posicionHojaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `PROCEDENCIA`
--
ALTER TABLE `PROCEDENCIA`
  MODIFY `procedenciaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `RECOLECTA`
--
ALTER TABLE `RECOLECTA`
  MODIFY `recolectaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `SAVIACOLOR`
--
ALTER TABLE `SAVIACOLOR`
  MODIFY `saviaColorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `SAVIATEXTURA`
--
ALTER TABLE `SAVIATEXTURA`
  MODIFY `saviaTexturaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `UBICACION`
--
ALTER TABLE `UBICACION`
  MODIFY `ubicacionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `UBICACIONGPS`
--
ALTER TABLE `UBICACIONGPS`
  MODIFY `ubicacionGpsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `UBICACIONGPSBITACORA`
--
ALTER TABLE `UBICACIONGPSBITACORA`
  MODIFY `ubicaciongGpsBitacoraID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `usuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `BITACORA`
--
ALTER TABLE `BITACORA`
  ADD CONSTRAINT `bitacora_especie` FOREIGN KEY (`f_especieID`) REFERENCES `ESPECIE` (`especieID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bitacora_gira` FOREIGN KEY (`f_giraID`) REFERENCES `GIRA` (`giraID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bitacora_persona` FOREIGN KEY (`f_personaID`) REFERENCES `PERSONA` (`personaID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `CARACTERISTICA`
--
ALTER TABLE `CARACTERISTICA`
  ADD CONSTRAINT `caracteristica_especieID` FOREIGN KEY (`f_especieID`) REFERENCES `ESPECIE` (`especieID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `ESPECIE`
--
ALTER TABLE `ESPECIE`
  ADD CONSTRAINT `especie_familiaID` FOREIGN KEY (`f_familiaID`) REFERENCES `FAMILIA` (`familiaID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `especie_florColorID` FOREIGN KEY (`f_florColorID`) REFERENCES `FLORCOLOR` (`florColorID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `especie_florSimetriaID` FOREIGN KEY (`f_florSimetriaID`) REFERENCES `FLORSIMETRIA` (`florSimetriaID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `especie_formaHojaID` FOREIGN KEY (`f_formaHojaID`) REFERENCES `FORMAHOJA` (`formaHojaID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `especie_generoID` FOREIGN KEY (`f_generoID`) REFERENCES `GENERO` (`generoID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `especie_posicionHojaID` FOREIGN KEY (`f_posicionHojaID`) REFERENCES `POSICIONHOJA` (`posicionHojaID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `especie_procedenciaID` FOREIGN KEY (`f_procedenciaID`) REFERENCES `PROCEDENCIA` (`procedenciaID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `especie_saviaColorID` FOREIGN KEY (`f_saviaColorID`) REFERENCES `SAVIACOLOR` (`saviaColorID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `especie_saviaTexturaID` FOREIGN KEY (`f_saviaTexturaID`) REFERENCES `SAVIATEXTURA` (`saviaTexturaID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `especie_ubicacionID` FOREIGN KEY (`f_ubicacionID`) REFERENCES `UBICACION` (`ubicacionID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `FAMILIA`
--
ALTER TABLE `FAMILIA`
  ADD CONSTRAINT `gen_florColorID` FOREIGN KEY (`f_florColorID`) REFERENCES `FLORCOLOR` (`florColorID`),
  ADD CONSTRAINT `gen_florSimetriaID` FOREIGN KEY (`f_florSimetriaID`) REFERENCES `FLORSIMETRIA` (`florSimetriaID`),
  ADD CONSTRAINT `gen_formaHojaID` FOREIGN KEY (`f_formaHojaID`) REFERENCES `FORMAHOJA` (`formaHojaID`),
  ADD CONSTRAINT `gen_posicionHojaID` FOREIGN KEY (`f_posicionHojaID`) REFERENCES `POSICIONHOJA` (`posicionHojaID`),
  ADD CONSTRAINT `gen_saviaColorID` FOREIGN KEY (`f_saviaColorID`) REFERENCES `SAVIACOLOR` (`saviaColorID`),
  ADD CONSTRAINT `gen_saviaTexturaID` FOREIGN KEY (`f_saviaTexturaID`) REFERENCES `SAVIATEXTURA` (`saviaTexturaID`),
  ADD CONSTRAINT `gen_ubicacionID` FOREIGN KEY (`f_ubicacionID`) REFERENCES `UBICACION` (`ubicacionID`),
  ADD CONSTRAINT `generoProcedencia` FOREIGN KEY (`f_procedenciaID`) REFERENCES `PROCEDENCIA` (`procedenciaID`);

--
-- Filtros para la tabla `FOTOPORBITACORA`
--
ALTER TABLE `FOTOPORBITACORA`
  ADD CONSTRAINT `fotoporbitacora_bitacora` FOREIGN KEY (`f_bitacoraID`) REFERENCES `BITACORA` (`bitacoraID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `GENERO`
--
ALTER TABLE `GENERO`
  ADD CONSTRAINT `fam_florColorID` FOREIGN KEY (`f_florColorID`) REFERENCES `FLORCOLOR` (`florColorID`),
  ADD CONSTRAINT `fam_florSimetriaID` FOREIGN KEY (`f_florSimetriaID`) REFERENCES `FLORSIMETRIA` (`florSimetriaID`),
  ADD CONSTRAINT `fam_formaHojaID` FOREIGN KEY (`f_formaHojaID`) REFERENCES `FORMAHOJA` (`formaHojaID`),
  ADD CONSTRAINT `fam_posicionHojaID` FOREIGN KEY (`f_posicionHojaID`) REFERENCES `POSICIONHOJA` (`posicionHojaID`),
  ADD CONSTRAINT `fam_saviaColorID` FOREIGN KEY (`f_saviaColorID`) REFERENCES `SAVIACOLOR` (`saviaColorID`),
  ADD CONSTRAINT `fam_saviaTexturaID` FOREIGN KEY (`f_saviaTexturaID`) REFERENCES `SAVIATEXTURA` (`saviaTexturaID`),
  ADD CONSTRAINT `fam_ubicacionID` FOREIGN KEY (`f_ubicacionID`) REFERENCES `UBICACION` (`ubicacionID`),
  ADD CONSTRAINT `familiaProcedencia` FOREIGN KEY (`f_procedenciaID`) REFERENCES `PROCEDENCIA` (`procedenciaID`);

--
-- Filtros para la tabla `IMAGENBITACORA`
--
ALTER TABLE `IMAGENBITACORA`
  ADD CONSTRAINT `IMAGENBITACORA_ibfk_1` FOREIGN KEY (`f_muestraBitacoraID`) REFERENCES `MUESTRABITACORA` (`muestraBitacoraID`);

--
-- Filtros para la tabla `IMAGENESEJEMLOS`
--
ALTER TABLE `IMAGENESEJEMLOS`
  ADD CONSTRAINT `imagenesEjemplos_itemGlosarioID` FOREIGN KEY (`f_itemGlosarioID`) REFERENCES `ITEMGLOSARIO` (`itemGlosarioID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `IMAGENESTIPOS`
--
ALTER TABLE `IMAGENESTIPOS`
  ADD CONSTRAINT `imagenesTipos_itemGlosarioID` FOREIGN KEY (`f_itemGlosarioID`) REFERENCES `ITEMGLOSARIO` (`itemGlosarioID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `MUESTRA`
--
ALTER TABLE `MUESTRA`
  ADD CONSTRAINT `muestra_especieID` FOREIGN KEY (`f_especieID`) REFERENCES `ESPECIE` (`especieID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `MUESTRABITACORA`
--
ALTER TABLE `MUESTRABITACORA`
  ADD CONSTRAINT `MUESTRABITACORA_ibfk_1` FOREIGN KEY (`f_recolectaID`) REFERENCES `RECOLECTA` (`recolectaID`),
  ADD CONSTRAINT `MUESTRABITACORA_ibfk_2` FOREIGN KEY (`f_especieID`) REFERENCES `ESPECIE` (`especieID`);

--
-- Filtros para la tabla `MUESTRAVERDE`
--
ALTER TABLE `MUESTRAVERDE`
  ADD CONSTRAINT `muestraVerde_especieID` FOREIGN KEY (`f_especieID`) REFERENCES `ESPECIE` (`especieID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `PERSONASXGIRA`
--
ALTER TABLE `PERSONASXGIRA`
  ADD CONSTRAINT `personaxgira_gira` FOREIGN KEY (`f_giraID`) REFERENCES `GIRA` (`giraID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `personaxgira_persona` FOREIGN KEY (`f_personaID`) REFERENCES `PERSONA` (`personaID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `RECOLECTA`
--
ALTER TABLE `RECOLECTA`
  ADD CONSTRAINT `RECOLECTA_ibfk_1` FOREIGN KEY (`f_personaID`) REFERENCES `PERSONA` (`personaID`),
  ADD CONSTRAINT `RECOLECTA_ibfk_2` FOREIGN KEY (`f_giraID`) REFERENCES `GIRA` (`giraID`);

--
-- Filtros para la tabla `UBICACIONGPS`
--
ALTER TABLE `UBICACIONGPS`
  ADD CONSTRAINT `ubicacionGPS_especieID` FOREIGN KEY (`f_especieID`) REFERENCES `ESPECIE` (`especieID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `UBICACIONGPSBITACORA`
--
ALTER TABLE `UBICACIONGPSBITACORA`
  ADD CONSTRAINT `UBICACIONGPSBITACORA_ibfk_1` FOREIGN KEY (`f_muestraBitacoraID`) REFERENCES `MUESTRABITACORA` (`muestraBitacoraID`);

--
-- Filtros para la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD CONSTRAINT `USUARIO_ibfk_1` FOREIGN KEY (`f_personaID`) REFERENCES `PERSONA` (`personaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
