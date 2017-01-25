<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 24/01/17
  Time: 09:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DaDa - registrati come azienda</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

    <form action="RegistrationServlet" method="post">
        Nome Azienda: <br>
        <input type = "text" name = "name" ><br>
        Proprietario: <br>
        <input type = "text" name = "owner" ><br>
        Email: <br>
        <input type = "text" name = "email" ><br>
        Password: <br>
        <input type = "password" name = "password" ><br>
        <input type="submit" value="Submit"> <br>
    </form>

</body>
</html>
