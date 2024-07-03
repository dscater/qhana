-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-07-2024 a las 19:13:15
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
-- Estructura de tabla para la tabla `admin_productos`
--

CREATE TABLE `admin_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_kg` double(8,2) NOT NULL DEFAULT '0.00',
  `stock_conos` double(8,2) NOT NULL DEFAULT '0.00',
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `admin_productos`
--

INSERT INTO `admin_productos` (`id`, `codigo_color`, `descripcion`, `titulo`, `stock_kg`, `stock_conos`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'ABC', 'DESC. PROD. #1', 'PROD. #1', 156.65, 12.00, '2024-01-06', '2024-01-06 15:40:49', '2024-07-02 18:19:09'),
(2, 'CDE', 'DESC. PROD. #2', 'PROD. #2', 70.00, 10.00, '2024-01-06', '2024-01-06 15:45:23', '2024-01-22 15:56:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apis`
--

CREATE TABLE `apis` (
  `id` bigint UNSIGNED NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_google` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_movimiento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `concepto_id` bigint UNSIGNED NOT NULL,
  `monto` decimal(24,2) NOT NULL,
  `responsable_id` bigint UNSIGNED NOT NULL,
  `nro_factura` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` date NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `a_favor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nro` int DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `estado` int NOT NULL,
  `movimiento_caja_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `tipo`, `tipo_movimiento`, `concepto_id`, `monto`, `responsable_id`, `nro_factura`, `fecha`, `descripcion`, `a_favor`, `nro`, `user_id`, `nombre`, `fecha_registro`, `estado`, `movimiento_caja_id`, `created_at`, `updated_at`) VALUES
(1, 'NORMAL', 'INGRESO', 1, 1000.00, 1, '11111111', '2023-10-17', 'REGISTRO CAJA 1000 BS. LOREM IPSUM TEXT IPSUM LOREM LEE QOIEE REMMSS', NULL, NULL, NULL, NULL, '2023-10-18', 2, 2, '2023-10-18 20:23:07', '2023-10-18 20:34:31'),
(2, 'RECIBO', 'INGRESO', 1, 500.00, 1, NULL, '2023-10-18', 'DESCRIPCION RECIBO #1', 'OTRO', 1, 5, 'FELIPE GUTIERREZ', '2023-10-18', 2, 2, '2023-10-18 20:36:14', '2023-10-18 20:44:37'),
(4, 'NORMAL', 'EGRESO', 2, 200.00, 1, '3333', '2023-10-18', 'PRUEBA EGRESO', NULL, NULL, NULL, NULL, '2023-10-18', 2, 2, '2023-10-18 21:09:48', '2023-10-18 21:09:48'),
(5, 'RECIBO', 'INGRESO', 1, 350.00, 1, NULL, '2023-10-18', 'PRUEBA INGRESO RECIBO CON RECIBBO', 'SOCIO', 3, 7, NULL, '2023-10-18', 2, 2, '2023-10-18 21:50:25', '2023-10-18 21:50:25'),
(6, 'NORMAL', 'EGRESO', 2, 150.50, 1, '1110000', '2023-10-18', 'PRUEBA EGRESO DECIMAL', NULL, NULL, NULL, NULL, '2023-10-18', 2, 2, '2023-10-18 21:51:04', '2023-10-18 21:51:04'),
(7, 'RECIBO', 'EGRESO', 2, 120.00, 1, NULL, '2023-10-18', 'DESC. EGRESO RECIBO', 'TRABAJADOR', 4, 5, NULL, '2023-10-18', 2, 2, '2023-10-18 21:52:18', '2023-10-18 21:52:18'),
(8, 'NORMAL', 'INGRESO', 1, 1000.00, 1, '11211211', '2023-10-18', 'DESC', NULL, NULL, NULL, NULL, '2023-10-18', 1, 0, '2023-10-18 22:11:17', '2023-10-18 22:11:17'),
(9, 'NORMAL', 'EGRESO', 1, 10.00, 1, '', '2024-01-19', 'PASAJE', NULL, NULL, NULL, NULL, '2024-01-19', 1, 0, '2024-01-19 14:50:23', '2024-01-19 14:50:23');

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
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `empresa` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_encargado` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fonos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `empresa`, `nombre_encargado`, `fonos`, `dir`, `correo`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'EMP. #1', 'JUAN PERES', '777777 - 666666', 'LOS OLIVOS', 'EMP1@GMAIL.COM', '2024-01-06', '2024-01-06 16:59:35', '2024-01-06 16:59:35'),
(2, 'EMP. #2', 'EDUARDO RAMIREZ', '78787878', '', '', '2024-01-07', '2024-01-07 14:53:25', '2024-01-07 14:53:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `conceptos`
--

INSERT INTO `conceptos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'CONCEPTO #1 MODIFICADO', '2023-10-18 19:42:15', '2023-10-18 19:42:21'),
(2, 'CONCEPTO #2', '2023-10-18 19:42:25', '2023-10-18 19:42:25'),
(4, 'APERTURA DE CAJA', '2024-01-19 14:51:58', '2024-01-19 14:51:58'),
(5, 'PASAJE', '2024-01-19 14:52:07', '2024-01-19 14:52:07'),
(6, 'VENTA', '2024-01-19 14:52:12', '2024-01-19 14:52:12');

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
(1, 'QHANA', 'QHANA', 'QHANA', 'LA PAZ', 'ZONA LOS OLIVOS CALLE 3 N°322', '222222', 'QHANAWEB', 'ACTIVIDAD QHANA', 'qhana@gmail.com', 'qhana2@gmail.com', 'qhanapedido2@gmail.com', 'logo.png', NULL, '2023-10-18 21:35:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` bigint UNSIGNED NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fonos` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mapa` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `direccion`, `fonos`, `correo`, `mapa`, `created_at`, `updated_at`) VALUES
(1, 'ZONA LOS OLIVOS CALLE 3 #1111', '22222 - 77766666', 'qhana@gmail.com', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1912.6568436143507!2d-68.12515081966652!3d-16.51025383262387!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x915f206175318d89%3A0x632dbaa19ddd3f8a!2sLas%20Torres%20Mall!5e0!3m2!1ses-419!2sbo!4v1697749391699!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '2023-10-02 19:08:12', '2023-10-19 21:03:19');

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
-- Estructura de tabla para la tabla `distribucion_detalles`
--

CREATE TABLE `distribucion_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `distribucion_pedido_id` bigint UNSIGNED NOT NULL,
  `solicitud_detalle_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `peso` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `distribucion_detalles`
--

INSERT INTO `distribucion_detalles` (`id`, `distribucion_pedido_id`, `solicitud_detalle_id`, `cantidad`, `peso`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 3.00, 50.00, '2024-01-08 16:52:07', '2024-07-01 16:09:59'),
(4, 1, 3, 1.00, 50.00, '2024-01-08 16:52:07', '2024-01-19 15:13:29'),
(5, 2, 2, 2.00, 95.00, '2024-07-02 17:38:05', '2024-07-02 17:38:05'),
(6, 2, 3, 0.00, 0.00, '2024-07-02 17:38:05', '2024-07-02 17:38:05'),
(7, 2, 4, 0.00, 0.00, '2024-07-02 17:38:05', '2024-07-02 17:38:05'),
(8, 3, 5, 10.00, 300.00, '2024-07-02 17:40:18', '2024-07-02 17:40:27'),
(9, 3, 6, 0.00, 0.00, '2024-07-02 17:40:18', '2024-07-02 17:40:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion_pedidos`
--

CREATE TABLE `distribucion_pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `solicitud_pedido_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `fecha_distribucion` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `distribucion_pedidos`
--

INSERT INTO `distribucion_pedidos` (`id`, `solicitud_pedido_id`, `user_id`, `fecha_distribucion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-01-08', '2024-01-08', '2024-01-08 16:52:07', '2024-01-08 16:52:07'),
(2, 1, 7, '2024-07-02', '2024-07-02', '2024-07-02 17:38:05', '2024-07-02 17:38:05'),
(3, 2, 2, '2024-07-02', '2024-07-02', '2024-07-02 17:40:18', '2024-07-02 17:40:18');

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
(91, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>nombre: PRODUCTO #1<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>precio: 300.00<br/>cantidad_stock: 10<br/>catalogo_id: 1<br/>imagen: 1696877768_1.jpg<br/>created_at: 2023-10-03 16:33:06<br/>updated_at: 2023-10-09 14:56:08<br/>', 'id: 1<br/>nombre: PRODUCTO #1<br/>descripcion: SUSPENDISSE DAPIBUS ORCI SUSCIPIT PORTA SOLLICITUDIN. AENEAN PORTA QUIS TURPIS NON VULPUTATE. QUISQUE ALIQUAM ARCU NON LIBERO PORTTITOR MATTIS. CRAS ET LECTUS LAOREET NUNC LAOREET VARIUS<br/>precio: 300.00<br/>cantidad_stock: 10<br/>catalogo_id: 1<br/>imagen: 1696877788_1.jpg<br/>created_at: 2023-10-03 16:33:06<br/>updated_at: 2023-10-09 14:56:28<br/>', 'PRODUCTOS', '2023-10-09', '14:56:28', '2023-10-09 18:56:28', '2023-10-09 18:56:28'),
(92, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN CATALOGO', 'id: 2<br/>usuario: <br/>nombre: CATÁLOGO #2<br/>paterno: <br/>materno: <br/>ci: <br/>ci_exp: <br/>fecha_nac: <br/>genero: <br/>cargo: <br/>fecha_ingreso: <br/>taller: <br/>dir: <br/>fono: <br/>tipo_personal: <br/>p_discapacidad: <br/>tipo: <br/>foto: <br/>validez_credencial: <br/>password: <br/>estado: <br/>acceso: <br/>fecha_registro: <br/>created_at: 2023-10-03 15:51:05<br/>updated_at: 2023-10-03 15:51:05<br/>', 'id: 2<br/>usuario: <br/>nombre: CATÁLOGO #2<br/>paterno: <br/>materno: <br/>ci: <br/>ci_exp: <br/>fecha_nac: <br/>genero: <br/>cargo: <br/>fecha_ingreso: <br/>taller: <br/>dir: <br/>fono: <br/>tipo_personal: <br/>p_discapacidad: <br/>tipo: <br/>foto: <br/>validez_credencial: <br/>password: <br/>estado: <br/>acceso: <br/>fecha_registro: <br/>created_at: 2023-10-03 15:51:05<br/>updated_at: 2023-10-03 15:51:05<br/>', 'CATALOGOS', '2023-10-09', '23:41:31', '2023-10-10 03:41:31', '2023-10-10 03:41:31'),
(93, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN CATALOGO', 'id: 2<br/>usuario: <br/>nombre: CATÁLOGO #2<br/>paterno: <br/>materno: <br/>ci: <br/>ci_exp: <br/>fecha_nac: <br/>genero: <br/>cargo: <br/>fecha_ingreso: <br/>taller: <br/>dir: <br/>fono: <br/>tipo_personal: <br/>p_discapacidad: <br/>tipo: <br/>foto: <br/>validez_credencial: <br/>password: <br/>estado: <br/>acceso: <br/>fecha_registro: <br/>created_at: 2023-10-03 15:51:05<br/>updated_at: 2023-10-03 15:51:05<br/>', 'id: 2<br/>usuario: <br/>nombre: CATÁLOGO #2<br/>paterno: <br/>materno: <br/>ci: <br/>ci_exp: <br/>fecha_nac: <br/>genero: <br/>cargo: <br/>fecha_ingreso: <br/>taller: <br/>dir: <br/>fono: <br/>tipo_personal: <br/>p_discapacidad: <br/>tipo: <br/>foto: <br/>validez_credencial: <br/>password: <br/>estado: <br/>acceso: <br/>fecha_registro: <br/>created_at: 2023-10-03 15:51:05<br/>updated_at: 2023-10-03 15:51:05<br/>', 'CATALOGOS', '2023-10-09', '23:41:33', '2023-10-10 03:41:33', '2023-10-10 03:41:33'),
(94, 1, 'MODIFICACIÓN', 'EL USUARIO  CAMBIO UN PEDIDO A ATENDIDO', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-09 13:30:41<br/>', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: ATENDIDO<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:54:55<br/>', 'PEDIDOS', '2023-10-18', '14:54:55', '2023-10-18 18:54:55', '2023-10-18 18:54:55'),
(95, 1, 'MODIFICACIÓN', 'EL USUARIO  ELIMINÓ UN PEDIDO', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: ATENDIDO<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:54:55<br/>', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:55:07<br/>', 'PEDIDOS', '2023-10-18', '14:55:07', '2023-10-18 18:55:07', '2023-10-18 18:55:07'),
(96, 1, 'MODIFICACIÓN', 'EL USUARIO  RESTABLECIÓ UN PEDIDO', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:55:07<br/>', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:55:14<br/>', 'PEDIDOS', '2023-10-18', '14:55:14', '2023-10-18 18:55:14', '2023-10-18 18:55:14'),
(97, 1, 'MODIFICACIÓN', 'EL USUARIO  CAMBIO UN PEDIDO A ATENDIDO', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:55:14<br/>', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: ATENDIDO<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:56:53<br/>', 'PEDIDOS', '2023-10-18', '14:56:53', '2023-10-18 18:56:53', '2023-10-18 18:56:53'),
(98, 1, 'MODIFICACIÓN', 'EL USUARIO  ELIMINÓ UN PEDIDO', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: ATENDIDO<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:56:53<br/>', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:56:57<br/>', 'PEDIDOS', '2023-10-18', '14:56:57', '2023-10-18 18:56:57', '2023-10-18 18:56:57'),
(99, 1, 'MODIFICACIÓN', 'EL USUARIO  RESTABLECIÓ UN PEDIDO', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: ELIMINADO<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:56:57<br/>', 'apellidos: GONZALES<br/>correo: <br/>created_at: 2023-10-09 13:30:41<br/>estado: PENDIENTE<br/>fecha_registro: 2023-10-09<br/>fono: 787878787<br/>id: 5<br/>monto_total: 100.00<br/>nombres: EDUARDO<br/>pec: BOLIVIA<br/>updated_at: 2023-10-18 14:57:03<br/>', 'PEDIDOS', '2023-10-18', '14:57:03', '2023-10-18 18:57:03', '2023-10-18 18:57:03'),
(100, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CONCEPTO', 'created_at: 2023-10-18 15:42:15<br/>id: 1<br/>nombre: CONCEPTO #1<br/>updated_at: 2023-10-18 15:42:15<br/>', NULL, 'CONCEPTOS', '2023-10-18', '15:42:15', '2023-10-18 19:42:15', '2023-10-18 19:42:15'),
(101, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN CONCEPTO', 'created_at: 2023-10-18 15:42:15<br/>id: 1<br/>nombre: CONCEPTO #1<br/>updated_at: 2023-10-18 15:42:15<br/>', 'created_at: 2023-10-18 15:42:15<br/>id: 1<br/>nombre: CONCEPTO #1 MODIFICADO<br/>updated_at: 2023-10-18 15:42:21<br/>', 'CONCEPTOS', '2023-10-18', '15:42:21', '2023-10-18 19:42:21', '2023-10-18 19:42:21'),
(102, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CONCEPTO', 'created_at: 2023-10-18 15:42:25<br/>id: 2<br/>nombre: CONCEPTO #2<br/>updated_at: 2023-10-18 15:42:25<br/>', NULL, 'CONCEPTOS', '2023-10-18', '15:42:25', '2023-10-18 19:42:25', '2023-10-18 19:42:25'),
(103, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CONCEPTO', 'created_at: 2023-10-18 15:42:30<br/>id: 3<br/>nombre: CONCEPTO #3<br/>updated_at: 2023-10-18 15:42:30<br/>', NULL, 'CONCEPTOS', '2023-10-18', '15:42:30', '2023-10-18 19:42:30', '2023-10-18 19:42:30'),
(104, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN CONCEPTO', 'created_at: 2023-10-18 15:42:30<br/>id: 3<br/>nombre: CONCEPTO #3<br/>updated_at: 2023-10-18 15:42:30<br/>', NULL, 'CONCEPTOS', '2023-10-18', '15:43:07', '2023-10-18 19:43:07', '2023-10-18 19:43:07'),
(105, 1, 'CREACIÓN', 'EL USUARIO  CREÓ UN REGISTRO DE CAJA', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 16:23:07<br/>descripcion: REGISTRO CAJA 1000 BS<br/>fecha: 2023-10-17<br/>fecha_registro: 2023-10-18<br/>id: 1<br/>monto: 1000<br/>nombre: <br/>nro: <br/>nro_factura: <br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:23:07<br/>user_id: <br/>', NULL, 'CAJAS', '2023-10-18', '16:23:07', '2023-10-18 20:23:07', '2023-10-18 20:23:07'),
(106, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 16:23:07<br/>descripcion: REGISTRO CAJA 1000 BS<br/>fecha: 2023-10-17<br/>fecha_registro: 2023-10-18<br/>id: 1<br/>monto: 1000.00<br/>nombre: <br/>nro: <br/>nro_factura: <br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:23:07<br/>user_id: <br/>', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 16:23:07<br/>descripcion: REGISTRO CAJA 1000 BS. LOREM IPSUM TEXT IPSUM LOREM LEE QOIEE REMM<br/>fecha: 2023-10-17<br/>fecha_registro: 2023-10-18<br/>id: 1<br/>monto: 1000.00<br/>nombre: <br/>nro: <br/>nro_factura: <br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:29:22<br/>user_id: <br/>', 'CAJAS', '2023-10-18', '16:29:22', '2023-10-18 20:29:22', '2023-10-18 20:29:22'),
(107, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 16:23:07<br/>descripcion: REGISTRO CAJA 1000 BS. LOREM IPSUM TEXT IPSUM LOREM LEE QOIEE REMM<br/>fecha: 2023-10-17<br/>fecha_registro: 2023-10-18<br/>id: 1<br/>monto: 1000.00<br/>nombre: <br/>nro: <br/>nro_factura: <br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:29:22<br/>user_id: <br/>', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 16:23:07<br/>descripcion: REGISTRO CAJA 1000 BS. LOREM IPSUM TEXT IPSUM LOREM LEE QOIEE REMM<br/>fecha: 2023-10-17<br/>fecha_registro: 2023-10-18<br/>id: 1<br/>monto: 1000.00<br/>nombre: <br/>nro: <br/>nro_factura: 1211111<br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:29:55<br/>user_id: <br/>', 'CAJAS', '2023-10-18', '16:29:55', '2023-10-18 20:29:55', '2023-10-18 20:29:55'),
(108, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 16:23:07<br/>descripcion: REGISTRO CAJA 1000 BS. LOREM IPSUM TEXT IPSUM LOREM LEE QOIEE REMM<br/>fecha: 2023-10-17<br/>fecha_registro: 2023-10-18<br/>id: 1<br/>monto: 1000.00<br/>nombre: <br/>nro: <br/>nro_factura: 1211111<br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:29:55<br/>user_id: <br/>', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 16:23:07<br/>descripcion: REGISTRO CAJA 1000 BS. LOREM IPSUM TEXT IPSUM LOREM LEE QOIEE REMMSS<br/>fecha: 2023-10-17<br/>fecha_registro: 2023-10-18<br/>id: 1<br/>monto: 1000.00<br/>nombre: <br/>nro: <br/>nro_factura: 111111<br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:32:15<br/>user_id: <br/>', 'CAJAS', '2023-10-18', '16:32:15', '2023-10-18 20:32:15', '2023-10-18 20:32:15'),
(109, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 16:23:07<br/>descripcion: REGISTRO CAJA 1000 BS. LOREM IPSUM TEXT IPSUM LOREM LEE QOIEE REMMSS<br/>fecha: 2023-10-17<br/>fecha_registro: 2023-10-18<br/>id: 1<br/>monto: 1000.00<br/>nombre: <br/>nro: <br/>nro_factura: 111111<br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:32:15<br/>user_id: <br/>', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 16:23:07<br/>descripcion: REGISTRO CAJA 1000 BS. LOREM IPSUM TEXT IPSUM LOREM LEE QOIEE REMMSS<br/>fecha: 2023-10-17<br/>fecha_registro: 2023-10-18<br/>id: 1<br/>monto: 1000.00<br/>nombre: <br/>nro: <br/>nro_factura: 11111111<br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:34:31<br/>user_id: <br/>', 'CAJAS', '2023-10-18', '16:34:31', '2023-10-18 20:34:31', '2023-10-18 20:34:31'),
(110, 1, 'CREACIÓN', 'EL USUARIO  CREÓ UN REGISTRO DE CAJA', 'a_favor: SOCIO<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:36:14<br/>descripcion: DESCRIPCION RECIBO #1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 2<br/>monto: 500<br/>nombre: <br/>nro: 1<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:36:14<br/>user_id: 4<br/>', NULL, 'CAJAS', '2023-10-18', '16:36:14', '2023-10-18 20:36:14', '2023-10-18 20:36:14'),
(111, 1, 'CREACIÓN', 'EL USUARIO  CREÓ UN REGISTRO DE CAJA', 'a_favor: OTRO<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:38:06<br/>descripcion: RECIBO #2<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 3<br/>monto: 300<br/>nombre: JUAN GONZALES<br/>nro: 2<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:38:06<br/>user_id: <br/>', NULL, 'CAJAS', '2023-10-18', '16:38:06', '2023-10-18 20:38:06', '2023-10-18 20:38:06'),
(112, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: SOCIO<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:36:14<br/>descripcion: DESCRIPCION RECIBO #1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 2<br/>monto: 500.00<br/>nombre: <br/>nro: 1<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:36:14<br/>user_id: 4<br/>', 'a_favor: TRABAJADOR<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:36:14<br/>descripcion: DESCRIPCION RECIBO #1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 2<br/>monto: 500.00<br/>nombre: <br/>nro: 1<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:40:25<br/>user_id: 5<br/>', 'CAJAS', '2023-10-18', '16:40:25', '2023-10-18 20:40:25', '2023-10-18 20:40:25'),
(113, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: TRABAJADOR<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:36:14<br/>descripcion: DESCRIPCION RECIBO #1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 2<br/>monto: 500.00<br/>nombre: <br/>nro: 1<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:40:25<br/>user_id: 5<br/>', 'a_favor: OTRO<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:36:14<br/>descripcion: DESCRIPCION RECIBO #1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 2<br/>monto: 500.00<br/>nombre: PEPE<br/>nro: 1<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:41:03<br/>user_id: 5<br/>', 'CAJAS', '2023-10-18', '16:41:03', '2023-10-18 20:41:03', '2023-10-18 20:41:03'),
(114, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: OTRO<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:36:14<br/>descripcion: DESCRIPCION RECIBO #1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 2<br/>monto: 500.00<br/>nombre: PEPE<br/>nro: 1<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:41:03<br/>user_id: 5<br/>', 'a_favor: TRABAJADOR<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:36:14<br/>descripcion: DESCRIPCION RECIBO #1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 2<br/>monto: 500.00<br/>nombre: PEPE<br/>nro: 1<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:41:11<br/>user_id: 5<br/>', 'CAJAS', '2023-10-18', '16:41:11', '2023-10-18 20:41:11', '2023-10-18 20:41:11'),
(115, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: OTRO<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:38:06<br/>descripcion: RECIBO #2<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 3<br/>monto: 300.00<br/>nombre: JUAN GONZALES<br/>nro: 2<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:38:06<br/>user_id: <br/>', 'a_favor: SOCIO<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:38:06<br/>descripcion: RECIBO #2<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 3<br/>monto: 300.00<br/>nombre: JUAN GONZALES<br/>nro: 2<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:44:26<br/>user_id: 2<br/>', 'CAJAS', '2023-10-18', '16:44:26', '2023-10-18 20:44:26', '2023-10-18 20:44:26'),
(116, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: TRABAJADOR<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:36:14<br/>descripcion: DESCRIPCION RECIBO #1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 2<br/>monto: 500.00<br/>nombre: PEPE<br/>nro: 1<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:41:11<br/>user_id: 5<br/>', 'a_favor: OTRO<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:36:14<br/>descripcion: DESCRIPCION RECIBO #1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 2<br/>monto: 500.00<br/>nombre: FELIPE GUTIERREZ<br/>nro: 1<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:44:37<br/>user_id: 5<br/>', 'CAJAS', '2023-10-18', '16:44:37', '2023-10-18 20:44:37', '2023-10-18 20:44:37'),
(117, 1, 'CREACIÓN', 'EL USUARIO  CREÓ UN REGISTRO DE CAJA', 'a_favor: <br/>concepto_id: 2<br/>created_at: 2023-10-18 17:09:48<br/>descripcion: PRUEBA EGRESO<br/>estado: 1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 4<br/>monto: 200<br/>movimiento_caja_id: 0<br/>nombre: <br/>nro: <br/>nro_factura: 3333<br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: EGRESO<br/>updated_at: 2023-10-18 17:09:48<br/>user_id: <br/>', NULL, 'CAJAS', '2023-10-18', '17:09:48', '2023-10-18 21:09:48', '2023-10-18 21:09:48'),
(118, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ LA CONFIGURACIÓN', 'actividad: ACTIVIDAD QHANA<br/>alias: QHANA<br/>ciudad: LA PAZ<br/>correo: qhana@gmail.com<br/>correo_pedido: qhana2@gmail.com<br/>correo_pedido2: qhanapedido2@gmail.com<br/>created_at: <br/>dir: LA PAZ<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nombre_sistema: QHANA<br/>razon_social: QHANA<br/>updated_at: 2023-09-28 17:09:17<br/>web: QHANAWEB<br/>', 'actividad: ACTIVIDAD QHANA<br/>alias: QHANA<br/>ciudad: LA PAZ<br/>correo: qhana@gmail.com<br/>correo_pedido: qhana2@gmail.com<br/>correo_pedido2: qhanapedido2@gmail.com<br/>created_at: <br/>dir: ZONA LOS OLIVOS CALLE 3 N°322<br/>fono: 222222<br/>id: 1<br/>logo: logo.png<br/>nombre_sistema: QHANA<br/>razon_social: QHANA<br/>updated_at: 2023-10-18 17:35:33<br/>web: QHANAWEB<br/>', 'CONFIGURACIÓN', '2023-10-18', '17:35:33', '2023-10-18 21:35:33', '2023-10-18 21:35:33'),
(119, 1, 'CREACIÓN', 'EL USUARIO  CREÓ UN REGISTRO DE CAJA', 'a_favor: SOCIO<br/>concepto_id: 1<br/>created_at: 2023-10-18 17:50:25<br/>descripcion: PRUEBA INGRESO RECIBO CON RECIBBO<br/>estado: 1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 5<br/>monto: 350<br/>movimiento_caja_id: 0<br/>nombre: <br/>nro: 3<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 17:50:25<br/>user_id: 7<br/>', NULL, 'CAJAS', '2023-10-18', '17:50:25', '2023-10-18 21:50:25', '2023-10-18 21:50:25'),
(120, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REGISTRO DE CAJA', 'a_favor: SOCIO<br/>concepto_id: 1<br/>created_at: 2023-10-18 17:50:25<br/>descripcion: PRUEBA INGRESO RECIBO CON RECIBBO<br/>estado: 1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 5<br/>monto: 350.00<br/>movimiento_caja_id: 0<br/>nombre: <br/>nro: 3<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 17:50:25<br/>user_id: 7<br/>', 'a_favor: SOCIO<br/>concepto_id: 1<br/>created_at: 2023-10-18 17:50:25<br/>descripcion: PRUEBA INGRESO RECIBO CON RECIBBO<br/>estado: 1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 5<br/>monto: 350.00<br/>movimiento_caja_id: 0<br/>nombre: <br/>nro: 3<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 17:50:25<br/>user_id: 7<br/>', 'CAJAS', '2023-10-18', '17:50:34', '2023-10-18 21:50:34', '2023-10-18 21:50:34'),
(121, 1, 'CREACIÓN', 'EL USUARIO  CREÓ UN REGISTRO DE CAJA', 'a_favor: <br/>concepto_id: 2<br/>created_at: 2023-10-18 17:51:04<br/>descripcion: PRUEBA EGRESO DECIMAL<br/>estado: 1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 6<br/>monto: 150.5<br/>movimiento_caja_id: 0<br/>nombre: <br/>nro: <br/>nro_factura: 1110000<br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: EGRESO<br/>updated_at: 2023-10-18 17:51:04<br/>user_id: <br/>', NULL, 'CAJAS', '2023-10-18', '17:51:04', '2023-10-18 21:51:04', '2023-10-18 21:51:04'),
(122, 1, 'CREACIÓN', 'EL USUARIO  CREÓ UN REGISTRO DE CAJA', 'a_favor: TRABAJADOR<br/>concepto_id: 2<br/>created_at: 2023-10-18 17:52:18<br/>descripcion: DESC. EGRESO RECIBO<br/>estado: 1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 7<br/>monto: 120<br/>movimiento_caja_id: 0<br/>nombre: <br/>nro: 4<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: EGRESO<br/>updated_at: 2023-10-18 17:52:18<br/>user_id: 5<br/>', NULL, 'CAJAS', '2023-10-18', '17:52:18', '2023-10-18 21:52:18', '2023-10-18 21:52:18'),
(123, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN REGISTRO DE CAJA', 'a_favor: SOCIO<br/>concepto_id: 1<br/>created_at: 2023-10-18 16:38:06<br/>descripcion: RECIBO #2<br/>estado: 1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 3<br/>monto: 300.00<br/>movimiento_caja_id: 0<br/>nombre: JUAN GONZALES<br/>nro: 2<br/>nro_factura: <br/>responsable_id: 1<br/>tipo: RECIBO<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 16:44:26<br/>user_id: 2<br/>', NULL, 'CAJAS', '2023-10-18', '17:53:07', '2023-10-18 21:53:07', '2023-10-18 21:53:07'),
(124, 1, 'CREACIÓN', 'EL USUARIO  REALIZÓ UN CIERRE DE CAJA', 'created_at: 2023-10-18 18:09:18<br/>egresos: 470.50<br/>fecha: 2023-10-18<br/>hora: 18:09:18<br/>id: 2<br/>ingresos: 1850.00<br/>total: 1379.5<br/>updated_at: 2023-10-18 18:09:18<br/>', NULL, 'MOVIMIENTO DE CAJAS', '2023-10-18', '18:09:18', '2023-10-18 22:09:18', '2023-10-18 22:09:18'),
(125, 1, 'CREACIÓN', 'EL USUARIO  CREÓ UN REGISTRO DE CAJA', 'a_favor: <br/>concepto_id: 1<br/>created_at: 2023-10-18 18:11:17<br/>descripcion: DESC<br/>estado: 1<br/>fecha: 2023-10-18<br/>fecha_registro: 2023-10-18<br/>id: 8<br/>monto: 1000<br/>movimiento_caja_id: 0<br/>nombre: <br/>nro: <br/>nro_factura: 11211211<br/>responsable_id: 1<br/>tipo: NORMAL<br/>tipo_movimiento: INGRESO<br/>updated_at: 2023-10-18 18:11:17<br/>user_id: <br/>', NULL, 'CAJAS', '2023-10-18', '18:11:17', '2023-10-18 22:11:17', '2023-10-18 22:11:17'),
(126, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN REPOSITORIO', 'created_at: 2023-10-19 15:09:18<br/>descripcion: REPOSITORIO #1<br/>id: 1<br/>updated_at: 2023-10-19 15:09:18<br/>', NULL, 'REPOSITORIOS', '2023-10-19', '15:09:18', '2023-10-19 19:09:18', '2023-10-19 19:09:18'),
(127, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN REPOSITORIO', 'created_at: 2023-10-19 15:09:18<br/>descripcion: REPOSITORIO #1<br/>id: 1<br/>updated_at: 2023-10-19 15:09:18<br/>', 'created_at: 2023-10-19 15:09:18<br/>descripcion: REPOSITORIO #1 MODIFICADO<br/>id: 1<br/>updated_at: 2023-10-19 15:10:51<br/>', 'REPOSITORIOS', '2023-10-19', '15:10:51', '2023-10-19 19:10:51', '2023-10-19 19:10:51'),
(128, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN REPOSITORIO', 'created_at: 2023-10-19 15:09:18<br/>descripcion: REPOSITORIO #1 MODIFICADO<br/>id: 1<br/>updated_at: 2023-10-19 15:10:51<br/>', NULL, 'REPOSITORIOS', '2023-10-19', '16:22:51', '2023-10-19 20:22:51', '2023-10-19 20:22:51'),
(129, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN REPOSITORIO', 'created_at: 2023-10-19 16:23:10<br/>descripcion: REPO #1<br/>id: 2<br/>updated_at: 2023-10-19 16:23:10<br/>', NULL, 'REPOSITORIOS', '2023-10-19', '16:23:10', '2023-10-19 20:23:10', '2023-10-19 20:23:10'),
(130, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN REPOSITORIO', 'created_at: 2023-10-19 16:23:35<br/>descripcion: REPO#2<br/>id: 3<br/>updated_at: 2023-10-19 16:23:35<br/>', NULL, 'REPOSITORIOS', '2023-10-19', '16:23:35', '2023-10-19 20:23:35', '2023-10-19 20:23:35'),
(131, 7, 'CREACIÓN', 'EL USUARIO EQUISPE ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: qhana@gmail.com<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #1111<br/>fonos: 22222 - 77766666<br/>id: 1<br/>mapa: <IFRAME SRC=\"HTTPS://WWW.GOOGLE.COM/MAPS/EMBED?PB=!1M21!1M12!1M3!1D15302.44340797871!2D-68.13196529479978!3D-16.495230895308648!2M3!1F0!2F0!3F0!3M2!1I1024!2I768!4F13.1!4M6!3E0!4M0!4M3!3M2!1D-16.497514656468287!2D-68.12797416816427!5E0!3M2!1SES-419!2SBO!4V1697748242821!5M2!1SES-419!2SBO\" WIDTH=\"1290\" HEIGHT=\"240\" STYLE=\"BORDER:0;\" ALLOWFULLSCREEN=\"\" LOADING=\"LAZY\" REFERRERPOLICY=\"NO-REFERRER-WHEN-DOWNGRADE\"></IFRAME><br/>updated_at: 2023-10-19 16:50:24<br/>', NULL, 'CONTACTOS', '2023-10-19', '16:50:24', '2023-10-19 20:50:24', '2023-10-19 20:50:24'),
(132, 7, 'CREACIÓN', 'EL USUARIO EQUISPE ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: qhana@gmail.com<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #1111<br/>fonos: 22222 - 77766666<br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo\" width=\"1290\" height=\"240\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-10-19 16:51:24<br/>', NULL, 'CONTACTOS', '2023-10-19', '16:51:24', '2023-10-19 20:51:24', '2023-10-19 20:51:24'),
(133, 7, 'CREACIÓN', 'EL USUARIO EQUISPE ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: qhana@gmail.com<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #1111<br/>fonos: 22222 - 77766666<br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo\" width=\"2114\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-10-19 16:57:09<br/>', NULL, 'CONTACTOS', '2023-10-19', '16:57:09', '2023-10-19 20:57:09', '2023-10-19 20:57:09'),
(134, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: qhana@gmail.com<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #1111<br/>fonos: 22222 - 77766666<br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d10820.918873296681!2d-68.1366239139961!3d-16.48705043185675!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e6!4m0!4m3!3m2!1d-16.49073129794562!2d-68.13368037837537!5e0!3m2!1ses-419!2sbo!4v1697749089248!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-10-19 17:00:48<br/>', NULL, 'CONTACTOS', '2023-10-19', '17:00:48', '2023-10-19 21:00:48', '2023-10-19 21:00:48'),
(135, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN CONTACTOS', 'correo: qhana@gmail.com<br/>created_at: 2023-10-02 15:08:12<br/>direccion: ZONA LOS OLIVOS CALLE 3 #1111<br/>fonos: 22222 - 77766666<br/>id: 1<br/>mapa: <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1912.6568436143507!2d-68.12515081966652!3d-16.51025383262387!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x915f206175318d89%3A0x632dbaa19ddd3f8a!2sLas%20Torres%20Mall!5e0!3m2!1ses-419!2sbo!4v1697749391699!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe><br/>updated_at: 2023-10-19 17:03:19<br/>', NULL, 'CONTACTOS', '2023-10-19', '17:03:19', '2023-10-19 21:03:19', '2023-10-19 21:03:19'),
(136, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'id: 1<br/>codigo_color: ABC<br/>descripcion: DESC. PROD #1<br/>titulo: PROD. #1<br/>fecha_registro: <br/>created_at: 2024-01-06 11:40:13<br/>updated_at: 2024-01-06 11:40:13<br/>', NULL, 'ADMIN-PRODUCTOS', '2024-01-06', '11:40:13', '2024-01-06 15:40:13', '2024-01-06 15:40:13'),
(137, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>codigo_color: ABC<br/>descripcion: DESC. PROD #1<br/>titulo: PROD. #1<br/>fecha_registro: <br/>created_at: 2024-01-06 11:40:13<br/>updated_at: 2024-01-06 11:40:13<br/>', 'id: 1<br/>codigo_color: ABC<br/>descripcion: DESC. PROD #1<br/>titulo: PROD. #1<br/>fecha_registro: <br/>created_at: 2024-01-06 11:40:13<br/>updated_at: 2024-01-06 11:40:13<br/>', 'ADMIN-PRODUCTOS', '2024-01-06', '11:40:18', '2024-01-06 15:40:18', '2024-01-06 15:40:18'),
(138, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN PRODUCTO', 'id: 1<br/>codigo_color: ABC<br/>descripcion: DESC. PROD #1<br/>titulo: PROD. #1<br/>fecha_registro: <br/>created_at: 2024-01-06 11:40:13<br/>updated_at: 2024-01-06 11:40:13<br/>', NULL, 'ADMIN-PRODUCTOS', '2024-01-06', '11:40:22', '2024-01-06 15:40:22', '2024-01-06 15:40:22'),
(139, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'id: 1<br/>codigo_color: ABC<br/>descripcion: DESC. PROD. #1<br/>titulo: PROD. #1<br/>fecha_registro: <br/>created_at: 2024-01-06 11:40:49<br/>updated_at: 2024-01-06 11:40:49<br/>', NULL, 'ADMIN-PRODUCTOS', '2024-01-06', '11:40:49', '2024-01-06 15:40:49', '2024-01-06 15:40:49');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(140, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'id: 2<br/>codigo_color: CDE<br/>descripcion: DESC. PROD. #2<br/>titulo: PROD. #2<br/>stock: <br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 11:45:23<br/>updated_at: 2024-01-06 11:45:23<br/>', NULL, 'ADMIN-PRODUCTOS', '2024-01-06', '11:45:23', '2024-01-06 15:45:23', '2024-01-06 15:45:23'),
(141, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'id: 1<br/>admin_producto_id: 1<br/>cantidad: 30<br/>cantidad_conos: 20<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:22:13<br/>updated_at: 2024-01-06 12:22:13<br/>', NULL, 'ADMIN-PRODUCTOS', '2024-01-06', '12:22:13', '2024-01-06 16:22:13', '2024-01-06 16:22:13'),
(142, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>admin_producto_id: 1<br/>cantidad: 30<br/>cantidad_conos: 20<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:22:13<br/>updated_at: 2024-01-06 12:22:13<br/>', 'id: 1<br/>admin_producto_id: 1<br/>cantidad: 60<br/>cantidad_conos: 20<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:22:13<br/>updated_at: 2024-01-06 12:22:38<br/>', 'ADMIN-PRODUCTOS', '2024-01-06', '12:22:38', '2024-01-06 16:22:38', '2024-01-06 16:22:38'),
(143, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'id: 2<br/>admin_producto_id: 2<br/>cantidad: 70<br/>cantidad_conos: 10<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:23:40<br/>updated_at: 2024-01-06 12:23:40<br/>', NULL, 'ADMIN-PRODUCTOS', '2024-01-06', '12:23:40', '2024-01-06 16:23:40', '2024-01-06 16:23:40'),
(144, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 2<br/>admin_producto_id: 2<br/>cantidad: 70<br/>cantidad_conos: 10<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:23:40<br/>updated_at: 2024-01-06 12:23:40<br/>', 'id: 2<br/>admin_producto_id: 2<br/>cantidad: 70<br/>cantidad_conos: 10<br/>fecha_ingreso: 2024-01-04<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:23:40<br/>updated_at: 2024-01-06 12:23:49<br/>', 'ADMIN-PRODUCTOS', '2024-01-06', '12:23:49', '2024-01-06 16:23:49', '2024-01-06 16:23:49'),
(145, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>admin_producto_id: 1<br/>cantidad: 60<br/>cantidad_conos: 20<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:22:13<br/>updated_at: 2024-01-06 12:22:38<br/>', 'id: 1<br/>admin_producto_id: 1<br/>cantidad: 60<br/>cantidad_conos: 20<br/>fecha_ingreso: 2024-01-04<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:22:13<br/>updated_at: 2024-01-06 12:23:51<br/>', 'ADMIN-PRODUCTOS', '2024-01-06', '12:23:51', '2024-01-06 16:23:51', '2024-01-06 16:23:51'),
(146, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'id: 3<br/>admin_producto_id: 1<br/>cantidad: 30<br/>cantidad_conos: 5<br/>fecha_ingreso: 2024-01-05<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:24:06<br/>updated_at: 2024-01-06 12:24:06<br/>', NULL, 'ADMIN-PRODUCTOS', '2024-01-06', '12:24:06', '2024-01-06 16:24:06', '2024-01-06 16:24:06'),
(147, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>admin_producto_id: 1<br/>cantidad: 60<br/>cantidad_conos: 20<br/>fecha_ingreso: 2024-01-04<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:22:13<br/>updated_at: 2024-01-06 12:23:51<br/>', 'id: 1<br/>admin_producto_id: 1<br/>cantidad: 55<br/>cantidad_conos: 15<br/>fecha_ingreso: 2024-01-04<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:22:13<br/>updated_at: 2024-01-06 12:24:35<br/>', 'ADMIN-PRODUCTOS', '2024-01-06', '12:24:35', '2024-01-06 16:24:35', '2024-01-06 16:24:35'),
(148, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN PRODUCTO', 'id: 1<br/>admin_producto_id: 1<br/>cantidad: 55<br/>cantidad_conos: 15<br/>fecha_ingreso: 2024-01-04<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:22:13<br/>updated_at: 2024-01-06 12:24:35<br/>', NULL, 'ADMIN-PRODUCTOS', '2024-01-06', '12:24:46', '2024-01-06 16:24:46', '2024-01-06 16:24:46'),
(149, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'id: 4<br/>admin_producto_id: 1<br/>cantidad: 30<br/>cantidad_conos: 5<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:28:48<br/>updated_at: 2024-01-06 12:28:48<br/>', NULL, 'ADMIN-PRODUCTOS', '2024-01-06', '12:28:48', '2024-01-06 16:28:48', '2024-01-06 16:28:48'),
(152, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'id: 3<br/>admin_producto_id: 1<br/>cantidad: 3<br/>cantidad_conos: 1<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:35:38<br/>updated_at: 2024-01-06 12:35:38<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-06', '12:35:38', '2024-01-06 16:35:38', '2024-01-06 16:35:38'),
(153, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA SALIDA DE PRODUCTO', 'id: 3<br/>admin_producto_id: 1<br/>cantidad: 3<br/>cantidad_conos: 1<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:35:38<br/>updated_at: 2024-01-06 12:35:38<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-06', '12:35:47', '2024-01-06 16:35:47', '2024-01-06 16:35:47'),
(154, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'id: 4<br/>admin_producto_id: 1<br/>cantidad: 2<br/>cantidad_conos: 1<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:35:54<br/>updated_at: 2024-01-06 12:35:54<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-06', '12:35:54', '2024-01-06 16:35:54', '2024-01-06 16:35:54'),
(155, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'id: 4<br/>admin_producto_id: 1<br/>cantidad: 2<br/>cantidad_conos: 1<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:35:54<br/>updated_at: 2024-01-06 12:35:54<br/>', 'id: 4<br/>admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:35:54<br/>updated_at: 2024-01-06 12:36:06<br/>', 'SALIDA DE PRODUCTOS', '2024-01-06', '12:36:06', '2024-01-06 16:36:06', '2024-01-06 16:36:06'),
(156, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'id: 4<br/>admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:35:54<br/>updated_at: 2024-01-06 12:36:06<br/>', 'id: 4<br/>admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 2<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:35:54<br/>updated_at: 2024-01-06 12:36:15<br/>', 'SALIDA DE PRODUCTOS', '2024-01-06', '12:36:15', '2024-01-06 16:36:15', '2024-01-06 16:36:15'),
(157, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA SALIDA DE PRODUCTO', 'id: 4<br/>admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 2<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:35:54<br/>updated_at: 2024-01-06 12:36:15<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-06', '12:36:19', '2024-01-06 16:36:19', '2024-01-06 16:36:19'),
(158, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'id: 5<br/>admin_producto_id: 1<br/>cantidad: 10<br/>cantidad_conos: 2<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:39:23<br/>updated_at: 2024-01-06 12:39:23<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-06', '12:39:23', '2024-01-06 16:39:23', '2024-01-06 16:39:23'),
(159, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'id: 5<br/>admin_producto_id: 1<br/>cantidad: 10<br/>cantidad_conos: 2<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:39:23<br/>updated_at: 2024-01-06 12:39:23<br/>', 'id: 5<br/>admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 2<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:39:23<br/>updated_at: 2024-01-06 12:39:43<br/>', 'SALIDA DE PRODUCTOS', '2024-01-06', '12:39:43', '2024-01-06 16:39:43', '2024-01-06 16:39:43'),
(160, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA SALIDA DE PRODUCTO', 'id: 5<br/>admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 2<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:39:23<br/>updated_at: 2024-01-06 12:39:43<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-06', '12:39:52', '2024-01-06 16:39:52', '2024-01-06 16:39:52'),
(161, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CLIENTE', 'id: 1<br/>empresa: EMP. #1<br/>nombre_encargado: JUAN PERES<br/>fonos: 777777 - 666666<br/>dir: LOS OLIVOS<br/>correo: EMP1@GMAIL.COM<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:58:20<br/>updated_at: 2024-01-06 12:58:20<br/>', NULL, 'CLIENTES', '2024-01-06', '12:58:20', '2024-01-06 16:58:20', '2024-01-06 16:58:20'),
(162, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN CLIENTE', 'id: 1<br/>empresa: EMP. #1<br/>nombre_encargado: JUAN PERES<br/>fonos: 777777 - 666666<br/>dir: LOS OLIVOS<br/>correo: EMP1@GMAIL.COM<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:58:20<br/>updated_at: 2024-01-06 12:58:20<br/>', 'id: 1<br/>empresa: EMPRESA #1<br/>nombre_encargado: JUAN PERES<br/>fonos: 777777 - 666666<br/>dir: LOS OLIVOS<br/>correo: EMP1@GMAIL.COM<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:58:20<br/>updated_at: 2024-01-06 12:58:34<br/>', 'CLIENTES', '2024-01-06', '12:58:34', '2024-01-06 16:58:34', '2024-01-06 16:58:34'),
(163, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN CLIENTE', 'id: 1<br/>empresa: EMPRESA #1<br/>nombre_encargado: JUAN PERES<br/>fonos: 777777 - 666666<br/>dir: LOS OLIVOS<br/>correo: EMP1@GMAIL.COM<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:58:20<br/>updated_at: 2024-01-06 12:58:34<br/>', NULL, 'CLIENTES', '2024-01-06', '12:59:03', '2024-01-06 16:59:03', '2024-01-06 16:59:03'),
(164, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CLIENTE', 'id: 1<br/>empresa: EMP. #1<br/>nombre_encargado: JUAN PERES<br/>fonos: 777777 - 666666<br/>dir: LOS OLIVOS<br/>correo: EMP1@GMAIL.COM<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:59:35<br/>updated_at: 2024-01-06 12:59:35<br/>', NULL, 'CLIENTES', '2024-01-06', '12:59:35', '2024-01-06 16:59:35', '2024-01-06 16:59:35'),
(165, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN MATERIAL', 'id: 1<br/>nombre: MATERIAL #1<br/>descripcion: DESC. MATERIAL #1<br/>stock: <br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:36:53<br/>updated_at: 2024-01-06 14:36:53<br/>', NULL, 'MATERIALES', '2024-01-06', '14:36:53', '2024-01-06 18:36:53', '2024-01-06 18:36:53'),
(166, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO EL INGRESO DE UN PRODUCTO', 'id: 1<br/>material_id: 1<br/>cantidad: 50<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:43:56<br/>updated_at: 2024-01-06 14:43:56<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-01-06', '14:43:56', '2024-01-06 18:43:56', '2024-01-06 18:43:56'),
(167, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ EL INGRESO DE UN PRODUCTO', 'id: 1<br/>material_id: 1<br/>cantidad: 50<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:43:56<br/>updated_at: 2024-01-06 14:43:56<br/>', 'id: 1<br/>material_id: 1<br/>cantidad: 20<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:43:56<br/>updated_at: 2024-01-06 14:44:12<br/>', 'INGRESO DE PRODUCTOS', '2024-01-06', '14:44:12', '2024-01-06 18:44:12', '2024-01-06 18:44:12'),
(168, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ EL INGRESO DE UN PRODUCTO', 'id: 1<br/>material_id: 1<br/>cantidad: 20<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:43:56<br/>updated_at: 2024-01-06 14:44:12<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-01-06', '14:44:29', '2024-01-06 18:44:29', '2024-01-06 18:44:29'),
(169, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO EL INGRESO DE UN PRODUCTO', 'id: 2<br/>material_id: 1<br/>cantidad: 30<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:44:44<br/>updated_at: 2024-01-06 14:44:44<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-01-06', '14:44:44', '2024-01-06 18:44:44', '2024-01-06 18:44:44'),
(170, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ EL INGRESO DE UN PRODUCTO', 'id: 2<br/>material_id: 1<br/>cantidad: 30<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:44:44<br/>updated_at: 2024-01-06 14:44:44<br/>', 'id: 2<br/>material_id: 1<br/>cantidad: 30<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:44:44<br/>updated_at: 2024-01-06 14:44:44<br/>', 'INGRESO DE PRODUCTOS', '2024-01-06', '14:44:46', '2024-01-06 18:44:46', '2024-01-06 18:44:46'),
(171, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ EL INGRESO DE UN PRODUCTO', 'id: 2<br/>material_id: 1<br/>cantidad: 30<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:44:44<br/>updated_at: 2024-01-06 14:44:44<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-01-06', '14:44:55', '2024-01-06 18:44:55', '2024-01-06 18:44:55'),
(172, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO EL INGRESO DE UN PRODUCTO', 'id: 1<br/>material_id: 1<br/>cantidad: 30<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:45:10<br/>updated_at: 2024-01-06 14:45:10<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-01-06', '14:45:10', '2024-01-06 18:45:10', '2024-01-06 18:45:10'),
(173, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE MATERIAL', 'id: 1<br/>material_id: 1<br/>cantidad: 3<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:50:48<br/>updated_at: 2024-01-06 14:50:48<br/>', NULL, 'SALIDA DE MATERIAL', '2024-01-06', '14:50:48', '2024-01-06 18:50:48', '2024-01-06 18:50:48'),
(174, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE MATERIAL', 'id: 1<br/>material_id: 1<br/>cantidad: 3<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:50:48<br/>updated_at: 2024-01-06 14:50:48<br/>', 'id: 1<br/>material_id: 1<br/>cantidad: 4<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:50:48<br/>updated_at: 2024-01-06 14:50:57<br/>', 'SALIDA DE MATERIALS', '2024-01-06', '14:50:57', '2024-01-06 18:50:57', '2024-01-06 18:50:57'),
(175, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA SALIDA DE MATERIAL', 'id: 1<br/>material_id: 1<br/>cantidad: 4<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:50:48<br/>updated_at: 2024-01-06 14:50:57<br/>', NULL, 'SALIDA DE MATERIALS', '2024-01-06', '14:51:02', '2024-01-06 18:51:02', '2024-01-06 18:51:02'),
(176, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE MATERIAL', 'id: 1<br/>material_id: 1<br/>cantidad: 1<br/>fecha_salida: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 14:51:23<br/>updated_at: 2024-01-06 14:51:23<br/>', NULL, 'SALIDA DE MATERIAL', '2024-01-06', '14:51:23', '2024-01-06 18:51:23', '2024-01-06 18:51:23'),
(177, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CLIENTE', 'correo: <br/>created_at: 2024-01-07 10:53:25<br/>dir: <br/>empresa: EMP. #2<br/>fecha_registro: 2024-01-07<br/>fonos: 78787878<br/>id: 2<br/>nombre_encargado: EDUARDO RAMIREZ<br/>updated_at: 2024-01-07 10:53:25<br/>', NULL, 'CLIENTES', '2024-01-07', '10:53:25', '2024-01-07 14:53:25', '2024-01-07 14:53:25'),
(178, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: <br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', NULL, 'SOLICITUD DE PEDIDOS', '2024-01-07', '11:35:58', '2024-01-07 15:35:58', '2024-01-07 15:35:58'),
(179, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-07', '11:54:32', '2024-01-07 15:54:32', '2024-01-07 15:54:32'),
(180, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-07', '11:54:47', '2024-01-07 15:54:47', '2024-01-07 15:54:47'),
(181, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-07', '11:55:01', '2024-01-07 15:55:01', '2024-01-07 15:55:01'),
(182, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-07', '11:55:07', '2024-01-07 15:55:07', '2024-01-07 15:55:07'),
(184, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-08', '11:26:52', '2024-01-08 15:26:52', '2024-01-08 15:26:52'),
(185, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-08', '11:33:10', '2024-01-08 15:33:10', '2024-01-08 15:33:10'),
(186, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-08', '12:08:56', '2024-01-08 16:08:56', '2024-01-08 16:08:56'),
(187, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-08', '12:15:05', '2024-01-08 16:15:05', '2024-01-08 16:15:05'),
(188, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-08', '12:15:56', '2024-01-08 16:15:56', '2024-01-08 16:15:56'),
(190, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA DISTRIBUCIÓN DE PEDIDO', 'created_at: 2024-01-08 12:17:50<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 2<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:17:50<br/>user_id: 2<br/>', NULL, 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-08', '12:17:50', '2024-01-08 16:17:50', '2024-01-08 16:17:50'),
(191, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cantidad_restante: 0<br/>cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>peso_restante: 0<br/>updated_at: 2024-01-07 11:35:58<br/>', 'cantidad_restante: 0<br/>cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>peso_restante: 0<br/>updated_at: 2024-01-07 11:35:58<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-08', '12:23:15', '2024-01-08 16:23:15', '2024-01-08 16:23:15'),
(192, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cantidad_restante: 0<br/>cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>peso_restante: 1<br/>updated_at: 2024-01-08 12:23:15<br/>', 'cantidad_restante: 0<br/>cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>peso_restante: 1<br/>updated_at: 2024-01-08 12:23:15<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-08', '12:24:47', '2024-01-08 16:24:47', '2024-01-08 16:24:47'),
(193, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'created_at: 2024-01-08 12:17:50<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 2<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:17:50<br/>user_id: 2<br/>', 'created_at: 2024-01-08 12:17:50<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 2<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:17:50<br/>user_id: 2<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-08', '12:45:18', '2024-01-08 16:45:18', '2024-01-08 16:45:18'),
(194, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'created_at: 2024-01-08 12:17:50<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 2<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:17:50<br/>user_id: 2<br/>', 'created_at: 2024-01-08 12:17:50<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 2<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:17:50<br/>user_id: 2<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-08', '12:50:12', '2024-01-08 16:50:12', '2024-01-08 16:50:12'),
(195, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA DISTRIBUCIÓN DE PEDIDO', 'created_at: 2024-01-08 12:17:50<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 2<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:17:50<br/>user_id: 2<br/>', NULL, 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-08', '12:51:10', '2024-01-08 16:51:10', '2024-01-08 16:51:10'),
(196, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA DISTRIBUCIÓN DE PEDIDO', 'created_at: 2024-01-08 12:52:07<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:52:07<br/>user_id: 2<br/>', NULL, 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-08', '12:52:07', '2024-01-08 16:52:07', '2024-01-08 16:52:07'),
(197, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'created_at: 2024-01-08 12:52:07<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:52:07<br/>user_id: 2<br/>', 'created_at: 2024-01-08 12:52:07<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:52:07<br/>user_id: 2<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-08', '13:02:09', '2024-01-08 17:02:09', '2024-01-08 17:02:09'),
(198, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA RECEPCIÓN DE PEDIDO', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:46:29<br/>updated_at: 2024-01-08 16:46:29<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-01-08', '16:46:29', '2024-01-08 20:46:29', '2024-01-08 20:46:29'),
(200, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:46:29<br/>updated_at: 2024-01-08 16:46:29<br/>', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:46:29<br/>updated_at: 2024-01-08 16:46:29<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-08', '16:57:41', '2024-01-08 20:57:41', '2024-01-08 20:57:41'),
(201, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:46:29<br/>updated_at: 2024-01-08 16:46:29<br/>', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:46:29<br/>updated_at: 2024-01-08 16:46:29<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-08', '16:57:45', '2024-01-08 20:57:45', '2024-01-08 20:57:45'),
(202, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:46:29<br/>updated_at: 2024-01-08 16:46:29<br/>', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:46:29<br/>updated_at: 2024-01-08 16:46:29<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-08', '16:57:50', '2024-01-08 20:57:50', '2024-01-08 20:57:50'),
(203, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA RECEPCIÓN DE PEDIDO', 'id: 2<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:58:48<br/>updated_at: 2024-01-08 16:58:48<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-01-08', '16:58:48', '2024-01-08 20:58:48', '2024-01-08 20:58:48'),
(204, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA RECEPCIÓN DE PEDIDO', 'id: 2<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:58:48<br/>updated_at: 2024-01-08 16:58:48<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-01-08', '17:01:47', '2024-01-08 21:01:47', '2024-01-08 21:01:47'),
(205, 1, 'CREACIÓN', 'EL USUARIO admin ACTUALIZÓ LA SECCIÓN NOSOTROS', 'id: 1<br/>historia: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>mision: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>vision: CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF \"DE FINIBUS BONORUM ET MALORUM\" (THE EXTREMES OF GOOD AND EVIL) BY CICERO, WRITTEN IN 45 BC. THIS BOOK IS A TREATISE ON THE THEORY OF ETHICS, VERY POPULAR DURING THE RENAISSANCE. THE FIRST LINE OF LOREM IPSUM, \"LOREM IPSUM DOLOR SIT AMET..\", COMES FROM A LINE IN SECTION 1.10.32.<br/>created_at: 2023-10-02 13:11:42<br/>updated_at: 2023-10-02 17:05:59<br/>', NULL, 'NOSOTROS', '2024-01-08', '17:05:45', '2024-01-08 21:05:45', '2024-01-08 21:05:45'),
(207, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA TARIFA DE PAGO', 'id: 2<br/>cliente_id: 1<br/>solicitud_pedido_id: 1<br/>cantidad: 53<br/>peso: 2940<br/>mano_obra: 16<br/>depreciacion: 18<br/>ganancia: 19<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 18:25:57<br/>updated_at: 2024-01-08 18:25:57<br/>', NULL, 'TARIFA DE PAGOS', '2024-01-08', '18:25:57', '2024-01-08 22:25:57', '2024-01-08 22:25:57'),
(208, 1, 'CREACIÓN', 'EL USUARIO  CREÓ UN REGISTRO DE CAJA', 'id: 9<br/>tipo: NORMAL<br/>tipo_movimiento: EGRESO<br/>concepto_id: 1<br/>monto: 10<br/>responsable_id: 1<br/>nro_factura: <br/>fecha: 2024-01-19<br/>descripcion: PASAJE<br/>a_favor: <br/>nro: <br/>user_id: <br/>nombre: <br/>fecha_registro: 2024-01-19<br/>estado: 1<br/>movimiento_caja_id: 0<br/>created_at: 2024-01-19 10:50:23<br/>updated_at: 2024-01-19 10:50:23<br/>', NULL, 'CAJAS', '2024-01-19', '10:50:23', '2024-01-19 14:50:23', '2024-01-19 14:50:23'),
(209, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CONCEPTO', 'id: 4<br/>nombre: APERTURA DE CAJA<br/>created_at: 2024-01-19 10:51:58<br/>updated_at: 2024-01-19 10:51:58<br/>', NULL, 'CONCEPTOS', '2024-01-19', '10:51:58', '2024-01-19 14:51:58', '2024-01-19 14:51:58'),
(210, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CONCEPTO', 'id: 5<br/>nombre: PASAJE<br/>created_at: 2024-01-19 10:52:07<br/>updated_at: 2024-01-19 10:52:07<br/>', NULL, 'CONCEPTOS', '2024-01-19', '10:52:07', '2024-01-19 14:52:07', '2024-01-19 14:52:07'),
(211, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN CONCEPTO', 'id: 6<br/>nombre: VENTA<br/>created_at: 2024-01-19 10:52:12<br/>updated_at: 2024-01-19 10:52:12<br/>', NULL, 'CONCEPTOS', '2024-01-19', '10:52:12', '2024-01-19 14:52:12', '2024-01-19 14:52:12'),
(214, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'id: 1<br/>codigo: B001<br/>cliente_id: 1<br/>cantidad_restante: 5<br/>peso_restante: 41<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-07 11:35:58<br/>updated_at: 2024-01-08 12:52:07<br/>', 'id: 1<br/>codigo: B001<br/>cliente_id: 1<br/>cantidad_restante: 5<br/>peso_restante: 41<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-07 11:35:58<br/>updated_at: 2024-01-08 12:52:07<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-19', '11:09:42', '2024-01-19 15:09:42', '2024-01-19 15:09:42'),
(215, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'id: 1<br/>codigo: B001<br/>cliente_id: 1<br/>cantidad_restante: 5<br/>peso_restante: 237<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-07 11:35:58<br/>updated_at: 2024-01-19 11:09:42<br/>', 'id: 1<br/>codigo: B001<br/>cliente_id: 1<br/>cantidad_restante: 5<br/>peso_restante: 237<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-07 11:35:58<br/>updated_at: 2024-01-19 11:09:42<br/>', 'SOLICITUD DE PEDIDOS', '2024-01-19', '11:09:50', '2024-01-19 15:09:50', '2024-01-19 15:09:50'),
(216, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-19', '11:13:13', '2024-01-19 15:13:13', '2024-01-19 15:13:13'),
(217, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-19', '11:13:29', '2024-01-19 15:13:29', '2024-01-19 15:13:29'),
(218, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-19', '11:18:46', '2024-01-19 15:18:46', '2024-01-19 15:18:46'),
(219, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-19', '11:18:53', '2024-01-19 15:18:53', '2024-01-19 15:18:53'),
(220, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'id: 1<br/>solicitud_pedido_id: 1<br/>user_id: 2<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 12:52:07<br/>updated_at: 2024-01-08 12:52:07<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-19', '11:19:00', '2024-01-19 15:19:00', '2024-01-19 15:19:00'),
(221, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:46:29<br/>updated_at: 2024-01-08 16:46:29<br/>', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>created_at: 2024-01-08 16:46:29<br/>updated_at: 2024-01-08 16:46:29<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-19', '11:19:31', '2024-01-19 15:19:31', '2024-01-19 15:19:31'),
(222, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-08 16:46:29<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 16:46:29<br/>user_id: 2<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-01-20', '11:56:08', '2024-01-20 15:56:08', '2024-01-20 15:56:08'),
(223, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'created_at: 2024-01-08 12:52:07<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:52:07<br/>user_id: 2<br/>', 'created_at: 2024-01-08 12:52:07<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:52:07<br/>user_id: 2<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-01-20', '13:23:53', '2024-01-20 17:23:53', '2024-01-20 17:23:53'),
(224, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-20<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-20 13:58:44<br/>user_id: 2<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-01-20', '13:58:44', '2024-01-20 17:58:44', '2024-01-20 17:58:44'),
(225, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-20<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-20 13:58:44<br/>user_id: 2<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '10:17:48', '2024-01-22 14:17:48', '2024-01-22 14:17:48'),
(227, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-20<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-20 13:58:44<br/>user_id: 2<br/>', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '10:55:51', '2024-01-22 14:55:51', '2024-01-22 14:55:51'),
(228, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '10:57:26', '2024-01-22 14:57:26', '2024-01-22 14:57:26'),
(229, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '10:58:54', '2024-01-22 14:58:54', '2024-01-22 14:58:54'),
(230, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '10:59:02', '2024-01-22 14:59:02', '2024-01-22 14:59:02'),
(231, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '10:59:12', '2024-01-22 14:59:12', '2024-01-22 14:59:12'),
(232, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 10:55:51<br/>user_id: 2<br/>', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-20<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:13:35<br/>user_id: 2<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '11:13:35', '2024-01-22 15:13:35', '2024-01-22 15:13:35'),
(236, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-20<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:13:35<br/>user_id: 2<br/>', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-20<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:13:35<br/>user_id: 2<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '11:26:43', '2024-01-22 15:26:43', '2024-01-22 15:26:43'),
(237, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-20<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:13:35<br/>user_id: 2<br/>', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-20<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:13:35<br/>user_id: 2<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '11:27:24', '2024-01-22 15:27:24', '2024-01-22 15:27:24'),
(238, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-20 13:58:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-20<br/>fecha_registro: 2024-01-20<br/>id: 6<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:13:35<br/>user_id: 2<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '11:35:04', '2024-01-22 15:35:04', '2024-01-22 15:35:04'),
(239, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-22 11:35:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-22<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:35:44<br/>user_id: 2<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '11:35:44', '2024-01-22 15:35:44', '2024-01-22 15:35:44'),
(240, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-22 11:35:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-22<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:35:44<br/>user_id: 2<br/>', 'created_at: 2024-01-22 11:35:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-22<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:35:44<br/>user_id: 2<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '11:35:52', '2024-01-22 15:35:52', '2024-01-22 15:35:52'),
(241, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA RECEPCIÓN DE PEDIDO', 'created_at: 2024-01-22 11:35:44<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-22<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:35:44<br/>user_id: 2<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-01-22', '11:36:22', '2024-01-22 15:36:22', '2024-01-22 15:36:22'),
(242, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA TARIFA DE PAGO', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-22 11:44:37<br/>depreciacion: 0<br/>fecha_registro: 2024-01-22<br/>ganancia: 0<br/>id: 3<br/>mano_obra: 0<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:44:37<br/>', NULL, 'TARIFA DE PAGOS', '2024-01-22', '11:44:37', '2024-01-22 15:44:37', '2024-01-22 15:44:37'),
(243, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA TARIFA DE PAGO', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-22 11:44:37<br/>depreciacion: 0.00<br/>fecha_registro: 2024-01-22<br/>ganancia: 0.00<br/>id: 3<br/>mano_obra: 0.00<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:44:37<br/>', NULL, 'TARIFA DE PAGOS', '2024-01-22', '11:44:56', '2024-01-22 15:44:56', '2024-01-22 15:44:56'),
(245, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA TARIFA DE PAGO', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-22 11:45:54<br/>depreciacion: 0<br/>fecha_registro: 2024-01-22<br/>ganancia: 0<br/>id: 4<br/>mano_obra: 0<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:45:54<br/>', NULL, 'TARIFA DE PAGOS', '2024-01-22', '11:45:54', '2024-01-22 15:45:54', '2024-01-22 15:45:54'),
(246, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA TARIFA DE PAGO', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-22 11:45:54<br/>depreciacion: 0.00<br/>fecha_registro: 2024-01-22<br/>ganancia: 0.00<br/>id: 4<br/>mano_obra: 0.00<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:45:54<br/>', NULL, 'TARIFA DE PAGOS', '2024-01-22', '11:45:57', '2024-01-22 15:45:57', '2024-01-22 15:45:57'),
(247, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA TARIFA DE PAGO', 'cantidad: 53<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18.00<br/>fecha_registro: 2024-01-08<br/>ganancia: 19.00<br/>id: 2<br/>mano_obra: 16.00<br/>peso: 2940<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 18:25:57<br/>', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18<br/>fecha_registro: 2024-01-08<br/>ganancia: 19<br/>id: 2<br/>mano_obra: 16<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:48:43<br/>', 'TARIFA DE PAGOS', '2024-01-22', '11:48:43', '2024-01-22 15:48:43', '2024-01-22 15:48:43'),
(248, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA TARIFA DE PAGO', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18.00<br/>fecha_registro: 2024-01-08<br/>ganancia: 19.00<br/>id: 2<br/>mano_obra: 16.00<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:48:43<br/>', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18<br/>fecha_registro: 2024-01-08<br/>ganancia: 19<br/>id: 2<br/>mano_obra: 6<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-22 11:49:03<br/>', 'TARIFA DE PAGOS', '2024-01-22', '11:49:03', '2024-01-22 15:49:03', '2024-01-22 15:49:03'),
(250, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'admin_producto_id: 2<br/>cantidad: <br/>cantidad_conos: 1<br/>created_at: 2024-01-22 11:56:33<br/>fecha_registro: 2024-01-22<br/>fecha_salida: 2024-01-22<br/>id: 2<br/>updated_at: 2024-01-22 11:56:33<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-22', '11:56:33', '2024-01-22 15:56:33', '2024-01-22 15:56:33'),
(251, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA SALIDA DE PRODUCTO', 'admin_producto_id: 2<br/>cantidad: <br/>cantidad_conos: 1<br/>created_at: 2024-01-22 11:56:33<br/>fecha_registro: 2024-01-22<br/>fecha_salida: 2024-01-22<br/>id: 2<br/>updated_at: 2024-01-22 11:56:33<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-22', '11:56:42', '2024-01-22 15:56:42', '2024-01-22 15:56:42'),
(252, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 10<br/>cantidad_conos: <br/>created_at: 2024-01-22 11:56:51<br/>fecha_registro: 2024-01-22<br/>fecha_salida: 2024-01-22<br/>id: 3<br/>updated_at: 2024-01-22 11:56:51<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-22', '11:56:51', '2024-01-22 15:56:51', '2024-01-22 15:56:51'),
(253, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 10<br/>cantidad_conos: <br/>created_at: 2024-01-22 11:56:51<br/>fecha_registro: 2024-01-22<br/>fecha_salida: 2024-01-22<br/>id: 3<br/>updated_at: 2024-01-22 11:56:51<br/>', 'admin_producto_id: 1<br/>cantidad: 10<br/>cantidad_conos: 2<br/>created_at: 2024-01-22 11:56:51<br/>fecha_registro: 2024-01-22<br/>fecha_salida: 2024-01-22<br/>id: 3<br/>updated_at: 2024-01-22 11:56:59<br/>', 'SALIDA DE PRODUCTOS', '2024-01-22', '11:56:59', '2024-01-22 15:56:59', '2024-01-22 15:56:59');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(254, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 10<br/>cantidad_conos: 2<br/>created_at: 2024-01-22 11:56:51<br/>fecha_registro: 2024-01-22<br/>fecha_salida: 2024-01-22<br/>id: 3<br/>updated_at: 2024-01-22 11:56:59<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-01-22', '11:57:03', '2024-01-22 15:57:03', '2024-01-22 15:57:03'),
(255, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: <br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: 1<br/>tipo_registro: <br/>updated_at: 2024-06-29 11:53:34<br/>user_id: 2<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-06-29', '11:53:34', '2024-06-29 15:53:34', '2024-06-29 15:53:34'),
(256, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: <br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: 1<br/>tipo_registro: <br/>updated_at: 2024-06-29 11:53:34<br/>user_id: 2<br/>', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: DETALLE<br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: <br/>tipo_registro: <br/>updated_at: 2024-06-29 11:56:14<br/>user_id: <br/>', 'SALIDA DE PRODUCTOS', '2024-06-29', '11:56:14', '2024-06-29 15:56:14', '2024-06-29 15:56:14'),
(257, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: DETALLE<br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: <br/>tipo_registro: <br/>updated_at: 2024-06-29 11:56:14<br/>user_id: <br/>', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: <br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: 1<br/>tipo_registro: <br/>updated_at: 2024-06-29 11:56:26<br/>user_id: 2<br/>', 'SALIDA DE PRODUCTOS', '2024-06-29', '11:56:26', '2024-06-29 15:56:26', '2024-06-29 15:56:26'),
(258, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: <br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: 1<br/>tipo_registro: <br/>updated_at: 2024-06-29 11:56:26<br/>user_id: 2<br/>', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: DET<br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: 1<br/>tipo_registro: <br/>updated_at: 2024-06-29 11:56:30<br/>user_id: 2<br/>', 'SALIDA DE PRODUCTOS', '2024-06-29', '11:56:30', '2024-06-29 15:56:30', '2024-06-29 15:56:30'),
(259, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: DET<br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: 1<br/>tipo_registro: <br/>updated_at: 2024-06-29 11:56:30<br/>user_id: 2<br/>', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: DET<br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: <br/>tipo_registro: <br/>updated_at: 2024-06-29 11:56:34<br/>user_id: <br/>', 'SALIDA DE PRODUCTOS', '2024-06-29', '11:56:34', '2024-06-29 15:56:34', '2024-06-29 15:56:34'),
(260, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: DET<br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: <br/>tipo_registro: <br/>updated_at: 2024-06-29 11:56:34<br/>user_id: <br/>', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: DET<br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: <br/>tipo_registro: <br/>updated_at: 2024-06-29 11:57:07<br/>user_id: 2<br/>', 'SALIDA DE PRODUCTOS', '2024-06-29', '11:57:07', '2024-06-29 15:57:07', '2024-06-29 15:57:07'),
(261, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SALIDA DE PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: DET<br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: <br/>tipo_registro: <br/>updated_at: 2024-06-29 11:57:07<br/>user_id: 2<br/>', 'admin_producto_id: 1<br/>cantidad: 5<br/>cantidad_conos: 1<br/>created_at: 2024-06-29 11:53:34<br/>detalle: <br/>fecha_registro: 2024-06-29<br/>fecha_salida: 2024-06-29<br/>id: 4<br/>solicitud_pedido_id: 1<br/>tipo_registro: <br/>updated_at: 2024-06-29 11:57:13<br/>user_id: 2<br/>', 'SALIDA DE PRODUCTOS', '2024-06-29', '11:57:13', '2024-06-29 15:57:13', '2024-06-29 15:57:13'),
(262, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ EL INGRESO DE UN PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 30<br/>cantidad_conos: 5<br/>created_at: 2024-01-06 12:28:48<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>id: 4<br/>updated_at: 2024-01-06 12:28:48<br/>', 'admin_producto_id: 1<br/>cantidad: 30.313<br/>cantidad_conos: 5<br/>created_at: 2024-01-06 12:28:48<br/>fecha_ingreso: 2024-01-06<br/>fecha_registro: 2024-01-06<br/>id: 4<br/>updated_at: 2024-07-01 11:06:15<br/>', 'INGRESO DE PRODUCTOS', '2024-07-01', '11:06:15', '2024-07-01 15:06:15', '2024-07-01 15:06:15'),
(263, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ EL INGRESO DE UN PRODUCTO', 'admin_producto_id: 1<br/>cantidad: 30<br/>cantidad_conos: 5<br/>created_at: 2024-01-06 12:24:06<br/>fecha_ingreso: 2024-01-05<br/>fecha_registro: 2024-01-06<br/>id: 3<br/>updated_at: 2024-01-06 12:24:06<br/>', 'admin_producto_id: 1<br/>cantidad: 30.43222<br/>cantidad_conos: 5<br/>created_at: 2024-01-06 12:24:06<br/>fecha_ingreso: 2024-01-05<br/>fecha_registro: 2024-01-06<br/>id: 3<br/>updated_at: 2024-07-01 11:06:21<br/>', 'INGRESO DE PRODUCTOS', '2024-07-01', '11:06:21', '2024-07-01 15:06:21', '2024-07-01 15:06:21'),
(264, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA TARIFA DE PAGO', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18.00<br/>fecha_registro: 2024-01-08<br/>ganancia: 19.00<br/>id: 2<br/>mano_obra: 6.00<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>tipo_registro: <br/>updated_at: 2024-01-22 11:49:03<br/>user_id: <br/>', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18<br/>fecha_registro: 2024-01-08<br/>ganancia: 19<br/>id: 2<br/>mano_obra: 6<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>tipo_registro: TODOS<br/>updated_at: 2024-07-01 11:20:13<br/>user_id: <br/>', 'TARIFA DE PAGOS', '2024-07-01', '11:20:13', '2024-07-01 15:20:13', '2024-07-01 15:20:13'),
(265, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA TARIFA DE PAGO', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18.00<br/>fecha_registro: 2024-01-08<br/>ganancia: 19.00<br/>id: 2<br/>mano_obra: 6.00<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>tipo_registro: TODOS<br/>updated_at: 2024-07-01 11:20:13<br/>user_id: <br/>', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18<br/>fecha_registro: 2024-01-08<br/>ganancia: 19<br/>id: 2<br/>mano_obra: 6<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>tipo_registro: SOCIO O TALLER<br/>updated_at: 2024-07-01 11:20:21<br/>user_id: 4<br/>', 'TARIFA DE PAGOS', '2024-07-01', '11:20:21', '2024-07-01 15:20:21', '2024-07-01 15:20:21'),
(266, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA TARIFA DE PAGO', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18.00<br/>fecha_registro: 2024-01-08<br/>ganancia: 19.00<br/>id: 2<br/>mano_obra: 6.00<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>tipo_registro: SOCIO O TALLER<br/>updated_at: 2024-07-01 11:20:21<br/>user_id: 4<br/>', 'cantidad: 8<br/>cliente_id: 1<br/>created_at: 2024-01-08 18:25:57<br/>depreciacion: 18<br/>fecha_registro: 2024-01-08<br/>ganancia: 19<br/>id: 2<br/>mano_obra: 6<br/>peso: 69<br/>solicitud_pedido_id: 1<br/>tipo_registro: TODOS<br/>updated_at: 2024-07-01 11:22:16<br/>user_id: <br/>', 'TARIFA DE PAGOS', '2024-07-01', '11:22:16', '2024-07-01 15:22:16', '2024-07-01 15:22:16'),
(272, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cantidad_restante: 4<br/>cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>peso_restante: 165<br/>updated_at: 2024-01-20 13:23:53<br/>', 'cantidad_restante: 4<br/>cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>peso_restante: 165<br/>updated_at: 2024-01-20 13:23:53<br/>', 'SOLICITUD DE PEDIDOS', '2024-07-01', '11:40:15', '2024-07-01 15:40:15', '2024-07-01 15:40:15'),
(273, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA SOLICITUD DE PEDIDO', 'cantidad_restante: 4<br/>cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>peso_restante: 165<br/>updated_at: 2024-01-20 13:23:53<br/>', 'cantidad_restante: 4<br/>cliente_id: 1<br/>codigo: B001<br/>created_at: 2024-01-07 11:35:58<br/>fecha_recepcion: 2024-01-07<br/>fecha_registro: 2024-01-06<br/>id: 1<br/>peso_restante: 165<br/>updated_at: 2024-01-20 13:23:53<br/>', 'SOLICITUD DE PEDIDOS', '2024-07-01', '11:48:10', '2024-07-01 15:48:10', '2024-07-01 15:48:10'),
(274, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'created_at: 2024-01-08 12:52:07<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:52:07<br/>user_id: 2<br/>', 'created_at: 2024-01-08 12:52:07<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:52:07<br/>user_id: 2<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-07-01', '12:09:40', '2024-07-01 16:09:40', '2024-07-01 16:09:40'),
(275, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'created_at: 2024-01-08 12:52:07<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:52:07<br/>user_id: 2<br/>', 'created_at: 2024-01-08 12:52:07<br/>fecha_distribucion: 2024-01-08<br/>fecha_registro: 2024-01-08<br/>id: 1<br/>solicitud_pedido_id: 1<br/>updated_at: 2024-01-08 12:52:07<br/>user_id: 2<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-07-01', '12:09:59', '2024-07-01 16:09:59', '2024-07-01 16:09:59'),
(276, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA DISTRIBUCIÓN DE PEDIDO', 'id: 2<br/>solicitud_pedido_id: 1<br/>user_id: 7<br/>fecha_distribucion: 2024-07-02<br/>fecha_registro: 2024-07-02<br/>created_at: 2024-07-02 13:38:05<br/>updated_at: 2024-07-02 13:38:05<br/>', NULL, 'DISTRIBUCIÓN DE PEDIDOS', '2024-07-02', '13:38:05', '2024-07-02 17:38:05', '2024-07-02 17:38:05'),
(277, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SOLICITUD DE PEDIDO', 'id: 2<br/>codigo: P002<br/>cliente_id: 2<br/>cantidad_restante: <br/>peso_restante: <br/>fecha_recepcion: 2024-07-02<br/>fecha_registro: 2024-07-02<br/>created_at: 2024-07-02 13:39:54<br/>updated_at: 2024-07-02 13:39:54<br/>', NULL, 'SOLICITUD DE PEDIDOS', '2024-07-02', '13:39:54', '2024-07-02 17:39:54', '2024-07-02 17:39:54'),
(278, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA DISTRIBUCIÓN DE PEDIDO', 'id: 3<br/>solicitud_pedido_id: 2<br/>user_id: 2<br/>fecha_distribucion: 2024-07-02<br/>fecha_registro: 2024-07-02<br/>created_at: 2024-07-02 13:40:18<br/>updated_at: 2024-07-02 13:40:18<br/>', NULL, 'DISTRIBUCIÓN DE PEDIDOS', '2024-07-02', '13:40:18', '2024-07-02 17:40:18', '2024-07-02 17:40:18'),
(279, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA DISTRIBUCIÓN DE PEDIDO', 'id: 3<br/>solicitud_pedido_id: 2<br/>user_id: 2<br/>fecha_distribucion: 2024-07-02<br/>fecha_registro: 2024-07-02<br/>created_at: 2024-07-02 13:40:18<br/>updated_at: 2024-07-02 13:40:18<br/>', 'id: 3<br/>solicitud_pedido_id: 2<br/>user_id: 2<br/>fecha_distribucion: 2024-07-02<br/>fecha_registro: 2024-07-02<br/>created_at: 2024-07-02 13:40:18<br/>updated_at: 2024-07-02 13:40:18<br/>', 'DISTRIBUCIÓN DE PEDIDOS', '2024-07-02', '13:40:27', '2024-07-02 17:40:27', '2024-07-02 17:40:27'),
(280, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA RECEPCIÓN DE PEDIDO', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-22<br/>created_at: 2024-01-22 11:35:44<br/>updated_at: 2024-01-22 11:35:44<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-07-02', '14:05:00', '2024-07-02 18:05:00', '2024-07-02 18:05:00'),
(281, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA RECEPCIÓN DE PEDIDO', 'id: 2<br/>user_id: 7<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 2<br/>fecha_recepcion: 2024-07-02<br/>fecha_registro: 2024-07-02<br/>created_at: 2024-07-02 14:12:19<br/>updated_at: 2024-07-02 14:12:19<br/>', NULL, 'RECEPCIÓN DE PEDIDOS', '2024-07-02', '14:12:19', '2024-07-02 18:12:19', '2024-07-02 18:12:19'),
(282, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA RECEPCIÓN DE PEDIDO', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-01-22<br/>fecha_registro: 2024-01-22<br/>created_at: 2024-01-22 11:35:44<br/>updated_at: 2024-01-22 11:35:44<br/>', 'id: 1<br/>user_id: 2<br/>solicitud_pedido_id: 1<br/>distribucion_pedido_id: 1<br/>fecha_recepcion: 2024-07-02<br/>fecha_registro: 2024-01-22<br/>created_at: 2024-01-22 11:35:44<br/>updated_at: 2024-07-02 14:14:00<br/>', 'RECEPCIÓN DE PEDIDOS', '2024-07-02', '14:14:00', '2024-07-02 18:14:00', '2024-07-02 18:14:00'),
(283, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ EL INGRESO DE UN PRODUCTO', 'id: 4<br/>admin_producto_id: 1<br/>cantidad: 30.313<br/>cantidad_conos: 5<br/>fecha_ingreso: 2024-01-06<br/>precio: 0.00<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:28:48<br/>updated_at: 2024-07-01 11:06:15<br/>', 'id: 4<br/>admin_producto_id: 1<br/>cantidad: 30.313<br/>cantidad_conos: 5<br/>fecha_ingreso: 2024-01-06<br/>precio: 1200<br/>fecha_registro: 2024-01-06<br/>created_at: 2024-01-06 12:28:48<br/>updated_at: 2024-07-02 14:18:51<br/>', 'INGRESO DE PRODUCTOS', '2024-07-02', '14:18:51', '2024-07-02 18:18:51', '2024-07-02 18:18:51'),
(284, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO EL INGRESO DE UN PRODUCTO', 'id: 5<br/>admin_producto_id: 1<br/>cantidad: 100.911<br/>cantidad_conos: 3<br/>fecha_ingreso: 2024-07-02<br/>precio: 600<br/>fecha_registro: 2024-07-02<br/>created_at: 2024-07-02 14:19:09<br/>updated_at: 2024-07-02 14:19:09<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-07-02', '14:19:09', '2024-07-02 18:19:09', '2024-07-02 18:19:09'),
(285, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN MATERIAL', 'created_at: 2024-07-03 14:54:27<br/>descripcion: DESC<br/>fecha_registro: 2024-07-03<br/>id: 2<br/>nombre: MATERIAL #2<br/>stock: <br/>updated_at: 2024-07-03 14:54:27<br/>', NULL, 'MATERIALES', '2024-07-03', '14:54:27', '2024-07-03 18:54:27', '2024-07-03 18:54:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_recepcions`
--

CREATE TABLE `historia_recepcions` (
  `id` bigint UNSIGNED NOT NULL,
  `recepcion_pedido_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `solicitud_pedido_id` bigint UNSIGNED NOT NULL,
  `distribucion_pedido_id` bigint UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historia_recepcions`
--

INSERT INTO `historia_recepcions` (`id`, `recepcion_pedido_id`, `user_id`, `solicitud_pedido_id`, `distribucion_pedido_id`, `fecha`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 1, '2024-01-22', '2024-01-22 15:35:44', '2024-01-22 15:35:44'),
(2, 1, 2, 1, 1, '2024-01-22', '2024-01-22 15:36:22', '2024-01-22 15:36:22'),
(3, 1, 2, 1, 1, '2024-07-02', '2024-07-02 18:05:00', '2024-07-02 18:05:00'),
(4, 2, 7, 1, 2, '2024-07-02', '2024-07-02 18:12:19', '2024-07-02 18:12:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_recepcion_detalles`
--

CREATE TABLE `historia_recepcion_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `historia_recepcion_id` bigint UNSIGNED NOT NULL,
  `recepcion_detalle_id` bigint UNSIGNED NOT NULL,
  `solicitud_detalle_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `peso` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historia_recepcion_detalles`
--

INSERT INTO `historia_recepcion_detalles` (`id`, `historia_recepcion_id`, `recepcion_detalle_id`, `solicitud_detalle_id`, `cantidad`, `peso`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1.00, 20.00, '2024-01-22 15:35:44', '2024-01-22 15:35:52'),
(2, 1, 2, 3, 0.00, 0.00, '2024-01-22 15:35:44', '2024-01-22 15:35:44'),
(3, 2, 1, 2, 1.00, 15.00, '2024-01-22 15:36:22', '2024-01-22 15:36:22'),
(4, 2, 2, 3, 1.00, 50.00, '2024-01-22 15:36:22', '2024-01-22 15:36:22'),
(5, 3, 1, 2, 1.00, 15.00, '2024-07-02 18:05:00', '2024-07-02 18:05:00'),
(6, 3, 2, 3, 0.00, 0.00, '2024-07-02 18:05:00', '2024-07-02 18:14:00'),
(7, 4, 3, 2, 1.00, 45.00, '2024-07-02 18:12:19', '2024-07-02 18:12:19'),
(8, 4, 4, 3, 0.00, 0.00, '2024-07-02 18:12:19', '2024-07-02 18:12:19'),
(9, 4, 5, 4, 0.00, 0.00, '2024-07-02 18:12:19', '2024-07-02 18:12:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_materials`
--

CREATE TABLE `ingreso_materials` (
  `id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingreso_materials`
--

INSERT INTO `ingreso_materials` (`id`, `material_id`, `cantidad`, `fecha_ingreso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 30.00, '2024-01-06', '2024-01-06', '2024-01-06 18:45:10', '2024-01-06 18:45:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_productos`
--

CREATE TABLE `ingreso_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,3) NOT NULL,
  `cantidad_conos` double(8,2) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `precio` decimal(24,2) NOT NULL DEFAULT '0.00',
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingreso_productos`
--

INSERT INTO `ingreso_productos` (`id`, `admin_producto_id`, `cantidad`, `cantidad_conos`, `fecha_ingreso`, `precio`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(2, 2, 70.000, 10.00, '2024-01-04', 0.00, '2024-01-06', '2024-01-06 16:23:40', '2024-01-06 16:23:49'),
(3, 1, 30.432, 5.00, '2024-01-05', 0.00, '2024-01-06', '2024-01-06 16:24:06', '2024-07-01 15:06:21'),
(4, 1, 30.313, 5.00, '2024-01-06', 1200.00, '2024-01-06', '2024-01-06 16:28:48', '2024-07-02 18:18:51'),
(5, 1, 100.911, 3.00, '2024-07-02', 600.00, '2024-07-02', '2024-07-02 18:19:09', '2024-07-02 18:19:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materials`
--

CREATE TABLE `materials` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` double(8,2) NOT NULL DEFAULT '0.00',
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materials`
--

INSERT INTO `materials` (`id`, `nombre`, `descripcion`, `stock`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'MATERIAL #1', 'DESC. MATERIAL #1', 29.00, '2024-01-06', '2024-01-06 18:36:53', '2024-01-06 18:51:23'),
(2, 'MATERIAL #2', 'DESC', 0.00, '2024-07-03', '2024-07-03 18:54:27', '2024-07-03 18:54:27');

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
(22, '2023_10_09_104851_create_apis_table', 3),
(23, '2023_10_18_145914_create_conceptos_table', 4),
(24, '2023_10_18_145915_create_cajas_table', 4),
(25, '2023_10_18_150335_create_repositorios_table', 4),
(26, '2023_10_18_150349_create_repositorio_archivos_table', 4),
(27, '2023_10_18_170418_create_movimiento_cajas_table', 5),
(28, '2024_01_06_100228_create_admin_productos_table', 6),
(29, '2024_01_06_100251_create_ingreso_productos_table', 6),
(30, '2024_01_06_101509_create_salida_productos_table', 6),
(31, '2024_01_06_101825_create_movimiento_productos_table', 6),
(32, '2024_01_06_102003_create_clientes_table', 6),
(33, '2024_01_06_102135_create_solicitud_pedidos_table', 6),
(34, '2024_01_06_102240_create_solicitud_detalles_table', 6),
(35, '2024_01_06_102412_create_distribucion_pedidos_table', 6),
(36, '2024_01_06_102602_create_distribucion_detalles_table', 6),
(37, '2024_01_06_102727_create_recepcion_pedidos_table', 6),
(38, '2024_01_06_103403_create_recepcion_detalles_table', 6),
(39, '2024_01_06_103651_create_tarifa_pagos_table', 6),
(40, '2024_01_06_104001_create_tarifa_detalles_table', 6),
(41, '2024_01_06_104238_create_materials_table', 6),
(42, '2024_01_06_104250_create_ingreso_materials_table', 6),
(43, '2024_01_06_104303_create_salida_materials_table', 6),
(44, '2024_01_06_104730_create_movimiento_materials_table', 7),
(45, '2024_01_20_113932_create_historia_recepcions_table', 8),
(46, '2024_01_20_114055_create_historia_recepcion_detalles_table', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_cajas`
--

CREATE TABLE `movimiento_cajas` (
  `id` bigint UNSIGNED NOT NULL,
  `ingresos` decimal(24,2) NOT NULL,
  `egresos` decimal(24,2) NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimiento_cajas`
--

INSERT INTO `movimiento_cajas` (`id`, `ingresos`, `egresos`, `total`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(2, 1850.00, 470.50, 1379.50, '2023-10-18', '18:09:18', '2023-10-18 22:09:18', '2023-10-18 22:09:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_materials`
--

CREATE TABLE `movimiento_materials` (
  `id` bigint UNSIGNED NOT NULL,
  `registro_id` bigint UNSIGNED NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimiento_materials`
--

INSERT INTO `movimiento_materials` (`id`, `registro_id`, `tipo`, `cantidad`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 'INGRESO', 30.00, '2024-01-06', '2024-01-06 18:45:10', '2024-01-06 18:45:10'),
(3, 1, 'SALIDA', 1.00, '2024-01-06', '2024-01-06 18:51:23', '2024-01-06 18:51:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_productos`
--

CREATE TABLE `movimiento_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `registro_id` bigint UNSIGNED NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `cantidad_conos` double(8,2) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `movimiento_productos`
--

INSERT INTO `movimiento_productos` (`id`, `registro_id`, `tipo`, `cantidad`, `cantidad_conos`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(2, 2, 'INGRESO', 70.00, 10.00, '2024-01-06', '2024-01-06 16:23:40', '2024-01-06 16:23:40'),
(3, 3, 'INGRESO', 30.43, 5.00, '2024-01-06', '2024-01-06 16:24:06', '2024-07-01 15:06:21'),
(4, 4, 'INGRESO', 30.31, 5.00, '2024-01-06', '2024-01-06 16:28:48', '2024-07-02 18:18:51'),
(10, 4, 'SALIDA', 5.00, 1.00, '2024-06-29', '2024-06-29 15:53:35', '2024-06-29 15:53:35'),
(11, 5, 'INGRESO', 100.91, 3.00, '2024-07-02', '2024-07-02 18:19:09', '2024-07-02 18:19:09');

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
(5, 'EDUARDO', 'GONZALES', 'BOLIVIA', '787878787', '', 'PENDIENTE', 100.00, '2023-10-09', '2023-10-09 17:30:41', '2023-10-18 18:57:03'),
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
(7, 'PRODUCTO #6', 'DESC 6', 100.00, 10.00, 2, '1696877778_7.jpg', '2023-10-03 20:45:44', '2023-10-18 18:56:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcion_detalles`
--

CREATE TABLE `recepcion_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `recepcion_pedido_id` bigint UNSIGNED NOT NULL,
  `solicitud_detalle_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `cantidad_restante` double(8,2) NOT NULL,
  `peso` double(8,2) NOT NULL,
  `peso_restante` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recepcion_detalles`
--

INSERT INTO `recepcion_detalles` (`id`, `recepcion_pedido_id`, `solicitud_detalle_id`, `cantidad`, `cantidad_restante`, `peso`, `peso_restante`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 3.00, 0.00, 50.00, 0.00, '2024-01-22 15:35:44', '2024-07-02 18:05:00'),
(2, 1, 3, 1.00, 0.00, 50.00, 0.00, '2024-01-22 15:35:44', '2024-07-02 18:14:00'),
(3, 2, 2, 2.00, 1.00, 95.00, 50.00, '2024-07-02 18:12:19', '2024-07-02 18:12:19'),
(4, 2, 3, 0.00, 0.00, 0.00, 0.00, '2024-07-02 18:12:19', '2024-07-02 18:12:19'),
(5, 2, 4, 0.00, 0.00, 0.00, 0.00, '2024-07-02 18:12:19', '2024-07-02 18:12:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcion_pedidos`
--

CREATE TABLE `recepcion_pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `solicitud_pedido_id` bigint UNSIGNED NOT NULL,
  `distribucion_pedido_id` bigint UNSIGNED DEFAULT NULL,
  `fecha_recepcion` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recepcion_pedidos`
--

INSERT INTO `recepcion_pedidos` (`id`, `user_id`, `solicitud_pedido_id`, `distribucion_pedido_id`, `fecha_recepcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2024-07-02', '2024-01-22', '2024-01-22 15:35:44', '2024-07-02 18:14:00'),
(2, 7, 1, 2, '2024-07-02', '2024-07-02', '2024-07-02 18:12:19', '2024-07-02 18:12:19');

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
-- Estructura de tabla para la tabla `repositorios`
--

CREATE TABLE `repositorios` (
  `id` bigint UNSIGNED NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `repositorios`
--

INSERT INTO `repositorios` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(2, 'REPO #1', '2023-10-19 20:23:10', '2023-10-19 20:23:10'),
(3, 'REPO#2', '2023-10-19 20:23:35', '2023-10-19 20:23:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repositorio_archivos`
--

CREATE TABLE `repositorio_archivos` (
  `id` bigint UNSIGNED NOT NULL,
  `repositorio_id` bigint UNSIGNED NOT NULL,
  `archivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `repositorio_archivos`
--

INSERT INTO `repositorio_archivos` (`id`, `repositorio_id`, `archivo`, `ext`, `tipo`, `created_at`, `updated_at`) VALUES
(5, 2, '16977469984139951.png', 'png', 'imagen', '2023-10-19 20:23:18', '2023-10-19 20:23:18'),
(6, 2, '1697746998tenazassimpson.jpeg', 'jpeg', 'imagen', '2023-10-19 20:23:18', '2023-10-19 20:23:18'),
(7, 3, '1697747022smartphone.png', 'png', 'imagen', '2023-10-19 20:23:42', '2023-10-19 20:23:42'),
(8, 3, '1697747022tenazassimpson.jpeg', 'jpeg', 'imagen', '2023-10-19 20:23:42', '2023-10-19 20:23:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_materials`
--

CREATE TABLE `salida_materials` (
  `id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `salida_materials`
--

INSERT INTO `salida_materials` (`id`, `material_id`, `cantidad`, `fecha_salida`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 1.00, '2024-01-06', '2024-01-06', '2024-01-06 18:51:23', '2024-01-06 18:51:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_productos`
--

CREATE TABLE `salida_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) DEFAULT NULL,
  `cantidad_conos` double(8,2) DEFAULT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo_registro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `solicitud_pedido_id` bigint UNSIGNED DEFAULT NULL,
  `detalle` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `salida_productos`
--

INSERT INTO `salida_productos` (`id`, `admin_producto_id`, `cantidad`, `cantidad_conos`, `fecha_salida`, `fecha_registro`, `created_at`, `updated_at`, `tipo_registro`, `user_id`, `solicitud_pedido_id`, `detalle`) VALUES
(4, 1, 5.00, 1.00, '2024-06-29', '2024-06-29', '2024-06-29 15:53:34', '2024-06-29 15:57:13', '', 2, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_detalles`
--

CREATE TABLE `solicitud_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `solicitud_pedido_id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `talla` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `cantidad_restante` double(8,2) NOT NULL,
  `elaborado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso` double(8,2) NOT NULL,
  `peso_total` double(8,2) NOT NULL,
  `peso_restante` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `solicitud_detalles`
--

INSERT INTO `solicitud_detalles` (`id`, `solicitud_pedido_id`, `codigo`, `descripcion`, `talla`, `cantidad`, `cantidad_restante`, `elaborado`, `titulo`, `codigo_color`, `peso`, `peso_total`, `peso_restante`, `created_at`, `updated_at`) VALUES
(2, 1, '4043', 'CHOMPA CRIS', 'L', 5.00, 0.00, 'MANO', '2/17', 'GUINDO-2500', 29.00, 145.00, 0.00, '2024-01-07 15:35:58', '2024-07-02 17:38:05'),
(3, 1, '4044', 'CHOMPA CUADRADA', 'M', 3.00, 2.00, 'MAQUINA', '2/16', 'AZUL-8100', 40.00, 120.00, 70.00, '2024-01-08 15:33:10', '2024-07-01 16:09:59'),
(4, 1, '4043', 'SDS', 'M', 3.00, 3.00, 'MAQUINA', '2/15', 'VERDE-300', 30.00, 90.00, 90.00, '2024-07-01 15:48:10', '2024-07-01 15:48:10'),
(5, 2, 'P003', 'DESC. NUEVO', 'L', 10.00, 0.00, 'MAQUINA', '17/5', 'AZUL-300', 30.00, 300.00, 0.00, '2024-07-02 17:39:54', '2024-07-02 17:40:27'),
(6, 2, 'P004', 'DESC. NUEVO 2', 'M', 10.00, 10.00, 'INDUSTRIAL', '1/16', 'VERDE-2000', 30.00, 300.00, 300.00, '2024-07-02 17:39:54', '2024-07-02 17:39:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_pedidos`
--

CREATE TABLE `solicitud_pedidos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `cantidad_restante` double(8,2) NOT NULL DEFAULT '0.00',
  `peso_restante` double(8,2) NOT NULL DEFAULT '0.00',
  `fecha_recepcion` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `solicitud_pedidos`
--

INSERT INTO `solicitud_pedidos` (`id`, `codigo`, `cliente_id`, `cantidad_restante`, `peso_restante`, `fecha_recepcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'B001', 1, 5.00, 160.00, '2024-01-07', '2024-01-06', '2024-01-07 15:35:58', '2024-07-02 17:38:05'),
(2, 'P002', 2, 10.00, 300.00, '2024-07-02', '2024-07-02', '2024-07-02 17:39:54', '2024-07-02 17:40:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa_detalles`
--

CREATE TABLE `tarifa_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `tarifa_pago_id` bigint UNSIGNED NOT NULL,
  `solicitud_detalle_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `peso` double(8,2) NOT NULL,
  `mano_obra` double(8,2) NOT NULL,
  `mano_obra_pagar` decimal(24,2) NOT NULL,
  `depreciacion` double(8,2) NOT NULL,
  `depreciacion_pagar` decimal(24,2) NOT NULL,
  `ganancia` double(8,2) NOT NULL,
  `ganancia_pagar` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tarifa_detalles`
--

INSERT INTO `tarifa_detalles` (`id`, `tarifa_pago_id`, `solicitud_detalle_id`, `cantidad`, `peso`, `mano_obra`, `mano_obra_pagar`, `depreciacion`, `depreciacion_pagar`, `ganancia`, `ganancia_pagar`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 5.00, 29.00, 0.00, 0.00, 3.00, 15.00, 2.00, 10.00, '2024-01-08 22:25:57', '2024-07-01 15:22:16'),
(2, 2, 3, 3.00, 40.00, 2.00, 6.00, 1.00, 3.00, 3.00, 9.00, '2024-01-08 22:25:57', '2024-07-01 15:22:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa_pagos`
--

CREATE TABLE `tarifa_pagos` (
  `id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `solicitud_pedido_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `peso` double(8,2) NOT NULL,
  `mano_obra` decimal(24,2) NOT NULL,
  `depreciacion` decimal(24,2) NOT NULL,
  `ganancia` decimal(24,2) NOT NULL,
  `tipo_registro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tarifa_pagos`
--

INSERT INTO `tarifa_pagos` (`id`, `cliente_id`, `solicitud_pedido_id`, `cantidad`, `peso`, `mano_obra`, `depreciacion`, `ganancia`, `tipo_registro`, `user_id`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 8.00, 69.00, 6.00, 18.00, 19.00, 'TODOS', NULL, '2024-01-08', '2024-01-08 22:25:57', '2024-07-01 15:22:16');

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
  `tipo` enum('ADMINISTRADOR','REPRESENTANTE','SOCIO','CAJA','NINGUNO') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
(7, 'EQUISPE', 'ELVIS', 'QUISPE', 'QUISPE', '5555', 'CB', '2000-03-03', 'MASCULINO', 'SIN CARGO', '2023-01-01', 'TALLER #3', 'LOS OLIVOS', '7777', 'SOCIO', 0.00, 'REPRESENTANTE', 'default.png', 'VALIDO DEL 01/01/2023 AL 01/01/2024', '$2y$10$AKGhHxtE.Bp5AYiw9fe1Ou6j1bZU7QC0VvVrdGbnwGa5dUSqHQQ9.', 1, 1, '2023-10-09', '2023-10-09 15:35:58', '2023-10-09 15:37:48'),
(8, 'caja', 'caja', '', NULL, '123456', '', NULL, '', '', NULL, '', '', NULL, '', 0.00, 'CAJA', NULL, '', '$2y$10$FmQTfV2nXBkwOI.TRHqShujlbDFgvPFLFxHH1iwilLrU2QnLik7zq', 1, 1, '2024-01-19', '2024-01-19 14:45:47', '2024-01-19 14:45:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividads`
--
ALTER TABLE `actividads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `admin_productos`
--
ALTER TABLE `admin_productos`
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
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajas_concepto_id_foreign` (`concepto_id`),
  ADD KEY `cajas_responsable_id_foreign` (`responsable_id`);

--
-- Indices de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
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
-- Indices de la tabla `distribucion_detalles`
--
ALTER TABLE `distribucion_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distribucion_pedidos`
--
ALTER TABLE `distribucion_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historia_recepcions`
--
ALTER TABLE `historia_recepcions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historia_recepcion_detalles`
--
ALTER TABLE `historia_recepcion_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingreso_materials`
--
ALTER TABLE `ingreso_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimiento_cajas`
--
ALTER TABLE `movimiento_cajas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimiento_materials`
--
ALTER TABLE `movimiento_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimiento_productos`
--
ALTER TABLE `movimiento_productos`
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
-- Indices de la tabla `recepcion_detalles`
--
ALTER TABLE `recepcion_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recepcion_pedidos`
--
ALTER TABLE `recepcion_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `red_socials`
--
ALTER TABLE `red_socials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `repositorios`
--
ALTER TABLE `repositorios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `repositorio_archivos`
--
ALTER TABLE `repositorio_archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repositorio_archivos_repositorio_id_foreign` (`repositorio_id`);

--
-- Indices de la tabla `salida_materials`
--
ALTER TABLE `salida_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salida_productos`
--
ALTER TABLE `salida_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitud_detalles`
--
ALTER TABLE `solicitud_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitud_pedidos`
--
ALTER TABLE `solicitud_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarifa_detalles`
--
ALTER TABLE `tarifa_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarifa_pagos`
--
ALTER TABLE `tarifa_pagos`
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
-- AUTO_INCREMENT de la tabla `admin_productos`
--
ALTER TABLE `admin_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `catalogos`
--
ALTER TABLE `catalogos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT de la tabla `distribucion_detalles`
--
ALTER TABLE `distribucion_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `distribucion_pedidos`
--
ALTER TABLE `distribucion_pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT de la tabla `historia_recepcions`
--
ALTER TABLE `historia_recepcions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historia_recepcion_detalles`
--
ALTER TABLE `historia_recepcion_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ingreso_materials`
--
ALTER TABLE `ingreso_materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `movimiento_cajas`
--
ALTER TABLE `movimiento_cajas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movimiento_materials`
--
ALTER TABLE `movimiento_materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `movimiento_productos`
--
ALTER TABLE `movimiento_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- AUTO_INCREMENT de la tabla `recepcion_detalles`
--
ALTER TABLE `recepcion_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `recepcion_pedidos`
--
ALTER TABLE `recepcion_pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `red_socials`
--
ALTER TABLE `red_socials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `repositorios`
--
ALTER TABLE `repositorios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `repositorio_archivos`
--
ALTER TABLE `repositorio_archivos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `salida_materials`
--
ALTER TABLE `salida_materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `salida_productos`
--
ALTER TABLE `salida_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `solicitud_detalles`
--
ALTER TABLE `solicitud_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `solicitud_pedidos`
--
ALTER TABLE `solicitud_pedidos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tarifa_detalles`
--
ALTER TABLE `tarifa_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tarifa_pagos`
--
ALTER TABLE `tarifa_pagos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_concepto_id_foreign` FOREIGN KEY (`concepto_id`) REFERENCES `conceptos` (`id`),
  ADD CONSTRAINT `cajas_responsable_id_foreign` FOREIGN KEY (`responsable_id`) REFERENCES `users` (`id`);

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

--
-- Filtros para la tabla `repositorio_archivos`
--
ALTER TABLE `repositorio_archivos`
  ADD CONSTRAINT `repositorio_archivos_repositorio_id_foreign` FOREIGN KEY (`repositorio_id`) REFERENCES `repositorios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
