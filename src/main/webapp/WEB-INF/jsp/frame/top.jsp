<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="fns" uri="http://mycompany.com" %>
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
    <ul class="layui-nav" lay-filter="" style="width: 100%;  border-bottom: 1px solid red">
        <li class="layui-nav-item <c:if test="${pageFlag eq 'userList'}">layui-this</c:if>"><a href="/page/toUserList">用户管理</a></li>
        <li class="layui-nav-item <c:if test="${pageFlag eq 'sysList'}">layui-this</c:if>"><a href="/page/toSystemList">系统管理</a></li>
        <li class="layui-nav-item <c:if test="${pageFlag eq 'dictList'}">layui-this</c:if>"><a href="/page/toDictionaryList">字典项管理</a></li>
        <li class="layui-nav-item <c:if test="${pageFlag eq 'targetList'}">layui-this</c:if>"><a href="/page/toTargetList">指标管理</a></li>
        <li class="layui-nav-item <c:if test="${pageFlag eq 'menuList'}">layui-this</c:if>"><a href="/page/toMenuList">菜单管理</a></li>
        <li class="layui-nav-item">
            <img src="//t.cn/RCzsdCq" class="layui-nav-img">${loginUser.userName}
        </li>
        <li class="layui-nav-item"><a href="/login/loginOut">退出</a></li>
    </ul>
</div>
</body>
</html>
