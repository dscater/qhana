-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-09-2023 a las 22:45:16
-- Versión del servidor: 8.0.30
-- Versión de PHP: 7.4.19

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posición` int NOT NULL,
  `desc1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'cargo: CARGO #3 QHANA BOLIVIA<br/>ci: 3333<br/>ci_exp: LP<br/>created_at: 2023-09-28 18:18:55<br/>dir: LOS OLIVOS<br/>estado: 1<br/>fecha_ingreso: 2018-01-01<br/>fecha_nac: 1999-01-01<br/>fecha_registro: 2023-09-28<br/>fono: 66666<br/>foto: default.png<br/>genero: FEMENINO<br/>id: 5<br/>materno: MAMANI<br/>nombre: MARIA<br/>p_discapacidad: 100<br/>password: $2y$10$q9MGwRRWSzADVe559suEL.D3LmI4FS8Cjcw08Ja8mYDu7ao/NrLh2<br/>paterno: MAMANI<br/>taller: TALLER #3<br/>tipo: NINGUNO<br/>tipo_personal: TRABAJADOR<br/>updated_at: 2023-09-28 18:18:55<br/>usuario: MMAMANI<br/>validez_credencial: VALIDO DEL 01/01/23 AL 01/01/24<br/>', NULL, 'USUARIOS', '2023-09-28', '18:18:55', '2023-09-28 22:18:55', '2023-09-28 22:18:55');

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
(4, 'FMAMANI', 'FERNANDO', 'MAMANI', 'MAMANI', '2222', 'LP', '2000-01-01', 'MASCULINO', 'CARGO QHANA BOLIVIA', '2020-01-01', 'TALLER #1', 'LOS OLIVOS', '777777', 'SOCIO', 70.00, 'ADMINISTRADOR', 'default.png', 'VALIDO DEL 20/01/23 AL 20/01/2024', '$2y$10$EosVGjhgfm3HNQ9JFnnbC..vgv7SsuWysSrLL7AjEq0iTRoYs/PWC', 1, '2023-09-28', '2023-09-28 22:10:52', '2023-09-28 22:10:52'),
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `nosotros`
--
ALTER TABLE `nosotros`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
