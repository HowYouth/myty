create table SYSTEM_INFO
(
    ID int not null comment 'ID',
    SYS_ID varchar(8) null comment '系统标识ID',
    SYS_NAME varchar(128) not null comment '系统中文名称',
    HOME_ADDRESS varchar(255) not null comment '系统首页地址',
    SYS_ABBREVIATIONS varchar(16) null comment '系统中文名称缩写',
    SYS_ICON varchar(255) null comment '系统LOGO图片地址',
    IS_AVAILABLE varchar(1) default '1' null comment '系统是否可用，关联字典项YES_NO'
)
    comment '各系统列表';

create unique index SYSTEM_INFO_ID_uindex
    on SYSTEM_INFO (ID);

alter table SYSTEM_INFO
    add constraint SYSTEM_INFO_pk
        primary key (ID);

