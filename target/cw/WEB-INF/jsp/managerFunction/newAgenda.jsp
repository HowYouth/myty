<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/8
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>谜苑天涯-发起比赛</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/css/myty.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<div class="centerDiv height-350">
    <form id="newAgendaForm" class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">轮次</label>
            <div class="layui-input-block">
                <input type="text" name="roundNo" lay-verify="required" readonly value="${roundNo}"
                       class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-block">
                <input type="text" lay-verify="required" placeholder="开始时间" name="startTime"
                       class="layui-input" id="startTime" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">猜射时间</label>
            <div class="layui-input-block">
                <input type="text" lay-verify="required" placeholder="猜射时间" name="doTime"
                       class="layui-input" id="doTime" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">评分列中时间</label>
            <div class="layui-input-block">
                <input type="text" lay-verify="required" placeholder="评分列中时间" name="judgeTime"
                       class="layui-input" id="judgeTime" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-block">
                <input type="text" lay-verify="required" placeholder="结束时间" name="endTime"
                       class="layui-input" id="endTime" autocomplete="off"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">输入条数</label>
            <div class="layui-input-block">
                <input type="text" name="inputCount" lay-verify="required" placeholder="输入条数"
                       autocomplete="off" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <input class="layui-btn layui-btn-fluid" type="button" value="新增" onclick="newAgenda()">
        </div>
    </form>
</div>
</body>
<script>
    layui.use(['laydate', 'layer', 'form'], function () {
        var laydate = layui.laydate;

        //日期时间选择器
        laydate.render({
            elem: '#startTime'
            , type: 'datetime'
            , calendar: true
        });
        //日期时间选择器
        laydate.render({
            elem: '#doTime'
            , type: 'datetime'
            , calendar: true
        });
        //日期时间选择器
        laydate.render({
            elem: '#judgeTime'
            , type: 'datetime'
            , calendar: true
        });
        //日期时间选择器
        laydate.render({
            elem: '#endTime'
            , type: 'datetime'
            , calendar: true
        });
    });

    function newAgenda() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/agenda/newAgenda",//url
            data: $('#newAgendaForm').serialize(),
            success: function (result) {
                layer.open({
                    title: '比赛开启结果'
                    , content: result.msg
                });
            },
            error: function (res) {
                alert("异常！" + res);
            }
        });
    }
</script>
</html>
