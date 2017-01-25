<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 23/01/17
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="RegistrationBean" scope="session" class="javabean.RegistrationBean"/>

<jsp:setProperty name="RegistrationBean" property="*"/>

<%
    if (request.getParameter("submit") != null) {
        if (RegistrationBean.validate())
        {
%>
<!-- Passa il controllo alla nuova pagina -->
            <jsp:forward page="registrationSummary.jsp" />
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

<div style="text-align: center;">
    <div class="registrationform" style="text-align: center" >

        <form action="registrationForm.jsp" name="myform" method="post">
            <div id="customer_details" class="col2-set">

                Nome: <br>
                <input type = "text" name = "name" id="name"><br>
                Cognome: <br>
                <input type = "text" name = "surname" id="surname"><br>
                Email: <br>
                <input type = "text" name = "email" id="email"><br>
                Password: <br>
                <input type = "password" name = "password" id="password"><br>
                Conferma Password: <br>
                <input type = "password" name = "confermapassword" ><br>
                <input type="submit" name = "submit" value="submit"> <br>
            </div>
        </form>


    </div>

</div>



<%--<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />--%>

</body>
</html>
