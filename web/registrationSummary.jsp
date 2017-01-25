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
    <title>Title</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />

Benvenuto in DaDa!
<br>
Nome: <jsp:getProperty property="name" name="UserBean" /><br>
Email: <jsp:getProperty property="email" name="UserBean" /><br>
</body>
</html>
