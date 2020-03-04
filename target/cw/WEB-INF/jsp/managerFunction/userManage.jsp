<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/20
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>谜苑天涯-用户管理</title>
    <link rel="stylesheet" href="/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/myty.css" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<div style="padding: 15px;">
    <table id="userManage" lay-filter="test"></table>
</div>
<script type="text/html" id="barDemo">
    <input class="layui-btn layui-btn-fluid" type="button" value="重置密码">
</script>
<script type="text/html" id="setDev">
    {{# if (d.isDeveloper == 1) { }}
    <input type="checkbox" value="{{d.isDeveloper}}" lay-filter="setDeveloper" lay-skin="switch" lay-text="是|否" checked >
    {{# } else { }}
    <input type="checkbox" value="{{d.isDeveloper}}" lay-filter="setDeveloper" lay-skin="switch" lay-text="是|否" >
    {{# } }}
</script>
</body>
<script>
    var isDev;
    layui.use(['table','form'], function(){
        var table = layui.table, form = layui.form;

        //第一个实例
        table.render({
            elem: '#userManage'
            ,url: '/user/getAllUserInfo' //数据接口
            ,page: true //开启分页
            ,limits: [5,10,20,50]
            ,limit: 10
            ,cols: [[ //表头
                {field: 'userName', title: '用户名',fixed: 'left'}
                ,{field: 'userRole', title: '用户角色'}
                ,{field: 'isDeveloper', event: 'developer', title: '是否开发', templet: '#setDev'}
                ,{title: '操作', event:'operation', fixed: 'right', toolbar: '#barDemo'}
            ]]
        });

        table.on('tool(test)',function (obj) {
            var data = obj.data;
            if(obj.event === 'developer'){
                $.post("/user/asDeveloper", {userId: data.userId, isDeveloper: isDev ? 1 : 0}, function (data) {
                    if (!data.result) {
                        layer.msg(data.msg);
                    }
                });
            } else if(obj.event === 'operation'){
                var userName = data.userName;
                $.post("/user/resetPassword", {userId: data.userId}, function (data) {
                    if (!data.result) {
                        layer.msg(data.msg);
                    } else {
                        layer.msg('用户【' + userName + '】的密码重置为123456', {
                            time: 2000 //2s后自动关闭
                        });
                    }
                });
            }
        });

        form.on('switch(setDeveloper)', function(obj){
            isDev = obj.elem.checked;
        });
    });
</script>
</html>
