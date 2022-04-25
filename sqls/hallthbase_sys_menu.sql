create table SYS_MENU
(
    ID int not null comment 'ID',
    SYS_ID int not null comment '系统ID',
    MENU_NAME varchar(64) not null comment '菜单名称',
    MENU_ICON varchar(64) null comment '菜单图标',
    MENU_URL varchar(64) null comment '菜单路径',
    REMARKS varchar(128) null comment '备注信息',
    HIDDEN varchar(1) default '0' not null comment '是否隐藏，关联字典项YES_NO，默认0',
    IS_AVAILABLE varchar(1) default '1' not null comment '是否可用，关联字典项YES_NO，默认1',
    PARENT_ID int default 0 not null comment '父级菜单ID，默认0，表示无上级菜单'
)
    comment '菜单表';

create unique index SYS_MENU_ID_uindex
    on SYS_MENU (ID);

alter table SYS_MENU
    add constraint SYS_MENU_pk
        primary key (ID);

alter table sys_menu
    add MENU_FLAG varchar(16) not null comment '菜单标志，用于是否高亮显示';

