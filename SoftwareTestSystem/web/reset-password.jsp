<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>密码重置</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

      <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">

      <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
      <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">
      <script src="myJS/Func.js"></script>
      <script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>

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
    <!--<link rel="shortcut icon" href="../assets/ico/favicon.ico">-->
    <!--<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">-->
    <!--<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">-->
    <!--<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">-->
    <!--<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">-->
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
                    
                </ul>
                <a class="brand" href="sign-in.jsp"><span class="first">CZQ</span> <span class="second">软件测试管理系统</span></a>
        </div>
    </div>
    


    

    
        <div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <%
                if (request.getParameter("result")!=null){
                %>
            <script type="text/javascript">alert("原密码错误！")</script>
            <%
            }
            %>

            <p class="block-heading">密码重置</p>
            <div class="block-body">
                <form method="post" action="/servlet/LoginServlet" id="resetPasswordForm">
                    <label>账号</label>
                    <input type="text" class="span12" name="account"/>
                    <label>原始密码</label>
                    <input type="password" class="span12" name="originPassword" id="originPassword">
                    <label>新密码</label>
                    <input type="password" class="span12" name="newPassword" id="newPassword">
                    <label>密码确认</label>
                    <input type="password" class="span12" name="reNewPassword" id="reNewPassword">
                    <!--<a href="/projectManager/index.jsp" class="btn btn-primary pull-right" onclick="checkPassword()">提交修改</a>-->
                    <input type="submit" class="btn btn-primary pull-right" name="changePassword" onclick="checkPassword()" value="提交修改">
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
        <a href="sign-in.jsp">Sign in to your account</a>
    </div>
</div>


    


    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  </body>
</html>


