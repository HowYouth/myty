<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/20
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>谜苑天涯-开发说明</title>
    <link rel="stylesheet" href="/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/myty.css" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<div class="layui-collapse">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">1 说明</h2>
        <div class="layui-colla-content layui-show">
            1. 本页面适用于有志于优化本系统的开发者用户。
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">2 代码地址</h2>
        <div class="layui-colla-content layui-show">
            1. 本系统代码存放在GitHub上<br/>
            HTTP地址：https://github.com/PomVen/neisai.git
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">3 项目说明</h2>
        <div class="layui-colla-content layui-show">
            1. 系统采用Java语言编写；使用SSM框架；并用Maven进行jar包管理；前端框架使用了layUI；数据库使用了MySQL数据库；使用了generator自动生成代码；<br/>
            2. 系统使用的各项技术版本如下：<br/>
            layUI版本：v2.5.5<br/>
            modelVersion: 4.0.0<br/>
            SpringVersion: 4.2.5.RELEASE<br/>
            MybatisVersion: 3.2.8<br/>
            MySQLDriverVersion: 8.0.11<br/>
            slf4jVersion: 1.7.18<br/>
            log4jVersion: 1.2.17<br/>
            其他详见项目pom文件。
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">4 系统更新日志</h2>
        <div class="layui-colla-content layui-show">
            <ul class="layui-timeline">
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019年11月6日</h3>
                        <p>
                            系统框架搭建
                        </p>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019年11月7日</h3>
                        <p>
                            引入layUI框架，完成以下功能点：
                        </p>
                        <ul>
                            <li>用户登录</li>
                            <li>查看日程</li>
                        </ul>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019年11月8日</h3>
                        <p>
                            完成以下功能点：
                        </p>
                        <ul>
                            <li>开启新一轮比赛</li>
                            <li>新增用户</li>
                            <li>修改密码</li>
                        </ul>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019年11月15日</h3>
                        <p>
                            完成以下功能点：
                        </p>
                        <ul>
                            <li>输入猜射</li>
                            <li>输入谜题</li>
                            <li>评分功能</li>
                        </ul>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019年11月18日</h3>
                        <p>
                            完成以下功能点：
                        </p>
                        <ul>
                            <li>列中功能</li>
                            <li>菜单权限控制</li>
                            <li>当前赛况</li>
                        </ul>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019年11月20日</h3>
                        <p>
                            调整表结构，完成以下功能点：
                        </p>
                        <ul>
                            <li>菜单管理</li>
                            <li>用户管理</li>
                        </ul>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019年11月21日</h3>
                        <p>
                            完成以下功能点：
                        </p>
                        <ul>
                            <li>佳谜榜</li>
                            <li>全部谜题</li>
                            <li>猜射积分榜</li>
                            <li>制谜积分榜</li>
                        </ul>
                    </div>
                </li>
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">2019年11月22日</h3>
                        <p>
                            完成以下功能点：
                        </p>
                        <ul>
                            <li>总积分榜</li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
<script>
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</html>
