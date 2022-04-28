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
    <table id="dictionaryListTable" lay-filter="dictionaryList" lay-data="{id: 'dictionaryListData'}"></table>
</div>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group">
        <button type="button" class="layui-btn layui-btn-xs" lay-event="detail" title="编辑">
            <i class="layui-icon">&#xe642;</i>
        </button>
        <button type="button" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete" title="删除">
            <i class="layui-icon">&#xe640;</i>
        </button>
    </div>
</script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use(['table','element','layer'], function(){
        var table = layui.table
        ,element = layui.element
        ,layer = layui.layer;
        //第一个实例
        table.render({
            elem: '#dictionaryListTable'
            ,url: '/dict/getDictList' //数据接口
            ,page: true //开启分页
            ,id: 'dictionaryListTableReload'
            ,cols: [[ //表头
                {field: 'type',  align: 'center', title: '字典类型'}
                ,{field: 'description', align: 'center', sort: true, title: '类型描述'}
                ,{fixed: 'right', align: 'center', sort: true, title: '操作', toolbar: '#barDemo'}
            ]]
        });
        //监听工具条
        table.on('tool(dictionaryList)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.open({
                    type: 2
                    ,title: '字典项' + data.type + '(' + data.description + ')'
                    ,area:['1000px', '400px']
                    ,closeBtn: 2
                    ,maxmin: true
                    ,content: ['/page/toDictDetails/'+data.type+'/'+data.description, 'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            } else if(obj.event === 'delete'){
                layer.open({
                    type: 0
                    ,content: '确定删除字典项'+data.type+'('+data.description + ')?'
                    ,title: '警告'
                    ,btn: ['确定', '取消']
                    ,icon: 0
                    ,closeBtn: 2
                    ,yes: function(index, layero){
                        //按钮【按钮一】的回调
                        $.post("/dict/deleteDict", data, function (resp) {
                            console.log('resp', resp.success);
                            if (resp.success) {
                                layer.close(index); //如果设定了回调，需进行手工关闭
                                layer.msg('删除成功！', {
                                    time: 1500
                                });
                                table.reload('dictionaryListTableReload', {
                                    url: '/dict/getDictList' //数据接口
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
