<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/8
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>谜苑天涯-输入谜题</title>
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
<div style="padding: 15px;background-color: #996600; color: wheat;">
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
    <table id="input_mySubject_table" toolbar="#input_mySubject_tool" style="width: 100%"></table>
</div>
<div id="input_mySubject_tool" style="height:auto; text-align: center;">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">本页存盘</a>
</div>
</body>
<script type="text/javascript">
    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){
            return true;
        }
        if ($('#input_mySubject_table').datagrid('validateRow', editIndex)){
            $('#input_mySubject_table').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }

    function accept(){
        if (endEditing()){
            var data = $('#input_mySubject_table').datagrid('getChanges', "updated");
            console.log('data', data);
            if(data.length == 0){
                $.messager.alert('提示','您没有未保存的内容。');
                return;
            }
            var dmTempId = '';
            var dmMimian = '';
            var dmMimu = '';
            var dmMidi = '';
            var dmMimianzhu = '';
            var dmMidizhu = '';
            for(var i = 0; i < data.length; i++){
                var item = data[i];
                dmTempId = item.dmTempId + '\t' + dmTempId;
                dmMimian = item.dmMimian + '\t' + dmMimian;
                dmMimu = item.dmMimu + '\t' + dmMimu;
                dmMidi = item.dmMidi + '\t' + dmMidi;
                dmMimianzhu = item.dmMimianzhu + '\t' + dmMimianzhu;
                dmMidizhu = item.dmMidizhu + '\t' + dmMidizhu;
            }
            $.post("/dengmiTemp/submitMySubject", {
                dmTempId: dmTempId,
                dmMimian: dmMimian,
                dmMimu: dmMimu,
                dmMidi: dmMidi,
                dmMimianzhu: dmMimianzhu,
                dmMidizhu: dmMidizhu
            }, function (data) {
                if (!data.result) {
                    $.messager.alert('提示',data.msg);
                } else {
                    $.messager.alert('提示','保存成功');
                }
            });
            // $('#input_mySubject_table').datagrid('load', {
            // });
        }
    }

    $('#input_mySubject_table').datagrid({
        fit: true, //自适应高度
        singleSelect: true,
        idField: 'dmTempId',
        url: '/dengmiTemp/inputMySubject',
        rownumbers: true,
        pagination: true,
        nowrap: false,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {field: 'dmMimian', editor: 'text', title: '谜面', width: setWidth(20)}
        ]],
        columns: [[
            {field: 'dmTempId', title: 'ID', hidden: true}
            , {field: 'dmMimu', editor: 'text', title: '谜目/谜格', width: setWidth(15)}
            , {field: 'dmMidi', editor: 'text', title: '谜底', width: setWidth(15)}
            , {field: 'dmMimianzhu', editor: 'text', title: '谜面注解', width: setWidth(18)}
            , {field: 'dmMidizhu', editor: 'text', title: '谜底注解', width: setWidth(18)}
            , {field: 'louchunzi', title: '露春字', width: setWidth(9),
                formatter: function (value, rec, index) {
                    return '<span style="color: red;">' + (value == null ? '' : value) + '</span>';
                }
            }
        ]],
        onClickCell: function (index, field, value) {
            $('#input_mySubject_table').datagrid('beginEdit', index);
            if (editIndex != index){
                if (endEditing()){
                    $('#input_mySubject_table').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                    editIndex = index;
                } else {
                    $('#input_mySubject_table').datagrid('selectRow', editIndex);
                }
            }
        }
    });

    function setWidth(percent) {
        return $("#input_mySubject_table").width() * percent / 100;
    }

    $('#input_mySubject_table').datagrid('getPager').pagination({
        // showPageList:true,
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh: function () {
            return true;
        }
    });
</script>
<%--<script>--%>
    <%--layui.use('table', function () {--%>
        <%--var table = layui.table;--%>

        <%--//第一个实例--%>
        <%--table.render({--%>
            <%--elem: '#demo'--%>
            <%--, url: '/dengmiTemp/inputMySubject' //数据接口--%>
            <%--, page: false //开启分页--%>
            <%--, cols: [[ //表头--%>
                <%--{field: 'dmMimian', edit: 'text', title: '谜面', fixed: 'left'}--%>
                <%--, {field: 'dmMimu', edit: 'text', title: '谜目/谜格'}--%>
                <%--, {field: 'dmMidi', edit: 'text', title: '谜底'}--%>
                <%--, {field: 'dmMimianzhu', edit: 'text', title: '谜面注解'}--%>
                <%--, {field: 'dmMidizhu', edit: 'text', title: '谜底注解'}--%>
            <%--]]--%>
        <%--});--%>


        <%--table.on('edit(test)', function (obj) { //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"--%>
            <%--var value = obj.value //得到修改后的值--%>
                <%--, data = obj.data //得到所在行所有键值--%>
                <%--, field = obj.field; //得到字段--%>
            <%--$.post("/dengmiTemp/submitMySubject", {dmTempId: data.dmTempId, colName: field, colValue: value}, function (data) {--%>
                <%--if (!data.result) {--%>
                    <%--layer.msg(data.msg);--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>
</html>
