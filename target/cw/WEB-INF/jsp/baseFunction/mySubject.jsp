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
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <link rel="stylesheet" href="/css/myty.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<%--<div class="layui-row">--%>
    <%--<div class="borderColor loginDiv height-auto">--%>
        <%--<table class="layui-table">--%>
            <%--<tr>--%>
                <%--<th lay-data="{align:'center'}" colspan="5">本轮我输入的谜题</th>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<th><span>谜面</span></th>--%>
                <%--<th><span>谜目</span></th>--%>
                <%--<th><span>谜底</span></th>--%>
                <%--<th><span>谜面注解</span></th>--%>
                <%--<th><span>谜底注解</span></th>--%>
            <%--</tr>--%>
            <%--&lt;%&ndash;<c:if test="${empty list}">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>本轮没有输入谜题</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<c:otherwise>&ndash;%&gt;--%>
            <%--<c:forEach items="${data.list}" var="item" varStatus="status">--%>
                <%--<tr class="${status.index%2 == 0 ? 'cell-background-color-0' : 'cell-background-color-1'}">--%>
                    <%--<td>${item.dmMimian}</td>--%>
                    <%--<td>${item.dmMimu}</td>--%>
                    <%--<td>${item.dmMidi}</td>--%>
                    <%--<td>${item.dmMimianzhu}</td>--%>
                    <%--<td>${item.dmMidizhu}</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--&lt;%&ndash;</c:otherwise>&ndash;%&gt;--%>
        <%--</table>--%>
        <%--<div class="layui-btn-container">--%>
            <%--共${data.total}条 当前${data.currentPage}/${data.pageCount}页--%>
            <%--<button type="button" class="layui-btn">--%>
                <%--<span><a href="javascript:getMySubjects('${data.pageSize}', 1)">首页</a></span>--%>
            <%--</button>--%>
            <%--<c:if test="${data.currentPage > 1}">--%>
                <%--<button type="button" class="layui-btn">--%>
                    <%--<span><a href="javascript:getMySubjects('${data.pageSize}', '${data.currentPage - 1}')">上一页</a></span>--%>
                <%--</button>--%>
            <%--</c:if>--%>
            <%--<c:if test="${data.currentPage < data.pageCount}">--%>
                <%--<button type="button" class="layui-btn">--%>
                    <%--<span><a href="javascript:getMySubjects('${data.pageSize}', '${data.currentPage + 1}')">下一页</a></span>--%>
                <%--</button>--%>
            <%--</c:if>--%>
            <%--<button type="button" class="layui-btn">--%>
                <%--<span><a href="javascript:getMySubjects('${data.pageSize}', '${data.pageCount}')">尾页</a></span>--%>
            <%--</button>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<jsp:include page="../frame/bottom.jsp"></jsp:include>--%>
<div style="padding: 15px;">
    <table id="demo" lay-filter="test"></table>
</div>
</body>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,url: '/dengmiTemp/toMySubject' //数据接口
            ,page: true //开启分页
            ,limits: [5,10,20,50]
            ,limit: 10
            ,cols: [[ //表头
                {field: 'dmMimian', title: '谜面', width: 500, fixed: 'left'}
                ,{field: 'dmMimu', title: '谜目'}
                ,{field: 'dmMidi', title: '谜底'}
                ,{field: 'dmMimianzhu', title: '谜面注解'}
                ,{field: 'dmMidizhu', title: '谜底注解'}
            ]]
        });
    });
</script>
</html>
