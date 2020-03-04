<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/7
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>谜苑天涯-输入猜射</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/css/myty.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<div style="padding: 15px;">
    <table id="demo" lay-filter="test"></table>
</div>
</body>
<script>
    layui.use('table', function () {
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            , url: '/dengmiTemp/noAnswerSubject' //数据接口
            , page: true //开启分页
            , limits: [5, 10, 20, 50]
            , limit: 10
            // , toolbar: true
            , cols: [[ //表头
                {field: 'dm_mimian', title: '谜面', width: 500, fixed: 'left'}
                , {field: 'dm_mimu', title: '谜目'}
                , {field: 'dm_mimianzhu', title: '谜面注解'}
                , {field: 'user_answer', edit: 'text', title: '谜底'}
            ]]
        });

        table.on('edit(test)', function (obj) { //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            $.post("/answer/saveMyAnswer", {dmTempId: data.dm_temp_id, dmMidi: value}, function (data) {
                if (!data.result) {
                    layer.msg(data.msg);
                }
            });
        });
    });
</script>


<script type="text/javascript">
    layui.use(['table'], function () {
        layui.table.on('edit(edittable)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            $.post("updateRobotConf", {id: data.conf_key, field: field, value: value}, function (data) {
                if (data == "true") {
                    layer.msg("修改成功");
                } else {
                    layer.msg(data);
                }
            });
        });
    });
</script>
</html>
