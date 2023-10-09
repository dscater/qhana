-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-10-2023 a las 19:01:15
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qhana_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividads`
--

CREATE TABLE `actividads` (
  `id` bigint UNSIGNED NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actividads`
--

INSERT INTO `actividads` (`id`, `imagen`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1696265570_2.png', 'LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE. LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE. IT IS A LONG ESTABLISHED FACT THAT A READER WILL BE DISTRACTED BY THE READABLE CONTENT LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM. LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.', '2023-10-02 16:52:50', '2023-10-02 16:52:59'),
(3, '1696866167_3.png', 'CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.', '2023-10-02 16:53:30', '2023-10-09 15:42:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apis`
--

CREATE TABLE `apis` (
  `id` bigint UNSIGNED NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_google` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `apis`
--

INSERT INTO `apis` (`id`, `correo`, `nombre`, `password`, `api_google`, `created_at`, `updated_at`) VALUES
(1, 'correosyseventos@gmail.com', 'Qhana', 'gywdptczpyhtkghm', 'AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes', '2023-10-09 15:12:54', '2023-10-09 15:12:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posicion` int NOT NULL,
  `desc1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `muestra_boton` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `img`, `posicion`, `desc1`, `desc2`, `muestra_boton`, `created_at`, `updated_at`) VALUES
(5, '1696264182_5.png', 1, '', '', 0, '2023-10-02 16:29:42', '2023-10-02 19:48:21'),
(6, '1696264203_6.png', 2, 'NUEVA COLECCIÓN 2023', 'CHAQUETAS Y ABRIGOS', 1, '2023-10-02 16:30:03', '2023-10-02 19:48:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos`
--

CREATE TABLE `catalogos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `catalogos`
--

INSERT INTO `catalogos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'CATÁLOGO #1', 'CATALOGO #1 DESCRIPCIÓN', '2023-10-03 19:50:56', '2023-10-03 19:50:56'),
(2, 'CATÁLOGO #2', '', '2023-10-03 19:51:05', '2023-10-03 19:51:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo_pedido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo_pedido2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `ciudad`, `dir`, `fono`, `web`, `actividad`, `correo`, `correo_pedido`, `correo_pedido2`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'QHANA', 'QHANA', 'QHANA', 'LA PAZ', 'LA PAZ', '222222', 'QHANAWEB', 'ACTIVIDAD QHANA', 'qhana@gmail.com', 'qhana2@gmail.com', 'qhanapedido2@gmail.com', 'logo.png', NULL, '2023-09-28 21:09:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` bigint UNSIGNED NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fonos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varbinary(255) NOT NULL,
  `lng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `direccion`, `fonos`, `correo`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(1, 'ZONA LOS OLIVOS CALLE 3 #1111', '22222 - 77766666', 'qhana@gmail.com', 0x2d31362e353034313934303135323037, '-68.131335712968', '2023-10-02 19:08:12', '2023-10-09 02:29:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `pedido_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 2.00, 200.50, 401.00, '2023-10-09 00:57:28', '2023-10-09 00:57:28'),
(2, 1, 5, 1.00, 99.99, 99.99, '2023-10-09 00:57:28', '2023-10-09 00:57:28'),
(3, 1, 4, 1.00, 189.99, 189.99, '2023-10-09 00:57:28', '2023-10-09 00:57:28'),
(4, 2, 7, 1.00, 100.00, 100.00, '2023-10-09 00:59:37', '2023-10-09 00:59:37'),
(5, 3, 3, 1.00, 200.00, 200.00, '2023-10-09 01:01:37', '2023-10-09 01:01:37'),
(7, 5, 7, 1.00, 100.00, 100.00, '2023-10-09 17:30:41', '2023-10-09 17:30:41'),
(8, 6, 6, 1.00, 200.50, 200.50, '2023-10-09 18:57:36', '2023-10-09 18:57:36'),
(9, 7, 4, 1.00, 189.99, 189.99, '2023-10-09 18:58:42', '2023-10-09 18:58:42'),
(10, 8, 1, 1.00, 300.00, 300.00, '2023-10-09 19:00:21', '2023-10-09 19:00:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ LA CONFIGURACIÓN', 'actividad: <br/>alias: VALVEST<br/>ciudad: LA PAZ<br/>correo: <br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nit: 1111111<br/>nombre_sistema: VALVEST<br/>razon_social: QHANA<br/>updated_at: 2023-07-29 11:57:47<br/>web: <br/>', 'actividad: ACTIVIDAD QHANA<br/>alias: VALVEST<br/>ciudad: LA PAZ<br/>correo: QHANA@GMAIL.COM<br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nit: 1111111<br/>nombre_sistema: VALVEST<br/>razon_social: QHANA<br/>updated_at: 2023-09-18 16:56:23<br/>web: QHANAWEB<br/>', 'CONFIGURACIÓN', '2023-09-18', '16:56:23', '2023-09-18 20:56:23', '2023-09-18 20:56:23'),
(2, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ LA CONFIGURACIÓN', 'actividad: ACTIVIDAD QHANA<br/>alias: VALVEST<br/>ciudad: LA PAZ<br/>correo: QHANA@GMAIL.COM<br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nit: 1111111<br/>nombre_sistema: VALVEST<br/>razon_social: QHANA<br/>updated_at: 2023-09-18 16:56:23<br/>web: QHANAWEB<br/>', 'actividad: ACTIVIDAD QHANA<br/>alias: QHANA<br/>ciudad: LA PAZ<br/>correo: QHANA@GMAIL.COM<br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nit: 1111111<br/>nombre_sistema: QHANA<br/>razon_social: QHANA<br/>updated_at: 2023-09-18 17:27:26<br/>web: QHANAWEB<br/>', 'CONFIGURACIÓN', '2023-09-18', '17:27:26', '2023-09-18 21:27:26', '2023-09-18 21:27:26'),
(3, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'ci: 1234<br/>ci_exp: LP<br/>correo: juan@gmail.com<br/>created_at: 2023-09-19 14:30:04<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-09-19<br/>fono: 7777777<br/>foto: default.png<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$q.fJiEAafZGZW3fDvWjq7uAa85PxmpYKP6cG8I0PsPU4Po3h22dBy<br/>paterno: PERES<br/>tipo: ADMINISTRADOR<br/>updated_at: 2023-09-19 14:30:04<br/>usuario: jperes<br/>', NULL, 'USUARIOS', '2023-09-19', '14:30:04', '2023-09-19 18:30:04', '2023-09-19 18:30:04'),
(4, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ LA CONFIGURACIÓN', 'actividad: ACTIVIDAD QHANA<br/>alias: QHANA<br/>ciudad: LA PAZ<br/>correo: QHANA@GMAIL.COM<br/>correo_pedido: <br/>correo_pedido2: <br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nombre_sistema: QHANA<br/>razon_social: QHANA<br/>updated_at: 2023-09-18 17:27:26<br/>web: QHANAWEB<br/>', 'actividad: ACTIVIDAD QHANA<br/>alias: QHANA<br/>ciudad: LA PAZ<br/>correo: <br/>correo_pedido: qhanapedido@gmail.com<br/>correo_pedido2: qhanapedido2@gmail.com<br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nombre_sistema: QHANA<br/>razon_social: QHANA<br/>updated_at: 2023-09-28 17:09:05<br/>web: QHANAWEB<br/>', 'CONFIGURACIÓN', '2023-09-28', '17:09:05', '2023-09-28 21:09:05', '2023-09-28 21:09:05'),
(5, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ LA CONFIGURACIÓN', 'actividad: ACTIVIDAD QHANA<br/>alias: QHANA<br/>ciudad: LA PAZ<br/>correo: <br/>correo_pedido: qhanapedido@gmail.com<br/>correo_pedido2: qhanapedido2@gmail.com<br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nombre_sistema: QHANA<br/>razon_social: QHANA<br/>updated_at: 2023-09-28 17:09:05<br/>web: QHANAWEB<br/>', 'actividad: ACTIVIDAD QHANA<br/>alias: QHANA<br/>ciudad: LA PAZ<br/>correo: <br/>correo_pedido: qhanapedido@gmail.com<br/>correo_pedido2: qhanapedido2@gmail.com<br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nombre_sistema: QHANA<br/>razon_social: QHANA<br/>updated_at: 2023-09-28 17:09:11<br/>web: QHANAWEB<br/>', 'CONFIGURACIÓN', '2023-09-28', '17:09:11', '2023-09-28 21:09:11', '2023-09-28 21:09:11'),
(6, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ LA CONFIGURACIÓN', 'actividad: ACTIVIDAD QHANA<br/>alias: QHANA<br/>ciudad: LA PAZ<br/>correo: <br/>correo_pedido: qhanapedido@gmail.com<br/>correo_pedido2: qhanapedido2@gmail.com<br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nombre_sistema: QHANA<br/>razon_social: QHANA<br/>updated_at: 2023-09-28 17:09:11<br/>web: QHANAWEB<br/>', 'actividad: ACTIVIDAD QHANA<br/>alias: QHANA<br/>ciudad: LA PAZ<br/>correo: qhana@gmail.com<br/>correo_pedido: qhanapedido@gmail.com<br/>correo_pedido2: qhanapedido2@gmail.com<br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nombre_sistema: QHANA<br/>razon_social: QHANA<br/>updated_at: 2023-09-28 17:09:17<br/>web: QHANAWEB<br/>', 'CONFIGURACIÓN', '2023-09-28', '17:09:17', '2023-09-28 21:09:17', '2023-09-28 21:09:17'),
(7, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'cargo: CARGO QHANA BOLIVIA<br/>ci: 2222<br/>ci_exp: LP<br/>created_at: 2023-09-28 18:10:52<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2020-01-01<br/>fecha_nac: 2000-01-01<br/>fecha_registro: 2023-09-28<br/>fono: 777777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 4<br/>materno: MAMANI<br/>nombre: FERNANDO<br/>p_discapacidad: 70<br/>password: $2y$10$EosVGjhgfm3HNQ9JFnnbC..vgv7SsuWysSrLL7AjEq0iTRoYs/PWC<br/>paterno: MAMANI<br/>taller: TALLER #1<br/>tipo: ADMINISTRADOR<br/>tipo_personal: SOCIO<br/>updated_at: 2023-09-28 18:10:52<br/>usuario: fmamani<br/>validez_credencial: VALIDO DEL 20/01/23 AL 20/01/2024<br/>', NULL, 'USUARIOS', '2023-09-28', '18:10:52', '2023-09-28 22:10:52', '2023-09-28 22:10:52'),
(8, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'cargo: <br/>ci: 1234<br/>ci_exp: LP<br/>created_at: 2023-09-19 14:30:04<br/>dir: LOS OLIVOS<br/>estado: 0<br/>fecha_ingreso: <br/>fecha_nac: <br/>fecha_registro: 2023-09-19<br/>fono: 7777777<br/>foto: default.png<br/>genero: <br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>p_discapacidad: 0<br/>password: $2y$10$q.fJiEAafZGZW3fDvWjq7uAa85PxmpYKP6cG8I0PsPU4Po3h22dBy<br/>paterno: PERES<br/>taller: <br/>tipo: ADMINISTRADOR<br/>tipo_personal: <br/>updated_at: 2023-09-19 14:30:04<br/>usuario: JPERES<br/>validez_credencial: <br/>', 'cargo: CARGO #1 QHANA BOLIVIA<br/>ci: 1234<br/>ci_exp: LP<br/>created_at: 2023-09-19 14:30:04<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2019-01-01<br/>fecha_nac: 1990-02-02<br/>fecha_registro: 2023-09-19<br/>fono: 7777777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>p_discapacidad: 100<br/>password: $2y$10$q.fJiEAafZGZW3fDvWjq7uAa85PxmpYKP6cG8I0PsPU4Po3h22dBy<br/>paterno: PERES<br/>taller: TALLER #2<br/>tipo: REPRESENTANTE<br/>tipo_personal: SOCIO<br/>updated_at: 2023-09-28 18:12:45<br/>usuario: JPERES<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', 'USUARIOS', '2023-09-28', '18:12:45', '2023-09-28 22:12:45', '2023-09-28 22:12:45'),
(9, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'cargo: CARGO #3 QHANA BOLIVIA<br/>ci: 3333<br/>ci_exp: LP<br/>created_at: 2023-09-28 18:18:55<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2018-01-01<br/>fecha_nac: 1999-01-01<br/>fecha_registro: 2023-09-28<br/>fono: 66666<br/>foto: default.png<br/>genero: FEMENINO<br/>id: 5<br/>materno: MAMANI<br/>nombre: MARIA<br/>p_discapacidad: 100<br/>password: $2y$10$q9MGwRRWSzADVe559suEL.D3LmI4FS8Cjcw08Ja8mYDu7ao/NrLh2<br/>paterno: MAMANI<br/>taller: TALLER #3<br/>tipo: NINGUNO<br/>tipo_personal: TRABAJADOR<br/>updated_at: 2023-09-28 18:18:55<br/>usuario: MMAMANI<br/>validez_credencial: VALIDO DEL 01/01/23 AL 01/01/24<br/>', NULL, 'USUARIOS', '2023-09-28', '18:18:55', '2023-09-28 22:18:55', '2023-09-28 22:18:55'),
(10, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 4<br/>usuario: FMAMANI<br/>nombre: FERNANDO<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>fecha_nac: 2000-01-01<br/>genero: MASCULINO<br/>cargo: CARGO QHANA BOLIVIA<br/>fecha_ingreso: 2020-01-01<br/>taller: TALLER #1<br/>dir: LOS OLIVOS<br/>fono: 777777<br/>tipo_personal: SOCIO<br/>p_discapacidad: 70<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>validez_credencial: VALIDO DEL 20/01/23 AL 20/01/2024<br/>password: $2y$10$EosVGjhgfm3HNQ9JFnnbC..vgv7SsuWysSrLL7AjEq0iTRoYs/PWC<br/>estado: 1<br/>fecha_registro: 2023-09-28<br/>created_at: 2023-09-28 18:10:52<br/>updated_at: 2023-09-28 18:10:52<br/>', 'id: 4<br/>usuario: FMAMANI<br/>nombre: FERNANDO GONZALO<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>fecha_nac: 2000-01-01<br/>genero: MASCULINO<br/>cargo: CARGO QHANA BOLIVIA<br/>fecha_ingreso: 2020-01-01<br/>taller: TALLER #1<br/>dir: LOS OLIVOS<br/>fono: 777777<br/>tipo_personal: SOCIO<br/>p_discapacidad: 70<br/>tipo: ADMINISTRADOR<br/>foto: default.png<br/>validez_credencial: VALIDO DEL 20/01/23 AL 20/01/2024<br/>password: $2y$10$EosVGjhgfm3HNQ9JFnnbC..vgv7SsuWysSrLL7AjEq0iTRoYs/PWC<br/>estado: 1<br/>fecha_registro: 2023-09-28<br/>created_at: 2023-09-28 18:10:52<br/>updated_at: 2023-09-29 13:01:06<br/>', 'USUARIOS', '2023-09-29', '13:01:06', '2023-09-29 17:01:06', '2023-09-29 17:01:06'),
(11, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN BANNER', 'id: 3<br/>img: 1696262967_3.png<br/>posicion: 1<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS Y ABRIGOS<br/>muestra_boton: 1<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:09:27<br/>', NULL, 'BANNERS', '2023-10-02', '12:09:27', '2023-10-02 16:09:27', '2023-10-02 16:09:27'),
(12, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'id: 3<br/>img: 1696262967_3.png<br/>posicion: 1<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS Y ABRIGOS<br/>muestra_boton: 1<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:09:27<br/>', 'id: 3<br/>img: 1696262967_3.png<br/>posicion: 1<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS Y ABRIGOS<br/>muestra_boton: 0<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:18:14<br/>', 'BANNERS', '2023-10-02', '12:18:14', '2023-10-02 16:18:14', '2023-10-02 16:18:14'),
(13, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'id: 3<br/>img: 1696262967_3.png<br/>posicion: 1<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS Y ABRIGOS<br/>muestra_boton: 0<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:18:14<br/>', 'id: 3<br/>img: 1696262967_3.png<br/>posicion: 1<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS Y ABRIGOS<br/>muestra_boton: 0<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:18:14<br/>', 'BANNERS', '2023-10-02', '12:18:21', '2023-10-02 16:18:21', '2023-10-02 16:18:21'),
(14, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'id: 3<br/>img: 1696262967_3.png<br/>posicion: 1<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS Y ABRIGOS<br/>muestra_boton: 0<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:18:14<br/>', 'id: 3<br/>img: 1696263885_3.png<br/>posicion: 2<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS Y ABRIGOS<br/>muestra_boton: 1<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:24:45<br/>', 'BANNERS', '2023-10-02', '12:24:45', '2023-10-02 16:24:45', '2023-10-02 16:24:45'),
(15, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'id: 3<br/>img: 1696263885_3.png<br/>posicion: 2<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS Y ABRIGOS<br/>muestra_boton: 1<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:24:45<br/>', 'id: 3<br/>img: 1696263903_3.png<br/>posicion: 1<br/>desc1: <br/>desc2: <br/>muestra_boton: 0<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:25:03<br/>', 'BANNERS', '2023-10-02', '12:25:03', '2023-10-02 16:25:03', '2023-10-02 16:25:03'),
(16, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN BANNER', 'id: 4<br/>img: 1696263918_4.png<br/>posicion: 2<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS & ABRIGOS<br/>muestra_boton: 1<br/>created_at: 2023-10-02 12:25:18<br/>updated_at: 2023-10-02 12:25:18<br/>', NULL, 'BANNERS', '2023-10-02', '12:25:18', '2023-10-02 16:25:18', '2023-10-02 16:25:18'),
(17, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN BANNER', 'id: 4<br/>img: 1696263918_4.png<br/>posicion: 2<br/>desc1: NUEVA COLECCIÓN INVIERNO<br/>desc2: CHAQUETAS & ABRIGOS<br/>muestra_boton: 1<br/>created_at: 2023-10-02 12:25:18<br/>updated_at: 2023-10-02 12:25:18<br/>', NULL, 'BANNERS', '2023-10-02', '12:27:15', '2023-10-02 16:27:15', '2023-10-02 16:27:15'),
(18, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN BANNER', 'id: 3<br/>img: 1696263903_3.png<br/>posicion: 1<br/>desc1: <br/>desc2: <br/>muestra_boton: 0<br/>created_at: 2023-10-02 12:09:27<br/>updated_at: 2023-10-02 12:25:03<br/>', NULL, 'BANNERS', '2023-10-02', '12:27:18', '2023-10-02 16:27:18', '2023-10-02 16:27:18'),
(19, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN BANNER', 'id: 5<br/>img: 1696264182_5.png<br/>posicion: 1<br/>desc1: <br/>desc2: <br/>muestra_boton: 0<br/>created_at: 2023-10-02 12:29:42<br/>updated_at: 2023-10-02 12:29:42<br/>', NULL, 'BANNERS', '2023-10-02', '12:29:42', '2023-10-02 16:29:42', '2023-10-02 16:29:42'),
(20, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN BANNER', 'id: 6<br/>img: 1696264203_6.png<br/>posicion: 2<br/>desc1: NUEVA COLECCIÓN 2023<br/>desc2: CHAQUETAS Y ABRIGOS<br/>muestra_boton: 1<br/>created_at: 2023-10-02 12:30:03<br/>updated_at: 2023-10-02 12:30:03<br/>', NULL, 'BANNERS', '2023-10-02', '12:30:03', '2023-10-02 16:30:03', '2023-10-02 16:30:03'),
(21, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ACTIVIDAD', 'id: 1<br/>imagen: 1696265432_1.png<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.<br/>created_at: 2023-10-02 12:50:32<br/>updated_at: 2023-10-02 12:50:32<br/>', NULL, 'ACTIVIDADES', '2023-10-02', '12:50:32', '2023-10-02 16:50:32', '2023-10-02 16:50:32'),
(22, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ACTIVIDAD', 'id: 1<br/>imagen: 1696265432_1.png<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.<br/>created_at: 2023-10-02 12:50:32<br/>updated_at: 2023-10-02 12:50:32<br/>', 'id: 1<br/>imagen: 1696265481_1.png<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.<br/>created_at: 2023-10-02 12:50:32<br/>updated_at: 2023-10-02 12:51:21<br/>', 'ACTIVIDADES', '2023-10-02', '12:51:21', '2023-10-02 16:51:21', '2023-10-02 16:51:21'),
(23, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ACTIVIDAD', 'id: 1<br/>imagen: 1696265481_1.png<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.<br/>created_at: 2023-10-02 12:50:32<br/>updated_at: 2023-10-02 12:51:21<br/>', 'id: 1<br/>imagen: 1696265481_1.png<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.<br/>created_at: 2023-10-02 12:50:32<br/>updated_at: 2023-10-02 12:51:21<br/>', 'ACTIVIDADES', '2023-10-02', '12:51:24', '2023-10-02 16:51:24', '2023-10-02 16:51:24'),
(24, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA ACTIVIDAD', 'id: 1<br/>imagen: 1696265481_1.png<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.<br/>created_at: 2023-10-02 12:50:32<br/>updated_at: 2023-10-02 12:51:21<br/>', NULL, 'ACTIVIDADES', '2023-10-02', '12:52:15', '2023-10-02 16:52:15', '2023-10-02 16:52:15'),
(25, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ACTIVIDAD', 'id: 2<br/>imagen: 1696265570_2.png<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.<br/>created_at: 2023-10-02 12:52:50<br/>updated_at: 2023-10-02 12:52:50<br/>', NULL, 'ACTIVIDADES', '2023-10-02', '12:52:50', '2023-10-02 16:52:50', '2023-10-02 16:52:50'),
(26, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ACTIVIDAD', 'id: 2<br/>imagen: 1696265570_2.png<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.<br/>created_at: 2023-10-02 12:52:50<br/>updated_at: 2023-10-02 12:52:50<br/>', 'id: 2<br/>imagen: 1696265570_2.png<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE. LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE. IT IS A LONG ESTABLISHED FACT THAT A READER WILL BE DISTRACTED BY THE READABLE CONTENT LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM. LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.<br/>created_at: 2023-10-02 12:52:50<br/>updated_at: 2023-10-02 12:52:59<br/>', 'ACTIVIDADES', '2023-10-02', '12:52:59', '2023-10-02 16:52:59', '2023-10-02 16:52:59'),
(27, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ACTIVIDAD', 'id: 3<br/>imagen: 1696265610_3.png<br/>descripcion: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>created_at: 2023-10-02 12:53:30<br/>updated_at: 2023-10-02 12:53:30<br/>', NULL, 'ACTIVIDADES', '2023-10-02', '12:53:30', '2023-10-02 16:53:30', '2023-10-02 16:53:30'),
(28, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN NOSOTROS', 'id: 1<br/>historia: Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.<br/>mision: <br/>vision: <br/>created_at: 2023-10-02 13:11:42<br/>updated_at: 2023-10-02 13:11:42<br/>', NULL, 'NOSOTROS', '2023-10-02', '13:11:42', '2023-10-02 17:11:42', '2023-10-02 17:11:42'),
(29, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN NOSOTROS', 'id: 1<br/>historia: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>mision: <br/>vision: <br/>created_at: 2023-10-02 13:11:42<br/>updated_at: 2023-10-02 13:12:20<br/>', NULL, 'NOSOTROS', '2023-10-02', '13:12:20', '2023-10-02 17:12:20', '2023-10-02 17:12:20'),
(30, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: QHANA@GMAIL.COM<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #22323<br/>fonos: 22222 - 777777<br/>id: 1<br/>lat: -16.50405<br/>lng: -68.13081<br/>updated_at: 2023-10-02 15:08:12<br/>', NULL, 'CONTACTOS', '2023-10-02', '15:08:12', '2023-10-02 19:08:12', '2023-10-02 19:08:12'),
(31, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: QHANA@GMAIL.COM<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #22323<br/>fonos: 22222 - 777777<br/>id: 1<br/>lat: -16.50405<br/>lng: -68.13081<br/>updated_at: 2023-10-02 15:08:12<br/>', NULL, 'CONTACTOS', '2023-10-02', '15:09:21', '2023-10-02 19:09:21', '2023-10-02 19:09:21'),
(32, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: QHANA@GMAIL.COM<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #22323<br/>fonos: 22222 - 777777<br/>id: 1<br/>lat: -16.50448718869<br/>lng: -68.131105042992<br/>updated_at: 2023-10-02 15:09:28<br/>', NULL, 'CONTACTOS', '2023-10-02', '15:09:28', '2023-10-02 19:09:28', '2023-10-02 19:09:28'),
(33, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: QHANA@GMAIL.COM<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #22323<br/>fonos: 22222 - 777777<br/>id: 1<br/>lat: -16.504965523418<br/>lng: -68.130509592591<br/>updated_at: 2023-10-02 15:10:17<br/>', NULL, 'CONTACTOS', '2023-10-02', '15:10:17', '2023-10-02 19:10:17', '2023-10-02 19:10:17'),
(34, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: qhana@gmail.com<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #1111<br/>fonos: 22222 - 77766666<br/>id: 1<br/>lat: -16.504965523418<br/>lng: -68.130509592591<br/>updated_at: 2023-10-02 15:10:55<br/>', NULL, 'CONTACTOS', '2023-10-02', '15:10:55', '2023-10-02 19:10:55', '2023-10-02 19:10:55'),
(35, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: qhana@gmail.com<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #1111<br/>fonos: 22222 - 77766666<br/>id: 1<br/>lat: -16.504420324601<br/>lng: -68.131239153443<br/>updated_at: 2023-10-02 15:23:00<br/>', NULL, 'CONTACTOS', '2023-10-02', '15:23:00', '2023-10-02 19:23:00', '2023-10-02 19:23:00'),
(36, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN REDES SOCIALES', 'created_at: 2023-10-02 15:32:46<br/>facebook: <br/>id: 1<br/>instagram: <br/>twitter: <br/>updated_at: 2023-10-02 15:32:46<br/>youtube: <br/>', NULL, 'REDES SOCIALES', '2023-10-02', '15:32:46', '2023-10-02 19:32:46', '2023-10-02 19:32:46'),
(37, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN REDES SOCIALES', 'created_at: 2023-10-02 15:32:46<br/>facebook: HTTPS://WWW.FACEBOOK.COM/<br/>id: 1<br/>instagram: <br/>twitter: <br/>updated_at: 2023-10-02 15:33:18<br/>youtube: HTTPS://WWW.YOUTUBE.COM/<br/>', NULL, 'REDES SOCIALES', '2023-10-02', '15:33:18', '2023-10-02 19:33:18', '2023-10-02 19:33:18'),
(38, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN REDES SOCIALES', 'created_at: 2023-10-02 15:32:46<br/>facebook: https://www.facebook.com/<br/>id: 1<br/>instagram: <br/>twitter: <br/>updated_at: 2023-10-02 15:33:35<br/>youtube: https://www.youtube.com/<br/>', NULL, 'REDES SOCIALES', '2023-10-02', '15:33:35', '2023-10-02 19:33:35', '2023-10-02 19:33:35'),
(39, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ACTIVIDAD', 'created_at: 2023-10-02 12:53:30<br/>descripcion: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>id: 3<br/>imagen: 1696265610_3.png<br/>updated_at: 2023-10-02 12:53:30<br/>', 'created_at: 2023-10-02 12:53:30<br/>descripcion: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>id: 3<br/>imagen: 1696275555_3.jpg<br/>updated_at: 2023-10-02 15:39:15<br/>', 'ACTIVIDADES', '2023-10-02', '15:39:15', '2023-10-02 19:39:15', '2023-10-02 19:39:15'),
(40, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'created_at: 2023-10-02 12:30:03<br/>desc1: NUEVA COLECCIÓN 2023<br/>desc2: CHAQUETAS Y ABRIGOS<br/>id: 6<br/>img: 1696264203_6.png<br/>muestra_boton: 1<br/>posicion: 2<br/>updated_at: 2023-10-02 12:30:03<br/>', 'created_at: 2023-10-02 12:30:03<br/>desc1: NUEVA COLECCIÓN 2023<br/>desc2: CHAQUETAS Y ABRIGOS<br/>id: 6<br/>img: 1696264203_6.png<br/>muestra_boton: 1<br/>posicion: 1<br/>updated_at: 2023-10-02 15:47:35<br/>', 'BANNERS', '2023-10-02', '15:47:35', '2023-10-02 19:47:35', '2023-10-02 19:47:35'),
(41, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'created_at: 2023-10-02 12:29:42<br/>desc1: <br/>desc2: <br/>id: 5<br/>img: 1696264182_5.png<br/>muestra_boton: 0<br/>posicion: 1<br/>updated_at: 2023-10-02 12:29:42<br/>', 'created_at: 2023-10-02 12:29:42<br/>desc1: <br/>desc2: <br/>id: 5<br/>img: 1696264182_5.png<br/>muestra_boton: 0<br/>posicion: 2<br/>updated_at: 2023-10-02 15:47:38<br/>', 'BANNERS', '2023-10-02', '15:47:38', '2023-10-02 19:47:38', '2023-10-02 19:47:38'),
(42, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'created_at: 2023-10-02 12:29:42<br/>desc1: <br/>desc2: <br/>id: 5<br/>img: 1696264182_5.png<br/>muestra_boton: 0<br/>posicion: 2<br/>updated_at: 2023-10-02 15:47:38<br/>', 'created_at: 2023-10-02 12:29:42<br/>desc1: <br/>desc2: <br/>id: 5<br/>img: 1696264182_5.png<br/>muestra_boton: 0<br/>posicion: 1<br/>updated_at: 2023-10-02 15:47:49<br/>', 'BANNERS', '2023-10-02', '15:47:49', '2023-10-02 19:47:49', '2023-10-02 19:47:49'),
(43, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'created_at: 2023-10-02 12:29:42<br/>desc1: <br/>desc2: <br/>id: 5<br/>img: 1696264182_5.png<br/>muestra_boton: 0<br/>posicion: 1<br/>updated_at: 2023-10-02 15:47:49<br/>', 'created_at: 2023-10-02 12:29:42<br/>desc1: <br/>desc2: <br/>id: 5<br/>img: 1696264182_5.png<br/>muestra_boton: 0<br/>posicion: 2<br/>updated_at: 2023-10-02 15:47:52<br/>', 'BANNERS', '2023-10-02', '15:47:52', '2023-10-02 19:47:52', '2023-10-02 19:47:52'),
(44, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'created_at: 2023-10-02 12:29:42<br/>desc1: <br/>desc2: <br/>id: 5<br/>img: 1696264182_5.png<br/>muestra_boton: 0<br/>posicion: 2<br/>updated_at: 2023-10-02 15:47:52<br/>', 'created_at: 2023-10-02 12:29:42<br/>desc1: <br/>desc2: <br/>id: 5<br/>img: 1696264182_5.png<br/>muestra_boton: 0<br/>posicion: 1<br/>updated_at: 2023-10-02 15:48:21<br/>', 'BANNERS', '2023-10-02', '15:48:21', '2023-10-02 19:48:21', '2023-10-02 19:48:21'),
(45, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN BANNER', 'created_at: 2023-10-02 12:30:03<br/>desc1: NUEVA COLECCIÓN 2023<br/>desc2: CHAQUETAS Y ABRIGOS<br/>id: 6<br/>img: 1696264203_6.png<br/>muestra_boton: 1<br/>posicion: 1<br/>updated_at: 2023-10-02 15:47:35<br/>', 'created_at: 2023-10-02 12:30:03<br/>desc1: NUEVA COLECCIÓN 2023<br/>desc2: CHAQUETAS Y ABRIGOS<br/>id: 6<br/>img: 1696264203_6.png<br/>muestra_boton: 1<br/>posicion: 2<br/>updated_at: 2023-10-02 15:48:27<br/>', 'BANNERS', '2023-10-02', '15:48:27', '2023-10-02 19:48:27', '2023-10-02 19:48:27'),
(46, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN NOSOTROS', 'created_at: 2023-10-02 13:11:42<br/>historia: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>id: 1<br/>mision: <br/>updated_at: 2023-10-02 17:05:57<br/>vision: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>', NULL, 'NOSOTROS', '2023-10-02', '17:05:57', '2023-10-02 21:05:57', '2023-10-02 21:05:57'),
(47, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN NOSOTROS', 'created_at: 2023-10-02 13:11:42<br/>historia: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>id: 1<br/>mision: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>updated_at: 2023-10-02 17:05:59<br/>vision: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>', NULL, 'NOSOTROS', '2023-10-02', '17:05:59', '2023-10-02 21:05:59', '2023-10-02 21:05:59'),
(48, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CATALOGO', 'cargo: <br/>ci: <br/>ci_exp: <br/>created_at: 2023-10-03 15:49:12<br/>dir: <br/>estado: <br/>fecha_ingreso: <br/>fecha_nac: <br/>fecha_registro: <br/>fono: <br/>foto: <br/>genero: <br/>id: 1<br/>materno: <br/>nombre: CATALOGO #1<br/>p_discapacidad: <br/>password: <br/>paterno: <br/>taller: <br/>tipo: <br/>tipo_personal: <br/>updated_at: 2023-10-03 15:49:12<br/>usuario: <br/>validez_credencial: <br/>', NULL, 'CATALOGOS', '2023-10-03', '15:49:12', '2023-10-03 19:49:12', '2023-10-03 19:49:12'),
(49, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN CATALOGO', 'cargo: <br/>ci: <br/>ci_exp: <br/>created_at: 2023-10-03 15:49:12<br/>dir: <br/>estado: <br/>fecha_ingreso: <br/>fecha_nac: <br/>fecha_registro: <br/>fono: <br/>foto: <br/>genero: <br/>id: 1<br/>materno: <br/>nombre: CATALOGO #1<br/>p_discapacidad: <br/>password: <br/>paterno: <br/>taller: <br/>tipo: <br/>tipo_personal: <br/>updated_at: 2023-10-03 15:49:12<br/>usuario: <br/>validez_credencial: <br/>', 'cargo: <br/>ci: <br/>ci_exp: <br/>created_at: 2023-10-03 15:49:12<br/>dir: <br/>estado: <br/>fecha_ingreso: <br/>fecha_nac: <br/>fecha_registro: <br/>fono: <br/>foto: <br/>genero: <br/>id: 1<br/>materno: <br/>nombre: CATALOGO #1 MODIFICADO<br/>p_discapacidad: <br/>password: <br/>paterno: <br/>taller: <br/>tipo: <br/>tipo_personal: <br/>updated_at: 2023-10-03 15:49:22<br/>usuario: <br/>validez_credencial: <br/>', 'CATALOGOS', '2023-10-03', '15:49:22', '2023-10-03 19:49:22', '2023-10-03 19:49:22'),
(50, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN CATALOGO', 'cargo: <br/>ci: <br/>ci_exp: <br/>created_at: 2023-10-03 15:49:12<br/>dir: <br/>estado: <br/>fecha_ingreso: <br/>fecha_nac: <br/>fecha_registro: <br/>fono: <br/>foto: <br/>genero: <br/>id: 1<br/>materno: <br/>nombre: CATALOGO #1 MODIFICADO<br/>p_discapacidad: <br/>password: <br/>paterno: <br/>taller: <br/>tipo: <br/>tipo_personal: <br/>updated_at: 2023-10-03 15:49:22<br/>usuario: <br/>validez_credencial: <br/>', NULL, 'CATALOGOS', '2023-10-03', '15:50:02', '2023-10-03 19:50:02', '2023-10-03 19:50:02'),
(51, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CATALOGO', 'cargo: <br/>ci: <br/>ci_exp: <br/>created_at: 2023-10-03 15:50:29<br/>dir: <br/>estado: <br/>fecha_ingreso: <br/>fecha_nac: <br/>fecha_registro: <br/>fono: <br/>foto: <br/>genero: <br/>id: 2<br/>materno: <br/>nombre: CATÁLOGO #1<br/>p_discapacidad: <br/>password: <br/>paterno: <br/>taller: <br/>tipo: <br/>tipo_personal: <br/>updated_at: 2023-10-03 15:50:29<br/>usuario: <br/>validez_credencial: <br/>', NULL, 'CATALOGOS', '2023-10-03', '15:50:29', '2023-10-03 19:50:29', '2023-10-03 19:50:29'),
(52, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CATALOGO', 'cargo: <br/>ci: <br/>ci_exp: <br/>created_at: 2023-10-03 15:50:56<br/>dir: <br/>estado: <br/>fecha_ingreso: <br/>fecha_nac: <br/>fecha_registro: <br/>fono: <br/>foto: <br/>genero: <br/>id: 1<br/>materno: <br/>nombre: CATÁLOGO #1<br/>p_discapacidad: <br/>password: <br/>paterno: <br/>taller: <br/>tipo: <br/>tipo_personal: <br/>updated_at: 2023-10-03 15:50:56<br/>usuario: <br/>validez_credencial: <br/>', NULL, 'CATALOGOS', '2023-10-03', '15:50:56', '2023-10-03 19:50:56', '2023-10-03 19:50:56'),
(53, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CATALOGO', 'cargo: <br/>ci: <br/>ci_exp: <br/>created_at: 2023-10-03 15:51:05<br/>dir: <br/>estado: <br/>fecha_ingreso: <br/>fecha_nac: <br/>fecha_registro: <br/>fono: <br/>foto: <br/>genero: <br/>id: 2<br/>materno: <br/>nombre: CATÁLOGO #2<br/>p_discapacidad: <br/>password: <br/>paterno: <br/>taller: <br/>tipo: <br/>tipo_personal: <br/>updated_at: 2023-10-03 15:51:05<br/>usuario: <br/>validez_credencial: <br/>', NULL, 'CATALOGOS', '2023-10-03', '15:51:05', '2023-10-03 19:51:05', '2023-10-03 19:51:05'),
(54, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'cantidad_stock: 10<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:33:06<br/>descripcion: DESC. PROD. #1<br/>id: 1<br/>imagen: default.png<br/>nombre: PRODUCTO #1<br/>precio: 300<br/>updated_at: 2023-10-03 16:33:06<br/>', NULL, 'PRODUCTOS', '2023-10-03', '16:33:06', '2023-10-03 20:33:06', '2023-10-03 20:33:06'),
(55, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'cantidad_stock: 5<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:33:49<br/>descripcion: <br/>id: 2<br/>imagen: 1696365229_2.jpg<br/>nombre: PRODUCTO #2<br/>precio: 200<br/>updated_at: 2023-10-03 16:33:49<br/>', NULL, 'PRODUCTOS', '2023-10-03', '16:33:49', '2023-10-03 20:33:49', '2023-10-03 20:33:49'),
(56, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'cantidad_stock: 5<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:33:49<br/>descripcion: <br/>id: 2<br/>imagen: 1696365229_2.jpg<br/>nombre: PRODUCTO #2<br/>precio: 200.00<br/>updated_at: 2023-10-03 16:33:49<br/>', 'cantidad_stock: 5<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:33:49<br/>descripcion: <br/>id: 2<br/>imagen: 1696365293_2.jpg<br/>nombre: PRODUCTO #2<br/>precio: 200.00<br/>updated_at: 2023-10-03 16:34:53<br/>', 'PRODUCTOS', '2023-10-03', '16:34:53', '2023-10-03 20:34:53', '2023-10-03 20:34:53'),
(57, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN PRODUCTO', 'cantidad_stock: 5<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:33:49<br/>descripcion: <br/>id: 2<br/>imagen: 1696365293_2.jpg<br/>nombre: PRODUCTO #2<br/>precio: 200.00<br/>updated_at: 2023-10-03 16:34:53<br/>', NULL, 'PRODUCTOS', '2023-10-03', '16:37:07', '2023-10-03 20:37:07', '2023-10-03 20:37:07'),
(58, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'cantidad_stock: 5<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:37:24<br/>descripcion: <br/>id: 3<br/>imagen: 1696365444_3.jpg<br/>nombre: PRODUCTO #2<br/>precio: 200<br/>updated_at: 2023-10-03 16:37:24<br/>', NULL, 'PRODUCTOS', '2023-10-03', '16:37:24', '2023-10-03 20:37:24', '2023-10-03 20:37:24'),
(59, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'cantidad_stock: 3<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:37:47<br/>descripcion: DESC #3<br/>id: 4<br/>imagen: 1696365467_4.jpg<br/>nombre: PRODUCTO #3<br/>precio: 189.99<br/>updated_at: 2023-10-03 16:37:47<br/>', NULL, 'PRODUCTOS', '2023-10-03', '16:37:47', '2023-10-03 20:37:47', '2023-10-03 20:37:47'),
(60, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'cantidad_stock: 3<br/>catalogo_id: 2<br/>created_at: 2023-10-03 16:38:36<br/>descripcion: <br/>id: 5<br/>imagen: 1696365516_5.jpg<br/>nombre: PRODUCTO #4<br/>precio: 99.99<br/>updated_at: 2023-10-03 16:38:36<br/>', NULL, 'PRODUCTOS', '2023-10-03', '16:38:36', '2023-10-03 20:38:36', '2023-10-03 20:38:36'),
(61, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'cantidad_stock: 3<br/>catalogo_id: 2<br/>created_at: 2023-10-03 16:38:36<br/>descripcion: <br/>id: 5<br/>imagen: 1696365516_5.jpg<br/>nombre: PRODUCTO #4<br/>precio: 99.99<br/>updated_at: 2023-10-03 16:38:36<br/>', 'cantidad_stock: 3<br/>catalogo_id: 2<br/>created_at: 2023-10-03 16:38:36<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>id: 5<br/>imagen: 1696365516_5.jpg<br/>nombre: PRODUCTO #4<br/>precio: 99.99<br/>updated_at: 2023-10-03 16:39:52<br/>', 'PRODUCTOS', '2023-10-03', '16:39:52', '2023-10-03 20:39:52', '2023-10-03 20:39:52'),
(62, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'cantidad_stock: 3<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:37:47<br/>descripcion: DESC #3<br/>id: 4<br/>imagen: 1696365467_4.jpg<br/>nombre: PRODUCTO #3<br/>precio: 189.99<br/>updated_at: 2023-10-03 16:37:47<br/>', 'cantidad_stock: 3<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:37:47<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>id: 4<br/>imagen: 1696365467_4.jpg<br/>nombre: PRODUCTO #3<br/>precio: 189.99<br/>updated_at: 2023-10-03 16:39:57<br/>', 'PRODUCTOS', '2023-10-03', '16:39:57', '2023-10-03 20:39:57', '2023-10-03 20:39:57'),
(63, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'cantidad_stock: 5<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:37:24<br/>descripcion: <br/>id: 3<br/>imagen: 1696365444_3.jpg<br/>nombre: PRODUCTO #2<br/>precio: 200.00<br/>updated_at: 2023-10-03 16:37:24<br/>', 'cantidad_stock: 5<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:37:24<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>id: 3<br/>imagen: 1696365444_3.jpg<br/>nombre: PRODUCTO #2<br/>precio: 200.00<br/>updated_at: 2023-10-03 16:40:02<br/>', 'PRODUCTOS', '2023-10-03', '16:40:02', '2023-10-03 20:40:02', '2023-10-03 20:40:02'),
(64, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'cantidad_stock: 10<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:33:06<br/>descripcion: DESC. PROD. #1<br/>id: 1<br/>imagen: default.png<br/>nombre: PRODUCTO #1<br/>precio: 300.00<br/>updated_at: 2023-10-03 16:33:06<br/>', 'cantidad_stock: 10<br/>catalogo_id: 1<br/>created_at: 2023-10-03 16:33:06<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>id: 1<br/>imagen: default.png<br/>nombre: PRODUCTO #1<br/>precio: 300.00<br/>updated_at: 2023-10-03 16:40:08<br/>', 'PRODUCTOS', '2023-10-03', '16:40:08', '2023-10-03 20:40:08', '2023-10-03 20:40:08'),
(65, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'cantidad_stock: 10<br/>catalogo_id: 2<br/>created_at: 2023-10-03 16:45:30<br/>descripcion: PROD 5<br/>id: 6<br/>imagen: 1696365930_6.jpg<br/>nombre: PRODUCTO #5<br/>precio: 200.5<br/>updated_at: 2023-10-03 16:45:30<br/>', NULL, 'PRODUCTOS', '2023-10-03', '16:45:30', '2023-10-03 20:45:30', '2023-10-03 20:45:30'),
(66, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'cantidad_stock: 2<br/>catalogo_id: 2<br/>created_at: 2023-10-03 16:45:44<br/>descripcion: DESC 6<br/>id: 7<br/>imagen: default.png<br/>nombre: PRODUCTO #6<br/>precio: 100<br/>updated_at: 2023-10-03 16:45:44<br/>', NULL, 'PRODUCTOS', '2023-10-03', '16:45:44', '2023-10-03 20:45:44', '2023-10-03 20:45:44'),
(67, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PEDIDO', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 20:57:28<br/>', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:09:55<br/>', 'PEDIDOS', '2023-10-08', '22:09:55', '2023-10-09 02:09:55', '2023-10-09 02:09:55'),
(68, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PEDIDO', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:09:55<br/>', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:14:19<br/>', 'PEDIDOS', '2023-10-08', '22:14:19', '2023-10-09 02:14:19', '2023-10-09 02:14:19'),
(69, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PEDIDO', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:14:19<br/>', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:14:51<br/>', 'PEDIDOS', '2023-10-08', '22:14:51', '2023-10-09 02:14:51', '2023-10-09 02:14:51');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(70, 1, 'MODIFICACIÓN', 'EL USUARIO  ELIMINÓ UN PEDIDO', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:14:51<br/>', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:15:58<br/>', 'PEDIDOS', '2023-10-08', '22:15:58', '2023-10-09 02:15:58', '2023-10-09 02:15:58'),
(71, 1, 'MODIFICACIÓN', 'EL USUARIO  RESTABLECIÓ UN PEDIDO', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:15:58<br/>', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:25:39<br/>', 'PEDIDOS', '2023-10-08', '22:25:39', '2023-10-09 02:25:39', '2023-10-09 02:25:39'),
(72, 1, 'MODIFICACIÓN', 'EL USUARIO  CAMBIO UN PEDIDO A ATENDIDO', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:25:39<br/>', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: ATENDIDO<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:25:54<br/>', 'PEDIDOS', '2023-10-08', '22:25:54', '2023-10-09 02:25:54', '2023-10-09 02:25:54'),
(73, 1, 'MODIFICACIÓN', 'EL USUARIO  ELIMINÓ UN PEDIDO', 'apellidos: PERES<br/>correo: <br/>created_at: 2023-10-08 20:59:37<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-08<br/>fono: 6666<br/>id: 2<br/>monto_total: 100.00<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 20:59:37<br/>', 'apellidos: PERES<br/>correo: <br/>created_at: 2023-10-08 20:59:37<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-08<br/>fono: 6666<br/>id: 2<br/>monto_total: 100.00<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:26:03<br/>', 'PEDIDOS', '2023-10-08', '22:26:03', '2023-10-09 02:26:03', '2023-10-09 02:26:03'),
(74, 1, 'MODIFICACIÓN', 'EL USUARIO  ELIMINÓ UN PEDIDO', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: ATENDIDO<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:25:54<br/>', 'apellidos: PERES<br/>correo: JUAN@GMAIL.COM<br/>created_at: 2023-10-08 20:57:28<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-08<br/>fono: 7777777<br/>id: 1<br/>monto_total: 690.98<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:27:32<br/>', 'PEDIDOS', '2023-10-08', '22:27:32', '2023-10-09 02:27:32', '2023-10-09 02:27:32'),
(75, 1, 'MODIFICACIÓN', 'EL USUARIO  CAMBIO UN PEDIDO A ATENDIDO', 'apellidos: GONZALES<br/>correo: FELIPE@GMAIL.COM<br/>created_at: 2023-10-08 21:01:37<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-08<br/>fono: 777777<br/>id: 3<br/>monto_total: 200.00<br/>nombres: FELIPE<br/>pec: LA PAZ<br/>updated_at: 2023-10-08 21:01:37<br/>', 'apellidos: GONZALES<br/>correo: FELIPE@GMAIL.COM<br/>created_at: 2023-10-08 21:01:37<br/>estado: ATENDIDO<br/>fecha_registro: 2023-10-08<br/>fono: 777777<br/>id: 3<br/>monto_total: 200.00<br/>nombres: FELIPE<br/>pec: LA PAZ<br/>updated_at: 2023-10-08 22:27:42<br/>', 'PEDIDOS', '2023-10-08', '22:27:42', '2023-10-09 02:27:42', '2023-10-09 02:27:42'),
(76, 1, 'MODIFICACIÓN', 'EL USUARIO  RESTABLECIÓ UN PEDIDO', 'apellidos: PERES<br/>correo: <br/>created_at: 2023-10-08 20:59:37<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-08<br/>fono: 6666<br/>id: 2<br/>monto_total: 100.00<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:26:03<br/>', 'apellidos: PERES<br/>correo: <br/>created_at: 2023-10-08 20:59:37<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-08<br/>fono: 6666<br/>id: 2<br/>monto_total: 100.00<br/>nombres: JUAN<br/>pec: BOLIVIA<br/>updated_at: 2023-10-08 22:28:09<br/>', 'PEDIDOS', '2023-10-08', '22:28:09', '2023-10-09 02:28:09', '2023-10-09 02:28:09'),
(77, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: qhana@gmail.com<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #1111<br/>fonos: 22222 - 77766666<br/>id: 1<br/>lat: -16.504194015207<br/>lng: -68.131335712968<br/>updated_at: 2023-10-08 22:29:52<br/>', NULL, 'CONTACTOS', '2023-10-08', '22:29:52', '2023-10-09 02:29:52', '2023-10-09 02:29:52'),
(78, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN APIS', 'api_google: AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes<br/>correo: correosyseventos@gmail.com<br/>created_at: 2023-10-09 11:12:54<br/>id: 1<br/>nombre: Qhana<br/>password: gywdptczpyhtkghm<br/>updated_at: 2023-10-09 11:12:54<br/>', NULL, 'APIS', '2023-10-09', '11:12:54', '2023-10-09 15:12:54', '2023-10-09 15:12:54'),
(79, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'acceso: 0<br/>cargo: CARGO #1 QHANA BOLIVIA<br/>ci: 1234<br/>ci_exp: LP<br/>created_at: 2023-09-19 14:30:04<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2019-01-01<br/>fecha_nac: 1990-02-02<br/>fecha_registro: 2023-09-19<br/>fono: 7777777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>p_discapacidad: 100<br/>password: $2y$10$q.fJiEAafZGZW3fDvWjq7uAa85PxmpYKP6cG8I0PsPU4Po3h22dBy<br/>paterno: PERES<br/>taller: TALLER #2<br/>tipo: REPRESENTANTE<br/>tipo_personal: SOCIO<br/>updated_at: 2023-09-28 18:12:45<br/>usuario: JPERES<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', 'acceso: 0<br/>cargo: CARGO #1 QHANA BOLIVIA<br/>ci: 1234<br/>ci_exp: LP<br/>created_at: 2023-09-19 14:30:04<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2019-01-01<br/>fecha_nac: 1990-02-02<br/>fecha_registro: 2023-09-19<br/>fono: 7777777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>p_discapacidad: 100<br/>password: $2y$10$q.fJiEAafZGZW3fDvWjq7uAa85PxmpYKP6cG8I0PsPU4Po3h22dBy<br/>paterno: PERES<br/>taller: TALLER #2<br/>tipo: REPRESENTANTE<br/>tipo_personal: SOCIO<br/>updated_at: 2023-09-28 18:12:45<br/>usuario: JPERES<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', 'USUARIOS', '2023-10-09', '11:32:40', '2023-10-09 15:32:40', '2023-10-09 15:32:40'),
(80, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'acceso: 0<br/>cargo: CARGO #1 QHANA BOLIVIA<br/>ci: 1234<br/>ci_exp: LP<br/>created_at: 2023-09-19 14:30:04<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2019-01-01<br/>fecha_nac: 1990-02-02<br/>fecha_registro: 2023-09-19<br/>fono: 7777777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>p_discapacidad: 100<br/>password: $2y$10$q.fJiEAafZGZW3fDvWjq7uAa85PxmpYKP6cG8I0PsPU4Po3h22dBy<br/>paterno: PERES<br/>taller: TALLER #2<br/>tipo: REPRESENTANTE<br/>tipo_personal: SOCIO<br/>updated_at: 2023-09-28 18:12:45<br/>usuario: JPERES<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', 'acceso: 1<br/>cargo: CARGO #1 QHANA BOLIVIA<br/>ci: 1234<br/>ci_exp: LP<br/>created_at: 2023-09-19 14:30:04<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2019-01-01<br/>fecha_nac: 1990-02-02<br/>fecha_registro: 2023-09-19<br/>fono: 7777777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>p_discapacidad: 100<br/>password: $2y$10$q.fJiEAafZGZW3fDvWjq7uAa85PxmpYKP6cG8I0PsPU4Po3h22dBy<br/>paterno: PERES<br/>taller: TALLER #2<br/>tipo: REPRESENTANTE<br/>tipo_personal: SOCIO<br/>updated_at: 2023-10-09 11:32:56<br/>usuario: JPERES<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', 'USUARIOS', '2023-10-09', '11:32:56', '2023-10-09 15:32:56', '2023-10-09 15:32:56'),
(81, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'acceso: 1<br/>cargo: CARGO #4<br/>ci: 4444<br/>ci_exp: CB<br/>created_at: 2023-10-09 11:34:49<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2023-10-09<br/>fecha_nac: 1999-01-01<br/>fecha_registro: 2023-10-09<br/>fono: 77777<br/>foto: default.png<br/>genero: FEMENINO<br/>id: 6<br/>materno: CACERES<br/>nombre: SOFIA<br/>p_discapacidad: 0<br/>password: $2y$10$YL0hndJf5qJZg3kL380SiOt/f4Dzhk2VThPQKnPKRCP/Btfe1eiO6<br/>paterno: CACERES<br/>taller: TALLER #2<br/>tipo: SOCIO<br/>tipo_personal: SOCIO<br/>updated_at: 2023-10-09 11:34:49<br/>usuario: SCACERES<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', NULL, 'USUARIOS', '2023-10-09', '11:34:49', '2023-10-09 15:34:49', '2023-10-09 15:34:49'),
(82, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'acceso: 0<br/>cargo: SIN CARGO<br/>ci: 5555<br/>ci_exp: CB<br/>created_at: 2023-10-09 11:35:58<br/>dir: LOS OLIVOS<br/>estado: 0<br/>fecha_ingreso: 2023-01-01<br/>fecha_nac: 2000-03-03<br/>fecha_registro: 2023-10-09<br/>fono: 7777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 7<br/>materno: QUISPE<br/>nombre: ELVIS<br/>p_discapacidad: 0<br/>password: $2y$10$AKGhHxtE.Bp5AYiw9fe1Ou6j1bZU7QC0VvVrdGbnwGa5dUSqHQQ9.<br/>paterno: QUISPE<br/>taller: TALLER #3<br/>tipo: NINGUNO<br/>tipo_personal: TRABAJADOR<br/>updated_at: 2023-10-09 11:35:58<br/>usuario: EQUISPE<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', NULL, 'USUARIOS', '2023-10-09', '11:35:58', '2023-10-09 15:35:58', '2023-10-09 15:35:58'),
(83, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'acceso: 0<br/>cargo: SIN CARGO<br/>ci: 5555<br/>ci_exp: CB<br/>created_at: 2023-10-09 11:35:58<br/>dir: LOS OLIVOS<br/>estado: 0<br/>fecha_ingreso: 2023-01-01<br/>fecha_nac: 2000-03-03<br/>fecha_registro: 2023-10-09<br/>fono: 7777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 7<br/>materno: QUISPE<br/>nombre: ELVIS<br/>p_discapacidad: 0<br/>password: $2y$10$AKGhHxtE.Bp5AYiw9fe1Ou6j1bZU7QC0VvVrdGbnwGa5dUSqHQQ9.<br/>paterno: QUISPE<br/>taller: TALLER #3<br/>tipo: NINGUNO<br/>tipo_personal: TRABAJADOR<br/>updated_at: 2023-10-09 11:35:58<br/>usuario: EQUISPE<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', 'acceso: 1<br/>cargo: SIN CARGO<br/>ci: 5555<br/>ci_exp: CB<br/>created_at: 2023-10-09 11:35:58<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2023-01-01<br/>fecha_nac: 2000-03-03<br/>fecha_registro: 2023-10-09<br/>fono: 7777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 7<br/>materno: QUISPE<br/>nombre: ELVIS<br/>p_discapacidad: 0<br/>password: $2y$10$AKGhHxtE.Bp5AYiw9fe1Ou6j1bZU7QC0VvVrdGbnwGa5dUSqHQQ9.<br/>paterno: QUISPE<br/>taller: TALLER #3<br/>tipo: NINGUNO<br/>tipo_personal: TRABAJADOR<br/>updated_at: 2023-10-09 11:36:45<br/>usuario: EQUISPE<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', 'USUARIOS', '2023-10-09', '11:36:45', '2023-10-09 15:36:45', '2023-10-09 15:36:45'),
(84, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'acceso: 0<br/>cargo: CARGO #3 QHANA BOLIVIA<br/>ci: 3333<br/>ci_exp: LP<br/>created_at: 2023-09-28 18:18:55<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2018-01-01<br/>fecha_nac: 1999-01-01<br/>fecha_registro: 2023-09-28<br/>fono: 66666<br/>foto: default.png<br/>genero: FEMENINO<br/>id: 5<br/>materno: MAMANI<br/>nombre: MARIA<br/>p_discapacidad: 100<br/>password: $2y$10$q9MGwRRWSzADVe559suEL.D3LmI4FS8Cjcw08Ja8mYDu7ao/NrLh2<br/>paterno: MAMANI<br/>taller: TALLER #3<br/>tipo: NINGUNO<br/>tipo_personal: TRABAJADOR<br/>updated_at: 2023-09-28 18:18:55<br/>usuario: MMAMANI<br/>validez_credencial: VALIDO DEL 01/01/23 AL 01/01/24<br/>', 'acceso: 0<br/>cargo: CARGO #3 QHANA BOLIVIA<br/>ci: 3333<br/>ci_exp: LP<br/>created_at: 2023-09-28 18:18:55<br/>dir: LOS OLIVOS<br/>estado: 0<br/>fecha_ingreso: 2018-01-01<br/>fecha_nac: 1999-01-01<br/>fecha_registro: 2023-09-28<br/>fono: 66666<br/>foto: default.png<br/>genero: FEMENINO<br/>id: 5<br/>materno: MAMANI<br/>nombre: MARIA<br/>p_discapacidad: 100<br/>password: $2y$10$q9MGwRRWSzADVe559suEL.D3LmI4FS8Cjcw08Ja8mYDu7ao/NrLh2<br/>paterno: MAMANI<br/>taller: TALLER #3<br/>tipo: NINGUNO<br/>tipo_personal: TRABAJADOR<br/>updated_at: 2023-10-09 11:36:55<br/>usuario: MMAMANI<br/>validez_credencial: VALIDO DEL 01/01/23 AL 01/01/24<br/>', 'USUARIOS', '2023-10-09', '11:36:55', '2023-10-09 15:36:55', '2023-10-09 15:36:55'),
(85, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'acceso: 1<br/>cargo: SIN CARGO<br/>ci: 5555<br/>ci_exp: CB<br/>created_at: 2023-10-09 11:35:58<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2023-01-01<br/>fecha_nac: 2000-03-03<br/>fecha_registro: 2023-10-09<br/>fono: 7777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 7<br/>materno: QUISPE<br/>nombre: ELVIS<br/>p_discapacidad: 0<br/>password: $2y$10$AKGhHxtE.Bp5AYiw9fe1Ou6j1bZU7QC0VvVrdGbnwGa5dUSqHQQ9.<br/>paterno: QUISPE<br/>taller: TALLER #3<br/>tipo: NINGUNO<br/>tipo_personal: TRABAJADOR<br/>updated_at: 2023-10-09 11:36:45<br/>usuario: EQUISPE<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', 'acceso: 1<br/>cargo: SIN CARGO<br/>ci: 5555<br/>ci_exp: CB<br/>created_at: 2023-10-09 11:35:58<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2023-01-01<br/>fecha_nac: 2000-03-03<br/>fecha_registro: 2023-10-09<br/>fono: 7777<br/>foto: default.png<br/>genero: MASCULINO<br/>id: 7<br/>materno: QUISPE<br/>nombre: ELVIS<br/>p_discapacidad: 0<br/>password: $2y$10$AKGhHxtE.Bp5AYiw9fe1Ou6j1bZU7QC0VvVrdGbnwGa5dUSqHQQ9.<br/>paterno: QUISPE<br/>taller: TALLER #3<br/>tipo: REPRESENTANTE<br/>tipo_personal: SOCIO<br/>updated_at: 2023-10-09 11:37:48<br/>usuario: EQUISPE<br/>validez_credencial: VALIDO DEL 01/01/2023 AL 01/01/2024<br/>', 'USUARIOS', '2023-10-09', '11:37:48', '2023-10-09 15:37:48', '2023-10-09 15:37:48'),
(86, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ACTIVIDAD', 'created_at: 2023-10-02 12:53:30<br/>descripcion: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>id: 3<br/>imagen: 1696275555_3.jpg<br/>updated_at: 2023-10-02 15:39:15<br/>', 'created_at: 2023-10-02 12:53:30<br/>descripcion: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>id: 3<br/>imagen: 1696866167_3.png<br/>updated_at: 2023-10-09 11:42:47<br/>', 'ACTIVIDADES', '2023-10-09', '11:42:47', '2023-10-09 15:42:47', '2023-10-09 15:42:47'),
(87, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 7<br/>nombre: PRODUCTO #6<br/>descripcion: DESC 6<br/>precio: 100.00<br/>cantidad_stock: 0<br/>catalogo_id: 2<br/>imagen: default.png<br/>created_at: 2023-10-03 16:45:44<br/>updated_at: 2023-10-09 13:30:41<br/>', 'id: 7<br/>nombre: PRODUCTO #6<br/>descripcion: DESC 6<br/>precio: 100.00<br/>cantidad_stock: 0<br/>catalogo_id: 2<br/>imagen: 1696877738_7.jpg<br/>created_at: 2023-10-03 16:45:44<br/>updated_at: 2023-10-09 14:55:38<br/>', 'PRODUCTOS', '2023-10-09', '14:55:38', '2023-10-09 18:55:38', '2023-10-09 18:55:38'),
(88, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>nombre: PRODUCTO #1<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>precio: 300.00<br/>cantidad_stock: 10<br/>catalogo_id: 1<br/>imagen: default.png<br/>created_at: 2023-10-03 16:33:06<br/>updated_at: 2023-10-03 16:40:08<br/>', 'id: 1<br/>nombre: PRODUCTO #1<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>precio: 300.00<br/>cantidad_stock: 10<br/>catalogo_id: 1<br/>imagen: 1696877749_1.jpg<br/>created_at: 2023-10-03 16:33:06<br/>updated_at: 2023-10-09 14:55:49<br/>', 'PRODUCTOS', '2023-10-09', '14:55:49', '2023-10-09 18:55:49', '2023-10-09 18:55:49'),
(89, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>nombre: PRODUCTO #1<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>precio: 300.00<br/>cantidad_stock: 10<br/>catalogo_id: 1<br/>imagen: 1696877749_1.jpg<br/>created_at: 2023-10-03 16:33:06<br/>updated_at: 2023-10-09 14:55:49<br/>', 'id: 1<br/>nombre: PRODUCTO #1<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>precio: 300.00<br/>cantidad_stock: 10<br/>catalogo_id: 1<br/>imagen: 1696877768_1.jpg<br/>created_at: 2023-10-03 16:33:06<br/>updated_at: 2023-10-09 14:56:08<br/>', 'PRODUCTOS', '2023-10-09', '14:56:08', '2023-10-09 18:56:08', '2023-10-09 18:56:08'),
(90, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 7<br/>nombre: PRODUCTO #6<br/>descripcion: DESC 6<br/>precio: 100.00<br/>cantidad_stock: 0<br/>catalogo_id: 2<br/>imagen: 1696877738_7.jpg<br/>created_at: 2023-10-03 16:45:44<br/>updated_at: 2023-10-09 14:55:38<br/>', 'id: 7<br/>nombre: PRODUCTO #6<br/>descripcion: DESC 6<br/>precio: 100.00<br/>cantidad_stock: 0<br/>catalogo_id: 2<br/>imagen: 1696877778_7.jpg<br/>created_at: 2023-10-03 16:45:44<br/>updated_at: 2023-10-09 14:56:18<br/>', 'PRODUCTOS', '2023-10-09', '14:56:18', '2023-10-09 18:56:18', '2023-10-09 18:56:18'),
(91, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>nombre: PRODUCTO #1<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>precio: 300.00<br/>cantidad_stock: 10<br/>catalogo_id: 1<br/>imagen: 1696877768_1.jpg<br/>created_at: 2023-10-03 16:33:06<br/>updated_at: 2023-10-09 14:56:08<br/>', 'id: 1<br/>nombre: PRODUCTO #1<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>precio: 300.00<br/>cantidad_stock: 10<br/>catalogo_id: 1<br/>imagen: 1696877788_1.jpg<br/>created_at: 2023-10-03 16:33:06<br/>updated_at: 2023-10-09 14:56:28<br/>', 'PRODUCTOS', '2023-10-09', '14:56:28', '2023-10-09 18:56:28', '2023-10-09 18:56:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000002_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2022_10_13_132625_create_configuracions_table', 1),
(4, '2023_08_26_190801_create_historial_accions_table', 1),
(13, '2023_09_28_182536_create_banners_table', 2),
(14, '2023_09_28_182744_create_actividads_table', 2),
(15, '2023_09_28_182811_create_nosotros_table', 2),
(16, '2023_09_28_182824_create_contactos_table', 2),
(17, '2023_09_28_182841_create_red_socials_table', 2),
(18, '2023_09_28_182851_create_catalogos_table', 2),
(19, '2023_09_28_182912_create_productos_table', 2),
(20, '2023_09_28_183049_create_pedidos_table', 2),
(21, '2023_09_28_184051_create_detalle_pedidos_table', 2),
(22, '2023_10_09_104851_create_apis_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nosotros`
--

CREATE TABLE `nosotros` (
  `id` bigint UNSIGNED NOT NULL,
  `historia` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mision` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vision` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nosotros`
--

INSERT INTO `nosotros` (`id`, `historia`, `mision`, `vision`, `created_at`, `updated_at`) VALUES
(1, 'CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.', 'CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.', 'CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.', '2023-10-02 17:11:42', '2023-10-02 21:05:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto_total` decimal(24,2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `nombres`, `apellidos`, `pec`, `fono`, `correo`, `estado`, `monto_total`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'JUAN', 'PERES', 'BOLIVIA', '7777777', 'JUAN@GMAIL.COM', 'ELIMINADO', 690.98, '2023-10-08', '2023-10-09 00:57:28', '2023-10-09 02:27:32'),
(2, 'JUAN', 'PERES', 'BOLIVIA', '6666', '', 'PENDIENTE', 100.00, '2023-10-08', '2023-10-09 00:59:37', '2023-10-09 02:28:09'),
(3, 'FELIPE', 'GONZALES', 'LA PAZ', '777777', 'FELIPE@GMAIL.COM', 'ATENDIDO', 200.00, '2023-10-08', '2023-10-09 01:01:37', '2023-10-09 02:27:42'),
(5, 'EDUARDO', 'GONZALES', 'BOLIVIA', '787878787', '', 'PENDIENTE', 100.00, '2023-10-09', '2023-10-09 17:30:41', '2023-10-09 17:30:41'),
(6, 'EDUARDO', 'CARASCO', 'LA PA BOLIVIA', '77777', 'EDUARDO@GMAIL.COM', 'PENDIENTE', 200.50, '2023-10-09', '2023-10-09 18:57:36', '2023-10-09 18:57:36'),
(7, 'MARIO', 'CARVAJAL', 'BOLIVIA', '22222', 'MARIO@GMAIL.COM', 'PENDIENTE', 189.99, '2023-10-09', '2023-10-09 18:58:42', '2023-10-09 18:58:42'),
(8, 'FABIOLA', 'SUAREZ', 'LA PAZ', '767676767', '', 'PENDIENTE', 300.00, '2023-10-09', '2023-10-09 19:00:21', '2023-10-09 19:00:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `cantidad_stock` double(8,2) NOT NULL,
  `catalogo_id` bigint UNSIGNED NOT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad_stock`, `catalogo_id`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 'PRODUCTO #1', 'SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS', 300.00, 9.00, 1, '1696877788_1.jpg', '2023-10-03 20:33:06', '2023-10-09 19:00:21'),
(3, 'PRODUCTO #2', 'SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS', 200.00, 4.00, 1, '1696365444_3.jpg', '2023-10-03 20:37:24', '2023-10-09 01:01:37'),
(4, 'PRODUCTO #3', 'SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS', 189.99, 2.00, 1, '1696365467_4.jpg', '2023-10-03 20:37:47', '2023-10-09 18:58:42'),
(5, 'PRODUCTO #4', 'SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS', 99.99, 3.00, 2, '1696365516_5.jpg', '2023-10-03 20:38:36', '2023-10-09 02:27:32'),
(6, 'PRODUCTO #5', 'PROD 5', 200.50, 9.00, 2, '1696365930_6.jpg', '2023-10-03 20:45:30', '2023-10-09 18:57:36'),
(7, 'PRODUCTO #6', 'DESC 6', 100.00, 0.00, 2, '1696877778_7.jpg', '2023-10-03 20:45:44', '2023-10-09 18:56:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_socials`
--

CREATE TABLE `red_socials` (
  `id` bigint UNSIGNED NOT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `red_socials`
--

INSERT INTO `red_socials` (`id`, `twitter`, `facebook`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
(1, NULL, 'https://www.facebook.com/', NULL, 'https://www.youtube.com/', '2023-10-02 19:32:46', '2023-10-02 19:33:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `genero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `taller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_personal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_discapacidad` double(8,2) NOT NULL,
  `tipo` enum('ADMINISTRADOR','REPRESENTANTE','SOCIO','NINGUNO') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validez_credencial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int NOT NULL,
  `acceso` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `fecha_nac`, `genero`, `cargo`, `fecha_ingreso`, `taller`, `dir`, `fono`, `tipo_personal`, `p_discapacidad`, `tipo`, `foto`, `validez_credencial`, `password`, `estado`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', NULL, '0', '', NULL, '', '', NULL, '', '', NULL, '', 0.00, 'ADMINISTRADOR', NULL, '', '$2y$10$RrCZZySOwPej2gMFWsrjMe6dLzfaL5Q88h4J75I1FesEBRNPwq1x.', 1, 1, '2023-07-23', NULL, NULL),
(2, 'JPERES', 'JUAN', 'PERES', 'MAMANI', '1234', 'LP', '1990-02-02', 'MASCULINO', 'CARGO #1 QHANA BOLIVIA', '2019-01-01', 'TALLER #2', 'LOS OLIVOS', '7777777', 'SOCIO', 100.00, 'REPRESENTANTE', 'default.png', 'VALIDO DEL 01/01/2023 AL 01/01/2024', '$2y$10$q.fJiEAafZGZW3fDvWjq7uAa85PxmpYKP6cG8I0PsPU4Po3h22dBy', 1, 1, '2023-09-19', '2023-09-19 18:30:04', '2023-10-09 15:32:56'),
(4, 'FMAMANI', 'FERNANDO GONZALO', 'MAMANI', 'MAMANI', '2222', 'LP', '2000-01-01', 'MASCULINO', 'CARGO QHANA BOLIVIA', '2020-01-01', 'TALLER #1', 'LOS OLIVOS', '777777', 'SOCIO', 70.00, 'ADMINISTRADOR', 'default.png', 'VALIDO DEL 20/01/23 AL 20/01/2024', '$2y$10$EosVGjhgfm3HNQ9JFnnbC..vgv7SsuWysSrLL7AjEq0iTRoYs/PWC', 1, 0, '2023-09-28', '2023-09-28 22:10:52', '2023-09-29 17:01:06'),
(5, 'MMAMANI', 'MARIA', 'MAMANI', 'MAMANI', '3333', 'LP', '1999-01-01', 'FEMENINO', 'CARGO #3 QHANA BOLIVIA', '2018-01-01', 'TALLER #3', 'LOS OLIVOS', '66666', 'TRABAJADOR', 100.00, 'NINGUNO', 'default.png', 'VALIDO DEL 01/01/23 AL 01/01/24', '$2y$10$q9MGwRRWSzADVe559suEL.D3LmI4FS8Cjcw08Ja8mYDu7ao/NrLh2', 0, 0, '2023-09-28', '2023-09-28 22:18:55', '2023-10-09 15:36:55'),
(6, 'SCACERES', 'SOFIA', 'CACERES', 'CACERES', '4444', 'CB', '1999-01-01', 'FEMENINO', 'CARGO #4', '2023-10-09', 'TALLER #2', 'LOS OLIVOS', '77777', 'SOCIO', 0.00, 'SOCIO', 'default.png', 'VALIDO DEL 01/01/2023 AL 01/01/2024', '$2y$10$YL0hndJf5qJZg3kL380SiOt/f4Dzhk2VThPQKnPKRCP/Btfe1eiO6', 1, 1, '2023-10-09', '2023-10-09 15:34:49', '2023-10-09 15:34:49'),
(7, 'EQUISPE', 'ELVIS', 'QUISPE', 'QUISPE', '5555', 'CB', '2000-03-03', 'MASCULINO', 'SIN CARGO', '2023-01-01', 'TALLER #3', 'LOS OLIVOS', '7777', 'SOCIO', 0.00, 'REPRESENTANTE', 'default.png', 'VALIDO DEL 01/01/2023 AL 01/01/2024', '$2y$10$AKGhHxtE.Bp5AYiw9fe1Ou6j1bZU7QC0VvVrdGbnwGa5dUSqHQQ9.', 1, 1, '2023-10-09', '2023-10-09 15:35:58', '2023-10-09 15:37:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividads`
--
ALTER TABLE `actividads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `apis`
--
ALTER TABLE `apis`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_pedidos_pedido_id_foreign` (`pedido_id`),
  ADD KEY `detalle_pedidos_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nosotros`
--
ALTER TABLE `nosotros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_catalogo_id_foreign` (`catalogo_id`);

--
-- Indices de la tabla `red_socials`
--
ALTER TABLE `red_socials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividads`
--
ALTER TABLE `actividads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `apis`
--
ALTER TABLE `apis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `nosotros`
--
ALTER TABLE `nosotros`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `red_socials`
--
ALTER TABLE `red_socials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `detalle_pedidos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_catalogo_id_foreign` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
