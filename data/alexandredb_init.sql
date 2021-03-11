/* SQL Manager Lite for MySQL                              5.8.0.53936 */
/* ------------------------------------------------------------------- */
/* Host     : localhost                                                */
/* Port     : 3306                                                     */
/* Database : alexandredb                                              */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'utf8mb4' */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `alexandredb`;

CREATE DATABASE `alexandredb`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `alexandredb`;

/* Dropping database objects */

DROP FUNCTION IF EXISTS `get_sequencial`;
DROP TABLE IF EXISTS `sequenciais`;
DROP TABLE IF EXISTS `pedidos_item`;
DROP TABLE IF EXISTS `produtos`;
DROP TABLE IF EXISTS `pedidos`;
DROP TABLE IF EXISTS `clientes`;
DROP TABLE IF EXISTS `estados`;

/* Structure for the `estados` table : */

CREATE TABLE `estados` (
  `est_sigla` CHAR(2) COLLATE utf8_general_ci NOT NULL,
  `est_estado` VARCHAR(100) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY USING BTREE (`est_sigla`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `clientes` table : */

CREATE TABLE `clientes` (
  `cli_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `cli_nome` VARCHAR(100) COLLATE utf8_general_ci NOT NULL,
  `cli_cidade` VARCHAR(100) COLLATE utf8_general_ci NOT NULL,
  `cli_estado` CHAR(2) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY USING BTREE (`cli_id`),
  KEY `fk_est_cli` USING BTREE (`cli_estado`),
  CONSTRAINT `fk_est_cli` FOREIGN KEY (`cli_estado`) REFERENCES `estados` (`est_sigla`)
) ENGINE=InnoDB
AUTO_INCREMENT=23 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `pedidos` table : */

CREATE TABLE `pedidos` (
  `ped_id` INTEGER(11) NOT NULL,
  `ped_emissao` DATE NOT NULL,
  `ped_cliente` INTEGER(11) NOT NULL,
  `ped_valortotal` FLOAT NOT NULL DEFAULT 0,
  `ped_efetivado` CHAR(1) COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY USING BTREE (`ped_id`),
  KEY `idx_cli001` USING BTREE (`ped_cliente`),
  CONSTRAINT `fk_cli_ped` FOREIGN KEY (`ped_cliente`) REFERENCES `clientes` (`cli_id`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `produtos` table : */

CREATE TABLE `produtos` (
  `pro_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `pro_descricao` VARCHAR(100) COLLATE utf8_general_ci NOT NULL,
  `pro_valorvenda` FLOAT NOT NULL,
  PRIMARY KEY USING BTREE (`pro_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=21 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `pedidos_item` table : */

CREATE TABLE `pedidos_item` (
  `pit_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `pit_seq` INTEGER(11) NOT NULL,
  `pit_pedido` INTEGER(11) NOT NULL,
  `pit_produto` INTEGER(11) NOT NULL,
  `pit_quantidade` INTEGER(11) NOT NULL,
  `pit_valorunitario` FLOAT NOT NULL,
  `pit_valortotal` FLOAT NOT NULL,
  PRIMARY KEY USING BTREE (`pit_id`),
  KEY `fk_pro_pit` USING BTREE (`pit_produto`),
  KEY `fk_ped_pit` USING BTREE (`pit_pedido`),
  CONSTRAINT `fk_ped_pit` FOREIGN KEY (`pit_pedido`) REFERENCES `pedidos` (`ped_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pro_pit` FOREIGN KEY (`pit_produto`) REFERENCES `produtos` (`pro_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=6 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Structure for the `sequenciais` table : */

CREATE TABLE `sequenciais` (
  `seq_tabela` VARCHAR(50) COLLATE utf8_general_ci NOT NULL,
  `seq_valor` INTEGER(11) NOT NULL,
  PRIMARY KEY USING BTREE (`seq_tabela`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

/* Definition for the `get_sequencial` function : */

DELIMITER $$

CREATE DEFINER = 'root'@'localhost' FUNCTION `get_sequencial`(
        `tabela` VARCHAR(50)
    )
    RETURNS TINYINT(4)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  DECLARE _proximovalor INTEGER;

  SELECT seq_valor INTO _proximovalor FROM `sequenciais` seq WHERE seq_tabela = tabela;

  IF COALESCE(_proximovalor, 0) = 0 THEN
  	INSERT INTO `sequenciais` SELECT tabela, 1;
    RETURN 1;
  ELSE
	UPDATE `sequenciais` SET seq_valor = _proximovalor + 1 WHERE seq_tabela = tabela;
    RETURN _proximovalor + 1;
  END IF;
END$$

DELIMITER ;

/* Data for the `estados` table  (LIMIT 0,500) */

INSERT INTO `estados` (`est_sigla`, `est_estado`) VALUES
  ('PR','Paraná'),
  ('SC','Santa Catarina'),
  ('SP','São Paulo');
COMMIT;

/* Data for the `clientes` table  (LIMIT 0,500) */

INSERT INTO `clientes` (`cli_id`, `cli_nome`, `cli_cidade`, `cli_estado`) VALUES
  (1,'Alexandre','Curitiba','PR'),
  (2,'Muriel','Curitiba','PR'),
  (3,'Meg','Curitiba','PR'),
  (4,'Rogério','São Paulo','SP'),
  (5,'Antonio','Curitiba','PR'),
  (6,'Ana','Curitiba','PR'),
  (7,'Thiago','São Paulo','SP'),
  (8,'Bruno','São Paulo','SP'),
  (9,'Pablo','São Paulo','SP'),
  (10,'Cristina','Curitiba','PR'),
  (11,'José','Garuva','SC'),
  (12,'Sérgio','Curitiba','PR'),
  (13,'Lucélia','Curitiba','PR'),
  (14,'Cynthia','Curitiba','PR'),
  (15,'Ricardo','Curitiba','PR'),
  (16,'Jair','Curitiba','PR'),
  (17,'Mariano','Curitiba','PR'),
  (18,'Benja','São Paulo','SP'),
  (19,'Marcelo','Curitiba','PR'),
  (20,'Douglas','Curitiba','PR'),
  (21,'Laura','Curitiba','PR'),
  (22,'Luana','Joinville','SC');
COMMIT;

/* Data for the `produtos` table  (LIMIT 0,500) */

INSERT INTO `produtos` (`pro_id`, `pro_descricao`, `pro_valorvenda`) VALUES
  (1,'Caneta azul',5),
  (2,'Lapis',3),
  (3,'Régua',2.5),
  (4,'Caneta vermelha',5),
  (5,'Caneta preta',5),
  (6,'Apontador',0.5),
  (7,'Massa de modelar',10),
  (8,'Borracha',1),
  (9,'Penal',12),
  (10,'Livro de matemática',18),
  (11,'Livro de química',17),
  (12,'Livro de física',19),
  (13,'Caderno de caligrafia',10),
  (14,'Caderno de matemática',10.5),
  (15,'Mochila',25),
  (16,'Grafite 0.5',2.3),
  (17,'Grafite 0.7',2.4),
  (18,'Lapiseira',7.5),
  (19,'Post-it',3.9),
  (20,'Caneta marca texto',4.5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;