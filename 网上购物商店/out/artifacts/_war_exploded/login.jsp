<%--
  Created by IntelliJ IDEA.
  User: 黑猫LOOK
  Date: 2020/6/2
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <style>
        .container{
            width: 16%;
            margin: 200px 100px 0px 900px;
            padding :50px 50px 50px 50px;
            background-color:white;
        }
        .common{
            width: 230px;
            height: 30px;
        }
        div{
            margin-top: 20px;
        }
        span{
            display: inline-block;
            width: 150px;
            text-align: right;
        }
        #register{
            margin-bottom:20px;
        }
        h1{
            color:#afdd22;
        }
        #in{
            border:1px solid #ddd;
            padding-left:38px;
            box-sizing:border-box;
            background-image:url(image/登录.png);
            background-size: 25px;
            background-repeat:no-repeat;
            background-position:3% center;
            padding-right:50px;
            height:30px;
            width:230px;
        }
        #in2{
            border:1px solid #ddd;
            padding-left:38px;
            box-sizing:border-box;
            background-image:url(image/登录时密码.png);
            background-size: 25px;
            background-repeat:no-repeat;
            background-position:3% center;
            padding-right:50px;
            height:30px;
            width:230px;
        }
        #lo{
            border:#afdd22;
            font-size:16px;
            background-color:#afdd22;
            color:white;
        }
    </style>
</head>
<body background="image/flower.jpg">
<div class="container">
    <form action="LoginServlet" method="post" name="from">
        <div>
            <h1>账户登录</h1>
        </div>
        <div>
            <input type="text" name="user_id"  id="in" placeholder="账户名"/>
        </div>
        <div>
            <input type="password" name="password" id="in2" placeholder="账户密码"/>
        </div>
        <div>
            <input type="submit" value="登录" class="common" id="lo"/>
        </div>
    </form>
    <form  action="register2.jsp" method="post" name="from2">
        <div id="register">
            <input type="submit" value="注册" class="common" id="lo"/>
        </div>
    </form>
</div>
</body>
</html>