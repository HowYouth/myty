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
<script type="text/html" id="switchTpl">
    <input type="checkbox" name="isAvailable" value="{{d.isAvailable}}" lay-skin="switch" lay-text="是|否" lay-filter="isAvailDemo" {{d.isAvailable=='1'?'checked':'' }}>
</script>
<script type="text/html" id="delFlagTpl">
    <input type="checkbox" name="delFlag" value="{{d.delFlag}}" lay-skin="switch" lay-text="未删除|已删除" lay-filter="delFlagDemo" {{d.delFlag=='0'?'checked':'' }}>
</script>
<div style="width: 100%; height: 100%;">
    <table class="layui-table">
        <tr>
            <th>类型</th>
            <td>${type}</td>
            <th>描述</th>
            <td>${description}</td>
        </tr>
    </table>
    <table id="dictionaryDetailsTable" lay-filter="dictionaryDetails"></table>
</div>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
    });
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#dictionaryDetailsTable'
            ,url: '/dict/getDictDetails/${type}' //数据接口
            ,page: false //不开启分页
            ,id: 'dictionaryDetailsTableReload'
            ,cols: [[ //表头
                {field: 'id',  align: 'center', title: '序号'}
                ,{field: 'key',  align: 'center', title: '码值'}
                ,{field: 'value', align: 'center', sort: true, title: '取值'}
                ,{field: 'remarks', align: 'center', sort: true, title: '备注'}
                ,{field: 'delFlag', align: 'center', sort: true, templet: '#delFlagTpl', title: '状态'}
                ,{field: 'isAvailable', align: 'center', sort: true, templet: '#switchTpl', title: '是否可用'}
            ]]
        });
    });
</script>
</body>
</html>
