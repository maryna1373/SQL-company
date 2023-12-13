CREATE DATABASE company;

USE company;

CREATE TABLE `employee` (
	`employee_id` INT NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`positson` varchar(15) NOT NULL,
	`employment_date` DATE NOT NULL,
	`departament_id` INT NOT NULL UNIQUE,
	`manager_id` INT NOT NULL UNIQUE,
	`rate` FLOAT NOT NULL,
	`bonus` FLOAT NOT NULL UNIQUE,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE `departament` (
	`departament_id` INT NOT NULL,
	`departament_name` varchar(30) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(40) NOT NULL,
	`building_no` VARCHAR(3) NOT NULL,
	PRIMARY KEY (`departament_id`)
);

CREATE TABLE `product` (
	`product_id` INT NOT NULL,
	`product_name` varchar(40) NOT NULL,
	`product_desscription` varchar(150) NOT NULL,
	`category` varchar(15) NOT NULL,
	`manufacture` varchar(30) NOT NULL,
	`product_type` varchar(15) NOT NULL,
	`amount` INT NOT NULL,
	`prise` FLOAT NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `customer` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`birth_date` DATE NOT NULL,
	`phone_number` INT NOT NULL,
	`email` varchar(50) NOT NULL,
	`discount` INT(2) NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `order` (
	`order_id` INT NOT NULL AUTO_INCREMENT,
	`employee_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`customer_id` INT NOT NULL,
	`transaction_type` INT NOT NULL,
	`transaction_moment` DATETIME NOT NULL,
	`amount` INT NOT NULL,
	PRIMARY KEY (`order_id`)
);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk0` FOREIGN KEY (`departament_id`) REFERENCES `departament`(`departament_id`);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk1` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);