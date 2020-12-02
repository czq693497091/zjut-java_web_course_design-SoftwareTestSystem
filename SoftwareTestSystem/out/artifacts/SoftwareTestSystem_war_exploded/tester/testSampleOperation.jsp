<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.beans.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
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

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->
    
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                    <li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">欢迎你</a></li>
                    <li id="fat-menu" class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i><%=((Person)session.getAttribute("Person")).getName()%>
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
            <li ><a href="projects.jsp" class="active">项目列表</a></li>
            <li><a href="workersInfo.jsp">员工信息</a></li>
            <li ><a href="workers.jsp" >成员列表</a></li>
            <li ><a href="tasks.jsp">任务列表</a></li>
            <li class="active"><a href="testSample.jsp">测试用例列表</a></li>
            <li ><a href="bugs.jsp">Bug列表</a></li>
            <!--<li ><a href="media.html">Media</a></li>-->
            <!--<li ><a href="calendar.html">Calendar</a></li>-->
            
        </ul>

        <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>账户管理<span class="label label-info">+3</span></a>
        <ul id="accounts-menu" class="nav nav-list collapse">
            <li ><a href="/sign-in.jsp">登录</a></li>
            <%--<li ><a href="sign-up.html">注册</a></li>--%>
            <li ><a href="/reset-password.jsp">重置密码</a></li>
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
            
            <h1 class="page-title">测试用例管理</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
            <li ><a href="testSample.jsp">测试用例列表</a></li>
            <li ><a href="testSampleOperation.jsp" class="active">测试用例管理</a></li>

        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                    
<!--<div class="btn-toolbar">-->
    <!--<button class="btn btn-primary"><i class="icon-save"></i> Save</button>-->
    <!--<a href="#myModal" data-toggle="modal" class="btn">Delete</a>-->
  <!--<div class="btn-group">-->
  <!--</div>-->
<!--</div>-->
<div class="well">
    <!--<ul class="nav nav-tabs">-->
      <!--<li class="active"><a href="#home" data-toggle="tab">Profile</a></li>-->
      <!--<li><a href="#profile" data-toggle="tab">Password</a></li>-->
    <!--</ul>-->
    <!--<div id="myTabContent" class="tab-content">-->
      <div class="tab-pane active in" id="home">
          <!---->
          <%
              request.setCharacterEncoding("utf-8");
          String testSampleNo = "";
          String testSampleName = "";
          String type = "";
          String creatorNo = "";
          String testerNo = "";
          String result = "";
          String status = "";
          String date = "";

          if (request.getParameter("TestSampleNo")!=null) testSampleNo = request.getParameter("TestSampleNo");
          if (request.getParameter("TestSampleName")!=null) testSampleName = request.getParameter("TestSampleName");
          if (request.getParameter("type")!=null) type = request.getParameter("type");
          if (request.getParameter("creatorNo")!=null) creatorNo = request.getParameter("creatorNo");
          if (request.getParameter("executorNo")!=null) testerNo = request.getParameter("executorNo");
          if (request.getParameter("result")!=null) result = request.getParameter("result");
          if (request.getParameter("status")!=null) status = request.getParameter("status");
          if (request.getParameter("date")!=null) date = request.getParameter("date");
          %>
    <form id="tab" action="/servlet/TestSampleServlet">
        <label>测试用例编号</label>
        <input type="text" class="input-xlarge" name="TestSampleNo" value="<%=testSampleNo%>" id="testSampleNo">
        <label>测试用例名称</label>
        <input type="text" class="input-xlarge" name="TestSampleName" value="<%=testSampleName%>">
        <label>类型</label>
        <input type="text" class="input-xlarge" name="type" value="<%=type%>">
        <label>创建人编号</label>
        <input type="text" class="input-xlarge" name="creatorNo" value="<%=((Person) session.getAttribute("Person")).getNo()%>" id="creatorNo" readonly="readonly">
        <label>执行人编号</label>
        <input type="text" class="input-large" name="testerNo" value="<%=testerNo%>" id="executorNo">
        <label>结果</label>
        <input type="text" class="input-large" name="result" value="<%=result%>">
        <label>状态</label>
        <input type="text" class="input-large" name="status" value="<%=status%>">
        <label>执行时间</label>
        <input type="text" class="input-large" name="date" value="<%=date%>">
        <br>

        <input type="submit" value="添加" class="btn-primary" style="height: 40px;width: 80px;" name="addTestSample1">
        <input type="submit" value="修改" class="btn-primary" style="height: 40px;width: 80px;margin-left: 30px" name="changeTestSample1">
    </form>
      </div>
      <!--<div class="tab-pane fade" id="profile">-->
    <!--<form id="tab2">-->
        <!--<label>New Password</label>-->
        <!--<input type="password" class="input-xlarge">-->
        <!--<div>-->
            <!--<button class="btn btn-primary">Update</button>-->
        <!--</div>-->
    <!--</form>-->
      <!--</div>-->
  <!--</div>-->

</div>

<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Delete Confirmation</h3>
  </div>
  <div class="modal-body">
    
    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
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
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });

        var testSampleNo = $("#testSampleNo");
        // var creatorNo = $("#creatorNo");
        var executorNo = $("#executorNo");
        if (testSampleNo.val()!="") testSampleNo.attr("readonly","readonly");
        // if (creatorNo.val()!="") creatorNo.attr("readonly","readonly");
        if (executorNo.val()!="") executorNo.attr("readonly","readonly");

    </script>
    
  </body>
</html>


