<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>谜苑天涯-登录</title>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/mycss.css" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<br/>
<div class="top-header">
    谜苑天涯灯谜联赛2020赛季
</div>
<div class="modal-dialog" style="margin-top: 10%;">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title text-center" id="myModalLabel">谜苑天涯内赛系统登录</h4>
        </div>
        <form id="loginForm" class="layui-form layui-form-pane"  action="/login/loginCheck" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="userName" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input" />
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="userPassword"  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" />
                </div>
            </div>
            <div class="layui-form-item">
                <button  class="layui-btn layui-btn-fluid" lay-submit lay-filter="login">登录</button>
            </div>
            <span style="color: #FF5722">${errMsg}</span>
        </form>
    </div><!-- /.modal-content -->
</div><!-- /.modal -->
</body>
<style type="text/css">
    body{
        background:url(/img/login-backgroud-img.jpg)  no-repeat;
        background-size:cover;
        background-attachment:fixed;
        background-color:#CCCCCC;
    }
</style>
</html>
