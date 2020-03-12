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
    <table id="liezhong_table" toolbar="#liezhong_tool" style="width: 100%"></table>
</div>
<div id="liezhong_tool" style="height:auto; text-align: center;">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">本页存盘</a>
</div>
</body>
<script type="text/javascript">
    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){
            return true;
        }
        if ($('#liezhong_table').datagrid('validateRow', editIndex)){
            $('#liezhong_table').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }

    function accept(){
        if (endEditing()){
            var data = $('#liezhong_table').datagrid('getChanges', "updated");
            console.log('data', data);
            if(data.length == 0){
                $.messager.alert('提示','您没有未保存的内容。');
                return;
            }
            var dmTempId = '';
            var isRight = '';
            var userId = '';
            for(var i = 0; i < data.length; i++){
                var item = data[i];
                dmTempId = item.dm_temp_id + '\t' + dmTempId;
                isRight = item.is_right + '\t' + isRight;
                userId = item.user_id + '\t' + userId;
            }
            $.post("/answer/saveIsright", {dmTempId: dmTempId, isRight: isRight, userId: userId}, function (data) {
                if (!data.result) {
                    $.messager.alert('提示',data.msg);
                } else {
                    $.messager.alert('提示','保存成功');
                }
            });
        }
    }

    $('#liezhong_table').datagrid({
        fit: true, //自适应高度
        singleSelect: true,
        idField: 'dm_temp_id',
        url: '/dengmiTemp/liezhong',
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
            ,{field: 'dm_midi', title: '谜底', width: setWidth(15)}
            ,{field: 'user_answer', title: '异底', width: setWidth(15)}
            ,{field: 'dm_mimianzhu', title: '注解', width: setWidth(30),
                formatter: function (value, rec, index) {
                    return (rec.dm_mimianzhu == null ? "" : rec.dm_mimianzhu) + (rec.dm_midizhu == null ? "" : rec.dm_midizhu);
                }
            }
            ,{field: 'is_right', title: '是否列中', width: setWidth(8),
                editor:{
                    type:'combobox',
                    options:{
                        valueField:'id',
                        textField:'value',
                        data:[
                            {"id":"0","value":"不中"},
                            {"id":"1","value":"列中"}
                        ]
                    }
                },
                formatter: function(value,row){
                    return value == 0 ? '<strong style="color: red;">不中</strong>' : '<strong style="color: green;">列中</strong>';
                },

            }
        ]],
        onClickCell: function (index, field, value) {
            if(field == 'is_right'){
                $('#liezhong_table').datagrid('beginEdit', index);
                if (editIndex != index){
                    if (endEditing()){
                        $('#liezhong_table').datagrid('selectRow', index)
                            .datagrid('beginEdit', index);
                        editIndex = index;
                    } else {
                        $('#liezhong_table').datagrid('selectRow', editIndex);
                    }
                }
            }
        }
    });

    function setWidth(percent) {
        return $("#liezhong_table").width() * percent / 100;
    }

    $('#liezhong_table').datagrid('getPager').pagination({
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh: function () {
            return true;
        }
    });
</script>
<%--<script>--%>
    <%--var liezhongOrNot;--%>
    <%--layui.use(['table','form'], function(){--%>
        <%--var table = layui.table,--%>
            <%--form = layui.form;--%>
        <%--//第一个实例--%>
        <%--table.render({--%>
            <%--elem: '#liezhong'--%>
            <%--,url: '/dengmiTemp/liezhong' //数据接口--%>
            <%--,page: true //开启分页--%>
            <%--,limits: [5,10,20,50]--%>
            <%--,limit: 10--%>
            <%--,cols: [[ //表头--%>
                <%--{field: 'dm_mimian', title: '谜面', width: 500, fixed: 'left'}--%>
                <%--,{field: 'dm_mimu', title: '谜目'}--%>
                <%--,{field: 'dm_midi', title: '谜底'}--%>
                <%--,{field: 'user_answer', title: '异底'}--%>
                <%--,{field: 'is_right',event:'liezhong', title: '列中', templet: '#switchTpl'}--%>
            <%--]]--%>
        <%--});--%>

        <%--table.on('tool(test)',function (obj) {--%>
            <%--var data = obj.data;--%>
            <%--if(obj.event === 'liezhong'){--%>
                <%--$.post("/answer/saveIsright", {dmTempId: data.dm_temp_id, isRight: liezhongOrNot ? 1 : 0, userId: data.user_id}, function (data) {--%>
                    <%--if (!data.result) {--%>
                        <%--layer.msg(data.msg);--%>
                    <%--}--%>
                <%--});--%>
            <%--}--%>
        <%--});--%>

        <%--form.on('switch(setLiezhong)', function(obj){--%>
            <%--liezhongOrNot = obj.elem.checked;--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>
</html>
