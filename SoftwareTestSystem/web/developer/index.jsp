<%@ page import="com.beans.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CZQ软件测试管理系统</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="../stylesheets/theme.css">
    <link rel="stylesheet" href="../lib/font-awesome/css/font-awesome.css">
    <script src="/myJS/Func.js"></script>
    <script src="../lib/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../lib/Chart.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height: 300px;
            width: 800px;
            margin: 0px auto;
            margin-top: 1em;
        }

        .brand {
            font-family: georgia, serif;
        }

        .brand .first {
            color: #ccc;
            font-style: italic;
        }

        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="../http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <!--<link rel="shortcut icon" href="../../assets/ico/favicon.ico">-->
    <!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../assets/ico/apple-touch-icon-144-precomposed.png">-->
    <!--<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">-->
    <!--<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">-->
    <!--<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">-->
</head>

<!--[if lt IE 7 ]>
<body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]>
<body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]>
<body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]>
<body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
<!--<![endif]-->

<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav pull-right">

            <li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">欢迎你</a></li>
            <li id="fat-menu" class="dropdown">
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-user"></i><%=((Person) session.getAttribute("Person")).getName()%>
                    <i class="icon-caret-down"></i>
                </a>

                <ul class="dropdown-menu">
                    <!--<li><a tabindex="-1" href="#">My Account</a></li>-->
                    <!--<li class="divider"></li>-->
                    <!--<li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>-->
                    <li class="divider visible-phone"></li>
                    <li><a tabindex="-1" href="/sign-in.jsp">退出</a></li>
                </ul>
            </li>

        </ul>
        <a class="brand" href="index.jsp"><span class="first">CZQ</span> <span class="second">软件测试管理系统</span></a>
    </div>
</div>


<div class="sidebar-nav">
    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>信息管理</a>
    <ul id="dashboard-menu" class="nav nav-list collapse in">
        <li class="active"><a href="index.jsp">首页</a></li>
        <li><a href="projects.jsp">项目列表</a></li>
        <li><a href="workersInfo.jsp">员工信息</a></li>
        <li><a href="workers.jsp">成员列表</a></li>
        <li><a href="tasks.jsp">任务列表</a></li>
        <%--<li><a href="testSample.jsp">测试用例列表</a></li>--%>
        <li><a href="bugs.jsp">Bug列表</a></li>
        <!--<li ><a href="media.html">Media</a></li>-->
        <!--<li ><a href="calendar.html">Calendar</a></li>-->

    </ul>

    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>账户管理<span
            class="label label-info">+3</span></a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li><a href="/sign-in.jsp">登录</a></li>
        <%--<li ><a href="sign-up.html">注册</a></li>--%>
        <li><a href="/reset-password.jsp">重置密码</a></li>
    </ul>

    <!--<a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>Error Pages <i class="icon-chevron-up"></i></a>-->
    <!--<ul id="error-menu" class="nav nav-list collapse">-->
    <!--<li ><a href="403.html">403 page</a></li>-->
    <!--<li ><a href="404.html">404 page</a></li>-->
    <!--<li ><a href="500.html">500 page</a></li>-->
    <!--<li ><a href="503.html">503 page</a></li>-->
    <!--</ul>-->

    <!--<a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-legal"></i>Legal</a>-->
    <!--<ul id="legal-menu" class="nav nav-list collapse">-->
    <!--<li ><a href="privacy-policy.html">Privacy Policy</a></li>-->
    <!--<li ><a href="terms-and-conditions.html">Terms and Conditions</a></li>-->
    <!--</ul>-->

    <!--<a href="help.html" class="nav-header" ><i class="icon-question-sign"></i>Help</a>-->
    <!--<a href="faq.html" class="nav-header" ><i class="icon-comment"></i>Faq</a>-->
</div>


