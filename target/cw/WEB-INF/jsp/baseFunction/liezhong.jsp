<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/15
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>谜苑天涯-列中</title>
    <link rel="stylesheet" href="/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/myty.css" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<div style="padding: 15px;">
    <table id="liezhong" lay-filter="test"></table>
</div>

<script type="text/html" id="switchTpl">
    {{# if (d.is_right == 1) { }}
    <input type="checkbox" name="{{d.dm_temp_id}}" value="{{d.is_right}}" lay-filter="setLiezhong" lay-skin="switch" lay-text="列中|不中" checked >
    {{# } else { }}
    <input type="checkbox" name="{{d.dm_temp_id}}" value="{{d.is_right}}" lay-filter="setLiezhong" lay-skin="switch" lay-text="列中|不中" >
    {{# } }}
</script>
</body>
<script>
    var liezhongOrNot;
    layui.use(['table','form'], function(){
        var table = layui.table,
            form = layui.form;
        //第一个实例
        table.render({
            elem: '#liezhong'
            ,url: '/dengmiTemp/liezhong' //数据接口
            ,page: true //开启分页
            ,limits: [5,10,20,50]
            ,limit: 10
            ,cols: [[ //表头
                {field: 'dm_mimian', title: '谜面', width: 500, fixed: 'left'}
                ,{field: 'dm_mimu', title: '谜目'}
                ,{field: 'dm_midi', title: '谜底'}
                ,{field: 'user_answer', title: '异底'}
                ,{field: 'is_right',event:'liezhong', title: '列中', templet: '#switchTpl'}
            ]]
        });

        table.on('tool(test)',function (obj) {
            var data = obj.data;
            if(obj.event === 'liezhong'){
                $.post("/answer/saveIsright", {dmTempId: data.dm_temp_id, isRight: liezhongOrNot ? 1 : 0, userId: data.user_id}, function (data) {
                    if (!data.result) {
                        layer.msg(data.msg);
                    }
                });
            }
        });

        form.on('switch(setLiezhong)', function(obj){
            liezhongOrNot = obj.elem.checked;
        });
    });
</script>
</html>
