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
    <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="width: 100%">
        <c:forEach items="${fns:getChildrenMenuList(parentId)}" var="leftMenu">
            <li class="layui-nav-item <c:if test="${leftPageFlag eq leftMenu.menuFlag}">layui-this</c:if>"><a href="${leftMenu.menuUrl}?menuId=${leftMenu.parentId}">${leftMenu.menuName}</a></li>
        </c:forEach>
    </ul>
</body>
</html>
