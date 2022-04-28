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
<script type="text/html" id="barDemo">
    <div class="layui-btn-group">
        {{# if (d.delFlag == '0'){ }}
            <button type="button" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete" title="删除">
                <i class="layui-icon">&#xe640;</i>
            </button>
        {{# } else if (d.delFlag == '1'){ }}
            <button type="button" class="layui-btn layui-btn-xs" lay-event="rollback" title="恢复">
                <i class="layui-icon">&#xe9aa;</i>
            </button>
        {{# } }}
    </div>
</script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use(['table','util','element','layer'], function(){
        var table = layui.table
        ,element = layui.element
        ,layer = layui.layer
        ,util = layui.util;

        //第一个实例
        table.render({
            elem: '#dictionaryDetailsTable'
            ,url: '/dict/getDictDetails/${type}' //数据接口
            ,page: false //不开启分页
            ,id: 'dictionaryDetailsTableReload'
            ,cols: [[ //表头
                {field: 'id',  align: 'center', title: '序号'}
                ,{field: 'key',  align: 'center', title: '码值', edit:'text'}
                ,{field: 'value', align: 'center', sort: true, title: '取值', edit:'text'}
                ,{field: 'remarks', align: 'center', sort: true, title: '备注', edit:'text'}
                ,{field: 'delFlag', align: 'center', sort: true, templet: '#delFlagTpl', title: '状态'}
                ,{field: 'isAvailable', align: 'center', sort: true, templet: '#switchTpl', title: '是否可用', edit:'text'}
                ,{fixed: 'right', align: 'center', sort: true, title: '操作', toolbar: '#barDemo'}
            ]]
        });
        //监听单元格编辑
        table.on('edit(dictionaryDetails)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            console.log('data:',data);
            $.post("/dict/edit", data, function (resp) {
                console.log('resp', resp.success);
                if (resp.success) {
                    layer.msg('修改成功！', {
                        time: 1500
                    });
                } else {
                    layer.msg(resp.errorMsg, {
                        time: 1500
                    });
                }

            });
            table.reload('dictionaryDetailsTableReload', {
                url: '/dict/getDictDetails/'+data.type //数据接口
            });
        });
        //监听工具条
        table.on('tool(dictionaryDetails)', function(obj){
            var data = obj.data;
            if(obj.event === 'delete'){
                layer.open({
                    type: 0
                    ,content: '确定删除字典项'+data.type+'('+data.description + ')的' + data.key + '(' + data.value + ')' + '项吗?'
                    ,title: '警告'
                    ,btn: ['确定', '取消']
                    ,icon: 0
                    ,closeBtn: 2
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        $.post("/dict/deleteKey", data, function (resp) {
                            console.log('resp', resp.success);
                            if (resp.success) {
                                layer.close(index); //如果设定了回调，需进行手工关闭
                                layer.msg('删除成功！', {
                                    time: 1500
                                });
                                table.reload('dictionaryDetailsTableReload', {
                                    url: '/dict/getDictDetails/'+data.type //数据接口
                                });
                            } else {
                                layer.msg(resp.errorMsg, {
                                    time: 1500
                                });
                            }
                        });
                    }
                    ,btn2: function(index, layero){
                        //按钮【按钮二】的回调
                        // return false; //开启该代码可禁止点击该按钮关闭
                        layer.close(index); //如果设定了回调，需进行手工关闭
                    }
                });
            } else if(obj.event === 'rollback'){
                layer.open({
                    type: 0
                    ,content: '确定恢复字典项'+data.type+'('+data.description + ')的' + data.key + '(' + data.value + ')' + '项吗?'
                    ,title: '警告'
                    ,btn: ['确定', '取消']
                    ,icon: 0
                    ,closeBtn: 2
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        $.post("/dict/keyRollback", data, function (resp) {
                            console.log('resp', resp.success);
                            if (resp.success) {
                                layer.close(index); //如果设定了回调，需进行手工关闭
                                layer.msg('数据已恢复！', {
                                    time: 1500
                                });
                                table.reload('dictionaryDetailsTableReload', {
                                    url: '/dict/getDictDetails/'+data.type //数据接口
                                });
                            } else {
                                layer.msg(resp.errorMsg, {
                                    time: 1500
                                });
                            }
                        });
                    }
                    ,btn2: function(index, layero){
                        //按钮【按钮二】的回调
                        // return false; //开启该代码可禁止点击该按钮关闭
                        layer.close(index); //如果设定了回调，需进行手工关闭
                    }
                });
            }
        });
    });
</script>
</body>
</html>
