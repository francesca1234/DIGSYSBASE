-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-08-2019 a las 22:06:08
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bonos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `tipo_documento` int(10) NOT NULL,
  `documento` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` int(20) NOT NULL,
  `tipo_beneficio` int(11) NOT NULL,
  `direccion` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `aprendiz`
--

INSERT INTO `aprendiz` (`tipo_documento`, `documento`, `nombre`, `apellidos`, `sexo`, `tipo_beneficio`, `direccion`, `telefono`, `email`) VALUES
(1, 10163636, 'Jose Luis', 'Peaz Ruiz', 1, 1, 'calle 2', '66262', 'jsjsj@k.com'),
(2, 2147483647, 'johan sin gafas', 'Crespo Castro', 1, 1, 'calle 2', '30158388399', 'tecsicol@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `id_entrega` int(11) NOT NULL,
  `id_aprendiz` int(11) NOT NULL,
  `id_beneficio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_entrega` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`) VALUES
(1, 'Usuario'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `id_sexo` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id_sexo`, `nombre`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_beneficio`
--

CREATE TABLE `tipo_beneficio` (
  `id_beneficio` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_beneficio`
--

INSERT INTO `tipo_beneficio` (`id_beneficio`, `nombre`) VALUES
(1, 'Transporte'),
(2, 'Almuerzo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documeno`
--

CREATE TABLE `tipo_documeno` (
  `id_tipodocumento` int(11) NOT NULL,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_documeno`
--

INSERT INTO `tipo_documeno` (`id_tipodocumento`, `nombre`) VALUES
(1, 'Tarjeta de identidad'),
(2, 'Cedula de ciudadania'),
(3, 'Cedula de extranjeri'),
(4, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `documento` int(40) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rol` int(11) NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `documento`, `nombre`, `apellido`, `rol`, `telefono`, `email`, `clave`) VALUES
(1, 1234, 'juan', 'paez', 1, '1111', 'j@j', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `tipo_documento` (`tipo_documento`),
  ADD KEY `tipo_documento_2` (`tipo_documento`),
  ADD KEY `sexo` (`sexo`),
  ADD KEY `tipo_beneficio` (`tipo_beneficio`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id_entrega`),
  ADD KEY `id_aprendiz` (`id_aprendiz`),
  ADD KEY `id_beneficio` (`id_beneficio`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id_sexo`);

--
-- Indices de la tabla `tipo_beneficio`
--
ALTER TABLE `tipo_beneficio`
  ADD PRIMARY KEY (`id_beneficio`);

--
-- Indices de la tabla `tipo_documeno`
--
ALTER TABLE `tipo_documeno`
  ADD PRIMARY KEY (`id_tipodocumento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD KEY `rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entrega`
--
ALTER TABLE `entrega`
  MODIFY `id_entrega` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id_sexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_beneficio`
--
ALTER TABLE `tipo_beneficio`
  MODIFY `id_beneficio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_documeno`
--
ALTER TABLE `tipo_documeno`
  MODIFY `id_tipodocumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD CONSTRAINT `aprendiz_ibfk_1` FOREIGN KEY (`sexo`) REFERENCES `sexo` (`id_sexo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aprendiz_ibfk_2` FOREIGN KEY (`tipo_beneficio`) REFERENCES `tipo_beneficio` (`id_beneficio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aprendiz_ibfk_3` FOREIGN KEY (`tipo_documento`) REFERENCES `tipo_documeno` (`id_tipodocumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_aprendiz`) REFERENCES `aprendiz` (`tipo_documento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`id_beneficio`) REFERENCES `tipo_beneficio` (`id_beneficio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entrega_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
