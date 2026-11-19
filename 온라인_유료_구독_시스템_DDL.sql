-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema subscription_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema subscription_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `subscription_system` DEFAULT CHARACTER SET utf8 ;
USE `subscription_system` ;

-- -----------------------------------------------------
-- Table `subscription_system`.`program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `subscription_system`.`program` (
  `program_id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`program_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subscription_system`.`level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `subscription_system`.`level` (
  `level_id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL,
  `benefit` VARCHAR(100) NULL,
  PRIMARY KEY (`level_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subscription_system`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `subscription_system`.`client` (
  `client_id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL,
  `tel` VARCHAR(45) NULL,
  `level_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `fk_client_level_idx` (`level_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_level`
    FOREIGN KEY (`level_id`)
    REFERENCES `subscription_system`.`level` (`level_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subscription_system`.`plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `subscription_system`.`plan` (
  `plan_id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL,
  `cost` INT NULL,
  `period` VARCHAR(45) NULL,
  `service` VARCHAR(100) NULL,
  PRIMARY KEY (`plan_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subscription_system`.`subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `subscription_system`.`subscription` (
  `subscription_id` VARCHAR(45) NOT NULL,
  `plan_id` VARCHAR(10) NOT NULL,
  `program_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`subscription_id`),
  INDEX `fk_plan_has_program_program1_idx` (`program_id` ASC) VISIBLE,
  INDEX `fk_plan_has_program_plan1_idx` (`plan_id` ASC) VISIBLE,
  CONSTRAINT `fk_plan_has_program_plan1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `subscription_system`.`plan` (`plan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_has_program_program1`
    FOREIGN KEY (`program_id`)
    REFERENCES `subscription_system`.`program` (`program_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subscription_system`.`subscribe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `subscription_system`.`subscribe` (
  `subscribe_id` VARCHAR(10) NOT NULL,
  `apply` DATE NULL,
  `client_id` VARCHAR(10) NOT NULL,
  `subscription_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`subscribe_id`),
  INDEX `fk_subscribe_client1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_subscribe_subscription1_idx` (`subscription_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscribe_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `subscription_system`.`client` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscribe_subscription1`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `subscription_system`.`subscription` (`subscription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subscription_system`.`cancel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `subscription_system`.`cancel` (
  `cancel_id` VARCHAR(10) NOT NULL,
  `apply` DATE NULL,
  `subscribe_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`cancel_id`),
  INDEX `fk_cancel_subscribe1_idx` (`subscribe_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancel_subscribe1`
    FOREIGN KEY (`subscribe_id`)
    REFERENCES `subscription_system`.`subscribe` (`subscribe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subscription_system`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `subscription_system`.`payment` (
  `payment_id` VARCHAR(10) NOT NULL,
  `payed_date` DATE NULL,
  `payed_cost` INT NULL,
  `will_pay_date` DATE NULL,
  `will_pay_cost` INT NULL,
  `subscribe_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payment_subscribe1_idx` (`subscribe_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_subscribe1`
    FOREIGN KEY (`subscribe_id`)
    REFERENCES `subscription_system`.`subscribe` (`subscribe_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
