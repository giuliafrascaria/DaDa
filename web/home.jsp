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

    <jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />

<%
    }
    else
    {
%>
    <%--<jsp:include page="jspPageTemplates/AccountArea.jsp" flush="true" />--%>
    <h1> ciao <jsp:getProperty name="UserBean" property="name"/></h1>
<%
    }
%>

<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />


    <div id="slideshow">
        <div>
            <img src="img/product-1.jpg">
        </div>
        <div>
            <img src="img/product-2.jpg">
        </div>
        <div>
            <img src="img/product-3.jpg">
        </div>
    </div>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

</body>
</html>
