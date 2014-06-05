SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `rededecomp` DEFAULT CHARACTER SET latin1 ;
USE `rededecomp` ;

-- -----------------------------------------------------
-- Table `rededecomp`.`advertencias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`advertencias` (
  `idAdvertencias` INT(11) NOT NULL AUTO_INCREMENT ,
  `Advertencia` VARCHAR(100) NULL DEFAULT NULL ,
  `TipoAdvertencia` VARCHAR(45) NULL DEFAULT NULL ,
  `dth` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`idAdvertencias`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`login`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`login` (
  `idLogin` INT(11) NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(36) NULL DEFAULT NULL ,
  `senha` VARCHAR(15) NULL DEFAULT NULL ,
  PRIMARY KEY (`idLogin`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL DEFAULT NULL ,
  `sexo` VARCHAR(1) NULL DEFAULT NULL ,
  `emprego` VARCHAR(45) NULL DEFAULT NULL ,
  `estudo` VARCHAR(60) NULL DEFAULT NULL ,
  `interese` VARCHAR(100) NULL DEFAULT NULL ,
  `descricao` VARCHAR(250) NULL DEFAULT NULL ,
  `imagem` VARCHAR(45) NULL DEFAULT NULL ,
  `idLogin` INT(11) NOT NULL ,
  `idUsuario2` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`idUsuario`) ,
  INDEX `fk_Usuario_Login1` (`idLogin` ASC) ,
  INDEX `fk_Usuario_Usuario1` (`idUsuario2` ASC) ,
  CONSTRAINT `fk_Usuario_Login1`
    FOREIGN KEY (`idLogin` )
    REFERENCES `rededecomp`.`login` (`idLogin` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Usuario1`
    FOREIGN KEY (`idUsuario2` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`advertencias_has_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`advertencias_has_usuario` (
  `idAdvertencias` INT(11) NOT NULL ,
  `idUsuario` INT(11) NOT NULL ,
  PRIMARY KEY (`idAdvertencias`, `idUsuario`) ,
  INDEX `fk_Advertencias_has_Usuario_Usuario1` (`idUsuario` ASC) ,
  INDEX `fk_Advertencias_has_Usuario_Advertencias1` (`idAdvertencias` ASC) ,
  CONSTRAINT `fk_Advertencias_has_Usuario_Advertencias1`
    FOREIGN KEY (`idAdvertencias` )
    REFERENCES `rededecomp`.`advertencias` (`idAdvertencias` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Advertencias_has_Usuario_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`categoria` (
  `idCategoria` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`arquivo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`arquivo` (
  `idArquivo` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(50) NULL DEFAULT NULL ,
  `infoarquivo` TEXT NULL DEFAULT NULL ,
  `autor` VARCHAR(50) NULL DEFAULT NULL ,
  `data` DATE NULL DEFAULT NULL ,
  `idCategoria` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`idArquivo`) ,
  INDEX `fk_Arquivo_Categoria1` (`idCategoria` ASC) ,
  CONSTRAINT `fk_Arquivo_Categoria1`
    FOREIGN KEY (`idCategoria` )
    REFERENCES `rededecomp`.`categoria` (`idCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`arquivo_has_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`arquivo_has_usuario` (
  `idArquivo` INT(11) NOT NULL ,
  `idUsuario` INT(11) NOT NULL ,
  PRIMARY KEY (`idArquivo`, `idUsuario`) ,
  INDEX `fk_Arquivo_has_Usuario_Usuario1` (`idUsuario` ASC) ,
  INDEX `fk_Arquivo_has_Usuario_Arquivo1` (`idArquivo` ASC) ,
  CONSTRAINT `fk_Arquivo_has_Usuario_Arquivo1`
    FOREIGN KEY (`idArquivo` )
    REFERENCES `rededecomp`.`arquivo` (`idArquivo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Arquivo_has_Usuario_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`avaliacao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`avaliacao` (
  `idAvaliação` INT(11) NOT NULL AUTO_INCREMENT ,
  `Notas` INT(11) NULL DEFAULT NULL ,
  `Nivel` INT(11) NULL DEFAULT NULL ,
  `Media` FLOAT NULL DEFAULT NULL ,
  `idArquivo` INT(11) NOT NULL ,
  `idUsuario` INT(11) NOT NULL ,
  PRIMARY KEY (`idAvaliação`) ,
  INDEX `fk_Avaliação_Usuario1` (`idUsuario` ASC) ,
  INDEX `fk_Avaliação_Arquivo1` (`idArquivo` ASC) ,
  CONSTRAINT `fk_Avaliação_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliação_Arquivo1`
    FOREIGN KEY (`idArquivo` )
    REFERENCES `rededecomp`.`arquivo` (`idArquivo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`chat`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`chat` (
  `idChat` INT(11) NOT NULL AUTO_INCREMENT ,
  `mensagem` VARCHAR(1000) NULL DEFAULT NULL ,
  `dth` DATETIME NULL DEFAULT NULL ,
  `idUsuarioReceptor` INT(11) NULL DEFAULT NULL ,
  `idUsuarioEmissor` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`idChat`) ,
  INDEX `fk_Chat_Usuario1` (`idUsuarioEmissor` ASC) ,
  INDEX `fk_Chat_Usuario2` (`idUsuarioReceptor` ASC) ,
  CONSTRAINT `fk_Chat_Usuario1`
    FOREIGN KEY (`idUsuarioEmissor` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Chat_Usuario2`
    FOREIGN KEY (`idUsuarioReceptor` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`postagens`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`postagens` (
  `idpostagens` INT NOT NULL AUTO_INCREMENT ,
  `texto` TEXT NULL ,
  `idUsuario` INT(11) NOT NULL ,
  `dtPost` DATETIME NULL ,
  `dtAtualiza` DATETIME NULL ,
  `assunto` VARCHAR(45) NULL ,
  PRIMARY KEY (`idpostagens`) ,
  INDEX `fk_postagens_usuario1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_postagens_usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rededecomp`.`comentarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`comentarios` (
  `idcomentarios` INT NOT NULL AUTO_INCREMENT ,
  `texto` TEXT NULL ,
  `idUsuario` INT(11) NOT NULL ,
  `dtComent` DATETIME NULL ,
  `dtAtualiza` DATETIME NULL ,
  `idpostagens` INT NOT NULL ,
  PRIMARY KEY (`idcomentarios`) ,
  INDEX `fk_comentarios_usuario1` (`idUsuario` ASC) ,
  INDEX `fk_comentarios_postagens1` (`idpostagens` ASC) ,
  CONSTRAINT `fk_comentarios_usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_postagens1`
    FOREIGN KEY (`idpostagens` )
    REFERENCES `rededecomp`.`postagens` (`idpostagens` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rededecomp`.`comunidades`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`comunidades` (
  `idComunidade` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL DEFAULT NULL ,
  `descricao` TEXT NULL DEFAULT NULL ,
  `imagem` BLOB NULL DEFAULT NULL ,
  `idCategoria` INT(11) NULL DEFAULT NULL ,
  `idcomentarios` INT NOT NULL ,
  `idpostagens` INT NOT NULL ,
  PRIMARY KEY (`idComunidade`) ,
  INDEX `fk_Comunidades_Categoria1` (`idCategoria` ASC) ,
  INDEX `fk_comunidades_comentarios1` (`idcomentarios` ASC) ,
  INDEX `fk_comunidades_postagens1` (`idpostagens` ASC) ,
  CONSTRAINT `fk_Comunidades_Categoria1`
    FOREIGN KEY (`idCategoria` )
    REFERENCES `rededecomp`.`categoria` (`idCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comunidades_comentarios1`
    FOREIGN KEY (`idcomentarios` )
    REFERENCES `rededecomp`.`comentarios` (`idcomentarios` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comunidades_postagens1`
    FOREIGN KEY (`idpostagens` )
    REFERENCES `rededecomp`.`postagens` (`idpostagens` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`configuracao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`configuracao` (
  `idConfiguracao` INT(11) NOT NULL AUTO_INCREMENT ,
  `senha` VARCHAR(15) NULL DEFAULT NULL ,
  `novasenha` VARCHAR(15) NULL DEFAULT NULL ,
  `compinfo` TINYINT(1) NULL DEFAULT NULL ,
  `comparquivo` TINYINT(1) NULL DEFAULT NULL ,
  `idUsuario` INT(11) NOT NULL ,
  PRIMARY KEY (`idConfiguracao`) ,
  INDEX `fk_Configuração_Usuario1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Configuração_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`usuario_has_comunidades`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`usuario_has_comunidades` (
  `idUsuario` INT(11) NOT NULL ,
  `idComunidade` INT(11) NOT NULL ,
  PRIMARY KEY (`idComunidade`, `idUsuario`) ,
  INDEX `fk_Usuario_has_Comunidades_Comunidades1` (`idComunidade` ASC) ,
  INDEX `fk_Usuario_has_Comunidades_Usuario1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Comunidades_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Comunidades_Comunidades1`
    FOREIGN KEY (`idComunidade` )
    REFERENCES `rededecomp`.`comunidades` (`idComunidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`usuario_has_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`usuario_has_usuario` (
  `idUsuario` INT(11) NOT NULL ,
  `idAmigo` INT(11) NOT NULL ,
  PRIMARY KEY (`idUsuario`, `idAmigo`) ,
  INDEX `fk_Usuario_has_Usuario_Usuario2` (`idAmigo` ASC) ,
  INDEX `fk_Usuario_has_Usuario_Usuario1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Usuario_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Usuario_Usuario2`
    FOREIGN KEY (`idAmigo` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`denuncia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`denuncia` (
  `iddenuncia` INT NOT NULL AUTO_INCREMENT ,
  `ocorrencia` VARCHAR(200) NULL ,
  `idUsuarioDenunciado` INT(11) NOT NULL ,
  PRIMARY KEY (`iddenuncia`) ,
  INDEX `fk_denuncia_usuario1` (`idUsuarioDenunciado` ASC) ,
  CONSTRAINT `fk_denuncia_usuario1`
    FOREIGN KEY (`idUsuarioDenunciado` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rededecomp`.`usuario_has_denuncia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`usuario_has_denuncia` (
  `idUsuario` INT(11) NOT NULL ,
  `iddenuncia` INT NOT NULL ,
  PRIMARY KEY (`idUsuario`, `iddenuncia`) ,
  INDEX `fk_usuario_has_denuncia_denuncia1` (`iddenuncia` ASC) ,
  INDEX `fk_usuario_has_denuncia_usuario1` (`idUsuario` ASC) ,
  CONSTRAINT `fk_usuario_has_denuncia_usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_denuncia_denuncia1`
    FOREIGN KEY (`iddenuncia` )
    REFERENCES `rededecomp`.`denuncia` (`iddenuncia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rededecomp`.`banidos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `rededecomp`.`banidos` (
  `idbanidos` INT NOT NULL ,
  `usuario_idUsuario` INT(11) NOT NULL ,
  `dtBan` DATETIME NULL ,
  PRIMARY KEY (`idbanidos`) ,
  INDEX `fk_banidos_usuario1` (`usuario_idUsuario` ASC) ,
  CONSTRAINT `fk_banidos_usuario1`
    FOREIGN KEY (`usuario_idUsuario` )
    REFERENCES `rededecomp`.`usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
