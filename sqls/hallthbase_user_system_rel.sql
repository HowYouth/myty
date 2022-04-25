create table USER_SYSTEM_REL
(
    ID int not null comment 'ID',
    USER_ID int not null comment '用户ID',
    SYS_ID int not null comment '系统ID',
    START_TIME timestamp not null comment '可访问时间区间始',
    END_TIME timestamp not null comment '可访问时间区间止'
)
    comment '用户系统权限表';

create unique index USER_SYSTEM_REL_ID_uindex
    on USER_SYSTEM_REL (ID);

alter table USER_SYSTEM_REL
    add constraint USER_SYSTEM_REL_pk
        primary key (ID);

