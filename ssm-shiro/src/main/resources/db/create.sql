use test;

create table t_user(
id bigint not null auto_increment,
username varchar(50),
password varchar(100),
primary key(id)
)ENGINE=InnoDB default charset=utf8;

insert into t_user values(1,'tom','$shiro1$SHA-256$500000$yQpBM/uQHF5WJyPrvofKww==$3tQ2lCRd5QeU4i0eLXjHOjp6LdM+hI0rgE7QKvWdK6w=');
insert into t_user values(2,'jack','$shiro1$SHA-256$500000$yQpBM/uQHF5WJyPrvofKww==$3tQ2lCRd5QeU4i0eLXjHOjp6LdM+hI0rgE7QKvWdK6w=');
insert into t_user values(3,'rose','$shiro1$SHA-256$500000$yQpBM/uQHF5WJyPrvofKww==$3tQ2lCRd5QeU4i0eLXjHOjp6LdM+hI0rgE7QKvWdK6w=');

create table t_role(
id bigint not null auto_increment,
rolename varchar(50),
primary key(id)
)ENGINE=InnoDB default charset=utf8;

insert into t_role values(1,'admin');
insert into t_role values(2,'manager');
insert into t_role values(3,'normal');

create table t_user_role(
user_id bigint not null,
role_id bigint not null,
primary key(user_id,role_id)
)ENGINE=InnoDB default charset=utf8;

insert into t_user_role values(1,1);
insert into t_user_role values(1,3);
insert into t_user_role values(2,2);
insert into t_user_role values(2,3);
insert into t_user_role values(3,3);

create table t_permission(
id bigint not null auto_increment,
permissionname varchar(50),
role_id bigint,
primary key(id)
)ENGINE=InnoDB default charset=utf8;

insert into t_permission values(1,'add',2);
insert into t_permission values(2,'del',1);
insert into t_permission values(3,'update',2);
insert into t_permission values(4,'query',3);