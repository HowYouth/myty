<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/20
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>谜苑天涯-总得分榜</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/css/myty.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<div style="padding: 15px;">
    <table id="hisScore" lay-filter="test"></table>
</div>
</body>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#hisScore'
            ,url: '/answer/getCountScoreInfo' //数据接口
            ,page: true //开启分页
            ,id: 'dengmiTableReload'
            ,cols: [[ //表头
                {field: 'user_name', title: '用户名',fixed: 'left'}
                ,{field: 'times', sort: true, title: '参与次数'}
                ,{field: 'user_subject_score', sort: true, title: '制谜总得分'}
                ,{field: 'avg_subject_score', sort: true, title: '制谜评均得分'}
                ,{field: 'user_answer_score', sort: true, title: '猜射总得分'}
                ,{field: 'avg_answer_score', sort: true, title: '猜射平均得分'}
                ,{field: 'sum_score', sort: true, title: '总得分'}
                ,{field: 'avg_sum_score', sort: true, title: '总平均得分'}
            ]]
        });
    });
</script>
</html>
