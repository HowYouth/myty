<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/11/20
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>谜苑天涯-本轮得分</title>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item  layui-inline">
        <label class="layui-form-label">轮次</label>
        <div class="layui-input-block" style="width: 300px;">
            <select id="roundNo" name="roundNo" lay-verify="required" lay-filter="brickType">
            </select>
        </div>
    </div>
</form>
<div style="padding: 15px;">
    <table id="thisScore" lay-filter="test"></table>
</div>
<script type="text/html" id="authorTemplet">
    <a lay-event="showDetail" class="layui-table-link">{{d.user_name}}</a>
</script>
</body>
<script>
    $.ajax({
        url : "/agenda/getAllAgenda",
        data : {},
        dataType : "json",
        success : function(resultData) {
            $("#roundNo").empty();
            if(resultData.code == 0){
                console.log('轮次',resultData.data);
                $("#roundNo").append(new Option("请选择轮次", ""));
                $.each(resultData.data, function(index, item) {
                    console.log('item',item);
                    $('#roundNo').append(new Option("第" + item.roundNo + "轮", item.roundNo));
                });
            }else{
                $("#roundNo").append(new Option("暂无数据", ""));
            }
            layui.form.render("select");
        }
    });
    layui.use(['table','form'], function(){
        var table = layui.table,
            form=layui.form;
        //第一个实例
        table.render({
            elem: '#thisScore'
            ,url: '/answer/getScoreInfo' //数据接口
            ,page: true //开启分页
            ,id: 'dengmiTableReload'
            ,cols: [[ //表头
                {field: 'user_name', title: '用户名',fixed: 'left', templet:'#authorTemplet'}
                ,{field: 'sumScore', sort: true, title: '总积分'}
                ,{field: 'userAnsScore', sort: true, title: '猜射得分'}
                ,{field: 'userSubScore', sort: true, title: '制谜得分'}
            ]]
        });

        form.on('select(brickType)', function(data){
            console.log(data);
            var demoReload = $('#roundNo');
            //执行重载
            table.reload('dengmiTableReload', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                //根据条件查询
                ,where: {
                    roundNo:demoReload.val()
                }
            });
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(data);
            //formData = data;
            if(obj.event === 'showDetail'){
                layer.open({
                    //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                    type:1,
                    title:"用户参赛信息",
                    area: ['90%','90%'],
                    content: '<div><table id="userScoreDetailTable"></table><table id="userCompetitionDetailTable"></table></div>',
                    success : function(index, layero) {
                        table.render({
                            elem: '#userScoreDetailTable'
                            ,url: '/util/userScoreDetailTable?userId=' + data.userId //数据接口
                            ,page: true //开启分页
                            ,cols: [[ //表头
                                {field: 'dm_author_name', title: '用户名', width:400, fixed: 'left'}
                                ,{field: 'user_subject_score', title: '制谜总分'}
                                ,{field: 'user_answer_score', title: '猜射总分'}
                            ]]
                        });
                        table.render({
                            elem: '#userCompetitionDetailTable'
                            ,url: '/util/userCompetitionDetail?userId='+data.userId + '&roundNo=' + data.agendaRoundNo //数据接口
                            ,page: true //开启分页
                            ,cols: [[ //表头
                                {field: 'dm_mimian', title: '谜面', width:400, fixed: 'left'}
                                ,{field: 'dm_mimu', title: '谜目/谜格'}
                                ,{field: 'dm_midi', title: '谜底'}
                                ,{field: 'dm_mimianzhu', title: '谜面注解'}
                                ,{field: 'dm_midizhu', title: '谜底注解'}
                                ,{field: 'user_subject_score', title: '评分'}
                                ,{field: 'right_proportion', title: '命中率'}
                                ,{field: 'rownum', title: '名次'}
                            ]]
                        });
                    }
                });
            }
        });
    });
</script>
</html>
