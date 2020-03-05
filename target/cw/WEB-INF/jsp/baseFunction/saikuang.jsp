<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/15
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>谜苑天涯-赛况</title>
    <link rel="stylesheet" type="text/css" href="/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css">
    <link rel="stylesheet" href="/font/iconfont.css">
    <link rel="stylesheet" href="/css/mycss.css">
    <script type="text/javascript" src="/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script src="/font/iconfont.js"></script>
</head>
<body>
<div style="width: 100%; height: 100%">
    <table id="saikuang_table" style="width: 100%;"></table>
</div>
</body>
<%--当前赛况--%>
<script type="text/javascript">
    $('#saikuang_table').datagrid({
        // title:'当前赛况',
        fit:true, //自适应高度
        singleSelect: true,
        nowrap: false,
        url: '/saikuang/dangqiansaikuang',
        rownumbers: true,
        pagination: false,
        pageList: [10, 20, 50, 100],
        columns: [[
            {field: 'user_id', title: '用户id', width: setWidth(49), hidden: true}
            , {field: 'user_name', title: '用户名称', width: setWidth(49)}
            , {field: 'count', title: '计数', width: setWidth(49)}
        ]]
    });

    function setWidth(percent){
        return $("#saikuang_table").width() * percent / 100;
    }

    $('#saikuang_table').datagrid('getPager').pagination({
        // showPageList:true,
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh: function () {
            return true;
        }
    });
</script>
</html>
