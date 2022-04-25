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

<div style="width: 90%; height: 6%;  float: left;">
    <ul class="layui-nav" lay-filter="" style="width: 100%;  border-bottom: 1px solid red">
        <li class="layui-nav-item"><a href="">用户管理</a></li>
        <li class="layui-nav-item layui-this"><a href="">系统管理</a></li>
        <li class="layui-nav-item"><a href="">字典项管理</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">解决方案</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a href="">移动模块</a></dd>
                <dd><a href="">后台模版</a></dd>
                <dd><a href="">电商平台</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">社区</a></li>
    </ul>
</div>
<div style="width: 10%; height: 6%; float: right">
    <ul class="layui-nav" lay-filter="" style="width: 100%; border-bottom: 1px solid red;">
        <li class="layui-nav-item">
            <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">${loginUser.userName}</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:;">修改信息</a></dd>
                <dd><a href="javascript:;">安全管理</a></dd>
                <dd><a href="/login/loginOut">退出</a></dd>
            </dl>
        </li>
    </ul>
</div>
<div>
    <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo" style="margin-right: 10px; height: 94%">
        <li class="layui-nav-item layui-nav-itemed"> <a href="javascript:;">默认展开</a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="javascript:;">选项一</a>
                </dd>
                <dd>
                    <a href="javascript:;">选项二</a>
                </dd>
                <dd>
                    <a href="javascript:;">选项三</a>
                </dd>
                <dd>
                    <a href="">跳转项</a>
                </dd>
            </dl> </li>
        <li class="layui-nav-item"> <a href="javascript:;">解决方案</a>
            <dl class="layui-nav-child">
                <dd>
                    <a href="">移动模块</a>
                </dd>
                <dd>
                    <a href="">后台模版</a>
                </dd>
                <dd>
                    <a href="">电商平台</a>
                </dd>
            </dl> </li>
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">社区</a></li>
    </ul>
</div>

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>
</body>
<style type="text/css">
</style>
<script type="application/javascript">
</script>
</html>
