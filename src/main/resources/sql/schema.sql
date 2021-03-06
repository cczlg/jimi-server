drop table ss_user;
drop table ss_role;
drop table ss_permission;
drop table ss_user_role;
drop table ss_role_permission;

create table ss_user (
       	id bigint auto_increment,
        login_name varchar(255) not null unique,
        name varchar(64),
        password varchar(255),
        salt varchar(64),
        email varchar(128),
        status varchar(32),
        register_date timestamp,
        primary key (id)
) engine=InnoDB;

create table ss_role (
        id bigint auto_increment,
    	name varchar(255) not null unique,
    	description varchar(255),
        primary key (id)
) engine=InnoDB;

create table ss_permission(
		id bigint auto_increment,
		permission varchar(255) not null unique,
		description varchar(255),
		primary key(id)
)engine=InnoDB;

create table ss_user_role (
        user_id bigint not null,
        role_id bigint not null,
        primary key (user_id, role_id)
) engine=InnoDB;

create table ss_role_permission(
		role_id bigint not null,
		permission_id bigint not null,
		primary key (role_id,permission_id)
) engine=InnoDB;

insert into ss_user (id, login_name, name, email, password, salt, status) values
(1,'admin','管理员','admin@springside.org.cn','691b14d79bf0fa2215f155235df5e670b64394cc','7efbd59d9741d34f','enabled');

insert into ss_role (id, name) values(1,'Admin');

insert into ss_permission (id,permission ,description) values (1,'user:create','create user');
insert into ss_permission (id,permission, description) values (2,'user:edit','edit user');
insert into ss_permission (id,permission ,description) values (3,'user:view','view user');
insert into ss_permission (id,permission, description) values (4,'user:delete','delete user');

insert into ss_user_role (user_id, role_id) values(1,1);

insert into ss_role_permission (role_id,permission_id) values(1,1);
insert into ss_role_permission (role_id,permission_id) values(1,2);
insert into ss_role_permission (role_id,permission_id) values(1,3);
insert into ss_role_permission (role_id,permission_id) values(1,4);

##Jimi 
CREATE TABLE `jimi`.`jimi_company` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(255) NULL,
  `linkMan` VARCHAR(45) NULL,
  `linkPhone` VARCHAR(45) NULL,
  `creator` VARCHAR(45) NULL,
  `updater` VARCHAR(45) NULL,
  `createDate` DATETIME NULL,
  `updateDate` DATETIME NULL,
  `status` VARCHAR(20) NULL ,
  `memo` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));
  
alter table 'jimi'.'jimi_company' AUTO_INCREMENT=10000;


CREATE TABLE `jimi_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyId` bigint(20) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `phoneIMEI` varchar(30) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `creator` varchar(45) DEFAULT NULL,
  `updater` varchar(45) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `latitude` double(20,17) DEFAULT '0.00000000000000000',
  `longitude` double(20,17) DEFAULT '0.00000000000000000',
  `loginCount` BIGINT(20) NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ;

--ALTER TABLE `jimi`.`jimi_employee` 
--ADD COLUMN `loginCount` BIGINT(20) NULL DEFAULT 0 COMMENT '' AFTER `longitude`;
ALTER TABLE `jimi`.`jimi_employee` 
ADD COLUMN `city` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '' AFTER `loginCount`;


 CREATE TABLE `jimi`.`jimi_customer` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `companyId` BIGINT NULL,
  `employeeId` BIGINT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `address` VARCHAR(200) NULL,
  `score` DOUBLE NULL,
  `status` VARCHAR(20) NULL,
  `memo` VARCHAR(255) NULL,
  `creator` VARCHAR(45) NULL,
  `updater` VARCHAR(45) NULL,
  `createDate` DATETIME NULL,
  `updateDate` DATETIME NULL,
  PRIMARY KEY (`id`));

  CREATE TABLE `jimi`.`jimi_order` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `companyId` BIGINT NULL,
  `employeeId` BIGINT NULL,
  `code` VARCHAR(45) NULL,
  `orderTime` DATETIME NULL,
  `customerId` BIGINT NULL,
  `customer` VARCHAR(45) NULL,
  `total` DOUBLE NULL,
  `salesman` VARCHAR(45) NULL,
  `address` VARCHAR(200) NULL,
  `customerPhone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

  CREATE TABLE `jimi`.`jimi_order_item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `orderCode` VARCHAR(45) NULL,
  `customer` VARCHAR(45) NULL,
  `productId` BIGINT NULL,
  `product` VARCHAR(100) NULL,
  `price` DOUBLE ZEROFILL NULL,
  `profit` DOUBLE ZEROFILL NULL,
  `quantity` INT ZEROFILL NULL,
  `flag` INT NULL,
  `image` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));

  CREATE TABLE `jimi`.`jimi_product` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `companyId` BIGINT NULL,
  `product` VARCHAR(45) NULL,
  `purchasePrice` DOUBLE NULL,
  `price` DOUBLE NULL,
  `memo` VARCHAR(255) NULL,
  `image` VARCHAR(255) NULL,
  `status` VARCHAR(20) NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `jimi_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `versionName` varchar(100) DEFAULT NULL,
  `versionCode` bigint(20) DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `creator` varchar(45) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发布版本历史表'

