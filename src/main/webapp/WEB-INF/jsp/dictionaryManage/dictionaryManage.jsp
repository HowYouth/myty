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
    <table id="dictionaryListTable" lay-filter="dictionaryList"></table>
</div>
<script type="text/html" id="barDemo">
    <div class="layui-btn-group">
        <button type="button" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">编辑</button>
        <button type="button" class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">删除</button>
    </div>
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
                    ,content: '/page/toDictDetails/'+data.type+'/'+data.description //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.alert('编辑行：<br>'+ JSON.stringify(data))
            }
        });
    });
</script>
</body>
</html>
