<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2020/3/5
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>谜苑天涯-数据库操作</title>
    <link rel="stylesheet" type="text/css" href="/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/easyui/themes/icon.css">
    <link rel="stylesheet" href="/font/iconfont.css">
    <link rel="stylesheet" href="/css/mycss.css">
    <script type="text/javascript" src="/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script src="/font/iconfont.js"></script>
</head>
<body>
<div style="padding:3px">
    <form id="ff" action="/doSQL/executeSQL" method="post">
        <span>类型:</span>
        <select class="easyui-combotree" url="/doSQL/getType" name="type" id="type" style="width: 200px; line-height:26px;border:1px solid #ccc"></select>
        <hr/>
        <span>SQL:</span>
        <input class="easyui-textbox" id="sql" name="sql" data-options="multiline:true" style="height:100px;width:200px">
        </input>
        <hr/>
        <button type="submit" id="submit_btn">执行</button>
    </form>
</div>
</body>
<script type="text/javascript">
    $(function(){
        /** 验证文件是否导入成功  */
        $("#ff").ajaxForm(function(data){
            if(data.success){
                if(data.colNameList.length > 0){
                    var colnames = data.colNameList;
                    var total = data.total;
                    var elementStr = '';
                    elementStr = elementStr + "<hr/>" +
                        "<div id='div'><table style='border: 1px solid red'>" +
                        "<tr>";
                    for(var a = 0; a < colnames.length; a ++){
                        elementStr = elementStr + "<th>" + colnames[a] + "</th>";
                    }
                    elementStr = elementStr + "</tr>";
                    for(var b = 0; b < total; b ++){
                        var rowData = data.data[b];
                        var cellDatas = rowData.split("\t",-1);

                        elementStr = elementStr + "<tr><td>";
                        for(var c=0; c < cellDatas.length-1; c++){
                            elementStr = elementStr + cellDatas[c];
                        }
                        elementStr = elementStr + "</td></tr>";
                    }
                    elementStr = elementStr + "</table></div>";
                }
                $('body').append(elementStr);
            }
        });
    });

</script>
</html>
