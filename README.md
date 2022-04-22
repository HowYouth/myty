# 寒痕个人系统

> 这是SSM纯净框架的分支，除了登录功能外，别无其他功能

## 一 SSM框架的搭建
### 1.1 系统概述

<code>
    <table>
        <tr>
            <th>项目</th>
            <th>工具</th>
            <th>版本号</th>
        </tr>
        <tr>
            <td>后台开发语言</td>
            <td>Java</td>
            <td>1.8</td>
        </tr>
        <tr>
            <td>前端框架</td>
            <td>layUI</td>
            <td>-</td>
        </tr>
        <tr>
            <td>开发工具</td>
            <td>IDEA</td>
            <td>2018.6.3</td>
        </tr>
        <tr>
            <td>项目管理工具</td>
            <td>maven</td>
            <td>3.6.1</td>
        </tr>
        <tr>
            <td>数据库</td>
            <td>MySQL</td>
            <td>8.0.11</td>
        </tr>
        <tr>
            <td>日志</td>
            <td>log4j</td>
            <td>1.2.17</td>
        </tr>
        <tr>
            <td>编码格式</td>
            <td>UTF-8</td>
            <td>-</td>
        </tr>
        <tr>
            <td>开发框架</td>
            <td>Spring</td>
            <td>4.2.5.RELEASE</td>
        </tr>
        <tr>
            <td>持久层框架</td>
            <td>MyBatis</td>
            <td>3.2.8</td>
        </tr>
        <tr>
            <td>Web服务器</td>
            <td>Tomcat</td>
            <td>8.5.56</td>
        </tr>        
    </table>
</code>


### 1.2 数据库脚本

```sql
-- 创建系统用户表
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
-- 添加一个初始化用户
INSERT INTO hallthbase.sys_user (ID, login_name, password, user_name, gender) VALUES (0, 'root', 'root', '系统管理员', '1');
```

