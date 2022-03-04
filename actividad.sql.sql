-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-03-2022 a las 18:30:50
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `feis_net (2)`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion`
--

CREATE TABLE `informacion` (
  `ID_Persona1` int(20) DEFAULT NULL,
  `ID_Persona2` int(20) DEFAULT NULL,
  `Amigos_de_persona1` int(20) DEFAULT NULL,
  `Amigos_en_comun` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `informacion`
--

INSERT INTO `informacion` (`ID_Persona1`, `ID_Persona2`, `Amigos_de_persona1`, `Amigos_en_comun`) VALUES
(1, 2, 5, 'camilo\r\n'),
(3, 4, 5, 'manuel\r\npedro\r\n'),
(5, 1, 5, 'ana\r\ncamilo\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_solicitudes`
--

CREATE TABLE `info_solicitudes` (
  `ID_usuario` int(50) DEFAULT NULL,
  `Aceptadas` int(50) DEFAULT NULL,
  `Rechazada` int(50) DEFAULT NULL,
  `en_espera` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `info_solicitudes`
--

INSERT INTO `info_solicitudes` (`ID_usuario`, `Aceptadas`, `Rechazada`, `en_espera`) VALUES
(1, 5, 1, 1),
(2, 5, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(20) NOT NULL,
  `Nombre` text,
  `Apellido` text,
  `Nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `Nombre`, `Apellido`, `Nacimiento`) VALUES
(1, 'Maria ', 'De la hoz ', '2002-10-10'),
(2, 'pedro', 'rojas', '2003-06-12'),
(3, 'lina', 'franco', '2022-10-26'),
(4, 'ana', 'cabarcas', '2022-07-10'),
(5, 'manuel', 'caballero', '2005-12-23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD UNIQUE KEY `ID_Usuario1` (`ID_Persona1`),
  ADD UNIQUE KEY `ID_usuario 2` (`ID_Persona2`),
  ADD UNIQUE KEY `ID_Persona1` (`ID_Persona1`),
  ADD UNIQUE KEY `ID_Persona2` (`ID_Persona2`);

--
-- Indices de la tabla `info_solicitudes`
--
ALTER TABLE `info_solicitudes`
  ADD UNIQUE KEY `ID` (`ID_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `informacion`
--
ALTER TABLE `informacion`
  ADD CONSTRAINT `informacion_ibfk_1` FOREIGN KEY (`ID_Persona1`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `informacion_ibfk_2` FOREIGN KEY (`ID_Persona2`) REFERENCES `usuario` (`ID`);

--
-- Filtros para la tabla `info_solicitudes`
--
ALTER TABLE `info_solicitudes`
  ADD CONSTRAINT `info_solicitudes_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
