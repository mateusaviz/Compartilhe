-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: rededecomp
-- ------------------------------------------------------
-- Server version	5.5.17

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
-- Current Database: `rededecomp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rededecomp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `rededecomp`;

--
-- Table structure for table `advertencias`
--

DROP TABLE IF EXISTS `advertencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertencias` (
  `idAdvertencias` int(11) NOT NULL AUTO_INCREMENT,
  `Advertencia` varchar(100) DEFAULT NULL,
  `TipoAdvertencia` varchar(45) DEFAULT NULL,
  `dth` datetime DEFAULT NULL,
  PRIMARY KEY (`idAdvertencias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertencias`
--

LOCK TABLES `advertencias` WRITE;
/*!40000 ALTER TABLE `advertencias` DISABLE KEYS */;
INSERT INTO `advertencias` VALUES (1,'Você esta ussando programas inadequados','nivel 2','2014-06-05 15:12:55');
/*!40000 ALTER TABLE `advertencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertencias_has_usuario`
--

DROP TABLE IF EXISTS `advertencias_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertencias_has_usuario` (
  `idAdvertencias` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idAdvertencias`,`idUsuario`),
  KEY `fk_Advertencias_has_Usuario_Usuario1` (`idUsuario`),
  KEY `fk_Advertencias_has_Usuario_Advertencias1` (`idAdvertencias`),
  CONSTRAINT `fk_Advertencias_has_Usuario_Advertencias1` FOREIGN KEY (`idAdvertencias`) REFERENCES `advertencias` (`idAdvertencias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Advertencias_has_Usuario_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertencias_has_usuario`
--

LOCK TABLES `advertencias_has_usuario` WRITE;
/*!40000 ALTER TABLE `advertencias_has_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertencias_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arquivo`
--

DROP TABLE IF EXISTS `arquivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivo` (
  `idArquivo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `infoarquivo` varchar(500) DEFAULT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idArquivo`),
  KEY `fk_Arquivo_Categoria1` (`idCategoria`),
  CONSTRAINT `fk_Arquivo_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivo`
--

LOCK TABLES `arquivo` WRITE;
/*!40000 ALTER TABLE `arquivo` DISABLE KEYS */;
INSERT INTO `arquivo` VALUES 
(1,'Equalizador Digital','Esse arquivo é um plugin para equalização, compativel com os softwares Cubase e Sonar.','WAVE','2014-05-26',4),
(2,'O Hobbit','Livro digital O Hobbit. O Hobbit conta a historia de Bilbo Bolseiro e suas aventuras.','J.R.R Tolkien','2014-04-23',6),
(3,'Nona Sinfonia','Música nona sinfonia de beethoven','Beethoven','2014-03-10',2);
/*!40000 ALTER TABLE `arquivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arquivo_has_usuario`
--

DROP TABLE IF EXISTS `arquivo_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivo_has_usuario` (
  `idArquivo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idArquivo`,`idUsuario`),
  KEY `fk_Arquivo_has_Usuario_Usuario1` (`idUsuario`),
  KEY `fk_Arquivo_has_Usuario_Arquivo1` (`idArquivo`),
  CONSTRAINT `fk_Arquivo_has_Usuario_Arquivo1` FOREIGN KEY (`idArquivo`) REFERENCES `arquivo` (`idArquivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Arquivo_has_Usuario_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivo_has_usuario`
--

LOCK TABLES `arquivo_has_usuario` WRITE;
/*!40000 ALTER TABLE `arquivo_has_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `arquivo_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `idAvaliação` int(11) NOT NULL AUTO_INCREMENT,
  `Notas` int(11) DEFAULT NULL,
  `Nivel` int(11) DEFAULT NULL,
  `Media` float DEFAULT NULL,
  `idArquivo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idAvaliação`),
  KEY `fk_Avaliação_Usuario1` (`idUsuario`),
  KEY `fk_Avaliação_Arquivo1` (`idArquivo`),
  CONSTRAINT `fk_Avaliação_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliação_Arquivo1` FOREIGN KEY (`idArquivo`) REFERENCES `arquivo` (`idArquivo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,9,2,9,1,1),(2,9,3,9,1,2);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Imagens'),(2,'Audios'),(3,'Videos'),(4,'Executaveis'),(5,'Jogos'),(6,'Arquivos de Texto'),(7,'Trabalhos Escolares'),(8,'Outros');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `idChat` int(11) NOT NULL AUTO_INCREMENT,
  `mensagem` varchar(1000) DEFAULT NULL,
  `dth` datetime DEFAULT NULL,
  `idUsuarioReceptor` int(11) DEFAULT NULL,
  `idUsuarioEmissor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idChat`),
  KEY `fk_Chat_Usuario1` (`idUsuarioEmissor`),
  KEY `fk_Chat_Usuario2` (`idUsuarioReceptor`),
  CONSTRAINT `fk_Chat_Usuario1` FOREIGN KEY (`idUsuarioEmissor`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Chat_Usuario2` FOREIGN KEY (`idUsuarioReceptor`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'oi','2014-05-26 14:26:05',1,2),(2,'oi','2014-05-26 14:28:01',2,1),(3,'tudo bem?','2014-05-26 14:29:31',1,2),(4,'tudo e com você?','2014-05-26 14:36:25',2,1),(5,'tubo bem também.','2014-05-26 14:40:08',1,2);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunidades`
--

DROP TABLE IF EXISTS `comunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comunidades` (
  `idComunidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `imagem` blob,
  `idCategoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idComunidade`),
  KEY `fk_Comunidades_Categoria1` (`idCategoria`),
  CONSTRAINT `fk_Comunidades_Categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidades`
--

LOCK TABLES `comunidades` WRITE;
/*!40000 ALTER TABLE `comunidades` DISABLE KEYS */;
INSERT INTO `comunidades` VALUES (3,'Mundo dos Games','Comunidade voltada para download de games','image.jpg',5),(4,'Musicas Classicas','Comunidade para adoradores da musica classica, ache aqui varias delas','image5.jpg',2);
/*!40000 ALTER TABLE `comunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracao`
--

DROP TABLE IF EXISTS `configuracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracao` (
  `idConfiguracao` int(11) NOT NULL AUTO_INCREMENT,
  `senha` varchar(15) DEFAULT NULL,
  `novasenha` varchar(15) DEFAULT NULL,
  `compinfo` tinyint(1) DEFAULT NULL,
  `comparquivo` tinyint(1) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idConfiguracao`),
  KEY `fk_Configuração_Usuario1` (`idUsuario`),
  CONSTRAINT `fk_Configuração_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracao`
--

LOCK TABLES `configuracao` WRITE;
/*!40000 ALTER TABLE `configuracao` DISABLE KEYS */;
INSERT INTO `configuracao` VALUES (1,'1234','235541',0,0,1),(2,NULL,NULL,1,1,2),(3,NULL,NULL,0,1,3);
/*!40000 ALTER TABLE `configuracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `idLogin` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(36) DEFAULT NULL,
  `senha` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idLogin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'mateusde_aviz@hotmail.com','1234'),(2,'ronaldo56@gmail.com','6324'),(3,'Carl_osS1lva@yahoo.com','4548456');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `emprego` varchar(45) DEFAULT NULL,
  `estudo` varchar(60) DEFAULT NULL,
  `interese` varchar(100) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `imagem` varchar(45) DEFAULT NULL,
  `idLogin` int(11) NOT NULL,
  `idUsuario2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_Login1` (`idLogin`),
  KEY `fk_Usuario_Usuario1` (`idUsuario2`),
  CONSTRAINT `fk_Usuario_Login1` FOREIGN KEY (`idLogin`) REFERENCES `login` (`idLogin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Usuario1` FOREIGN KEY (`idUsuario2`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Mateus de Aviz','M','Desempregado','Ensino Médio Incompleto','Download de softwares gratuitos de edição de audio','Olá internet =D','image.png',1,NULL),(2,'Ronaldo Costa','M','Engenheiro Químico','Faculdade de Engenharia Química','Download de arquivos para estudo','Bem vindo ao meu perfil','image.jpg',2,NULL),(3,'Maria Aparecida','F','Diarista','Ensino Fundamental Completo','Download de músicas','Este é meu perfil','imagme.jpg',3,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_comunidades`
--

DROP TABLE IF EXISTS `usuario_has_comunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_has_comunidades` (
  `idUsuario` int(11) NOT NULL,
  `idComunidade` int(11) NOT NULL,
  PRIMARY KEY (`idComunidade`,`idUsuario`),
  KEY `fk_Usuario_has_Comunidades_Comunidades1` (`idComunidade`),
  KEY `fk_Usuario_has_Comunidades_Usuario1` (`idUsuario`),
  CONSTRAINT `fk_Usuario_has_Comunidades_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Comunidades_Comunidades1` FOREIGN KEY (`idComunidade`) REFERENCES `comunidades` (`idComunidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_comunidades`
--

LOCK TABLES `usuario_has_comunidades` WRITE;
/*!40000 ALTER TABLE `usuario_has_comunidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_comunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_usuario`
--

DROP TABLE IF EXISTS `usuario_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_has_usuario` (
  `idUsuario` int(11) NOT NULL,
  `idAmigo` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idAmigo`),
  KEY `fk_Usuario_has_Usuario_Usuario2` (`idAmigo`),
  KEY `fk_Usuario_has_Usuario_Usuario1` (`idUsuario`),
  CONSTRAINT `fk_Usuario_has_Usuario_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Usuario_Usuario2` FOREIGN KEY (`idAmigo`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_usuario`
--

LOCK TABLES `usuario_has_usuario` WRITE;
/*!40000 ALTER TABLE `usuario_has_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-26 17:03:47