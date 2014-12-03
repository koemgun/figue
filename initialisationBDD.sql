SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `areszobsares44`.`Figue_CAT_Figue_Categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areszobsares44`.`Figue_CAT_Figue_Categorie` (
  `CAT_Id` INT NOT NULL AUTO_INCREMENT,
  `CAT_Libelle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CAT_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areszobsares44`.`Figue_FIG_Figue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areszobsares44`.`Figue_FIG_Figue` (
  `FIG_Id` INT NOT NULL AUTO_INCREMENT,
  `FIG_Numero` INT NOT NULL,
  `CAT_Id` INT NOT NULL,
  `FIG_Libelle` VARCHAR(128) NULL,
  `FIG_Date` INT NULL,
  `FIG_MEM_Id_Createur` INT NULL,
  PRIMARY KEY (`FIG_Id`),
  INDEX `fk_Figue_figue_categorie_idx` (`CAT_Id` ASC),
  CONSTRAINT `fk_Figue_figue_categorie`
    FOREIGN KEY (`CAT_Id`)
    REFERENCES `areszobsares44`.`Figue_CAT_Figue_Categorie` (`CAT_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areszobsares44`.`Figue_ROL_Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areszobsares44`.`Figue_ROL_Role` (
  `ROL_Id` INT NOT NULL AUTO_INCREMENT,
  `ROL_Libelle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ROL_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areszobsares44`.`Figue_MEM_Membre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areszobsares44`.`Figue_MEM_Membre` (
  `MEM_Id` INT NOT NULL AUTO_INCREMENT,
  `ROL_Id` INT NOT NULL,
  `MEM_Pseudo` VARCHAR(45) NOT NULL,
  `MEM_phone_num` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`MEM_Id`),
  INDEX `fk_membre_role1_idx` (`ROL_Id` ASC),
  CONSTRAINT `fk_membre_role1`
    FOREIGN KEY (`ROL_Id`)
    REFERENCES `areszobsares44`.`Figue_ROL_Role` (`ROL_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `areszobsares44`.`Figue_MCL_Mot_Cle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areszobsares44`.`Figue_MCL_Mot_Cle` (
  `MCL_Id` INT NOT NULL AUTO_INCREMENT,
  `MCL_Libelle` VARCHAR(45) NOT NULL,
  `MCL_Accreditation` INT NOT NULL,
  PRIMARY KEY (`MCL_Id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Donnée pour `areszobsares44`.`Figue_MCL_Mot_Cle`
-- -----------------------------------------------------

INSERT INTO `Figue_MCL_Mot_Cle` (`MCL_Id`, `MCL_Libelle`, `MCL_Accreditation`) VALUES
    (1, 'cle liste',0),
    (2, 'evenement liste',0),
    (3, 'partie liste',0),
    (4, 'cle inscrit',0),
    (5, 'evenement inscrit',0),
    (6, 'partie inscrit',0),
    (7, 'cle annule',0),
    (8, 'evenement annule',0),
    (9, 'partie annule',0),
    (10, 'cle supprime',2),
    (11, 'evenement supprime',2),
    (12, 'partie supprime',1),
    (13, 'cle creation',2),
    (14, 'evenement creation',2),
    (15, 'partie creation',0),
    (16, 'cle virer',2),
    (17, 'evenement virer',2),
    (18, 'partie virer',1),
    (19, 'aide',0),
    (20, 'identification',0),
    (21, 'stop',0),
    (22, 'noir',0),
    (23, 'poney',0);


-- -----------------------------------------------------
-- Table `areszobsares44`.`Figue_INS_Inscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areszobsares44`.`Figue_INS_Inscription` (
  `FIG_Id` INT NOT NULL,
  `MEM_Id` INT NOT NULL,
  `INS_Date` TIMESTAMP NOT NULL,
  INDEX `fk_inscription_Figue1_idx` (`FIG_Id` ASC),
  INDEX `fk_inscription_membre1_idx` (`MEM_Id` ASC),
  PRIMARY KEY (`FIG_Id`, `MEM_Id`, `INS_Date`),
  CONSTRAINT `fk_inscription_Figue1`
    FOREIGN KEY (`FIG_Id`)
    REFERENCES `areszobsares44`.`Figue_FIG_Figue` (`FIG_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscription_membre1`
    FOREIGN KEY (`MEM_Id`)
    REFERENCES `areszobsares44`.`Figue_MEM_Membre` (`MEM_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
