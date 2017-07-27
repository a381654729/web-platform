use demo;

create table t_user(
id bigint not null auto_increment,
username varchar(50),
password varchar(100),
address varchar(100),
email varchar(50),
primary key(id)
)ENGINE=InnoDB default charset=utf8;

create table t_role(
id bigint not null auto_increment,
rolename varchar(50),
cname varchar(100),
description varchar(200),
primary key(id)
)ENGINE=InnoDB default charset=utf8;

create table t_permission(
id bigint not null auto_increment,
pname varchar(50),
cname varchar(100),
description varchar(200),
primary key(id)
)ENGINE=InnoDB default charset=utf8;

create table t_user_role(
user_id bigint not null,
role_id bigint not null,
primary key(user_id,role_id),
foreign key (user_id) references t_user(id),
foreign key (role_id) references t_role(id)
)ENGINE=InnoDB default charset=utf8;

create table t_role_permission(
role_id bigint not null,
permission_id bigint not null,
primary key(role_id,permission_id),
foreign key (role_id) references t_role(id),
foreign key(permission_id) references t_permission(id)
)ENGINE=InnoDB default charset=utf8;