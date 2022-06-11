CREATE DATABASE test_vista;

USE test_vista;

CREATE TABLE `Client` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`patr_name` varchar(255) NOT NULL,
	`deleted` tinyint(1) NOT NULL,
	`birth_date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Event` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`exec_person` INT NOT NULL,
	`set_person` INT NOT NULL,
	`client_id` INT NOT NULL,
	`beg_date` DATETIME NOT NULL,
	`end_date` DATETIME NOT NULL,
	`event_type_id` INT NOT NULL,
	`deleted` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `EventType` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`deleted` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Person` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`patr_name` varchar(255) NOT NULL,
	`birth_date` DATE NOT NULL,
	`deleted` tinyint(1) NOT NULL,
	`login` varchar(255) NOT NULL,
	`password_hash` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Action` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`event_id` INT NOT NULL,
	`exec_person` INT NOT NULL,
	`beg_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	`action_type` INT NOT NULL,
	`status` INT NOT NULL,
	`deleted` tinyint(1) NOT NULL,
	`contact_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Contact` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`number` varchar(255) NOT NULL,
	`payer_id` INT NOT NULL,
	`date` DATE NOT NULL,
	`deleted` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ActionType` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`title` varchar(255) NOT NULL,
	`class` INT NOT NULL,
	`deleted` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `ConractTariff` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`master_id` INT NOT NULL,
	`action_type` INT NOT NULL,
	`price` FLOAT NOT NULL,
	`deleted` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Event` ADD CONSTRAINT `Event_fk0` FOREIGN KEY (`exec_person`) REFERENCES `Person`(`id`);

ALTER TABLE `Event` ADD CONSTRAINT `Event_fk1` FOREIGN KEY (`set_person`) REFERENCES `Person`(`id`);

ALTER TABLE `Event` ADD CONSTRAINT `Event_fk2` FOREIGN KEY (`client_id`) REFERENCES `Client`(`id`);

ALTER TABLE `Event` ADD CONSTRAINT `Event_fk3` FOREIGN KEY (`event_type_id`) REFERENCES `EventType`(`id`);

ALTER TABLE `Action` ADD CONSTRAINT `Action_fk0` FOREIGN KEY (`event_id`) REFERENCES `Event`(`id`);

ALTER TABLE `Action` ADD CONSTRAINT `Action_fk1` FOREIGN KEY (`exec_person`) REFERENCES `Person`(`id`);

ALTER TABLE `Action` ADD CONSTRAINT `Action_fk2` FOREIGN KEY (`action_type`) REFERENCES `ActionType`(`id`);

ALTER TABLE `Action` ADD CONSTRAINT `Action_fk3` FOREIGN KEY (`contact_id`) REFERENCES `Contact`(`id`);

ALTER TABLE `ConractTariff` ADD CONSTRAINT `ConractTariff_fk0` FOREIGN KEY (`master_id`) REFERENCES `Contact`(`id`);

ALTER TABLE `ConractTariff` ADD CONSTRAINT `ConractTariff_fk1` FOREIGN KEY (`action_type`) REFERENCES `ActionType`(`id`);
