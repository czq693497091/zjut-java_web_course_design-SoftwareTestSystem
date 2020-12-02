<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
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
    <script src="../lib/table2excel.js"></script>
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
    <!--<link rel="shortcut icon" href="../assets/ico/favicon.ico">-->
    <!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">-->
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
        <li><a href="index.jsp">首页</a></li>
        <li><a href="projects.jsp">项目列表</a></li>
        <li><a href="workersInfo.jsp">员工信息</a></li>
        <li><a href="workers.jsp">成员列表</a></li>
        <li class="active"><a href="tasks.jsp">任务列表</a></li>
        <li><a href="testSample.jsp">测试用例列表</a></li>
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

        <h1 class="page-title">任务列表</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
        <li class="active">任务列表</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">

            <div class="btn-toolbar">
                <a class="btn btn-primary" href="taskOperation.jsp"><i class="icon-plus"></i> 任务</a>
                <!--<button class="btn">Import</button>-->
                <button class="btn" onclick="Export('taskTable')">导出</button>

            </div>
            <%
                if (request.getAttribute("result") != null) {
            %>
            <script type="text/javascript">alert("操作失败！")</script>
            <%
                }
            %>
            <div class="btn-group">
                <form action="/servlet/TaskServlet" method="post">
                    <label>
                        <span>项目编号：</span>
                        <input type="text" style="height: 20px" name="projectNo">
                        <span style="margin-left: 20px">任务编号：</span>
                        <input type="text" style="height: 20px" name="taskNo">
                        <span style="margin-left: 20px">项目经理编号：</span>
                        <input type="text" style="height: 20px" name="projectManagerNo">
                        <span style="margin-left: 20px">产品经理编号：</span>
                        <input type="text" style="height: 20px" name="productManagerNo"><br><br>
                        <span>开发者编号：</span>
                        <input type="text" style="height: 20px" name="developerNo">
                        <span style="margin-left: 20px">测试者编号：</span>
                        <input type="text" style="height: 20px" name="testerNo">
                        <span style="margin-left: 20px">完成状态</span>
                        <input type="text" style="height: 20px" name="status">
                        <input type="submit" style="margin-left: 20px" value="查询" class="btn btn-primary"
                               name="checkTask">
                    </label>
                </form>
            </div>
            <div class="well">
                <table class="table" id="taskTable">
                    <thead>
                    <tr>
                        <th>任务编号</th>
                        <th>项目编号</th>
                        <th>任务名称</th>
                        <th>项目经理编号</th>
                        <th>项目经理名称</th>
                        <th>产品经理编号</th>
                        <th>产品经理名称</th>
                        <th>开发者编号</th>
                        <th>开发者名称</th>
                        <th>测试者编号</th>
                        <th>测试者名称</th>
                        <th>完成状态</th>
                        <th>开始日期</th>
                        <th>截止日期</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<Map<String, String>> arrayList = new ArrayList<>();
                        if (session.getAttribute("taskList") != null) {
                            arrayList = (ArrayList<Map<String, String>>) session.getAttribute("taskList");
                            for (int i = 0; i < arrayList.size(); i++) {
                                Map<String, String> itemMap = arrayList.get(i);
                    %>
                    <tr>
                        <td><%=itemMap.get("taskNo")%>
                        </td>
                        <td><%=itemMap.get("projectNo")%>
                        </td>
                        <td><%=itemMap.get("taskName")%>
                        </td>
                        <td><%=itemMap.get("projectManagerNo")%>
                        </td>
                        <td><%=itemMap.get("projectManagerName")%>
                        </td>
                        <td><%=itemMap.get("productManagerNo")%>
                        </td>
                        <td><%=itemMap.get("productManagerName")%>
                        </td>
                        <td><%=itemMap.get("developerNo")%>
                        </td>
                        <td><%=itemMap.get("developerName")%>
                        </td>
                        <td><%=itemMap.get("testerNo")%>
                        </td>
                        <td><%=itemMap.get("testerName")%>
                        </td>
                        <td><%=itemMap.get("status")%>
                        </td>
                        <td><%=itemMap.get("startDate")%>
                        </td>
                        <td><%=itemMap.get("endDate")%>
                        </td>
                        <td>
                            <%
                                String href = "taskNo=" + itemMap.get("taskNo");
                                href += "&projectNo=" + itemMap.get("projectNo");
                                href += "&taskName=" + itemMap.get("taskName");
                                href += "&projectManagerNo=" + itemMap.get("projectManagerNo");
                                href += "&productManagerName=" + itemMap.get("productManagerName");
                                href += "&productManagerNo=" + itemMap.get("productManagerNo");
                                href += "&productManagerName=" + itemMap.get("productManagerName");
                                href += "&developerNo=" + itemMap.get("developerNo");
                                href += "&developerName=" + itemMap.get("developerName");
                                href += "&testerNo=" + itemMap.get("testerNo");
                                href += "&testerName=" + itemMap.get("testerName");
                                href += "&status=" + itemMap.get("status");
                                href += "&startDate=" + itemMap.get("startDate");
                                href += "&endDate=" + itemMap.get("endDate");
                            %>
                            <%
                            if (itemMap.get("projectManagerNo").equals(((Person) session.getAttribute("Person")).getNo())){
                                %>
                            <a href="taskOperation.jsp?<%=href%>">
                                <i class="icon-pencil"></i></a>
                            <a href="/servlet/TaskServlet?deleteTask=1&projectNo=<%=itemMap.get("projectNo")%>&taskNo=<%=itemMap.get("taskNo")%>"
                               onclick="return confirm('确认删除?')" data-toggle="modal"><i class="icon-remove"></i></a>
                            <%
                            }
                            %>

                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>


                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <%--<ul>--%>
                    <%--<li><a href="#">Prev</a></li>--%>
                    <%--<li><a href="#">1</a></li>--%>
                    <%--<li><a href="#">2</a></li>--%>
                    <%--<li><a href="#">3</a></li>--%>
                    <%--<li><a href="#">4</a></li>--%>
                    <%--<li><a href="#">Next</a></li>--%>
                <%--</ul>--%>
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
</script>

</body>
</html>


