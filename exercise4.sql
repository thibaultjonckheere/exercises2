-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise4` ;
USE `exercise4` ;

-- -----------------------------------------------------
-- Table `exercise4`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Doctor` (
  `idDoctor` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Date_of_birth` DATE NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` CHAR(12) NULL,
  `Salary` FLOAT NULL,
  PRIMARY KEY (`idDoctor`),
  UNIQUE INDEX `idDoctor_UNIQUE` (`idDoctor` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Medical` (
  `ID` VARCHAR(45) NOT NULL,
  `Doctor_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Doctor_ID_idx` (`Doctor_id` ASC),
  CONSTRAINT `Doctor_ID`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Specialist` (
  `ID` INT NOT NULL,
  `Field_specialist` VARCHAR(45) NULL,
  `Doctor_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Doctor_id_idx` (`Doctor_id` ASC),
  CONSTRAINT `Doctor_id`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
