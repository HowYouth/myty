<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>谜苑天涯-比赛结果</title>
    <link rel="stylesheet" type="text/css" href="/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css">
    <link rel="stylesheet" href="/font/iconfont.css">
    <link rel="stylesheet" href="/css/mycss.css">
    <script type="text/javascript" src="/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script src="/font/iconfont.js"></script>
</head>
<body>
<div class="easyui-tabs" style="width:99%;height:98%;">
    <div title="本轮得分" iconCls="iconfont icon-defen" style="padding:10px;">
        <table id="this_score_table" toolbar="#this_score_search_tool" style="width: 100%"></table>
    </div>
    <div title="总积分榜" iconCls="iconfont icon-zongdefen" style="padding:10px;">
        <table id="his_score_table" style="width: 100%"></table>
    </div>
    <div title="猜射成绩榜" iconCls="iconfont icon-cai" style="padding:10px;">
        <table id="answer_score_table" toolbar="#answer_score_search_tool" style="width: 100%"></table>
    </div>
    <div title="制谜成绩榜" iconCls="iconfont icon-zhi" style="padding:10px;">
        <table id="subject_score_table" toolbar="#subject_score_search_tool" style="width: 100%"></table>
    </div>
    <div title="佳谜榜" iconCls="iconfont icon-jia" style="padding:10px;">
        <table id="good_subject_table" toolbar="#good_subject_search_tool" style="width: 100%"></table>
    </div>
    <div title="全部谜题" iconCls="iconfont icon-quan" style="padding:10px;">
        <table id="all_subject_table" toolbar="#all_subject_search_tool" style="width: 100%"></table>
    </div>
</div>
<div id="this_score_search_tool" style="padding:3px">
    <span>轮次:</span>
    <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_this_score" style="width: 100px; line-height:26px;border:1px solid #ccc"></select>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doThisScoreSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-chaxun"></use>
        </svg>
        查询
    </a>
</div>
<div id="answer_score_search_tool" style="padding:3px">
    <span>轮次:</span>
    <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_answer_score" style="width: 100px; line-height:26px;border:1px solid #ccc"></select>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doAnswerScoreSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-chaxun"></use>
        </svg>
        查询
    </a>
</div>
<div id="subject_score_search_tool" style="padding:3px">
    <span>轮次:</span>
    <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_subject_score" style="width: 100px; line-height:26px;border:1px solid #ccc"></select>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doSubjectScoreSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-chaxun"></use>
        </svg>
        查询
    </a>
</div>
<div id="good_subject_search_tool" style="padding:3px">
    <span>轮次:</span>
    <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_good_subject" style="width: 100px; line-height:26px;border:1px solid #ccc"></select>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doGoodSubjectSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-chaxun"></use>
        </svg>
        查询
    </a>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doGoodSubjectSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-export"></use>
        </svg>
        导出
    </a>
</div>
<div id="all_subject_search_tool" style="padding:3px">
    <span>轮次:</span>
    <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_all_subject" style="width: 100px; line-height:26px;border:1px solid #ccc"></select>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doAllSubjectSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-chaxun"></use>
        </svg>
        查询
    </a>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doGoodSubjectSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-export"></use>
        </svg>
        导出
    </a>
</div>
</body>
<%--本轮得分榜--%>
<script type="text/javascript">
    $('#this_score_table').datagrid({
        fit:true, //自适应高度
        singleSelect: true,
        idField: 'user_id',
        url: '/answer/getScoreInfo',
        rownumbers: true,
        pagination: true,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {field: 'user_name', title: '用户名', width: setWidth(24)}
        ]],
        columns: [[
            {field: 'user_id', title: '用户ID',fixed: 'left', hidden: true}
            ,{field: 'sumScore', sortable: true, title: '总积分', width: setWidth(25)}
            ,{field: 'userAnsScore', sortable: true, title: '猜射得分', width: setWidth(25)}
            ,{field: 'userSubScore', sortable: true, title: '制谜得分', width: setWidth(25)}
        ]]
    });

    function setWidth(percent){
        return $("#this_score_table").width() * percent / 100;
    }

    function doThisScoreSearch() {
        $('#this_score_table').datagrid('load', {
            roundNo: $('#roundNo_this_score').combobox("getValue")
        });
    }

    $('#this_score_table').datagrid('getPager').pagination({
        // showPageList:true,
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh: function () {
            return true;
        }
    });
</script>
<%--总积分榜--%>
<script type="text/javascript">
    $('#his_score_table').datagrid({
        fit:true, //自适应高度
        singleSelect: true,
        idField: 'user_id',
        url: '/answer/getCountScoreInfo',
        rownumbers: true,
        pagination: true,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {field: 'user_name', title: '用户名', width: setWidth(8)}
        ]],
        columns: [[
            {field: 'user_id', title: '用户ID', align: 'center', hidden: true}
            , {field: 'times', title: '参与次数', sortable: true, width: setWidth(13)}
            , {field: 'user_subject_score', title: '制谜总得分', sortable: true, width: setWidth(13)}
            , {field: 'avg_subject_score', title: '制谜平均得分', sortable: true, width: setWidth(13)}
            , {field: 'user_answer_score', title: '猜射总得分', sortable: true, width: setWidth(13)}
            , {field: 'avg_answer_score', title: '猜射平均得分', sortable: true, width: setWidth(13)}
            , {field: 'sum_score', title: '总得分', sortable: true, width: setWidth(13)}
            , {field: 'avg_sum_score', title: '总平均得分', sortable: true, width: setWidth(13)}
        ]]
    });

    function setWidth(percent){
        return $("#his_score_table").width() * percent / 100;
    }

    $('#his_score_table').datagrid('getPager').pagination({
        // showPageList:true,
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh: function () {
            return true;
        }
    });
