<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>寒痕</title>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/mycss.css" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>

<div style="width: 100%; height: 6%;  float: left;">
    <jsp:include page="/page/top"></jsp:include>
</div>
<div style="width: 100%; height: 100%; padding-top: 50px;">
    <table id="userListTable" lay-filter="userList"></table>
</div>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#userListTable'
            ,url: '/user/getUserList' //数据接口
            ,page: true //开启分页
            ,id: 'userListTableReload'
            ,cols: [[ //表头
                {field: 'ID',  align: 'center', title: 'ID',fixed: 'left'}
                ,{field: 'loginName', align: 'center', sort: true, title: '登录名'}
                ,{field: 'password', align: 'center', sort: true, title: '密码'}
                ,{field: 'userName', align: 'center', sort: true, title: '用户名称'}
                ,{field: 'gender', align: 'center', sort: true, title: '性别'}
            ]]
        });
    });
</script>
</body>
</html>
