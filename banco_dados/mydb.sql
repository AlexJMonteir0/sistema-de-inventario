-- MySQL Script generated by MySQL Workbench
-- Tue May 21 16:28:03 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cadastro_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cadastro_usuario` (
  `idcadastro_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NULL,
  `matricula` VARCHAR(50) NULL,
  `sala_departamento` VARCHAR(50) NULL,
  `patrimonio` VARCHAR(50) NULL,
  `user` VARCHAR(50) NOT NULL,
  `nivel_acesso` ENUM('gestor_administrativor', 'administrador', 'geral') NOT NULL,
  PRIMARY KEY (`idcadastro_usuario`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`login_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`login_usuario` (
  `idlogin_usuario` INT NOT NULL AUTO_INCREMENT,
  `senha` VARCHAR(50) NULL,
  `usuario` VARCHAR(50) NULL,
  `idcadastro_usuario` INT NOT NULL,
  PRIMARY KEY (`idlogin_usuario`),
  INDEX `fk_login_usuario_cadastro_usuario1_idx` (`idcadastro_usuario` ASC),
  CONSTRAINT `fk_login_usuario_cadastro_usuario1`
    FOREIGN KEY (`idcadastro_usuario`)
    REFERENCES `mydb`.`cadastro_usuario` (`idcadastro_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`monitor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`monitor` (
  `idequimentos` INT NOT NULL AUTO_INCREMENT,
  `marca e modelo` VARCHAR(100) NOT NULL,
  `tamanho da tela` VARCHAR(50) NOT NULL,
  `resolucao` VARCHAR(50) NOT NULL,
  `taxa de atualização` VARCHAR(50) NOT NULL,
  `patrimonio` INT NOT NULL,
  `dataEntrada` DATETIME NOT NULL,
  `dataSaida` DATETIME NOT NULL,
  `obs` VARCHAR(50) NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idequimentos`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`computador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`computador` (
  `idequimentos` INT NOT NULL AUTO_INCREMENT,
  `marca e modelo` VARCHAR(100) NOT NULL,
  ` data_entrada` DATETIME NOT NULL,
  `data_saida` DATETIME NOT NULL,
  `patrimonio` INT NOT NULL,
  `status_equipamento` VARCHAR(100) NOT NULL,
  `historico_equipamentos` VARCHAR(100) NOT NULL,
  `obs_equipamento` VARCHAR(100) NOT NULL,
  `processador` VARCHAR(50) NOT NULL,
  `memória RAM` VARCHAR(50) NOT NULL,
  `armazenamento` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idequimentos`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`equipamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`equipamentos` (
  `idequipamentos` INT NOT NULL AUTO_INCREMENT,
  `nome_equipamento` VARCHAR(50) NOT NULL,
  `idclasses` INT NOT NULL,
  `monitor_idequimentos` INT NOT NULL,
  `computador_idequimentos` INT NOT NULL,
  PRIMARY KEY (`idequipamentos`),
  INDEX `fk_equipamentos_monitor1_idx` (`monitor_idequimentos` ASC),
  INDEX `fk_equipamentos_computador1_idx` (`computador_idequimentos` ASC),
  CONSTRAINT `fk_equipamentos_monitor1`
    FOREIGN KEY (`monitor_idequimentos`)
    REFERENCES `mydb`.`monitor` (`idequimentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipamentos_computador1`
    FOREIGN KEY (`computador_idequimentos`)
    REFERENCES `mydb`.`computador` (`idequimentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`periferico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`periferico` (
  `idPeriferico` INT NOT NULL AUTO_INCREMENT,
  `nome_equipamento` VARCHAR(50) NOT NULL,
  `idclasses` INT NOT NULL,
  `Informacoes_Periférico` INT NOT NULL,
  `Localização_Localização_Origem_Periférico` INT NOT NULL,
  `Localização_Localização_Destino_Periférico` INT NOT NULL,
  `tipo_periférico` INT NOT NULL,
  PRIMARY KEY (`idPeriferico`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`classes` (
  `idclasses` INT NOT NULL AUTO_INCREMENT,
  `equipamentos` INT NOT NULL,
  `perifericos` INT NOT NULL,
  `idmaquina` VARCHAR(45) NOT NULL,
  `perifericos_idperifericos` INT NOT NULL,
  `equimentos_cabos` INT NOT NULL,
  `equipamentos_idequipamentos` INT NOT NULL,
  `periferico_idPeriferico` INT NOT NULL,
  `login_usuario_idlogin_usuario` INT NOT NULL,
  PRIMARY KEY (`idclasses`, `equipamentos`, `perifericos`, `login_usuario_idlogin_usuario`),
  INDEX `fk_classes_equipamentos1_idx` (`equipamentos_idequipamentos` ASC),
  INDEX `fk_classes_periferico1_idx` (`periferico_idPeriferico` ASC),
  INDEX `fk_classes_login_usuario1_idx` (`login_usuario_idlogin_usuario` ASC),
  CONSTRAINT `fk_classes_equipamentos1`
    FOREIGN KEY (`equipamentos_idequipamentos`)
    REFERENCES `mydb`.`equipamentos` (`idequipamentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classes_periferico1`
    FOREIGN KEY (`periferico_idPeriferico`)
    REFERENCES `mydb`.`periferico` (`idPeriferico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_classes_login_usuario1`
    FOREIGN KEY (`login_usuario_idlogin_usuario`)
    REFERENCES `mydb`.`login_usuario` (`idlogin_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`entrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`entrada` (
  `tipo_periferico_entrada` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `num_patrimonio` INT NULL,
  `data` DATETIME NULL,
  `estoque_idestoque` INT NULL,
  `quantidade` INT NULL,
  `marca` VARCHAR(50) NOT NULL,
  `destino` VARCHAR(50) NOT NULL,
  `responsável` VARCHAR(50) NOT NULL,
  `periferico_idPeriferico` INT NOT NULL,
  PRIMARY KEY (`tipo_periferico_entrada`),
  INDEX `fk_entrada_periferico1_idx` (`periferico_idPeriferico` ASC),
  CONSTRAINT `fk_entrada_periferico1`
    FOREIGN KEY (`periferico_idPeriferico`)
    REFERENCES `mydb`.`periferico` (`idPeriferico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`saida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`saida` (
  `tipo_periferico_saida` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `num_patrimonio` INT NULL,
  `data` DATETIME NULL,
  `estoque_idestoque` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `marca` VARCHAR(50) NOT NULL,
  `destino` VARCHAR(50) NOT NULL,
  `responsavel` VARCHAR(50) NOT NULL,
  `periferico_idPeriferico` INT NOT NULL,
  PRIMARY KEY (`tipo_periferico_saida`),
  INDEX `fk_saida_periferico1_idx` (`periferico_idPeriferico` ASC),
  CONSTRAINT `fk_saida_periferico1`
    FOREIGN KEY (`periferico_idPeriferico`)
    REFERENCES `mydb`.`periferico` (`idPeriferico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`entrada_saida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`entrada_saida` (
  `tipo_periferico_entrada_saida` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `num_patrimonio` INT NULL,
  `data` DATETIME NULL,
  `estoque_idestoque` INT NULL,
  `quantidade` INT NULL,
  `periferico_idPeriferico` INT NOT NULL,
  PRIMARY KEY (`tipo_periferico_entrada_saida`),
  INDEX `fk_entrada_saida_periferico1_idx` (`periferico_idPeriferico` ASC),
  CONSTRAINT `fk_entrada_saida_periferico1`
    FOREIGN KEY (`periferico_idPeriferico`)
    REFERENCES `mydb`.`periferico` (`idPeriferico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


