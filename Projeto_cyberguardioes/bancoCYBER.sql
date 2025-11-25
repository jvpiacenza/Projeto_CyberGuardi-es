-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para banco_projeto
DROP DATABASE IF EXISTS `banco_projeto`;
CREATE DATABASE IF NOT EXISTS `banco_projeto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `banco_projeto`;

-- Copiando estrutura para tabela banco_projeto.fale_conosco
DROP TABLE IF EXISTS `fale_conosco`;
CREATE TABLE IF NOT EXISTS `fale_conosco` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `assunto` varchar(50) NOT NULL,
  `mensagem` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `data` date NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.fale_conosco: ~1 rows (aproximadamente)
DELETE FROM `fale_conosco`;
INSERT INTO `fale_conosco` (`ID`, `nome`, `email`, `telefone`, `assunto`, `mensagem`, `status`, `data`) VALUES
	(2, 'João Victor Piacenza', 'joaovp@gmail.com', '', 'Algo', 'Dizer algo', 'Aguardando leitura', '2025-11-18');

-- Copiando estrutura para tabela banco_projeto.login_intranet
DROP TABLE IF EXISTS `login_intranet`;
CREATE TABLE IF NOT EXISTS `login_intranet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL,
  `senha` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.login_intranet: ~2 rows (aproximadamente)
DELETE FROM `login_intranet`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
