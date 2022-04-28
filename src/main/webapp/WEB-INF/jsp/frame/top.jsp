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
<ul class="layui-nav" lay-filter="" style="width: 100%;">
    <c:forEach items="${fns:getChildrenMenuList(0)}" var="topMenu">
        <li class="layui-nav-item <c:if test="${topPageFlag eq topMenu.menuFlag}">layui-this</c:if>"><a href="${topMenu.menuUrl}?menuId=${topMenu.id}">${topMenu.menuName}</a></li>
    </c:forEach>
    <li class="layui-nav-item">
        <img src="/img/头像1.jpg" class="layui-nav-img">${loginUser.userName}
    </li>
    <li class="layui-nav-item"><a href="/login/loginOut">退出</a></li>
</ul>
<input id="loginUserId" value="${loginUser.id}" hidden>
<input id="systemId" value="${systemInfo.id}" hidden>
</body>
</html>
