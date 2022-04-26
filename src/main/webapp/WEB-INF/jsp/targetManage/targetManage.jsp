<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div style="width: 100%; height: 100%; padding-top: 50px;">
    <table id="targetListTable" lay-filter="targetList"></table>
</div>
<script type="text/html" id="nullableTpl">
    <input type="checkbox" name="nullalbe" value="{{d.nullalbe}}" lay-skin="switch" lay-text="是|否" lay-filter="nullalbeDemo" {{d.nullalbe=='1'?'checked':'' }}>
</script>
<script type="text/html" id="isPkTpl">
    <input type="checkbox" name="isPk" value="{{d.isPk}}" lay-skin="switch" lay-text="是|否" lay-filter="nullalbeDemo" {{d.isPk=='1'?'checked':'' }}>
</script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#targetListTable'
            ,url: '/target/getTargetList' //数据接口
            ,page: true //开启分页
            ,id: 'targetListTableReload'
            ,cols: [[ //表头
                {field: 'enName',  align: 'center', title: '字段名',fixed: 'left'}
                ,{field: 'cnName', align: 'center', sort: true, title: '中文描述'}
                ,{field: 'dataType', align: 'center', sort: true, title: '数据类型'}
                ,{field: 'length', align: 'center', sort: true, title: '字段长度'}
                ,{field: 'nullalbe', align: 'center', sort: true, title: '可为空', templet: '#nullableTpl'}
                ,{field: 'isPk', align: 'center', sort: true, title: '主键', templet: '#isPkTpl'}
                ,{field: 'defaultValue', align: 'center', sort: true, title: '默认值'}
            ]]
        });
    });
</script>
</body>
</html>
