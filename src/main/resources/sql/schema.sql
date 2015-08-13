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