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
    <title>谜苑天涯-评分</title>
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
    <table id="pingfen_table" toolbar="#pingfen_tool" style="width: 100%"></table>
</div>
<div id="pingfen_tool" style="height:auto; text-align: center;">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">本页存盘</a>
</div>
</body>
<script type="text/javascript">
    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){
            return true;
        }
        if ($('#pingfen_table').datagrid('validateRow', editIndex)){
            $('#pingfen_table').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }

    function accept(){
        if (endEditing()){
            var data = $('#pingfen_table').datagrid('getChanges', "updated");
            console.log('data', data);
            if(data.length == 0){
                $.messager.alert('提示','您没有未保存的内容。');
                return;
            }
            var dmTempId = '';
            var userJudge = '';
            for(var i = 0; i < data.length; i++){
                var item = data[i];
                if(item.user_judge > 10 || item.user_judge < 0){
                    $.messager.alert('提示','评分只能是0-10的整数。');
                    return;
                }
                dmTempId = item.dm_temp_id + '\t' + dmTempId;
                userJudge = item.user_judge + '\t' + userJudge;
            }
            $.post("/answer/saveMyJudge", {dmTempId: dmTempId, userJudge: userJudge}, function (data) {
                if (!data.result) {
                    $.messager.alert('提示',data.msg);
                } else {
                    $.messager.alert('提示','保存成功');
                }
            });
        }
    }

    $('#pingfen_table').datagrid({
        fit: true, //自适应高度
        singleSelect: true,
        idField: 'dm_temp_id',
        url: '/dengmiTemp/pingfen',
        rownumbers: true,
        pagination: true,
        nowrap: false,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {field: 'dm_mimian', title: '谜面', width: setWidth(20)}
        ]],
        columns: [[
            {field: 'dm_temp_id', title: 'ID', hidden: true}
            ,{field: 'dm_mimu', title: '谜目', width: setWidth(10)}
            ,{field: 'dm_mimianzhu', title: '注解', width: setWidth(30),
                formatter: function (value, rec, index) {
                    return (rec.dm_mimianzhu == null ? "" : rec.dm_mimianzhu) + (rec.dm_midizhu == null ? "" : rec.dm_midizhu);
                }}
            ,{field: 'dm_midi', title: '谜底', width: setWidth(15)}
            ,{field: 'user_answer', title: '我的谜底', width: setWidth(15)}
            ,{field: 'user_judge', title: '评分', width: setWidth(8), editor: 'numberbox'}
        ]],
        onClickCell: function (index, field, value) {
            if (field == 'user_judge') {
                $('#input_answer_table').datagrid('beginEdit', index);
                if (editIndex != index){
                    if (endEditing()){
                        $('#pingfen_table').datagrid('selectRow', index)
                            .datagrid('beginEdit', index);
                        editIndex = index;
                    } else {
                        $('#pingfen_table').datagrid('selectRow', editIndex);
                    }
                }
            }
        }
    });

    function setWidth(percent) {
        return $("#pingfen_table").width() * percent / 100;
    }

    $('#pingfen_table').datagrid('getPager').pagination({
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh: function () {
            return true;
        }
    });
</script>
<%--<script>--%>
    <%--layui.use('table', function(){--%>
        <%--var table = layui.table;--%>

        <%--//第一个实例--%>
        <%--table.render({--%>
            <%--elem: '#pingfen'--%>
            <%--,url: '/dengmiTemp/pingfen' //数据接口--%>
            <%--,page: true //开启分页--%>
            <%--,limits: [5,10,20,50]--%>
            <%--,limit: 10--%>
            <%--,cols: [[ //表头--%>
                <%--{field: 'dm_mimian', title: '谜面', width: 500, fixed: 'left'}--%>
                <%--,{field: 'dm_mimu', title: '谜目'}--%>
                <%--,{field: 'dm_mimianzhu', title: '谜面注解'}--%>
                <%--,{field: 'dm_midizhu', title: '谜底注解'}--%>
                <%--,{field: 'dm_midi', title: '谜底'}--%>
                <%--,{field: 'user_answer', title: '我的谜底'}--%>
                <%--,{field: 'user_judge',edit: 'text', title: '评分'}--%>
            <%--]]--%>
        <%--});--%>

        <%--table.on('edit(test)', function (obj) { //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"--%>
            <%--var value = obj.value //得到修改后的值--%>
                <%--, data = obj.data //得到所在行所有键值--%>
                <%--, field = obj.field; //得到字段--%>
            <%--if(value > 10 || value < 0){--%>
                <%--layer.msg('请输入0-10的评分', {--%>
                    <%--time: 2000, //2s后自动关闭--%>
                    <%--btn: ['明白了']--%>
                <%--});--%>
            <%--} else {--%>
                <%--$.post("/answer/saveMyJudge", {dmTempId: data.dm_temp_id, judge: value}, function (data) {--%>
                    <%--if (!data.result) {--%>
                        <%--layer.msg(data.msg);--%>
                    <%--}--%>
                <%--});--%>
            <%--}--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>
</html>
