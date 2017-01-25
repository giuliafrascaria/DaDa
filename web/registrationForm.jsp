<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 23/01/17
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="RegistrationBean" scope="request" class="javabean.RegistrationBean"/>

<jsp:setProperty name="RegistrationBean" property="*"/>

<%
    if (request.getParameter("submit") != null) {
        if (RegistrationBean.validate())
        {
%>
<!-- Passa il controllo alla nuova pagina -->
            <jsp:forward page="index.jsp" />
<%
        }
    }
%>
<html>
<head>
    <title>DaDa - registrati come privato</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />

<div class="registrationform">
    <form action="registrationForm.jsp" name="myform" method="post">
        Nome: <br>
        <input type = "text" name = "firstname" ><br>
        Cognome: <br>
        <input type = "text" name = "surname" ><br>
        Email: <br>
        <input type = "text" name = "email" ><br>
        Password: <br>
        <input type = "password" name = "password" ><br>
        Conferma Password:
        <input type = "password" name = "confermapassword" ><br>
        <input type="submit" name = "submit" value="submit"> <br>

        <%
            if (request.getParameter("submit") != null) {
        %>
                <p style="text-color: red;">Dati errati</p>
        <%
            }
        %>
    </form>
</div>
<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

</body>
</html>
