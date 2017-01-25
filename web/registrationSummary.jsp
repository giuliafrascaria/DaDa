<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 25/01/17
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="RegistrationBean" scope="session" class="javabean.RegistrationBean"/>

<jsp:setProperty name="RegistrationBean" property="*"/>
<html>
<head>
    <title>Title</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />

Login effettuato con:
<br>
Nome: <jsp:getProperty property="name" name="RegistrationBean" /><br>
Cognome: <jsp:getProperty property="surname" name="RegistrationBean" /><br>
Email: <jsp:getProperty property="email" name="RegistrationBean" /><br>
</body>
</html>
