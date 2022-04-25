create table TARGET_INFO
(
    ID int not null comment 'ID',
    EN_NAME varchar(32) not null comment '英文名称',
    CN_NAME varchar(64) not null comment '中文名称',
    DATA_TYPE varchar(16) not null comment '数据类型',
    LENGTH int not null comment '字段长度',
    NULLALBE varchar(1) not null comment '是否可为空，关联字典项YES_NO',
    IS_PK varchar(1) default '0' not null comment '是否主键，关联字典项YES_NO，默认为0',
    DEFAULT_VALUE varchar(32) null comment '默认值'
)
    comment '指标信息表';

create unique index TARGET_INFO_ID_uindex
    on TARGET_INFO (ID);

alter table TARGET_INFO
    add constraint TARGET_INFO_pk
        primary key (ID);

