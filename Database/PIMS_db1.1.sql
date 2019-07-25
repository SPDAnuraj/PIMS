-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PIS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PIS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PIS` ;
USE `PIS` ;

-- -----------------------------------------------------
-- Table `PIS`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PIS`.`Patient` (
  `PHN` INT NOT NULL,
  `Patient_Name` VARCHAR(60) NULL,
  PRIMARY KEY (`PHN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PIS`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PIS`.`Doctor` (
  `Doctor_Id` INT NOT NULL,
  `Doctor_Name` VARCHAR(60) NULL,
  `Username` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `Type` VARCHAR(20) NULL,
  PRIMARY KEY (`Doctor_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PIS`.`Management`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PIS`.`Management` (
  `Management_Id` INT NOT NULL,
  `Ice_packs` TINYINT NULL,
  `Antihistamine` TINYINT NULL,
  `Adrenaline` TINYINT NULL,
  `ICU_Care` TINYINT NULL,
  `Steroids` TINYINT NULL,
  `Renal_Rep_Theraphy` TINYINT NULL,
  `Invasive_Ventilation` TINYINT NULL,
  `Stinger_Scrapped` TINYINT NULL,
  PRIMARY KEY (`Management_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PIS`.`Clinical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PIS`.`Clinical` (
  `Clinical_Id` INT NOT NULL,
  `Burning_Pain` TINYINT NULL,
  `Pruritus` TINYINT NULL,
  `Vomiting` TINYINT NULL,
  `Bronchospasm` TINYINT NULL,
  `Renal_Failure` TINYINT NULL,
  `Tightness_of_Chest` TINYINT NULL,
  `Urticaria` TINYINT NULL,
  `Laryngeal_Odema` TINYINT NULL,
  `Rhabdomyolysis` TINYINT NULL,
  `Swelling` TINYINT NULL,
  `Nausea` TINYINT NULL,
  `Hypotension` TINYINT NULL,
  `Oliguria` TINYINT NULL,
  `Diarrhoea` TINYINT NULL,
  `Malaise` TINYINT NULL,
  `Facial_Odema` TINYINT NULL,
  `Seizure` TINYINT NULL,
  PRIMARY KEY (`Clinical_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PIS`.`Site`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PIS`.`Site` (
  `Site_Id` INT NOT NULL,
  `Head_Neck` TINYINT NULL,
  `Upper_Limb` TINYINT NULL,
  `Chest` TINYINT NULL,
  `Abdomen` TINYINT NULL,
  `Lower_Limb` TINYINT NULL,
  `Others` VARCHAR(100) NULL,
  PRIMARY KEY (`Site_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PIS`.`Record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PIS`.`Record` (
  `Record_Id` INT NOT NULL AUTO_INCREMENT,
  `PHN` INT NOT NULL,
  `Clinical_Id` INT NULL,
  `Management_Id` INT NULL,
  `Toxicity_Type` VARCHAR(45) NOT NULL,
  `Toxicity_Id` INT NOT NULL,
  `Site_Id` INT NULL,
  `Record_Time` DATETIME NULL,  
  PRIMARY KEY (`Record_Id`),
  CONSTRAINT `Record_Patient_fk`
    FOREIGN KEY (`PHN`)
    REFERENCES `PIS`.`Patient` (`PHN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Record_Management_fk`
    FOREIGN KEY (`Management_Id`)
    REFERENCES `PIS`.`Management` (`Management_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Record_Clinical_fk`
    FOREIGN KEY (`Clinical_Id`)
    REFERENCES `PIS`.`Clinical` (`Clinical_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Record_Site_fk`
    FOREIGN KEY (`Site_Id`)
    REFERENCES `PIS`.`Site` (`Site_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PIS`.`Doctor_Record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PIS`.`Doctor_Record` (
  `Record_Id` INT NOT NULL,
  `Doctor_Id` INT NOT NULL,
  `Edit_Time` VARCHAR(45) NULL,
  PRIMARY KEY (`Record_Id`, `Doctor_Id`),
  CONSTRAINT `Doctor_Record_Record_fk`
    FOREIGN KEY (`Record_Id`)
    REFERENCES `PIS`.`Record` (`Record_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Doctor_Record_Doctor_fk`
    FOREIGN KEY (`Doctor_Id`)
    REFERENCES `PIS`.`Doctor` (`Doctor_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PIS`.`Bee_Sting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PIS`.`Bee_Sting` (
  `Bee_Sting_Id` INT NOT NULL,
  `Number_of_Stings` TINYINT(50) NULL,
  `Place_of_Sting` VARCHAR(45) NULL,
  `Sting_Time` VARCHAR(45) NULL,
  `Cirmustance` TINYINT NULL,
  PRIMARY KEY (`Bee_Sting_Id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