</script>
<%--猜射积分榜--%>
<script type="text/javascript">
    $('#answer_score_table').datagrid({
        fit:true, //自适应高度
        singleSelect: true,
        idField: 'user_id',
        url: '/answer/getAnswerScoreInfo',
        rownumbers: true,
        pagination: true,
        pageList: [10, 20, 50, 100],
        columns: [[
            {field: 'user_id', title: '用户ID', align: 'center', hidden: true}
            , {field: 'user_name', title: '用户名',fixed: 'left',width: setWidth(49)}
            , {field: 'userAnsScore', sortable: true, title: '猜射得分',width: setWidth(50)}
        ]]
    });

    function setWidth(percent){
        return $("#answer_score_table").width() * percent / 100;
    }

    function doAnswerScoreSearch() {
        $('#answer_score_table').datagrid('load', {
            roundNo: $('#roundNo_answer_score').combobox("getValue")
        });
    }

    $('#answer_score_table').datagrid('getPager').pagination({
        // showPageList:true,
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh: function () {
            return true;
        }
    });
</script>
<%--制谜积分榜--%>
<script type="text/javascript">
    $('#subject_score_table').datagrid({
        fit:true, //自适应高度
        singleSelect: true,
        idField: 'user_id',
        url: '/answer/getSubjectScoreCount',
        rownumbers: true,
        pagination: true,
        pageList: [10, 20, 50, 100],
        columns: [[
            {field: 'user_id', title: '用户ID', align: 'center', hidden: true}
            , {field: 'user_name', title: '用户名',fixed: 'left',width: setWidth(49)}
            , {field: 'userSubScore', sortable: true, title: '制谜得分',width: setWidth(50)}
        ]]
    });

    function setWidth(percent){
        return $("#subject_score_table").width() * percent / 100;
    }

    function doSubjectScoreSearch() {
        $('#subject_score_table').datagrid('load', {
            roundNo: $('#roundNo_subject_score').combobox("getValue")
        });
    }

    $('#subject_score_table').datagrid('getPager').pagination({
        // showPageList:true,
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh: function () {
            return true;
        }
    });
</script>
<%--佳谜榜--%>
<script type="text/javascript">
    $('#good_subject_table').datagrid({
        fit:true, //自适应高度
        singleSelect: true,
        idField: 'dm_temp_id',
        url: '/dengmiTemp/goodSubject',
        rownumbers: true,
        pagination: false,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {field: 'dm_mimian', title: '谜面', width: setWidth(19)}
        ]],
        columns: [[
            {field: 'dm_temp_id', title: 'ID', hidden: true}
            ,{field: 'dm_mimu', title: '谜目', width: setWidth(12)}
            ,{field: 'dm_midi', title: '谜底', width: setWidth(18)}
            ,{field: 'dm_mimianzhu', title: '谜面注', width: setWidth(19)}
            ,{field: 'dm_midizhu', title: '谜底注', width: setWidth(19)}
            ,{field: 'user_name', title: '作者', width: setWidth(6)}
            ,{field: 'user_judge', title: '评分', sortable: true, width: setWidth(6)}
        ]]
    });

    function setWidth(percent){
        return $("#good_subject_table").width() * percent / 100;
    }

    function doGoodSubjectSearch() {
        $('#good_subject_table').datagrid('load', {
            roundNo: $('#roundNo_good_subject').combobox("getValue")
        });
    }

    $('#good_subject_table').datagrid('getPager').pagination({
        // showPageList:true,
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',
        displayMsg: '共 {total} 条记录',
        onBeforeRefresh: function () {
            return true;
        }
    });
</script>
<%--全部谜题--%>
<script type="text/javascript">
    $('#all_subject_table').datagrid({
        fit:true, //自适应高度
        singleSelect: true,
        idField: 'dm_temp_id',
        url: '/dengmiTemp/getDengmiByRoundNo',
        rownumbers: true,
        pagination: true,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {field: 'dm_mimian', title: '谜面', width: setWidth(19)}
        ]],
        columns: [[
            {field: 'dm_temp_id', title: 'ID', hidden: true}
            ,{field: 'dm_mimu', title: '谜目', width: setWidth(12)}
            ,{field: 'dm_midi', title: '谜底', width: setWidth(18)}
            ,{field: 'dm_mimianzhu', title: '谜面注', width: setWidth(19)}
            ,{field: 'dm_midizhu', title: '谜底注', width: setWidth(19)}
            ,{field: 'user_name', title: '作者', width: setWidth(6)}
            ,{field: 'user_judge', title: '评分', sortable: true, width: setWidth(6)}
        ]]
    });

    function setWidth(percent){
        return $("#all_subject_table").width() * percent / 100;
    }

    function doAllSubjectSearch() {
        $('#all_subject_table').datagrid('load', {
            roundNo: $('#roundNo_all_subject').combobox("getValue")
        });
    }

    $('#all_subject_table').datagrid('getPager').pagination({
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