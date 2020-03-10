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
<div style="padding: 15px;background-color: #996600; color: #fff;">
    小贴士:
</div>
<div style="padding: 4px; border-left: 1px solid #996600; border-right: 1px solid #996600">
    1.集锦谜谜底用/隔开，注意用半角符号，而不是全角符号“／”。
</div>
<div style="padding: 4px; border-left: 1px solid #996600; border-right: 1px solid #996600">
    2.探骊、隐目等带目的谜底或谜目为“某某冠某”、“某某带某”之类者，谜底连写，不加分隔符号。
</div>
<div style="padding: 4px; border-left: 1px solid #996600; border-right: 1px solid #996600">
    3.谜目与谜格之间用/或者·隔开，不必用括号将谜目括起来。
</div>
<div style="padding: 4px; border-left: 1px solid #996600; border-right: 1px solid #996600">
    4.谜面注解栏用于对谜面出处等作一简单注释，猜射和评谜时将显示出来。可不填。
</div>
<div style="padding: 4px; border-left: 1px solid #996600; border-right: 1px solid #996600;border-bottom: 1px solid #996600">
    5.谜底注解栏用于对谜面和谜底扣合的可能引起误会之处作一注解，评分时将显示谜底注解，以免出现误评。可不填。
</div>
<div style="padding: 15px; width: 100%; height: 73%;">
    <%--<table id="demo" lay-filter="test"></table>--%>
    <table id="input_answer_table" toolbar="#input_answer_tool" style="width: 100%"></table>
</div>
<div id="input_answer_tool" style="height:auto; text-align: center;">
    <form action="/export/exportSubject" id="export-form-inputAnswer" method="post">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">本页存盘</a>
        <input name="roundNo" value="${roundNo}" hidden/>
        <input name="tabs" value="inputAnswer" hidden/>
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
        $('#export-form-inputAnswer').submit();
    }

    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){
            return true;
        }
        if ($('#input_answer_table').datagrid('validateRow', editIndex)){
            $('#input_answer_table').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }

    function accept(){
        if (endEditing()){
            var data = $('#input_answer_table').datagrid('getChanges', "updated");
            console.log('data', data);
            var dmTempId = '';
            var dmMidi = '';
            for(var i = 0; i < data.length; i++){
                var item = data[i];
                dmTempId = item.dm_temp_id + '\t' + dmTempId;
                dmMidi = item.user_answer + '\t' + dmMidi;
            }
            $.post("/answer/saveMyAnswer", {dmTempId: dmTempId, dmMidi: dmMidi}, function (data) {
                if (!data.result) {
                    $.messager.alert('提示',data.msg);
                }
            });
        }
    }

    $('#input_answer_table').datagrid({
        fit: true, //自适应高度
        singleSelect: true,
        idField: 'dm_temp_id',
        url: '/dengmiTemp/noAnswerSubject',
        rownumbers: true,
        pagination: true,
        nowrap: false,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {field: 'dm_mimian', title: '谜面', width: setWidth(20)}
        ]],
        columns: [[
            {field: 'dm_temp_id', title: 'ID', hidden: true}
            ,{field: 'dm_mimu', title: '谜目', width: setWidth(18)}
            ,{field: 'user_answer', title: '谜底', width: setWidth(20), editor:'text'}
            , {field: 'dm_mimianzhu', title: '谜面注解', width: setWidth(40)}
        ]],
        onClickCell: function (index, field, value) {
            if (field == 'user_answer') {
                $('#input_answer_table').datagrid('beginEdit', index);
                if (editIndex != index){
                    if (endEditing()){
                        $('#input_answer_table').datagrid('selectRow', index)
                            .datagrid('beginEdit', index);
                        editIndex = index;
                    } else {
                        $('#input_answer_table').datagrid('selectRow', editIndex);
                    }
                }
            }
        }
    });

    function setWidth(percent) {
        return $("#input_answer_table").width() * percent / 100;
    }

    $('#input_answer_table').datagrid('getPager').pagination({
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
