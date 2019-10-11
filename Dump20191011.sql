-- MariaDB dump 10.17  Distrib 10.4.6-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: cursos_transporte
-- ------------------------------------------------------
-- Server version	10.4.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `numPuestos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Mecánico',3),(2,'Conductor',5),(3,'Servicio al cliente',2),(4,'Contador',1),(5,'Secretario',4),(6,'Vigilante',2);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos_curso`
--

DROP TABLE IF EXISTS `cargos_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos_curso` (
  `idCurso` int(11) NOT NULL,
  `idCargo` int(11) NOT NULL,
  PRIMARY KEY (`idCurso`,`idCargo`),
  KEY `idCargo` (`idCargo`),
  CONSTRAINT `cargos_curso_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`id`),
  CONSTRAINT `cargos_curso_ibfk_2` FOREIGN KEY (`idCargo`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos_curso`
--

LOCK TABLES `cargos_curso` WRITE;
/*!40000 ALTER TABLE `cargos_curso` DISABLE KEYS */;
INSERT INTO `cargos_curso` VALUES (1,2),(2,2),(3,4),(3,5),(4,1),(5,2),(6,4),(7,6),(8,3),(9,1);
/*!40000 ALTER TABLE `cargos_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `tipo` varchar(64) NOT NULL,
  `idTutor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idTutor` (`idTutor`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`idTutor`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Carreteras','Cerrado',1),(2,'Conducción','Abierto',2),(3,'Administración','Abierto',3),(4,'Mecanica','Abierta',4),(5,'Vechiculos','Abierto',5),(6,'Contaduría','Abierto',6),(7,'Vigilancia','Abierto',7),(8,'Servicio al cliente','Abierto',8),(9,'Mecanica Avanzada','Cerrado',4);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_curso`
--

DROP TABLE IF EXISTS `empleado_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado_curso` (
  `idEmpleado` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `nota` double DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`,`idCurso`),
  KEY `idCurso` (`idCurso`),
  CONSTRAINT `empleado_curso_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`id`) ON DELETE CASCADE,
  CONSTRAINT `empleado_curso_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_curso`
--

LOCK TABLES `empleado_curso` WRITE;
/*!40000 ALTER TABLE `empleado_curso` DISABLE KEYS */;
INSERT INTO `empleado_curso` VALUES (1,1,'2009-09-13','2009-11-14',3.6),(2,1,'2010-03-04','2010-03-03',5),(2,2,'2013-03-01','2013-05-01',4),(2,4,'2019-10-09','2019-11-09',NULL),(3,3,'2015-03-16','2015-05-01',4.5),(4,4,'2017-05-01','2017-05-31',4.5),(5,5,'2001-01-01','2001-02-01',5),(6,6,'2003-12-01','2004-01-13',3.5),(7,6,'2019-04-20','2019-05-25',3.3),(7,7,'2017-09-09','2017-10-09',3.9),(8,8,'2019-10-10','2019-11-10',4.2),(9,9,'2010-03-04','2010-04-05',4.5);
/*!40000 ALTER TABLE `empleado_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(64) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `titulo` varchar(64) NOT NULL,
  `idCargo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCargo` (`idCargo`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idCargo`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Pedro','Ramírez','2000-01-01','Dr. Ingeniería Eléctrica',2),(2,'Steven','Agudelo','1998-05-03',' Dr. Ingeniero en sistemas',2),(3,'Paulina','Villa','1980-01-01','Astrónoma',3),(4,'Bryk','Torres','1998-01-03','Ingeniero nuclear',1),(5,'Maria','Pilar','1996-05-23','Primaria',2),(6,'Salomon','Arredondo','1980-03-01','Bachiller',4),(7,'Carlos','Valencia','2000-08-20','Bachiller',6),(8,'Elquin','Tico','1960-02-03','Tecnico del Sena',3),(9,'Elon','Musk','1990-03-03','Tecnico',1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerrequisito_curso`
--

DROP TABLE IF EXISTS `prerrequisito_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prerrequisito_curso` (
  `idCurso` int(11) DEFAULT NULL,
  `idCursoPrerrequisito` int(11) DEFAULT NULL,
  `idCargo` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `idCursoPrerrequisito` (`idCursoPrerrequisito`),
  KEY `idCargo` (`idCargo`),
  KEY `prerrequisito_curso_ibfk_1` (`idCurso`),
  CONSTRAINT `prerrequisito_curso_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`id`),
  CONSTRAINT `prerrequisito_curso_ibfk_2` FOREIGN KEY (`idCursoPrerrequisito`) REFERENCES `cursos` (`id`),
  CONSTRAINT `prerrequisito_curso_ibfk_3` FOREIGN KEY (`idCargo`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerrequisito_curso`
--

LOCK TABLES `prerrequisito_curso` WRITE;
/*!40000 ALTER TABLE `prerrequisito_curso` DISABLE KEYS */;
INSERT INTO `prerrequisito_curso` VALUES (1,2,2,1),(4,5,NULL,2),(2,5,NULL,4),(3,NULL,NULL,5),(5,NULL,NULL,6),(6,NULL,NULL,7),(7,NULL,NULL,8),(8,NULL,NULL,9),(9,4,1,10);
/*!40000 ALTER TABLE `prerrequisito_curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-11  0:29:39
