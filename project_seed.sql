-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema blog_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog_db` DEFAULT CHARACTER SET utf8 ;
USE `blog_db` ;

-- -----------------------------------------------------
-- Table `blog_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `id` INT NOT NULL,
  `profile` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `blog_db`.`Post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`Post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  `content` VARCHAR(255) NULL,
  `tags` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `createTime` TIMESTAMP NULL,
  `updateTime` TIMESTAMP NULL,
  `authorId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Post_user_idx` (`authorId` ASC),
  CONSTRAINT `fk_Post_user`
    FOREIGN KEY (`authorId`)
    REFERENCES `blog_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_db`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`Comment` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  `id` INT NOT NULL,
  `postId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `comment-post_idx` (`postId` ASC),
  CONSTRAINT `comment-post`
    FOREIGN KEY (`postId`)
    REFERENCES `blog_db`.`Post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `blog_db`.`Tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`Tag` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_db`.`PostTag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog_db`.`PostTag` (
  `postId` INT NOT NULL,
  `tagID` INT NOT NULL,
  PRIMARY KEY (`postId`, `tagID`),
  INDEX `Tag_idx` (`tagID` ASC),
  CONSTRAINT `Post`
    FOREIGN KEY (`postId`)
    REFERENCES `blog_db`.`Post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Tag`
    FOREIGN KEY (`tagID`)
    REFERENCES `blog_db`.`Tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
