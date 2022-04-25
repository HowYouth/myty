create table SYS_DICTIONARY
(
    ID int not null comment 'ID',
    TYPE varchar(64) not null comment '字典项类型',
    DESCRIPTION varchar(64) null comment '字典项类型描述',
    `KEY` varchar(32) not null comment '字典项的码值',
    VALUE varchar(128) not null comment '字典项的取值',
    REMARKS varchar(64) null comment '说明',
    DEL_FLAG varchar(1) default '0' not null comment '是否删除标志，关联字典项YE_NO',
    IS_AVAILABLE varchar(1) default '1' not null comment '是否可用标志，1-可用；0-不可用'
)
    comment '系统字典表';

create unique index SYS_DICTIONARY_ID_uindex
    on SYS_DICTIONARY (ID);

alter table SYS_DICTIONARY
    add constraint SYS_DICTIONARY_pk
        primary key (ID);

