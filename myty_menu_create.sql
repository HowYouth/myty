create table myty_menu
(
  menu_id      varchar(20)  not null
  comment '菜单ID',
  menu_name    varchar(20)  not null
  comment '菜单名称',
  menu_path    varchar(100) not null
  comment '菜单指向路径',
  menu_role    varchar(20)  not null
  comment '菜单权限',
  menu_type    int          not null
  comment '类型：1-功能菜单；2-友情链接',
  parent_menu  varchar(20)  null
  comment '父级菜单',
  has_children int          null
  comment '是否含有子菜单：0-否；1-是',
  menu_order   varchar(4)   null
  comment '菜单出现的时间：0000-一直出现；第一位是1-输入谜题阶段；第二位是1-输入猜射阶段；第三位是1-评分列中阶段；第四位是1-结束之后',
  menu_icon    varchar(50)  null
  comment '菜单图标'
);
