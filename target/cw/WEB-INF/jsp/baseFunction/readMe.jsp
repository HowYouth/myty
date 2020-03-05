<%--
  Created by IntelliJ IDEA.
  User: YowYouth
  Date: 2019/12/26
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>谜苑天涯-使用说明</title>
    <link rel="stylesheet" href="/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/myty.css" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/js/myty.js"></script>
    <script type="text/javascript" src="/layui/layui.js"></script>
</head>
<body>
<div class="layui-collapse" lay-accordion="">
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">1.基本功能及使用</h2>
        <div class="layui-colla-content layui-show">
            <p>谜苑天涯内赛系统（以下简称本系统）中的用户一共有两种角色：普通用户（以下简称用户）和管理员用户（以下简称管理员）。用户可以参与灯谜联赛的各个环节,比如输入谜题、进行猜射和评分等；管理员负责维护系统，比如发起比赛、新增用户、重置用户密码、设置佳谜条数、新增友情链接等；管理员不能参与灯谜比赛。</p>
            <p>参与一轮比赛的任何一个环节（输入谜题、输入猜射、评分、列中）的用户，即视为参赛用户。</p>
            <p>有别于前一版本的系统，用户即使未参与比赛的上一环节，仍可参与比赛的当前环节。比如你没有输入任何谜题，但你仍然可以参与猜射和评分；即使你既没有输入谜题，也不曾参与猜射，系统也允许你对谜题进行评分。</p>
            <p>有别于前一版本的系统，用户在输入谜题时，只需要输入准备好的灯谜即可：不用再输入123了。</p>
            <p>输入谜题或者猜射的时候，在相应的地方单击，就会进入编辑状态；输入完成之后，您的输入会被自动保存。</p>
            <p>在评分时，评分只能输入0-10之间的整数，评分会被自动保存。</p>
            <p>在列中时，点击"列中"列的按钮，当它显示列中时，表示此条异底被列中，计分时会给异底的猜射者加分，列中结果会被自动保存。</p>
            <p>在本轮得分榜中，用户可以选择轮次来查看该轮中各用户的得分情况；但在最新一轮结束之前，不会显示最新一轮的情况。您可以点击用户名列，来查看该用户到目前为止（不包括正在进行的比赛）的猜射和制谜总得分以及该用户该轮所输入谜题的一些信息，比如命中率。</p>
            <p>在总积分榜中，可以查看所有用户到目前为止（不包括正在进行的比赛）的猜射和制谜得分情况。</p>
            <p>在猜射成绩榜中，用户可以选择轮次来查看该轮中各用户的猜射情况；但在最新一轮结束之前，不会显示最新一轮的情况。您可以点击用户名列，来查看该用户到目前为止（不包括正在进行的比赛）的猜射和制谜总得分以及该用户该轮的猜射情况。</p>
            <p>在制谜成绩榜中，用户可以选择轮次来查看该轮中各用户的制谜情况；但在最新一轮结束之前，不会显示最新一轮的情况。您可以点击用户名列，来查看该用户到目前为止（不包括正在进行的比赛）的猜射和制谜总得分以及该用户该轮所输入谜题的一些信息，比如命中率。</p>
            <p>在佳谜榜中，用户可以选择轮次来查看该轮比赛中评选出的佳谜；但在最新一轮结束之前，不会显示最新一轮的情况。您可以点击谜面，来查看当时参赛的各个用户的猜射、得分和评分情况。但这里的用户得分仅仅表示是否完中（完中得3分，列中得1分，不中得0分），与猜射成绩榜中的猜射得分并无关联。佳谜榜不支持分页查询。</p>
            <p>在全部谜题中，用户可以选择轮次来查看该轮比赛中所有的谜题；但在最新一轮结束之前，不会显示最新一轮的情况。您可以点击谜面，来查看当时参赛的各个用户的猜射、得分和评分情况。但这里的用户得分仅仅表示是否完中（完中得3分，列中得1分，不中得0分），与猜射成绩榜中的猜射得分并无关联。</p>
            <p>在某些页面（不是全部），我们提供了导出到Excel、导出到CSV、筛选列以及打印等功能。</p>
            <p>系统提供了一些友情链接，如果您还有更多更好的资源，请联系管理员进行添加。</p>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">2.猜射得分规则</h2>
        <div class="layui-colla-content">
            比如ABCDE五个人，输入的题目数量如下<br/>
            A B C D E<br/>
            4 3 5 0 0<br/>

            假设五人最终的猜射情况如下（横行为出题人，纵行为答题人，数字表示答对的题目数）：<br/>
            A B C D E S SC R<br/>
            A - 2 4 - - 6 8  1<br/>
            B 2 - 3 - - 5 4  4<br/>
            C 4 1 - - - 5 6  3<br/>
            D 3 3 2 - - 8 7  2<br/>
            E 1 2 3 - - 6 0  5<br/>
            然后以统计A的得分：<br/>
            AB比较的时候，只看两个人答对的CDE所出的题目的数量，A答对4题，B答对3题，A胜，记2分；<br/>
            AC比较的时候，只看两个人答对的BDE所出的题目的数量，A答对2题，C答对1题，A胜，记2分；<br/>
            AD比较的时候，只看两个人答对的BCE所出的题目的数量，A答对6题，D答对5题，A胜，记2分；<br/>
            AE比较的时候，只看两个人答对的BCD所出的题目的数量，A答对6题，E答对5题，A胜，记2分；<br/>
            总计A猜射得分为8分；<br/>

            计算B的得分：<br/>
            BA比较的时候，只看两个人答对的CDE所出的题目的数量，B答对3题，A答对4题，B败，记0分；<br/>
            BC比较的时候，只看两个人答对的ADE所出的题目的数量，B答对2题，C答对4题，B败，记0分；<br/>
            BD比较的时候，只看两个人答对的ACE所出的题目的数量，B答对5题，D答对5题，B平，记1分；<br/>
            BE比较的时候，只看两个人答对的ACD所出的题目的数量，B答对5题，E答对4题，B胜，记3分；<br/>
            总计B猜射得分为4分；<br/>

            计算C的得分：<br/>
            CA比较的时候，只看两个人答对的BDE所出的题目的数量，C答对1题，A答对2题，C败，记0分；<br/>
            CB比较的时候，只看两个人答对的ADE所出的题目的数量，C答对4题，B答对2题，C胜，记3分；<br/>
            CD比较的时候，只看两个人答对的ABE所出的题目的数量，C答对5题，D答对6题，C败，记0分；<br/>
            CE比较的时候，只看两个人答对的ABD所出的题目的数量，C答对5题，E答对3题，C胜，记3分；<br/>
            总计C猜射得分为6分；<br/>

            计算D的得分：<br/>
            DA比较的时候，只看两个人答对的BCE所出的题目的数量，D答对5题，A答对6题，D败，记0分；<br/>
            DB比较的时候，只看两个人答对的ACE所出的题目的数量，D答对5题，B答对5题，D平，记1分；<br/>
            DC比较的时候，只看两个人答对的ABE所出的题目的数量，D答对6题，C答对5题，D胜，记3分；<br/>
            DE比较的时候，只看两个人答对的ABC所出的题目的数量，D答对8题，E答对6题，D胜，记3分；<br/>
            总计D猜射得分为7分；<br/>

            计算E的得分：<br/>
            EA比较的时候，只看两个人答对的BCD所出的题目的数量，E答对5题，A答对6题，E败，记0分；<br/>
            EB比较的时候，只看两个人答对的ACD所出的题目的数量，E答对4题，B答对5题，E败，记0分；<br/>
            EC比较的时候，只看两个人答对的ABD所出的题目的数量，E答对3题，C答对5题，E败，记0分；<br/>
            ED比较的时候，只看两个人答对的ABC所出的题目的数量，E答对6题，D答对8题，E败，记0分；<br/>
            总计D猜射得分为0分；<br/>

            得出的结论如下：<br/>
            A B C D E 答对题目数量 猜射得分 排名<br/>
            A - 2 4 - - 6            8        1<br/>
            B 2 - 3 - - 5            4        4<br/>
            C 4 1 - - - 5            6        3<br/>
            D 3 3 2 - - 8            7        2<br/>
            E 1 2 3 - - 6            0        5<br/>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">3.制谜得分规则</h2>
        <div class="layui-colla-content">
            目前的制谜得分仅仅是各个用户的评分总和。
        </div>
    </div>
</div>
</body>
<script>
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</html>
