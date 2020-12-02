<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
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
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
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
        <li><a href="index.jsp">首页</a></li>
        <li><a href="projects.jsp" class="active">项目列表</a></li>
        <li><a href="workersInfo.jsp">员工信息</a></li>
        <li><a href="workers.jsp">成员列表</a></li>
    </ul>

    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>账户管理<span
            class="label label-info">+3</span></a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li><a href="/sign-in.jsp">登录</a></li>
        <%--<li ><a href="sign-up.html">注册</a></li>--%>
        <li><a href="/reset-password.jsp">重置密码</a></li>
    </ul>


</div>
<div class="content">

    <div class="header">

        <h1 class="page-title">测试用例管理</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
        <li><a href="workersInfo.jsp">员工列表</a></li>
        <li><a href="workersInfoOperation.jsp" class="active">员工信息管理</a></li>

    </ul>

    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">

                <div class="tab-pane active in" id="home">
                    <form id="tab" action="/servlet/WorkerInfoServlet">
                        <label>员工编号</label>
                        <input type="text" class="input-xlarge" name="personNo" value="${param.get("personNo")}"
                               id="personNo">
                        <label>员工名称</label>
                        <input type="text" class="input-xlarge" name="personName" value="${param.get("personName")}"
                               id="personName">
                        <label>密码</label>
                        <input type="text" class="input-xlarge" name="personPassword"
                               value="${param.get("personPassword")}" id="personPassword">
                        <label>所属部门</label>
                        <input type="text" class="input-xlarge" name="personType" value="${param.get("personType")}"
                               id="personType">
                        <label>性别</label>
                        <input type="text" class="input-large" name="personSex" value="${param.get("personSex")}"
                               id="personSex">
                        <label>邮箱</label>
                        <input type="text" class="input-large" name="personEmail" value="${param.get("personEmail")}"
                               id="personEmail">

                        <br>
                        <input type="submit" value="添加" class="btn-primary" style="height: 40px;width: 80px;"
                               name="addPerson">
                        <input type="submit" value="修改" class="btn-primary"
                               style="height: 40px;width: 80px;margin-left: 30px" name="changePerson">
                    </form>
                </div>
            </div>

            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Delete Confirmation</h3>
                </div>
                <div class="modal-body">

                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete
                        the user?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                    <button class="btn btn-danger" data-dismiss="modal">Delete</button>
                </div>
            </div>


            <footer>
                <hr>


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

    var personNo = $("#personNo");
    var personType = $("#personType");
    if (personNo.val() != "") personNo.attr("readonly", "readonly");
    if (personType.val() != "") personType.attr("readonly", "readonly");
</script>

</body>
</html>


