-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema jpademo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jpademo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jpademo` DEFAULT CHARACTER SET latin1 ;
USE `jpademo` ;

-- -----------------------------------------------------
-- Table `jpademo`.`Cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jpademo`.`Cities` (
  `zip` INT(11) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`zip`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `jpademo`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jpademo`.`Customers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(45) NULL,
  `age` INT(11) NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `Customers_name` (`firstName` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `jpademo`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jpademo`.`Orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `orderdate` TIMESTAMP NOT NULL,
  `shippingdate` TIMESTAMP NULL,
  `Customers_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Orders_Customers1_idx` (`Customers_id` ASC),
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`Customers_id`)
    REFERENCES `jpademo`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jpademo`.`Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jpademo`.`Addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `nr` VARCHAR(20) NULL,
  `Cities_zip` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Adresses_Cities_idx` (`Cities_zip` ASC),
  CONSTRAINT `fk_Adresses_Cities`
    FOREIGN KEY (`Cities_zip`)
    REFERENCES `jpademo`.`Cities` (`zip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jpademo`.`Adresses_has_Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jpademo`.`Adresses_has_Customers` (
  `Adresses_id` INT NOT NULL,
  `Customers_id` INT(11) NOT NULL,
  PRIMARY KEY (`Adresses_id`, `Customers_id`),
  INDEX `fk_Adresses_has_Customers_Customers1_idx` (`Customers_id` ASC),
  INDEX `fk_Adresses_has_Customers_Adresses1_idx` (`Adresses_id` ASC),
  CONSTRAINT `fk_Adresses_has_Customers_Adresses1`
    FOREIGN KEY (`Adresses_id`)
    REFERENCES `jpademo`.`Addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Adresses_has_Customers_Customers1`
    FOREIGN KEY (`Customers_id`)
    REFERENCES `jpademo`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jpademo`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jpademo`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jpademo`.`OrderLines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jpademo`.`OrderLines` (
  `Orders_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`Orders_id`, `products_id`),
  INDEX `fk_Orders_has_products_products1_idx` (`products_id` ASC),
  INDEX `fk_Orders_has_products_Orders1_idx` (`Orders_id` ASC),
  CONSTRAINT `fk_Orders_has_products_Orders1`
    FOREIGN KEY (`Orders_id`)
    REFERENCES `jpademo`.`Orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `jpademo`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

