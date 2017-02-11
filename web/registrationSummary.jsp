<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 25/01/17
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<jsp:setProperty name="UserBean" property="*"/>
<html>
<head>
    <title>Registrazione Avvenuta</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<div class="site-branding-area" style="display: block">
    <div class="container">
        <div class="row">

            <div class="col-sm-6">
                <div class="logo">
                    <%--<h1><a href="index.jsp"><span>DaDa</span></a></h1>--%>
                    <h1><a href="home.jsp"></a></h1>
                    <img src="img/DaDalogo.png" style="width:150px;height:150px; padding:10px">
                </div>
            </div>

            <div class="col-sm-6">
                <div class="shopping-item2">
                    <span class="cart-amunt"> Account: <jsp:getProperty name="UserBean" property="name"/> </span> <img class="img-circle" src="img/cats-politics-TN.jpg">
                </div>

            </div>

            <div class="user-menu">
                <ul>

                    <li><a href="registrationSummary.jsp"><i class="fa fa-user"></i>Ciao, <jsp:getProperty name="UserBean" property="name"/></a></li>
                    <li><a href="login.jsp"><i class="fa fa-user"></i>Logout</a></li>
                </ul>
            </div>


        </div>
    </div>
</div><!-- End site branding area -->

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />

Benvenuto in DaDa!
<br>
Nome: <jsp:getProperty property="name" name="UserBean" /><br>
Email: <jsp:getProperty property="email" name="UserBean" /><br>
</body>
</html>
