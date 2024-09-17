-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2024 a las 23:38:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pannysoft4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` enum('Programada','Confirmada','Cancelada') DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_cliente`, `fecha`, `estado`, `observaciones`) VALUES
(1, 1, '2023-07-01 10:00:00', 'Confirmada', 'Cliente pide sesión en ambiente tranquilo'),
(2, 2, '2023-07-01 12:00:00', 'Programada', 'Primer masaje, necesita explicación'),
(3, 3, '2023-07-02 14:00:00', 'Cancelada', 'Cliente cambió de fecha'),
(4, 4, '2023-07-03 11:00:00', 'Confirmada', 'Solicitó masaje deportivo por dolor muscular'),
(5, 5, '2023-07-03 13:00:00', 'Confirmada', 'Cliente quiere tratamiento capilar especial'),
(6, 6, '2023-07-04 09:00:00', 'Programada', 'Preferencia por productos veganos'),
(7, 7, '2023-07-04 11:00:00', 'Cancelada', 'No se presentó'),
(8, 8, '2023-07-05 16:00:00', 'Confirmada', 'Sesión de masaje de piedras calientes'),
(9, 9, '2023-07-06 10:00:00', 'Programada', 'Primera cita, cliente nervioso'),
(10, 10, '2023-07-06 12:00:00', 'Confirmada', 'Cliente pide una limpieza facial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('M','F') DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `telefono`, `correo`, `fecha_nacimiento`, `genero`, `direccion`) VALUES
(1, 'Ana', 'Perez', '1234567890', 'ana.perez@example.com', '1990-05-12', 'F', 'Calle 1, Ciudad A'),
(2, 'Carlos', 'Lopez', '0987654321', 'carlos.lopez@example.com', '1985-07-23', 'M', 'Calle 2, Ciudad B'),
(3, 'María', 'Gómez', '1122334455', 'maria.gomez@example.com', '1992-03-15', 'F', 'Calle 3, Ciudad C'),
(4, 'Juan', 'Diaz', '5566778899', 'juan.diaz@example.com', '1988-11-30', 'M', 'Calle 4, Ciudad D'),
(5, 'Lucia', 'Sanchez', '9988776655', 'lucia.sanchez@example.com', '1995-09-08', 'F', 'Calle 5, Ciudad E'),
(6, 'Pedro', 'Morales', '5544332211', 'pedro.morales@example.com', '1987-12-20', 'M', 'Calle 6, Ciudad F'),
(7, 'Sofia', 'Martinez', '6677889900', 'sofia.martinez@example.com', '1991-04-14', 'F', 'Calle 7, Ciudad G'),
(8, 'Luis', 'Vega', '4455667788', 'luis.vega@example.com', '1993-01-25', 'M', 'Calle 8, Ciudad H'),
(9, 'Valentina', 'Rojas', '3344556677', 'valentina.rojas@example.com', '1996-08-18', 'F', 'Calle 9, Ciudad I'),
(10, 'Jorge', 'Fernandez', '2233445566', 'jorge.fernandez@example.com', '1989-02-10', 'M', 'Calle 10, Ciudad J');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cita`
--

CREATE TABLE `detalle_cita` (
  `id_detalle` int(11) NOT NULL,
  `id_cita` int(11) DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_cita`
--

INSERT INTO `detalle_cita` (`id_detalle`, `id_cita`, `id_servicio`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `tipo` enum('Recepcionista','Esteticista') DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellido`, `tipo`, `usuario`, `contrasena`) VALUES
(1, 'Sofia', 'Perez', 'Esteticista', 'sofia.perez', 'password123'),
(2, 'Carlos', 'Ramirez', 'Recepcionista', 'carlos.ramirez', 'password456'),
(3, 'Lucia', 'Gomez', 'Esteticista', 'lucia.gomez', 'password789'),
(4, 'Pedro', 'Fernandez', 'Recepcionista', 'pedro.fernandez', 'password321'),
(5, 'Mariana', 'Lopez', 'Esteticista', 'mariana.lopez', 'password654'),
(6, 'Daniel', 'Rodriguez', 'Recepcionista', 'daniel.rodriguez', 'password987'),
(7, 'Carmen', 'Martinez', 'Esteticista', 'carmen.martinez', 'password852'),
(8, 'Jose', 'Sanchez', 'Recepcionista', 'jose.sanchez', 'password963'),
(9, 'Laura', 'Gomez', 'Esteticista', 'laura.gomez', 'password741'),
(10, 'Luis', 'Vega', 'Recepcionista', 'luis.vega', 'password159');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_clinico`
--

CREATE TABLE `historial_clinico` (
  `id_historial` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `alergias` varchar(255) DEFAULT NULL,
  `enfermedades_previas` varchar(255) DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_clinico`
--

INSERT INTO `historial_clinico` (`id_historial`, `id_cliente`, `fecha`, `alergias`, `enfermedades_previas`, `observaciones`) VALUES
(1, 1, '2023-01-10', 'Polen', 'Asma', 'No usar productos con fragancias fuertes'),
(2, 2, '2023-02-15', 'Mariscos', 'Ninguna', 'Evitar cremas con extracto de marisco'),
(3, 3, '2023-03-20', 'Polvo', 'Dermatitis', 'Usar productos hipoalergénicos'),
(4, 4, '2023-04-25', 'Aspirina', 'Hipertensión', 'Revisión periódica de presión'),
(5, 5, '2023-05-30', 'Chocolate', 'Diabetes', 'Cuidado con productos que contengan azúcar'),
(6, 6, '2023-06-05', 'Nueces', 'Ninguna', 'Evitar productos con frutos secos'),
(7, 7, '2023-07-10', 'Polen', 'Asma', 'Requiere ambiente ventilado'),
(8, 8, '2023-08-15', 'Frutos rojos', 'Ninguna', 'Evitar contacto con productos de frutos rojos'),
(9, 9, '2023-09-20', 'Polvo', 'Alergia cutánea', 'Usar solo productos suaves para la piel'),
(10, 10, '2023-10-25', 'Lácteos', 'Gastritis', 'Evitar productos con componentes lácteos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_cita` int(11) DEFAULT NULL,
  `metodo_pago` enum('Efectivo','Tarjeta','Transferencia') DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_cita`, `metodo_pago`, `monto`, `fecha_pago`) VALUES
(1, 1, 'Efectivo', 50.00, '2023-07-01'),
(2, 2, 'Tarjeta', 30.00, '2023-07-01'),
(3, 3, 'Efectivo', 20.00, '2023-07-02'),
(4, 4, 'Tarjeta', 70.00, '2023-07-03'),
(5, 5, 'Transferencia', 55.00, '2023-07-03'),
(6, 6, 'Efectivo', 40.00, '2023-07-04'),
(7, 7, 'Tarjeta', 15.00, '2023-07-04'),
(8, 8, 'Transferencia', 80.00, '2023-07-05'),
(9, 9, 'Efectivo', 35.00, '2023-07-06'),
(10, 10, 'Tarjeta', 30.00, '2023-07-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre`, `descripcion`, `duracion`, `precio`) VALUES
(1, 'Masaje Relajante', 'Masaje completo con aceites esenciales.', 60, 50.00),
(2, 'Facial Hidratante', 'Limpieza profunda e hidratación facial.', 45, 30.00),
(3, 'Manicure', 'Cuidado de uñas y cutículas.', 30, 20.00),
(4, 'Pedicure', 'Cuidado de pies y uñas.', 45, 25.00),
(5, 'Masaje Deportivo', 'Terapia muscular profunda.', 75, 70.00),
(6, 'Exfoliación Corporal', 'Tratamiento exfoliante para todo el cuerpo.', 50, 40.00),
(7, 'Depilación', 'Depilación con cera.', 30, 15.00),
(8, 'Tratamiento Capilar', 'Revitalización y cuidado del cabello.', 60, 55.00),
(9, 'Limpieza de Espalda', 'Tratamiento de limpieza para la piel de la espalda.', 50, 35.00),
(10, 'Masaje de Piedras Calientes', 'Masaje terapéutico con piedras volcánicas.', 90, 80.00);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_canceladas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_canceladas` (
`id_cita` int(11)
,`nombre` varchar(50)
,`apellido` varchar(50)
,`fecha` datetime
,`observaciones` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_del_dia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_del_dia` (
`id_cita` int(11)
,`nombre` varchar(50)
,`apellido` varchar(50)
,`fecha` datetime
,`nombre_servicio` varchar(100)
,`nombre_empleado` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_estado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_estado` (
`id_cita` int(11)
,`nombre` varchar(50)
,`apellido` varchar(50)
,`fecha` datetime
,`estado` enum('Programada','Confirmada','Cancelada')
,`observaciones` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_esteticista`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_esteticista` (
`nombre_esteticista` varchar(50)
,`apellido_esteticista` varchar(50)
,`fecha_cita` datetime
,`nombre_cliente` varchar(50)
,`apellido_cliente` varchar(50)
,`nombre_servicio` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_citas_por_servicio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_citas_por_servicio` (
`nombre_servicio` varchar(100)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clientes_frecuentes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clientes_frecuentes` (
`id_cliente` int(11)
,`nombre` varchar(50)
,`apellido` varchar(50)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clientes_sin_citas_recientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clientes_sin_citas_recientes` (
`id_cliente` int(11)
,`nombre` varchar(50)
,`apellido` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_detalle_cita`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_detalle_cita` (
`id_cita` int(11)
,`nombre_cliente` varchar(50)
,`apellido_cliente` varchar(50)
,`fecha` datetime
,`nombre_servicio` varchar(100)
,`nombre_empleado` varchar(50)
,`observaciones` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_esteticistas_mas_citas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_esteticistas_mas_citas` (
`nombre_esteticista` varchar(50)
,`apellido_esteticista` varchar(50)
,`total_citas` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_historial_clinico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_historial_clinico` (
`id_cliente` int(11)
,`nombre` varchar(50)
,`apellido` varchar(50)
,`telefono` varchar(20)
,`correo` varchar(50)
,`fecha_historial` date
,`alergias` varchar(255)
,`enfermedades_previas` varchar(255)
,`observaciones` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ingresos_por_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ingresos_por_mes` (
`mes` int(2)
,`anio` int(4)
,`total_ingresos` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pagos_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pagos_cliente` (
`id_cliente` int(11)
,`nombre` varchar(50)
,`apellido` varchar(50)
,`fecha_cita` datetime
,`monto` decimal(10,2)
,`metodo_pago` enum('Efectivo','Tarjeta','Transferencia')
,`fecha_pago` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_servicios_mas_solicitados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_servicios_mas_solicitados` (
`nombre_servicio` varchar(100)
,`total_solicitudes` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_servicios_por_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_servicios_por_cliente` (
`id_cliente` int(11)
,`nombre` varchar(50)
,`apellido` varchar(50)
,`fecha_cita` datetime
,`nombre_servicio` varchar(100)
,`precio` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_canceladas`
--
DROP TABLE IF EXISTS `vista_citas_canceladas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_canceladas`  AS SELECT `c`.`id_cita` AS `id_cita`, `cl`.`nombre` AS `nombre`, `cl`.`apellido` AS `apellido`, `c`.`fecha` AS `fecha`, `c`.`observaciones` AS `observaciones` FROM (`citas` `c` join `clientes` `cl` on(`c`.`id_cliente` = `cl`.`id_cliente`)) WHERE `c`.`estado` = 'Cancelada' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_del_dia`
--
DROP TABLE IF EXISTS `vista_citas_del_dia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_del_dia`  AS SELECT `c`.`id_cita` AS `id_cita`, `cl`.`nombre` AS `nombre`, `cl`.`apellido` AS `apellido`, `c`.`fecha` AS `fecha`, `s`.`nombre` AS `nombre_servicio`, `e`.`nombre` AS `nombre_empleado` FROM ((((`citas` `c` join `clientes` `cl` on(`c`.`id_cliente` = `cl`.`id_cliente`)) join `detalle_cita` `dc` on(`c`.`id_cita` = `dc`.`id_cita`)) join `servicios` `s` on(`dc`.`id_servicio` = `s`.`id_servicio`)) left join `empleados` `e` on(`e`.`id_empleado` = `dc`.`id_servicio`)) WHERE cast(`c`.`fecha` as date) = curdate() ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_estado`
--
DROP TABLE IF EXISTS `vista_citas_estado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_estado`  AS SELECT `c`.`id_cita` AS `id_cita`, `cl`.`nombre` AS `nombre`, `cl`.`apellido` AS `apellido`, `c`.`fecha` AS `fecha`, `c`.`estado` AS `estado`, `c`.`observaciones` AS `observaciones` FROM (`citas` `c` join `clientes` `cl` on(`c`.`id_cliente` = `cl`.`id_cliente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_esteticista`
--
DROP TABLE IF EXISTS `vista_citas_esteticista`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_esteticista`  AS SELECT `e`.`nombre` AS `nombre_esteticista`, `e`.`apellido` AS `apellido_esteticista`, `c`.`fecha` AS `fecha_cita`, `cl`.`nombre` AS `nombre_cliente`, `cl`.`apellido` AS `apellido_cliente`, `s`.`nombre` AS `nombre_servicio` FROM ((((`empleados` `e` join `detalle_cita` `dc` on(`e`.`id_empleado` = `dc`.`id_servicio`)) join `citas` `c` on(`dc`.`id_cita` = `c`.`id_cita`)) join `clientes` `cl` on(`c`.`id_cliente` = `cl`.`id_cliente`)) join `servicios` `s` on(`dc`.`id_servicio` = `s`.`id_servicio`)) WHERE `e`.`tipo` = 'Esteticista' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_citas_por_servicio`
--
DROP TABLE IF EXISTS `vista_citas_por_servicio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_citas_por_servicio`  AS SELECT `s`.`nombre` AS `nombre_servicio`, count(`dc`.`id_cita`) AS `total_citas` FROM (`servicios` `s` join `detalle_cita` `dc` on(`s`.`id_servicio` = `dc`.`id_servicio`)) GROUP BY `s`.`id_servicio` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clientes_frecuentes`
--
DROP TABLE IF EXISTS `vista_clientes_frecuentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_clientes_frecuentes`  AS SELECT `c`.`id_cliente` AS `id_cliente`, `c`.`nombre` AS `nombre`, `c`.`apellido` AS `apellido`, count(`ci`.`id_cita`) AS `total_citas` FROM (`clientes` `c` join `citas` `ci` on(`c`.`id_cliente` = `ci`.`id_cliente`)) GROUP BY `c`.`id_cliente` HAVING `total_citas` > 3 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clientes_sin_citas_recientes`
--
DROP TABLE IF EXISTS `vista_clientes_sin_citas_recientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_clientes_sin_citas_recientes`  AS SELECT `c`.`id_cliente` AS `id_cliente`, `c`.`nombre` AS `nombre`, `c`.`apellido` AS `apellido` FROM (`clientes` `c` left join `citas` `ci` on(`c`.`id_cliente` = `ci`.`id_cliente`)) WHERE `ci`.`fecha` < curdate() - interval 6 month OR `ci`.`fecha` is null ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_detalle_cita`
--
DROP TABLE IF EXISTS `vista_detalle_cita`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_detalle_cita`  AS SELECT `ci`.`id_cita` AS `id_cita`, `cl`.`nombre` AS `nombre_cliente`, `cl`.`apellido` AS `apellido_cliente`, `ci`.`fecha` AS `fecha`, `s`.`nombre` AS `nombre_servicio`, `e`.`nombre` AS `nombre_empleado`, `ci`.`observaciones` AS `observaciones` FROM ((((`citas` `ci` join `clientes` `cl` on(`ci`.`id_cliente` = `cl`.`id_cliente`)) join `detalle_cita` `dc` on(`ci`.`id_cita` = `dc`.`id_cita`)) join `servicios` `s` on(`dc`.`id_servicio` = `s`.`id_servicio`)) left join `empleados` `e` on(`e`.`id_empleado` = `dc`.`id_servicio`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_esteticistas_mas_citas`
--
DROP TABLE IF EXISTS `vista_esteticistas_mas_citas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_esteticistas_mas_citas`  AS SELECT `e`.`nombre` AS `nombre_esteticista`, `e`.`apellido` AS `apellido_esteticista`, count(`dc`.`id_cita`) AS `total_citas` FROM (`empleados` `e` join `detalle_cita` `dc` on(`e`.`id_empleado` = `dc`.`id_servicio`)) GROUP BY `e`.`id_empleado` ORDER BY count(`dc`.`id_cita`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_historial_clinico`
--
DROP TABLE IF EXISTS `vista_historial_clinico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_historial_clinico`  AS SELECT `c`.`id_cliente` AS `id_cliente`, `c`.`nombre` AS `nombre`, `c`.`apellido` AS `apellido`, `c`.`telefono` AS `telefono`, `c`.`correo` AS `correo`, `hc`.`fecha` AS `fecha_historial`, `hc`.`alergias` AS `alergias`, `hc`.`enfermedades_previas` AS `enfermedades_previas`, `hc`.`observaciones` AS `observaciones` FROM (`clientes` `c` join `historial_clinico` `hc` on(`c`.`id_cliente` = `hc`.`id_cliente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ingresos_por_mes`
--
DROP TABLE IF EXISTS `vista_ingresos_por_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ingresos_por_mes`  AS SELECT month(`p`.`fecha_pago`) AS `mes`, year(`p`.`fecha_pago`) AS `anio`, sum(`p`.`monto`) AS `total_ingresos` FROM `pagos` AS `p` GROUP BY year(`p`.`fecha_pago`), month(`p`.`fecha_pago`) ORDER BY year(`p`.`fecha_pago`) ASC, month(`p`.`fecha_pago`) ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pagos_cliente`
--
DROP TABLE IF EXISTS `vista_pagos_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pagos_cliente`  AS SELECT `cl`.`id_cliente` AS `id_cliente`, `cl`.`nombre` AS `nombre`, `cl`.`apellido` AS `apellido`, `ci`.`fecha` AS `fecha_cita`, `p`.`monto` AS `monto`, `p`.`metodo_pago` AS `metodo_pago`, `p`.`fecha_pago` AS `fecha_pago` FROM ((`clientes` `cl` join `citas` `ci` on(`cl`.`id_cliente` = `ci`.`id_cliente`)) join `pagos` `p` on(`ci`.`id_cita` = `p`.`id_cita`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_servicios_mas_solicitados`
--
DROP TABLE IF EXISTS `vista_servicios_mas_solicitados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_servicios_mas_solicitados`  AS SELECT `s`.`nombre` AS `nombre_servicio`, count(`dc`.`id_servicio`) AS `total_solicitudes` FROM (`servicios` `s` join `detalle_cita` `dc` on(`s`.`id_servicio` = `dc`.`id_servicio`)) GROUP BY `s`.`id_servicio` ORDER BY count(`dc`.`id_servicio`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_servicios_por_cliente`
--
DROP TABLE IF EXISTS `vista_servicios_por_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_servicios_por_cliente`  AS SELECT `c`.`id_cliente` AS `id_cliente`, `c`.`nombre` AS `nombre`, `c`.`apellido` AS `apellido`, `ci`.`fecha` AS `fecha_cita`, `s`.`nombre` AS `nombre_servicio`, `s`.`precio` AS `precio` FROM (((`clientes` `c` join `citas` `ci` on(`c`.`id_cliente` = `ci`.`id_cliente`)) join `detalle_cita` `dc` on(`ci`.`id_cita` = `dc`.`id_cita`)) join `servicios` `s` on(`dc`.`id_servicio` = `s`.`id_servicio`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_cita`
--
ALTER TABLE `detalle_cita`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_cita` (`id_cita`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_cita` (`id_cita`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_cita`
--
ALTER TABLE `detalle_cita`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_cita`
--
ALTER TABLE `detalle_cita`
  ADD CONSTRAINT `detalle_cita_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_cita_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD CONSTRAINT `historial_clinico_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
