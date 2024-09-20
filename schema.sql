Create database sistemaescolar;
use sistemaescolar;

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
`id_cargo` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) DEFAULT NULL,
PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cargo
-- ----------------------------
INSERT INTO `cargo` VALUES ('1', 'Director/a');
INSERT INTO `cargo` VALUES ('2', 'Inicial 1ro A');
INSERT INTO `cargo` VALUES ('3', 'Inicial 1ro B');
INSERT INTO `cargo` VALUES ('4', 'Inicial 2do A');
INSERT INTO `cargo` VALUES ('5', 'Inicial 2do B');
INSERT INTO `cargo` VALUES ('6', '1ro A');
INSERT INTO `cargo` VALUES ('7', '1ro B');
INSERT INTO `cargo` VALUES ('8', '2do A');
INSERT INTO `cargo` VALUES ('9', '2do B');
INSERT INTO `cargo` VALUES ('10', '3ro A');
INSERT INTO `cargo` VALUES ('11', '3ro A');
INSERT INTO `cargo` VALUES ('12', '4to A');
INSERT INTO `cargo` VALUES ('13', '4to B');
INSERT INTO `cargo` VALUES ('14', '5to A');
INSERT INTO `cargo` VALUES ('15', '5to B');
INSERT INTO `cargo` VALUES ('16', '6to A');
INSERT INTO `cargo` VALUES ('17', '6to B');
INSERT INTO `cargo` VALUES ('18', 'Educacion Fisica');
INSERT INTO `cargo` VALUES ('19', 'Musica');
INSERT INTO `cargo` VALUES ('20', 'Secretaria');
INSERT INTO `cargo` VALUES ('21', 'Regente');
INSERT INTO `cargo` VALUES ('22', 'Auxiliar Inicial');
INSERT INTO `cargo` VALUES ('23', 'Portero/a');

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
`id_empleado` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) DEFAULT NULL,
`apellido` varchar(255) DEFAULT NULL,
`cargo` int(11) NOT NULL,
PRIMARY KEY (`id_empleado`),
KEY `fk1` (`cargo`),
CONSTRAINT `fk1` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', 'Janet Camila', 'Rios Aguirre', '1');
INSERT INTO `empleado` VALUES ('2', 'Raymundo Epifanio', 'Carrizales Mamani', '2');
INSERT INTO `empleado` VALUES ('3', 'Magaly', 'Monrroy Teran', '3');
INSERT INTO `empleado` VALUES ('4', 'Mirian', 'Espinoza Acha', '4');
INSERT INTO `empleado` VALUES ('5', 'Maribel', 'Vargas Coñaca', '5');
INSERT INTO `empleado` VALUES ('6', 'Maria Laura', 'Mercado Montaño', '6');
INSERT INTO `empleado` VALUES ('7', 'Jaime', 'Morales Troncoso', '7');
INSERT INTO `empleado` VALUES ('8', 'Nelson', 'Trujillo Aguilar', '8');
INSERT INTO `empleado` VALUES ('9', 'Rosa Lucia', 'Calle Chuquimia', '9');
INSERT INTO `empleado` VALUES ('10', 'Dionisia', 'Mamani Molina', '10');
INSERT INTO `empleado` VALUES ('11', 'Victor', 'Camacho Vasquez', '11');
INSERT INTO `empleado` VALUES ('12', 'Cinthia Leonor', 'Ramirez Morales', '12');
INSERT INTO `empleado` VALUES ('13', 'Emiliano', 'Perales Medrano', '13');
INSERT INTO `empleado` VALUES ('14', 'Fabiana', 'Sanchez Padilla', '14');
INSERT INTO `empleado` VALUES ('15', 'Hilda', 'Torrico Mendoza', '15');
INSERT INTO `empleado` VALUES ('16', 'Norka', 'Calvimonte Antezana', '16');
INSERT INTO `empleado` VALUES ('17', 'Juan Carlos', 'Apaza Calizaya', '17');
INSERT INTO `empleado` VALUES ('18', 'Guido', 'Borda', '18');
INSERT INTO `empleado` VALUES ('19', 'Estela Zaida', 'Mamani Prieto', '18');
INSERT INTO `empleado` VALUES ('20', 'Edith', 'Intipampa Yupanqui', '19');
INSERT INTO `empleado` VALUES ('21', 'Alfonso', 'Ramos Ramirez', '19');
INSERT INTO `empleado` VALUES ('22', 'Erlan', 'Marca Vargas', '19');
INSERT INTO `empleado` VALUES ('23', 'Hilarion', 'Hidalgo', '19');
INSERT INTO `empleado` VALUES ('24', 'Janneth', 'Velasco Hinojosa', '20');
INSERT INTO `empleado` VALUES ('25', 'Jhanneth', 'Flores Reynaga', '21');
INSERT INTO `empleado` VALUES ('26', 'Lidia', 'Chulve Andrade', '22');
INSERT INTO `empleado` VALUES ('27', 'Justino', 'Paco Gomez', '23');

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
`id_empresa` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(255) NOT NULL,
PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES ('1', 'Unidad Educativa "Carlos Garibaldi"');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
`id_usuario` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) DEFAULT NULL,
`apellido` varchar(100) DEFAULT NULL,
`usuario` varchar(100) NOT NULL,
`password` varchar(255) NOT NULL,
PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'Janet Camila', 'Rios Aguirre', 'janet', 'janet');
INSERT INTO `usuario` VALUES ('2', 'Janneth', 'Velasco Hinojosa', 'janneth', '3538815');

-- ----------------------------
-- Table structure for asistencia
-- ----------------------------
DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
`id_asistencia` int(11) NOT NULL AUTO_INCREMENT,
`id_empleado` int(11) NOT NULL,
`entrada` datetime DEFAULT NULL,
`salida` datetime DEFAULT NULL,
PRIMARY KEY (`id_asistencia`),
KEY `fk2` (`id_empleado`),
CONSTRAINT `fk2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asistencia
-- ----------------------------
INSERT INTO `asistencia` VALUES ('1', '1', '2024-03-31 00:17:34', '2024-03-31 00:17:41');
INSERT INTO `asistencia` VALUES ('2', '6', '2024-03-31 00:22:53', '2024-03-31 00:23:04');
INSERT INTO `asistencia` VALUES ('3', '11', '2024-03-31 10:36:58', '2024-03-31 10:37:37');