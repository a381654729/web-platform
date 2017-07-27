insert into t_user values(1,'admin','$shiro1$SHA-256$500000$yQpBM/uQHF5WJyPrvofKww==$3tQ2lCRd5QeU4i0eLXjHOjp6LdM+hI0rgE7QKvWdK6w=','Beijing','tom@xx.com');

insert into t_role values(1,'admin','管理员','');

insert into t_permission values(1,'add','添加信息','');
insert into t_permission values(2,'del','删除信息','');
insert into t_permission values(3,'update','修改信息','');
insert into t_permission values(4,'query','查询信息','');

insert into t_user_role values(1,1);

insert into t_role_permission values(1,1);
insert into t_role_permission values(1,2);
insert into t_role_permission values(1,3);
insert into t_role_permission values(1,4);