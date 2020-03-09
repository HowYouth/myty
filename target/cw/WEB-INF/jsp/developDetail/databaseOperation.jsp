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
    <script src="/font/iconfont.js"></script>
</head>
<body>
<div style="padding:3px">
    <form id="ff" action="form1_proc.php" method="post">
        <table>
            <tr>
                <td>SQL:</td>
                <td><input class="easyui-textbox" name="description" data-options="multiline:true" style="height:100px;width:1000px"></input></td>
            </tr>
        </table>
        <a href="#" class="easyui-linkbutton" plain="true" onclick="doThisScoreSearch()">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-run"></use>
            </svg>
            执行
        </a>
    </form>
</div>
</body>
</html>
