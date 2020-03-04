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
    <title>谜苑天涯-菜单新增</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/css/myty.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<span style="color: red">* 只可新增友情链接</span>
<div class="centerDiv height-100">
    <form id="addMenuForm" class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">链接名称</label>
            <div class="layui-input-block">
                <input type="text" name="menuName" lay-verify="required" placeholder="请输入链接名称" autocomplete="off"
                       class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">链接地址</label>
            <div class="layui-input-block">
                <input type="text" name="menuPath" lay-verify="required" placeholder="请输入链接地址"
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
            url: "/menu/addMenu",//url
            data: $('#addMenuForm').serialize(),
            success: function (result) {
                layer.open({
                    title: '菜单新增结果'
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
