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
    <table id="menuListTable" lay-filter="menuList"></table>
</div>
<script type="text/html" id="hiddenTpl">
    <input type="checkbox" name="hidden" value="{{d.hidden}}" lay-skin="switch" lay-text="是|否" lay-filter="hiddenDemo" {{d.hidden=='1'?'checked':'' }}>
</script>
<script type="text/html" id="switchTpl">
    <input type="checkbox" name="isAvailable" value="{{d.isAvailable}}" lay-skin="switch" lay-text="是|否" lay-filter="isAvailDemo" {{d.isAvailable=='1'?'checked':'' }}>
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
            elem: '#menuListTable'
            ,url: '/menu/getMenuList' //数据接口
            ,page: true //开启分页
            ,id: 'menuListTableReload'
            ,cols: [[ //表头
                {field: 'sysName',  align: 'center', title: '所属系统'}
                ,{field: 'menuName', align: 'center', sort: true, title: '菜单名称'}
                ,{field: 'menuIcon', align: 'center', sort: true, title: '图标'}
                ,{field: 'menuUrl', align: 'center', sort: true, title: '菜单路径'}
                ,{field: 'hidden', align: 'center', sort: true, title: '是否隐藏', templet: '#hiddenTpl'}
                ,{field: 'isAvailable', align: 'center', sort: true, title: '是否可用', templet: '#switchTpl'}
                ,{field: 'parentMenuName', align: 'center', sort: true, title: '上级菜单'}
                ,{field: 'menuFlag', align: 'center', sort: true, title: '菜单标志'}
            ]]
        });
    });
</script>
</body>
</html>
