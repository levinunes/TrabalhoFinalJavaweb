-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.32-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6226
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para tjwclientes
CREATE DATABASE IF NOT EXISTS `tjwclientes` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tjwclientes`;

-- Copiando estrutura para tabela tjwclientes.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `dtnascimento` date DEFAULT NULL,
  `nome` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tjwclientes.cliente: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idcliente`, `dtnascimento`, `nome`) VALUES
	(1, '1998-10-12', 'João das Neves');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela tjwclientes.cliente_endereco
CREATE TABLE IF NOT EXISTS `cliente_endereco` (
  `cliente_idcliente` int(11) NOT NULL,
  `endereco_idendereco` int(11) NOT NULL,
  KEY `FKendk7667vom5bsco9nremjtip` (`endereco_idendereco`),
  KEY `FKjpydlk02pyisdyntmlj9uhk1g` (`cliente_idcliente`),
  CONSTRAINT `FKendk7667vom5bsco9nremjtip` FOREIGN KEY (`endereco_idendereco`) REFERENCES `endereco` (`idendereco`),
  CONSTRAINT `FKjpydlk02pyisdyntmlj9uhk1g` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tjwclientes.cliente_endereco: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente_endereco` DISABLE KEYS */;
INSERT INTO `cliente_endereco` (`cliente_idcliente`, `endereco_idendereco`) VALUES
	(1, 1),
	(1, 2);
/*!40000 ALTER TABLE `cliente_endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela tjwclientes.documentos
CREATE TABLE IF NOT EXISTS `documentos` (
  `cliente_idcliente` int(11) NOT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cliente_idcliente`),
  CONSTRAINT `FKc36o2jkq23lregm7m96ajodj` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tjwclientes.documentos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;

-- Copiando estrutura para tabela tjwclientes.endereco
CREATE TABLE IF NOT EXISTS `endereco` (
  `idendereco` int(11) NOT NULL AUTO_INCREMENT,
  `CEP` varchar(8) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `enderecocol` varchar(45) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `logradouro` varchar(80) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idendereco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tjwclientes.endereco: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`idendereco`, `CEP`, `cidade`, `enderecocol`, `estado`, `logradouro`, `numero`) VALUES
	(1, '60015290', 'Fortaleza', '-', 'Ceará', 'Av. Carapinima', '2200'),
	(2, '60160230', 'Fortaleza', '-', 'Ceará', 'Avenida Dom Luís', '500');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela tjwclientes.telefone
CREATE TABLE IF NOT EXISTS `telefone` (
  `idtelefone` int(11) NOT NULL AUTO_INCREMENT,
  `telefone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idtelefone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tjwclientes.telefone: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` (`idtelefone`, `telefone`) VALUES
	(1, '8534581212');
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;

-- Copiando estrutura para tabela tjwclientes.telefone_dos_clientes
CREATE TABLE IF NOT EXISTS `telefone_dos_clientes` (
  `id_do_cliente` int(11) NOT NULL,
  `id_do_telefone` int(11) NOT NULL,
  KEY `FKstjhjefcrev1v16g1wag53he7` (`id_do_telefone`),
  KEY `FK9x4t0jvmtnxobiena3lc4gr39` (`id_do_cliente`),
  CONSTRAINT `FK9x4t0jvmtnxobiena3lc4gr39` FOREIGN KEY (`id_do_cliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `FKstjhjefcrev1v16g1wag53he7` FOREIGN KEY (`id_do_telefone`) REFERENCES `telefone` (`idtelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela tjwclientes.telefone_dos_clientes: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `telefone_dos_clientes` DISABLE KEYS */;
INSERT INTO `telefone_dos_clientes` (`id_do_cliente`, `id_do_telefone`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `telefone_dos_clientes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