<div class="content">

    <div class="header">
        <div class="stats">
            <p class="stat"><span class="number" id="day"></span>日</p>
            <p class="stat"><span class="number" id="month"></span>月</p>
            <p class="stat"><span class="number" id="year"></span>年</p>


        </div>

        <h1 class="page-title">信息管理</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
        <li class="active">信息管理</li>
        <li><a href="/servlet/StaticServlet">数据刷新</a></li>
    </ul>
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a></div>
    <div class="container-fluid">
        <div class="row-fluid">


            <div class="row-fluid">

                <%--<div class="alert alert-info">--%>
                <%--<button type="button" class="close" data-dismiss="alert">×</button>--%>
                <%--<strong>Just a quick note:</strong> Hope you like the theme!--%>
                <%--</div>--%>
                <%--<%--%>
                <%--if (session.getAttribute("dataMap")!=null){--%>
                <%--%>--%>
                <%--<script type="text/javascript">alert("Hello")</script>--%>
                <%--<%--%>
                <%--}--%>
                <%--%>--%>
                <div class="block">
                    <a href="#page-stats" class="block-heading" data-toggle="collapse">数据一览</a>
                    <div id="page-stats" class="block-body collapse in">

                        <div class="stat-widget-container">
                            <div class="stat-widget">
                                <div class="stat-button">
                                    <p class="title">${sessionScope.dataMap["sumProject"]}</p>
                                    <p class="detail">项目</p>
                                </div>
                            </div>

                            <div class="stat-widget">
                                <div class="stat-button">
                                    <p class="title">${sessionScope.dataMap.get("sumTask")}</p>
                                    <p class="detail">任务</p>
                                </div>
                            </div>

                            <div class="stat-widget">
                                <div class="stat-button">
                                    <p class="title">${sessionScope.dataMap.get("sumTestSample")}</p>
                                    <p class="detail">测试用例</p>
                                </div>
                            </div>

                            <div class="stat-widget">
                                <div class="stat-button">
                                    <p class="title">${sessionScope.dataMap.get("sumBug")}</p>
                                    <p class="detail">Bug</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="block span6">
                    <a href="#" class="block-heading" data-toggle="collapse"
                        <%--onclick="alert('gun')"--%>
                       onclick="showProjectManagerPic1('${dataMap["planningProject"]}','${dataMap["runningProject"]}','${dataMap["finishedProject"]}','${dataMap["sumProject"]}')"
                    >
                        项目
                        <i class="icon-refresh"></i></a>

                    <div>
                        <canvas id="projectBarChart1"></canvas>
                    </div>
                </div>
                <div class="block span6">
                    <a href="#" class="block-heading" data-toggle="collapse"

                       onclick="showProjectManagerPic2('${dataMap["planningTask"]}','${dataMap["runningTask"]}','${dataMap["finishedTask"]}','${dataMap["sumTask"]}')">任务
                        <i class="icon-refresh"></i></a>

                    <div>
                        <canvas id="projectBarChart2"></canvas>
                    </div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="block span6">
                    <a href="#" class="block-heading" data-toggle="collapse"

                       onclick="showProjectManagerPic3('${dataMap["failedTestSample"]}','${dataMap["successTestSample"]}','${dataMap["sumTestSample"]}')">测试用例
                        <i class="icon-refresh"></i></a>

                    <div>
                        <canvas id="projectBarChart3"></canvas>
                    </div>
                </div>
                <div class="block span6">
                    <a href="#" class="block-heading" data-toggle="collapse"

                       onclick="showProjectManagerPic4('${dataMap["unfinishedBug"]}','${dataMap["finishedBug"]}','${dataMap["sumBug"]}')">Bug
                        <i class="icon-refresh"></i></a>

                    <div>
                        <canvas id="projectBarChart4"></canvas>
                    </div>
                </div>
            </div>


            <footer>
                <hr>


                <!--<p class="pull-right">Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>-->

                <p>2019 <a href="#">CZQ软件测试管理系统</a></p>
            </footer>

        </div>
    </div>
</div>


<script src="../lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function () {
        $('.demo-cancel-click').click(function () {
            return false;
        });
    });
    var date = new Date();
    document.getElementById("day").innerHTML = date.getDate();
    document.getElementById("month").innerHTML = date.getMonth() + 1;
    document.getElementById("year").innerHTML = date.getFullYear();
</script>

</body>
</html>


