<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="fns" uri="http://mycompany.com" %>--%>
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
<div style="float: left; margin-top: 8px; height: 92%; width: 10%; background-color: #DAA520">
    <jsp:include page="/page/left/${menuId}"></jsp:include>
</div>
<script type="text/html" id="toolbarDemo">
    <div class="demoTable">
        用户名称：
        <div class="layui-inline">
            <input class="layui-input" name="userName" id="userName" autocomplete="off" placeholder="用户名称，支持模糊查询">
        </div>
        登录名：
        <div class="layui-inline">
            <input class="layui-input" name="loginName" id="loginName" autocomplete="off" placeholder="登录名，支持模糊查询">
        </div>
        <button class="layui-btn" data-type="reload">搜索</button>
    </div>
</script>
<div style="float: right; border-right: 1px solid greenyellow; border-left: 1px solid greenyellow; height: 92%;margin-top: 10px; margin-right: 15px; width: 88%">
    <table id="userListTable" lay-filter="userList"></table>
</div>
<script type="text/html" id="genderFormat">
    <input type="checkbox" name="gender" value="{{d.gender}}" lay-skin="switch" lay-text="男|女" lay-filter="genderDemo" {{d.gender=='M'?'checked':'' }}>
</script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use(['table','element','layer'], function(){
        var table = layui.table
            ,element = layui.element
            ,layer = layui.layer;
        //第一个实例
        table.render({
            elem: '#userListTable'
            ,url: '/user/getUserList' //数据接口
            ,page: true //开启分页
            ,id: 'userListTableReload'
            // ,toolbar: 'default'
            ,title: '用户数据'
            ,defaultToolbar: ['filter', 'exports', 'print']
            ,toolbar: '#toolbarDemo'
            ,cols: [[ //表头
                {field: 'id',  align: 'center', title: 'ID'}
                ,{field: 'loginName', align: 'center', sort: true, title: '登录名', edit:'text'}
                ,{field: 'password', align: 'center', sort: true, title: '密码', edit: 'text'}
                ,{field: 'userName', align: 'center', sort: true, title: '用户名称', edit:'text'}
                ,{field: 'gender', align: 'center', sort: true, templet: '#genderFormat', title: '性别'}
            ]]
        });

        //监听单元格编辑
        table.on('edit(userList)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            console.log('data:',data);
            $.post("/user/edit", data, function (resp) {
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
            table.reload('userListTableReload', {
                url: '/user/getUserList' //数据接口
            });
        });

        //监听顶部工具栏
        table.on('toolbar(userList)', function(obj){
            if(obj.event === 'addUser'){
                var sysId = $('#systemId').val();
                var userId = $('#loginUserId').val();
                $.post("/page/toUserAdd", {systemId: sysId, userId: userId}, function(resp){
                    console.log('resp', resp)
                }, "json")
            }
        });

        $('.demoTable .layui-btn').on('click', function(){
            table.reload('userListTableReload', {
                url: '/user/getUserList' //数据接口
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    key: {
                        id: demoReload.val()
                    }
                }
            });
            layer.msg('查询成功！', {
                time: 1500
            });
        });
    });
</script>
</body>
</html>
