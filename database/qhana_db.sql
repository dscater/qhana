-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-10-2023 a las 18:00:42
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
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actividads`
--

INSERT INTO `actividads` (`id`, `imagen`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, '1696265570_2.png', 'LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE. LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES, AND MORE RECENTLY WITH DESKTOP PUBLISHING SOFTWARE. IT IS A LONG ESTABLISHED FACT THAT A READER WILL BE DISTRACTED BY THE READABLE CONTENT LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM. LIKE ALDUS PAGEMAKER INCLUDING VERSIONS OF LOREM IPSUM.', '2023-10-02 16:52:50', '2023-10-02 16:52:59'),
(3, '1696265610_3.png', 'CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.', '2023-10-02 16:53:30', '2023-10-02 16:53:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posicion` int NOT NULL,
  `desc1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `muestra_boton` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `img`, `posicion`, `desc1`, `desc2`, `muestra_boton`, `created_at`, `updated_at`) VALUES
(5, '1696264182_5.png', 1, '', '', 0, '2023-10-02 16:29:42', '2023-10-02 16:29:42'),
(6, '1696264203_6.png', 2, 'NUEVA COLECCIÓN 2023', 'CHAQUETAS Y ABRIGOS', 1, '2023-10-02 16:30:03', '2023-10-02 16:30:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogos`
--

CREATE TABLE `catalogos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo_pedido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo_pedido2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `ciudad`, `dir`, `fono`, `web`, `actividad`, `correo`, `correo_pedido`, `correo_pedido2`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'QHANA', 'QHANA', 'QHANA', 'LA PAZ', 'LA PAZ', '222222', 'QHANAWEB', 'ACTIVIDAD QHANA', 'qhana@gmail.com', 'qhanapedido@gmail.com', 'qhanapedido2@gmail.com', 'logo.png', NULL, '2023-09-28 21:09:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` bigint UNSIGNED NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fonos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(29, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN NOSOTROS', 'id: 1<br/>historia: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>mision: <br/>vision: <br/>created_at: 2023-10-02 13:11:42<br/>updated_at: 2023-10-02 13:12:20<br/>', NULL, 'NOSOTROS', '2023-10-02', '13:12:20', '2023-10-02 17:12:20', '2023-10-02 17:12:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(21, '2023_09_28_184051_create_detalle_pedidos_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nosotros`
--

CREATE TABLE `nosotros` (
  `id` bigint UNSIGNED NOT NULL,
  `historia` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mision` text COLLATE utf8mb4_unicode_ci,
  `vision` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nosotros`
--

INSERT INTO `nosotros` (`id`, `historia`, `mision`, `vision`, `created_at`, `updated_at`) VALUES
(1, 'CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.', '', '', '2023-10-02 17:11:42', '2023-10-02 17:12:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pec` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto_total` decimal(24,2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `cantidad_stock` double(8,2) NOT NULL,
  `catalogo_id` bigint UNSIGNED NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `red_socials`
--

CREATE TABLE `red_socials` (
  `id` bigint UNSIGNED NOT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nac` date DEFAULT NULL,
  `genero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `taller` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_personal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_discapacidad` double(8,2) NOT NULL,
  `tipo` enum('ADMINISTRADOR','REPRESENTANTE','SOCIO','NINGUNO') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validez_credencial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `fecha_nac`, `genero`, `cargo`, `fecha_ingreso`, `taller`, `dir`, `fono`, `tipo_personal`, `p_discapacidad`, `tipo`, `foto`, `validez_credencial`, `password`, `estado`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', NULL, '0', '', NULL, '', '', NULL, '', '', NULL, '', 0.00, 'ADMINISTRADOR', NULL, '', '$2y$10$RrCZZySOwPej2gMFWsrjMe6dLzfaL5Q88h4J75I1FesEBRNPwq1x.', 0, '2023-07-23', NULL, NULL),
(2, 'JPERES', 'JUAN', 'PERES', 'MAMANI', '1234', 'LP', '1990-02-02', 'MASCULINO', 'CARGO #1 QHANA BOLIVIA', '2019-01-01', 'TALLER #2', 'LOS OLIVOS', '7777777', 'SOCIO', 100.00, 'REPRESENTANTE', 'default.png', 'VALIDO DEL 01/01/2023 AL 01/01/2024', '$2y$10$q.fJiEAafZGZW3fDvWjq7uAa85PxmpYKP6cG8I0PsPU4Po3h22dBy', 1, '2023-09-19', '2023-09-19 18:30:04', '2023-09-28 22:12:45'),
(4, 'FMAMANI', 'FERNANDO GONZALO', 'MAMANI', 'MAMANI', '2222', 'LP', '2000-01-01', 'MASCULINO', 'CARGO QHANA BOLIVIA', '2020-01-01', 'TALLER #1', 'LOS OLIVOS', '777777', 'SOCIO', 70.00, 'ADMINISTRADOR', 'default.png', 'VALIDO DEL 20/01/23 AL 20/01/2024', '$2y$10$EosVGjhgfm3HNQ9JFnnbC..vgv7SsuWysSrLL7AjEq0iTRoYs/PWC', 1, '2023-09-28', '2023-09-28 22:10:52', '2023-09-29 17:01:06'),
(5, 'MMAMANI', 'MARIA', 'MAMANI', 'MAMANI', '3333', 'LP', '1999-01-01', 'FEMENINO', 'CARGO #3 QHANA BOLIVIA', '2018-01-01', 'TALLER #3', 'LOS OLIVOS', '66666', 'TRABAJADOR', 100.00, 'NINGUNO', 'default.png', 'VALIDO DEL 01/01/23 AL 01/01/24', '$2y$10$q9MGwRRWSzADVe559suEL.D3LmI4FS8Cjcw08Ja8mYDu7ao/NrLh2', 1, '2023-09-28', '2023-09-28 22:18:55', '2023-09-28 22:18:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividads`
--
ALTER TABLE `actividads`
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
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `nosotros`
--
ALTER TABLE `nosotros`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `red_socials`
--
ALTER TABLE `red_socials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
