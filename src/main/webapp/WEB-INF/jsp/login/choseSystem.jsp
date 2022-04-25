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
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md12" style="background-color: #00F7DE; height: 80px; width: 100%">
                Welcome to my personal system, <span style="color: #FF5722">${loginUser.userName}</span>. Please chose a system you want to visit.
                You can visit ${page.total} systems.
            </div>
        </div>
        <div class="layui-row">
            <c:if test="${page.total == 0}">
                您没有访问权限，请联系管理员进行分配。
            </c:if>
            <c:if test="${page.total > 0}">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>系统名称</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${page.dataList}" var="sysInfo">
                        <tr>
                            <td>${sysInfo.sysName}</td>
                            <td>
                                <a href="/login/jump?userId=${loginUser.id}&systemId=${sysInfo.id}">访问</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>

</body>
<script type="application/javascript">
    function toSystem(sysId, userId) {
        $.post("/login/jump", {systemId: sysId, userId: userId}, function(resp){
            console.log('resp', resp)
        }, "json")
    }
</script>
</html>
