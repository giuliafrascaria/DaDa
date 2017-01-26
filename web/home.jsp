<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 23/01/17
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<html>
<head>
    <title>DaDa - HOMEPAGE </title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />

</head>


<body>


<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />


<%
    if (UserBean.getEmail() == null) {
%>


        <jsp:include page="jspPageTemplates/brandingArea.jsp"/>
<%
    }
    else
    {
%>
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
                    <span class="cart-amunt"> Account: <jsp:getProperty name="UserBean" property="email"/> </span> <img class="img-circle" src="img/cats-politics-TN.jpg">
                </div>

            </div>

            <div class="user-menu">
                <ul>

                    <li><a href="registrationSummary.jsp"><i class="fa fa-user"></i>Ciao, <jsp:getProperty name="UserBean" property="name"/></a></li>
                    <li><a href="/logout.jsp"><i class="fa fa-user"></i>Logout</a></li>
                </ul>
            </div>


        </div>
    </div>
</div><!-- End site branding area -->
<%
    }
%>

<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />


<div class="slider" id="main-slider"><!-- outermost container element -->
    <div class="slider-wrapper"><!-- innermost wrapper element -->
        <img src="http://lorempixel.com/1024/400/animals" alt="First" class="slide" /><!-- slides -->
        <img src="http://lorempixel.com/1024/400/business" alt="Second" class="slide" />
        <img src="http://lorempixel.com/1024/400/city" alt="Third" class="slide" />
    </div>
</div>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />
<script src="jspPageTemplates/js/slideshow.js"></script>
</body>
</html>
