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
    <script type="text/javascript" src="/js/myjs.js"></script>
    <%--<script type="text/javascript" src="/js/jquery.form.js"></script>--%>
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
    <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_this_score"
            style="width: 200px; line-height:26px;border:1px solid #ccc"></select>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doThisScoreSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-chaxun"></use>
        </svg>
        查询
    </a>
</div>
<div id="answer_score_search_tool" style="padding:3px">
    <span>轮次:</span>
    <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_answer_score"
            style="width: 200px; line-height:26px;border:1px solid #ccc"></select>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doAnswerScoreSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-chaxun"></use>
        </svg>
        查询
    </a>
</div>
<div id="subject_score_search_tool" style="padding:3px">
    <span>轮次:</span>
    <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_subject_score"
            style="width: 200px; line-height:26px;border:1px solid #ccc"></select>
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doSubjectScoreSearch()">
        <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-chaxun"></use>
        </svg>
        查询
    </a>
</div>
<div id="good_subject_search_tool" style="padding:3px">
    <form action="/export/exportSubject" id="export-form-good" method="post">
        <span>轮次:</span>
        <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_good_subject" name="roundNo" style="width: 200px; line-height:26px;border:1px solid #ccc"></select>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="doGoodSubjectSearch()">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-chaxun"></use>
            </svg>
            查询
        </a>
        <input name="tabs" value="goodSubject" hidden/>
        <input name="fanwei" value="1" hidden/>
        <input name="type"  hidden id="type2"/>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="submitExportForm(1,0)">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-export"></use>
            </svg>
            导出为Excel
        </a>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="submitExportForm(0,0)">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-export"></use>
            </svg>
            导出为txt
        </a>
    </form>
</div>
<div id="all_subject_search_tool" >
    <form action="/export/exportSubject" id="export-form-all" method="post">
        <span>轮次:</span>
        <select class="easyui-combotree" url="/agenda/getAllAgenda" id="roundNo_all_subject" name="roundNo" style="width: 200px; line-height:26px;border:1px solid #ccc"></select>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="doAllSubjectSearch()">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-chaxun"></use>
            </svg>
            查询
        </a>
        <input name="tabs" value="allSubject" hidden/>
        <input name="fanwei" value="1" hidden/>
        <input name="type"  hidden id="type"/>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="submitExportForm(1,1)">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-export"></use>
            </svg>
            导出为Excel
        </a>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="submitExportForm(0,1)">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-export"></use>
            </svg>
            导出为txt
        </a>
    </form>
</div>
<div id="win" class="easyui-window" closed="true" title="详情页面" style="width: 95%;height: 88%;">
    <table id="score_detail_table" style="width: 100%"></table>
    <table id="subject_detail_table" style="width: 100%"></table>
</div>
</body>
<script type="text/javascript">
    function submitExportForm(param, tabs){
        debugger;
        var roundNo = '';
        var form_id = '';
        if(tabs == 1){//全部谜题
            roundNo = $('#roundNo_all_subject').combobox("getValue");
            $('#type').val(param);
            form_id = 'export-form-all';
        } else {
            roundNo = $('#roundNo_good_subject').combobox("getValue");
            $('#type2').val(param);
            form_id = 'export-form-good';
        }
        console.log(roundNo);
        if(roundNo == null || roundNo == ""){
            $.messager.alert('提示','请选择轮次');
            return;
        }
        $('#'+form_id).submit();
    }
