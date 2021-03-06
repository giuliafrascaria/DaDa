<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 24/01/17
  Time: 09:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:useBean id="CorpRegistrationBean" scope="session" class="javabean.CorpRegistrationBean"/>

<jsp:setProperty name="CorpRegistrationBean" property="*"/>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<%
    if (request.getParameter("submit") != null) {%>
<%! int result ;%>
<%
    result = CorpRegistrationBean.validate();
    if (result == 1)
    {

%>
<!-- Passa il controllo alla nuova pagina -->
            <jsp:setProperty name="UserBean" property="email"/>
            <jsp:setProperty name="UserBean" property="name"/>

<%--<jsp:forward page="home.jsp" />&ndash;%&gt;--%>
<%
            response.sendRedirect("home.jsp");
        }
    }
%>

<html>
<head>
    <title>DaDa - registrati come azienda</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />

    <%if (request.getParameter("submit") != null) {
        if (result == 2) {%>
    <div class="alert alert-danger" role="alert">This email is already associated with a user.</div><%
        } if (result == 3) {%>
    <div class="alert alert-danger" role="alert">An error occur during the process. Please try again later</div><%
        } if(result == 4) {%>
    <div class="alert alert-danger" role="alert">Passwords do not match</div><%
        } if(result == 5) {%>
    <div class="alert alert-danger" role="alert">Missing fields found</div><%
        }
    }
    %>


    <form action="registrationFormAzienda.jsp" name="myform" method="post">
        Nome Azienda: <br>
        <input type = "text" name = "name" id="name"><br>
        Proprietario: <br>
        <input type = "text" name = "owner" id="owner"><br>
        Email: <br>
        <input type = "text" name = "email" id="email"><br>
        Password: <br>
        <input type = "password" name = "password" ><br>
        Conferma password: <br>
        <input type = "password" name = "confirmpassword" id="confirmpassword"><br>
        <input type="submit" name = "submit" value="submit"> <br>
    </form>



</body>
</html>
