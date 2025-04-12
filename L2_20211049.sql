CREATE DATABASE IF NOT EXISTS l2_20211049;
USE l2_20211049;

-- CREACIÓN DE TABLAS

DROP TABLE IF EXISTS `renta_auto`;
DROP TABLE IF EXISTS `credenciales_usuario`;
DROP TABLE IF EXISTS `auto`;
DROP TABLE IF EXISTS `seguro`;
DROP TABLE IF EXISTS `usuario`;
DROP TABLE IF EXISTS `sede`;

CREATE TABLE `sede` (
  `idsede` int NOT NULL AUTO_INCREMENT,
  `distrito` varchar(45) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  PRIMARY KEY (`idsede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `seguro` (
  `idseguro` int NOT NULL AUTO_INCREMENT,
  `empresa_aseguradora` varchar(45) NOT NULL,
  `cobertura_maxima` double NOT NULL,
  `tarifa` double NOT NULL,
  PRIMARY KEY (`idseguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `auto` (
  `idauto` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `kilometraje` int NOT NULL,
  `sede_idsede` int NOT NULL,
  `costo_por_dia` double NOT NULL,
  PRIMARY KEY (`idauto`),
  KEY `fk_auto_sede1_idx` (`sede_idsede`),
  CONSTRAINT `fk_auto_sede1` FOREIGN KEY (`sede_idsede`) REFERENCES `sede` (`idsede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `credenciales_usuario` (
  `idusuario` int NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contraseña_encriptada` varchar(64) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_credenciales_usuario_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_credenciales_usuario_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `renta_auto` (
  `id_renta` int NOT NULL AUTO_INCREMENT,
  `auto_idauto` int NOT NULL,
  `usuario_idusuario` int NOT NULL,
  `seguro_idseguro` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `cancelada` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_renta`),
  KEY `fk_renta_auto_seguro1_idx` (`seguro_idseguro`),
  KEY `fk_renta_auto_usuario1_idx` (`usuario_idusuario`),
  KEY `fk_renta_auto_auto1_idx` (`auto_idauto`),
  CONSTRAINT `fk_renta_auto_auto1` FOREIGN KEY (`auto_idauto`) REFERENCES `auto` (`idauto`),
  CONSTRAINT `fk_renta_auto_seguro1` FOREIGN KEY (`seguro_idseguro`) REFERENCES `seguro` (`idseguro`),
  CONSTRAINT `fk_renta_auto_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INSERCIÓN DE DATOS

INSERT INTO `sede` VALUES
(1,'San Isidro','Calle Las Begonias 450'),
(2,'Pueblo Libre','Av. Sucre 311'),
(3,'Jesús María','Av. General Garzón 1518'),
(4,'San Martín de Porres','Av. Perú 2950'),
(5,'Santa Anita','Av. De La Cultura 702');

INSERT INTO `usuario` VALUES
(1,'Carlos','Minaya',999999999),
(2,'Rodrigo','Ruiz',988888888),
(3,'Hiroshi','Giotoku',977777777),
(4,'Julio','Carrión',966666666),
(5,'Stephano','Roldán',955555555),
(6,'Alonso','Guevara',944444444);

INSERT INTO `seguro` VALUES
(1,'Pacífico',1000000,200),
(2,'Rímac',500000,100),
(3,'Interseguro',200000,50),
(4,'La Positiva',100000,10);

INSERT INTO `auto` VALUES
(1,'kia sorento','rojo',0,5,500),
(2,'kia sorento','turquesa',50,4,400),
(3,'kia sorento','negro',100,3,300),
(4,'hyundai i11','rojo',0,2,200),
(5,'hyundai i11','turquesa',50,1,150),
(6,'hyundai i11','negro',100,1,100),
(7,'bmw','rojo',0,2,2000),
(8,'bmw','turquesa',50,3,1500),
(9,'bmw','negro',100,4,1000),
(10,'kia picanto','rojo',0,5,300),
(11,'kia picanto','turquesa',50,2,200),
(12,'kia picanto','negro',100,2,100);

INSERT INTO `credenciales_usuario` VALUES
(1,'c.minaya@pucp.pe','31b4cbb325bac6984216819d263053847b03d0872b272e947ed0afbf133924b2'),
(2,'r.ruiz@pucp.pe','7fac0d0407d163311247ad4e99c8a02cda51b32a7d544507e1e4873c7e1befaf'),
(3,'h.giotoku@pucp.pe','4e3985c86dba30c06b810a18adb0eca94cefafbb8e855c7bb45268aae42562a5'),
(4,'j.carrion@pucp.pe','6c08f849fd94bb57718a6765e17c0592d340d6dcaacdcde659c2247af3be078a'),
(5,'s.roldan@pucp.pe','f418a82cecd0b94f3dd8e2aad8fb69aeb1f420698b620f3c5c2f8969eaff2f19'),
(6,'a.guevara@pucp.pe','6518e9213ceebb754023091cda1356a7c74ebd76eeb69bb0a9e317301b179b12');

INSERT INTO `renta_auto` VALUES
(1,1,1,1,'2024-06-17','2024-06-24',1),
(2,2,1,1,'2024-06-10','2024-06-11',0),
(3,3,1,4,'2024-06-05','2024-06-08',0),
(4,4,2,3,'2024-06-04','2024-06-05',0),
(5,5,2,3,'2024-06-03','2024-06-04',1),
(6,6,3,2,'2024-06-01','2024-06-02',0);
