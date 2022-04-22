create table sys_user
(
  ID         int         not null comment 'ID'
    primary key,
  login_name varchar(45) not null comment '登录名',
  password   varchar(45) not null comment '登录密码',
  user_name  varchar(45) not null comment '用户名称；用于登录后显示',
  gender     varchar(1)  not null comment '用户性别；字典项SYS_DICT.TYPE=GENDER',
  constraint login_name_UNIQUE
    unique (login_name)
)
  comment '系统用户表';
INSERT INTO hallthbase.sys_user (ID, login_name, password, user_name, gender) VALUES (0, 'root', 'root', '系统管理员', '1');