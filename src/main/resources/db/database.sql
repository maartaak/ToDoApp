CREATE SCHEMA IF NOT EXISTS `todolist` DEFAULT CHARACTER SET utf8 ;
USE `todolist` ;

CREATE TABLE IF NOT EXISTS `todolist`.`person` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny tabeli.',
    `name` VARCHAR(245) NOT NULL COMMENT 'Nazwa użytkownika',
    PRIMARY KEY (`id`)) ;

CREATE TABLE IF NOT EXISTS `todolist`.`todo_list` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny tabeli.',
    `name` VARCHAR(245) NOT NULL COMMENT 'Nazwa listy z zadaniami',
    PRIMARY KEY (`id`)) ;

CREATE TABLE IF NOT EXISTS `todolist`.`task` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny tabeli.',
    `name` VARCHAR(245) NOT NULL COMMENT 'Nazwa zadania',
    `person_id` INT NOT NULL COMMENT 'Klucz obcy tabeli person',
    `todolist_id` INT NOT NULL COMMENT 'Klucz obcy tabeli todoList',
    `status` VARCHAR(245) NOT NULL COMMENT 'Status zadania',
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_task_person1`
        FOREIGN KEY (`person_id`)
        REFERENCES `todolist`.`person` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_task_todolist1`
        FOREIGN KEY (`todolist_id`)
        REFERENCES `todolist`.`todo_list` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION) ;