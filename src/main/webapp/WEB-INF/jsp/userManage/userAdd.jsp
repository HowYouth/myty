<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fns" uri="http://mycompany.com" %>
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
<div style="float: left; margin-top: 8px; height: 92%; width: 10%; background-color: #DAA520">
    <jsp:include page="/page/left/${menuId}"></jsp:include>
</div>
<div style="float: right; border-right: 1px solid greenyellow; border-left: 1px solid greenyellow; height: 92%;margin-top: 10px; margin-right: 15px; width: 88%">
    <form class="layui-form layui-form-pane" action="/user/userAdd?menuId=${menuId}" id="userAddForm">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名称</label>
            <div class="layui-input-block">
                <input type="text" name="userName" id="userName" autocomplete="off" placeholder="请输入用户名称" class="layui-input formInput" lay-verify="userName">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录名</label>
            <div class="layui-input-block">
                <input type="text" name="loginName" id="loginName" placeholder="请输入登录名" autocomplete="off" class="layui-input formInput" lay-verify="loginName">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" id="password" placeholder="请输入密码" autocomplete="off" class="layui-input formInput" lay-verify="password">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码确认</label>
            <div class="layui-input-block">
                <input type="password" name="passwordConfirm" id="passwordConfirm" placeholder="请再次输入密码" autocomplete="off" class="layui-input formInput" lay-verify="passwordConfirm">
            </div>
        </div>
        <div class="layui-form-item" pane="">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block formInput">
                <select name="gender" lay-filter="gender">
                    <option value="">请选择</option>
                    <c:forEach items="${fns:getDictDetailList('GENDER')}" var="dict" varStatus="status">
                        <option value="${dict.key}">${dict.value}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <button type="submit" class="layui-btn"  lay-filter="demo1">保存</button>
    </form>
</div>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use(['element','layer','form','layedit','laydate'], function(){
        var element = layui.element
        ,layer = layui.layer
        ,layedit = layui.layedit
        ,laydate = layui.laydate
        ,form = layui.form;
        //自定义验证规则
        form.verify({
            userName: function(value){
                if(value == null || value === ''){
                    return '用户名称不能为空';
                }
            }
            ,loginName: function(value){
                if(value == null || value === ''){
                    return '登录名不能为空';
                }
            }
            ,password: function(value){
                if(value == null || value === ''){
                    return '密码不能为空';
                }
            }
            ,passwordConfirm: function(value){
                if(value == null || value === ''){
                    return '密码确认不能为空';
                }
                if(value != $('#password').val()){
                    return '两次密码输入不一致';
                }
            }
            ,gender: function(value){
                if(value == null || value === ''){
                    return '性别不能为空';
                }
            }
        });
    });

    function submitForm() {

    }
</script>
</body>
</html>
