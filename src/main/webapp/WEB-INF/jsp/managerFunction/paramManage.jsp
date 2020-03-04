<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/12/26
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>谜苑天涯-参数管理</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/css/myty.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<div style="padding: 15px;">
    <table id="paramManage" lay-filter="test"></table>
</div>
<script type="text/html" id="barDemo">
    <input class="layui-btn layui-btn-fluid" type="button" value="删除">
</script>
</body>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#paramManage'
            ,url: '/param/getAllParam' //数据接口
            ,page: true //开启分页
            ,limits: [5,10,20,50]
            ,limit: 10
            ,id:'paramTable'
            ,cols: [[ //表头
                {field: 'paramId', title: '参数名称',fixed: 'left'}
                ,{field: 'paramValue', edit:'text', title: '参数值'}
                ,{field: 'paramDesc',edit:'text', title: '描述'}
                ,{title: '操作', event:'deleteParam', fixed: 'right', toolbar: '#barDemo'}
            ]]
        });

        table.on('edit(test)', function (obj) { //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            $.post("/param/updateParam", {paramId: data.paramId, colName: field, colValue: value}, function (data) {
                if (!data.result) {
                    layer.msg(data.msg);
                } else {
                    layer.msg('参数修改成功', {
                        time: 2000 //2s后自动关闭
                    });
                }
            });
        });

        table.on('tool(test)',function (obj) {
            var data = obj.data;
            if(obj.event === 'deleteParam'){
                var paramId = data.paramId;
                $.post("/param/deleteParam", {paramId: data.paramId}, function (data) {
                    if (!data.result) {
                        layer.msg(data.msg);
                    } else {
                        table.reload('paramTable', {
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        });
                        layer.msg('参数【' + paramId + '】已删除', {
                            time: 2000 //2s后自动关闭
                        });
                    }
                });
            }
        });
    });
</script>
</html>
