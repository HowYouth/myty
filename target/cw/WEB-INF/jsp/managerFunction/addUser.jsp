<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/8
  Time: 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>谜苑天涯-用户新增</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/css/myty.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<div class="centerDiv height-100">
    <form id="addUserForm" class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="userName" lay-verify="required" placeholder="请输入" autocomplete="off"
                       class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="userPassword" lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <input class="layui-btn layui-btn-fluid" type="button" value="新增" onclick="addUser()">
        </div>
    </form>
</div>
</body>
<script>
    // layUI获取元素值：var pvalue = $("input[name='password']").val(); name属性为password的input的值
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        //监听提交,也就是在点击按钮，提交到后台之前的操作
        form.on('submit(addUserForm)', function (data) {
        });
    });

    function addUser() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/user/addUser",//url
            data: $('#addUserForm').serialize(),
            success: function (result) {
                layer.open({
                    title: '用户新增结果'
                    , content: result.msg
                });
            },
            error: function () {
                alert("异常！");
            }
        });
    }
</script>
</html>