</script>
<%--本轮得分榜--%>
<script type="text/javascript">
    var firstSubWinWidth;
    var secondSubWinWidth;
    var flag = 0;
    $('#this_score_table').datagrid({
        fit: true, //自适应高度
        singleSelect: true,
        idField: 'user_id',
        url: '/answer/getScoreInfo',
        rownumbers: true,
        pagination: true,
        nowrap: false,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {
                field: 'user_name', title: '用户名', width: setWidth(24),
                formatter: function (value, rec, index) {
                    return '<super-link>' + value + '</super-link>';
                }
            }
        ]],
        columns: [[
            {field: 'user_id', title: '用户ID', fixed: 'left', hidden: true}
            , {field: 'sumScore', sortable: true, title: '总积分', width: setWidth(25)}
            , {field: 'userAnsScore', sortable: true, title: '猜射得分', width: setWidth(25)}
            , {field: 'userSubScore', sortable: true, title: '制谜得分', width: setWidth(25)}
        ]],
        onClickCell: function (index, field, value) {
            if (field == 'user_name') {
                var row = $('#this_score_table').datagrid('getRows')[index];//获取单元格所在行的所有的值
                $('#win').window('open');
                $('#score_detail_table').datagrid({
                    title: '得分情况',
                    // fit:true, //自适应高度
                    // height: 200,
                    singleSelect: true,
                    idField: 'user_id',
                    nowrap: false,
                    url: '/util/userScoreDetailTable?userId=' + row.userId,
                    rownumbers: true,
                    pagination: false,
                    columns: [[
                        {field: 'dm_author_name', title: '用户名', width: setSubWinWidth(30)}
                        , {field: 'user_id', title: '用户名', hidden: true}
                        , {field: 'user_subject_score', title: '制谜总分', width: setSubWinWidth(33)}
                        , {field: 'user_answer_score', title: '猜射总分', width: setSubWinWidth(33)}
                    ]]
                });
                $('#subject_detail_table').datagrid({
                    title: '单条谜题得分情况',
                    // fit:true, //自适应高度
                    singleSelect: true,
                    idField: 'dm_id',
                    nowrap: false,
                    url: '/util/userCompetitionDetail?userId=' + row.userId + '&roundNo=' + row.agendaRoundNo, //数据接口
                    rownumbers: true,
                    pagination: true,
                    pageList: [10, 20, 50, 100],
                    frozenColumns: [[
                        {field: 'dm_mimian', title: '谜面', width: setSecondSubWinWidth(20)}
                    ]],
                    columns: [[
                        {field: 'dm_id', title: 'ID', hidden: true}
                        , {field: 'dm_mimu', title: '谜目/谜格', width: setSecondSubWinWidth(15)}
                        , {field: 'dm_midi', title: '谜底', width: setSecondSubWinWidth(17)}
                        , {field: 'dm_mimianzhu', title: '注解', width: setSecondSubWinWidth(30),
                            formatter: function (value, rec, index) {
                                return (rec.dm_mimianzhu == null ? "" : rec.dm_mimianzhu) + (rec.dm_midizhu == null ? "" : rec.dm_midizhu);
                            }
                        }
                        , {field: 'user_subject_score', title: '评分', width: setSecondSubWinWidth(5)}
                        , {field: 'right_proportion', title: '命中率', width: setSecondSubWinWidth(5)}
                        , {field: 'rownum', title: '名次', width: setSecondSubWinWidth(5)}
                    ]]
                });
                $('#subject_detail_table').datagrid('getPager').pagination({
                    // showPageList:true,
                    beforePageText: '第',//页数文本框前显示的汉字
                    afterPageText: '页    共 {pages} 页',
                    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
                    onBeforeRefresh: function () {
                        return true;
                    }
                });
            }
        }
    });

    $('#win').window({
        collapsible: false,
        minimizable: false
    });

    function setWidth(percent) {
        return $("#this_score_table").width() * percent / 100;
    }

    function setSubWinWidth(percent) {
        if (flag == 0) {
            firstSubWinWidth = $("#score_detail_table").width();
            secondSubWinWidth = $("#subject_detail_table").width();
        }
        flag++;
        return firstSubWinWidth * percent / 100;
    }

    function setSecondSubWinWidth(percent) {
        if (flag == 0) {
            firstSubWinWidth = $("#score_detail_table").width();
            secondSubWinWidth = $("#subject_detail_table").width();
        }
        flag++;
        return secondSubWinWidth * percent / 100;
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
        fit: true, //自适应高度
        singleSelect: true,
        nowrap: false,
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

    function setWidth(percent) {
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
        fit: true, //自适应高度
        singleSelect: true,
        idField: 'user_id',
        nowrap: false,
        url: '/answer/getAnswerScoreInfo',
        rownumbers: true,
        pagination: true,
        pageList: [10, 20, 50, 100],
        columns: [[
            {field: 'user_id', title: '用户ID', align: 'center', hidden: true}
            , {
                field: 'user_name', title: '用户名', fixed: 'left', width: setWidth(49),
                formatter: function (value, rec, index) {
                    return '<super-link>' + value + '</super-link>';
                }
            }
            , {field: 'userAnsScore', sortable: true, title: '猜射得分', width: setWidth(50)}
        ]],
        onClickCell: function (index, field, value) {
            if (field == 'user_name') {
                var row = $('#answer_score_table').datagrid('getRows')[index];//获取单元格所在行的所有的值
                $('#win').window('open');
                $('#score_detail_table').datagrid({
                    title: '得分情况',
                    // fit:true, //自适应高度
                    // height: 200,
                    singleSelect: true,
                    idField: 'user_id',
                    nowrap: false,
                    url: '/util/userScoreDetailTable?userId=' + row.userId,
                    rownumbers: true,
                    pagination: false,
                    columns: [[
                        {field: 'dm_author_name', title: '用户名', width: setSubWinWidth(30)}
                        , {field: 'user_id', title: '用户名', hidden: true}
                        , {field: 'user_subject_score', title: '制谜总分', width: setSubWinWidth(33)}
                        , {field: 'user_answer_score', title: '猜射总分', width: setSubWinWidth(33)}
                    ]]
                });
                var userName = row.user_name;
                $('#subject_detail_table').datagrid({
                    title: '猜射情况',
                    // fit:true, //自适应高度
                    singleSelect: true,
                    idField: 'dm_id',
                    nowrap: false,
                    url: '/util/userAnswerDetailTable?userId=' + row.userId + '&roundNo=' + row.agendaRoundNo, //数据接口
                    rownumbers: true,
                    pagination: true,
                    pageList: [10, 20, 50, 100],
                    frozenColumns: [[
                        {field: 'dm_mimian', title: '谜面', width: setSecondSubWinWidth(20)}
                    ]],
                    columns: [[
                        {field: 'dm_id', title: 'ID', hidden: true}
                        , {field: 'dm_mimu', title: '谜目/谜格', width: setSecondSubWinWidth(10)}
                        , {field: 'dm_midi', title: '谜底', width: setSecondSubWinWidth(15)}
                        , {field: 'dm_mimianzhu', title: '注解', width: setSecondSubWinWidth(24),
                            formatter: function (value, rec, index) {
                                return (rec.dm_mimianzhu == null ? "" : rec.dm_mimianzhu) + (rec.dm_midizhu == null ? "" : rec.dm_midizhu);
                            }
                        }
                        , {field: 'dm_author_name', title: '作者', width: setSecondSubWinWidth(8)}
                        , {field: 'user_answer', title: userName + '猜射', width: setSecondSubWinWidth(15)}
                        , {field: 'user_answer_score', title: '猜射得分', width: setSecondSubWinWidth(5)}
                    ]]
                });
                $('#subject_detail_table').datagrid('getPager').pagination({
                    // showPageList:true,
                    beforePageText: '第',//页数文本框前显示的汉字
                    afterPageText: '页    共 {pages} 页',
                    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
                    onBeforeRefresh: function () {
                        return true;
                    }
                });
            }
        }
    });

    function setWidth(percent) {
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
        fit: true, //自适应高度
        singleSelect: true,
        idField: 'user_id',
        nowrap: false,
        url: '/answer/getSubjectScoreCount',
        rownumbers: true,
        pagination: true,
        pageList: [10, 20, 50, 100],
        columns: [[
            {field: 'user_id', title: '用户ID', align: 'center', hidden: true}
            , {
                field: 'user_name', title: '用户名', fixed: 'left', width: setWidth(49),
                formatter: function (value, rec, index) {
                    return '<super-link>' + value + '</super-link>';
                }
            }
            , {field: 'userSubScore', sortable: true, title: '制谜得分', width: setWidth(50)}
        ]],
        onClickCell: function (index, field, value) {
            if (field == 'user_name') {
                var row = $('#subject_score_table').datagrid('getRows')[index];//获取单元格所在行的所有的值
                console.log('row', row);
                $('#win').window('open');
                $('#score_detail_table').datagrid({
                    title: '得分情况',
                    // fit:true, //自适应高度
                    // height: 200,
                    singleSelect: true,
                    idField: 'user_id',
                    nowrap: false,
                    url: '/util/userScoreDetailTable?userId=' + row.userId,
                    rownumbers: true,
                    pagination: false,
                    columns: [[
                        {field: 'dm_author_name', title: '用户名', width: setSubWinWidth(30)}
                        , {field: 'user_id', title: '用户名', hidden: true}
                        , {field: 'user_subject_score', title: '制谜总分', width: setSubWinWidth(33)}
                        , {field: 'user_answer_score', title: '猜射总分', width: setSubWinWidth(33)}
                    ]]
                });
                $('#subject_detail_table').datagrid({
                    title: '猜射情况',
                    // fit:true, //自适应高度
                    singleSelect: true,
                    idField: 'dm_id',
                    nowrap: false,
                    url: '/util/userCompetitionDetail?userId=' + row.userId + '&roundNo=' + row.agendaRoundNo, //数据接口
                    rownumbers: true,
                    pagination: true,
                    pageList: [10, 20, 50, 100],
                    frozenColumns: [[
                        {field: 'dm_mimian', title: '谜面', width: setSecondSubWinWidth(20)}
                    ]],
                    columns: [[
                        {field: 'dm_id', title: 'ID', hidden: true}
                        , {field: 'dm_mimu', title: '谜目/谜格', width: setSecondSubWinWidth(10)}
                        , {field: 'dm_midi', title: '谜底', width: setSecondSubWinWidth(15)}
                        , {field: 'dm_mimianzhu', title: '注解', width: setSecondSubWinWidth(28),
                            formatter: function (value, rec, index) {
                                return (rec.dm_mimianzhu == null ? "" : rec.dm_mimianzhu) + (rec.dm_midizhu == null ? "" : rec.dm_midizhu);
                            }
                        }
                        , {field: 'user_subject_score', title: '评分', width: setSecondSubWinWidth(8)}
                        , {field: 'right_proportion', title: '命中率', width: setSecondSubWinWidth(8)}
                        , {field: 'rownum', title: '名次', width: setSecondSubWinWidth(8)}
                    ]]
                });
                $('#subject_detail_table').datagrid('getPager').pagination({
                    // showPageList:true,
                    beforePageText: '第',//页数文本框前显示的汉字
                    afterPageText: '页    共 {pages} 页',
                    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
                    onBeforeRefresh: function () {
                        return true;
                    }
                });
            }
        }
    });

    function setWidth(percent) {
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
        fit: true, //自适应高度
        singleSelect: true,
        nowrap: false,
        idField: 'dm_temp_id',
        url: '/dengmiTemp/goodSubject',
        rownumbers: true,
        pagination: false,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {
                field: 'dm_mimian', title: '谜面', width: setWidth(19),
                formatter: function (value, rec, index) {
                    return '<super-link>' + value + '</super-link>';
                }
            }
        ]],
        columns: [[
            {field: 'dm_temp_id', title: 'ID', hidden: true}
            , {field: 'dm_mimu', title: '谜目', width: setWidth(12)}
            , {field: 'dm_midi', title: '谜底', width: setWidth(18)}
            , {field: 'dm_mimianzhu', title: '注解', width: setWidth(38),
                formatter: function (value, rec, index) {
                    return (rec.dm_mimianzhu == null ? "" : rec.dm_mimianzhu) + (rec.dm_midizhu == null ? "" : rec.dm_midizhu);
                }
            }
            , {field: 'user_name', title: '作者', width: setWidth(6)}
            , {field: 'user_judge', title: '评分', sortable: true, width: setWidth(6)}
        ]],
        onClickCell: function (index, field, value) {
            if (field == 'dm_mimian') {
                var row = $('#good_subject_table').datagrid('getRows')[index];//获取单元格所在行的所有的值
                $('#win').window('open');
                $('#score_detail_table').datagrid({
                    title: '谜题详情',
                    // fit:true, //自适应高度
                    // height: 200,
                    singleSelect: true,
                    idField: 'dm_temp_id',
                    nowrap: false,
                    url: '/util/dengmiDetailTable?dmId=' + row.dm_temp_id, //数据接口
                    rownumbers: true,
                    pagination: false,
                    frozenColumns: [[
                        {field: 'dm_mimian', title: '谜面', width: setSubWinWidth(20)}
                    ]],
                    columns: [[
                        {field: 'dm_temp_id', title: 'ID', hidden: true}
                        , {field: 'dm_mimu', title: '谜目/谜格', width: setSubWinWidth(15)}
                        , {field: 'dm_midi', title: '谜底', width: setSubWinWidth(15)}
                        , {field: 'dm_mimianzhu', title: '注解', width: setSubWinWidth(30),
                            formatter: function (value, rec, index) {
                                return (rec.dm_mimianzhu == null ? "" : rec.dm_mimianzhu) + (rec.dm_midizhu == null ? "" : rec.dm_midizhu);
                            }
                        }
                        , {field: 'user_name', title: '作者', width: setSubWinWidth(12)}
                    ]]
                });
                $('#subject_detail_table').datagrid({
                    title: '用户猜射情况',
                    // fit:true, //自适应高度
                    singleSelect: true,
                    idField: 'dm_id',
                    nowrap: false,
                    url: '/util/dengmiAnswerDetailTable?dmId=' + row.dm_temp_id, //数据接口
                    rownumbers: true,
                    pagination: true,
                    pageList: [10, 20, 50, 100],
                    frozenColumns: [[
                        {field: 'user_name', title: '用户', fixed: 'left', width: setSecondSubWinWidth(20)}
                    ]],
                    columns: [[
                        {field: 'userId', title: '用户ID', hidden: true}
                        , {field: 'user_answer', title: '猜射', width: setSecondSubWinWidth(19)}
                        , {field: 'result', title: '列中', width: setSecondSubWinWidth(19)}
                        , {field: 'user_answer_score', sortable: true, title: '用户得分', width: setSecondSubWinWidth(19)}
                        , {field: 'user_judge', sortable: true, title: '用户评分', width: setSecondSubWinWidth(19)}
                    ]]
                });
                $('#subject_detail_table').datagrid('getPager').pagination({
                    // showPageList:true,
                    beforePageText: '第',//页数文本框前显示的汉字
                    afterPageText: '页    共 {pages} 页',
                    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
                    onBeforeRefresh: function () {
                        return true;
                    }
                });
            }
        }
    });

    function setWidth(percent) {
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
        fit: true, //自适应高度
        singleSelect: true,
        idField: 'dm_temp_id',
        nowrap: false,
        url: '/dengmiTemp/getDengmiByRoundNo',
        rownumbers: true,
        pagination: true,
        pageList: [10, 20, 50, 100],
        frozenColumns: [[
            {
                field: 'dm_mimian', title: '谜面', width: setWidth(19),
                formatter: function (value, rec, index) {
                    return '<super-link>' + value + '</super-link>';
                }
            }
        ]],
        columns: [[
            {field: 'dm_temp_id', title: 'ID', hidden: true}
            , {field: 'dm_mimu', title: '谜目', width: setWidth(12)}
            , {field: 'dm_midi', title: '谜底', width: setWidth(18)}
            , {field: 'dm_mimianzhu', title: '注解', width: setWidth(38),
                formatter: function (value, rec, index) {
                    return (rec.dm_mimianzhu == null ? "" : rec.dm_mimianzhu) + (rec.dm_midizhu == null ? "" : rec.dm_midizhu);
                }
            }
            , {field: 'user_name', title: '作者', width: setWidth(6)}
            , {field: 'user_judge', title: '评分', sortable: true, width: setWidth(6)}
        ]],
        onClickCell: function (index, field, value) {
            if (field == 'dm_mimian') {
                var row = $('#all_subject_table').datagrid('getRows')[index];//获取单元格所在行的所有的值
                $('#win').window('open');
                $('#score_detail_table').datagrid({
                    title: '谜题详情',
                    // fit:true, //自适应高度
                    // height: 200,
                    singleSelect: true,
                    idField: 'dm_temp_id',
                    nowrap: false,
                    url: '/util/dengmiDetailTable?dmId=' + row.dm_temp_id, //数据接口
                    rownumbers: true,
                    pagination: false,
                    frozenColumns: [[
                        {field: 'dm_mimian', title: '谜面', width: setSubWinWidth(20)}
                    ]],
                    columns: [[
                        {field: 'dm_temp_id', title: 'ID', hidden: true}
                        , {field: 'dm_mimu', title: '谜目/谜格', width: setSubWinWidth(15)}
                        , {field: 'dm_midi', title: '谜底', width: setSubWinWidth(15)}
                        , {field: 'dm_mimianzhu', title: '注解', width: setSubWinWidth(30),
                            formatter: function (value, rec, index) {
                                return (rec.dm_mimianzhu == null ? "" : rec.dm_mimianzhu) + (rec.dm_midizhu == null ? "" : rec.dm_midizhu);
                            }
                        }
                        , {field: 'user_name', title: '作者', width: setSubWinWidth(12)}
                    ]]
                });
                $('#subject_detail_table').datagrid({
                    title: '用户猜射情况',
                    // fit:true, //自适应高度
                    singleSelect: true,
                    idField: 'dm_id',
                    nowrap: false,
                    url: '/util/dengmiAnswerDetailTable?dmId=' + row.dm_temp_id, //数据接口
                    rownumbers: true,
                    pagination: true,
                    pageList: [10, 20, 50, 100],
                    frozenColumns: [[
                        {field: 'user_name', title: '用户', fixed: 'left', width: setSecondSubWinWidth(20)}
                    ]],
                    columns: [[
                        {field: 'userId', title: '用户ID', hidden: true}
                        , {field: 'user_answer', title: '猜射', width: setSecondSubWinWidth(19)}
                        , {field: 'result', title: '列中', width: setSecondSubWinWidth(19)}
                        , {field: 'user_answer_score', sortable: true, title: '用户得分', width: setSecondSubWinWidth(19)}
                        , {field: 'user_judge', sortable: true, title: '用户评分', width: setSecondSubWinWidth(19)}
                    ]]
                });
                $('#subject_detail_table').datagrid('getPager').pagination({
                    // showPageList:true,
                    beforePageText: '第',//页数文本框前显示的汉字
                    afterPageText: '页    共 {pages} 页',
                    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
                    onBeforeRefresh: function () {
                        return true;
                    }
                });
            }
        }
    });

    function setWidth(percent) {
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
<style type="text/css">
    super-link {
        cursor: pointer;
        color: #0000FF;
    }
</style>
</html>