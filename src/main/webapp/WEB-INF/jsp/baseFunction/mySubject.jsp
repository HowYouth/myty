<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/7
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>谜苑天涯-我的谜题</title>
    <link rel="stylesheet" type="text/css" href="/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css">
    <link rel="stylesheet" href="/font/iconfont.css">
    <link rel="stylesheet" href="/css/mycss.css">
    <script type="text/javascript" src="/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/myjs.js"></script>
    <script src="/font/iconfont.js"></script>
</head>
<body>
<div style="padding: 15px; width: 100%; height: 100%;">
    <table id="my_subject_table" toolbar="#my_subject_search_tool" style="width: 100%"></table>
</div>
<div id="my_subject_search_tool" >
    <form action="/export/exportSubject" id="export-form-mySubject" method="post">
        <input name="roundNo" value="${roundNo}" hidden/>
        <input name="tabs" value="mySubject" hidden/>
        <input name="fanwei" value="1" hidden/>
        <input name="type"  hidden id="type"/>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="submitExportForm(1)">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-export"></use>
            </svg>
            导出为Excel
        </a>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="submitExportForm(0)">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-export"></use>
            </svg>
            导出为txt
        </a>
    </form>
</div>
</body>
<script type="text/javascript">
    function submitExportForm(param){
        $('#type').val(param);
        $('#export-form-mySubject').submit();
    }

    $('#my_subject_table').datagrid({
        fit: true, //自适应高度
        singleSelect: true,
        idField: 'dmTempId',
        url: '/dengmiTemp/toMySubject',
        rownumbers: true,
        pagination: true,
        nowrap: false,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {field: 'dmMimian', title: '谜面', width: setWidth(20)}
        ]],
        columns: [[
            {field: 'dmTempId', title: 'ID', hidden: true}
            ,{field: 'dmMimu', title: '谜目', width: setWidth(18)}
            ,{field: 'dmMidi', title: '谜底', width: setWidth(20)}
            ,{field: 'dmMimianzhu', title: '注解', width: setWidth(40),
                formatter: function (value, rec, index) {
                    console.log(rec);
                    console.log(index);
                    return (rec.dmMimianzhu == null ? "" : rec.dmMimianzhu) + (rec.dmMidizhu == null ? "" : rec.dmMidizhu);
                }
            }
        ]]
    });

    function doSearch() {
        $('#my_subject_table').datagrid('load', {
            roundNo: $('#roundNo_my_subject').combobox("getValue")
        });
    }

    function setWidth(percent) {
        return $("#my_subject_table").width() * percent / 100;
    }

    $('#my_subject_table').datagrid('getPager').pagination({
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
