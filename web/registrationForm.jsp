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
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<%
    if (request.getParameter("submit") != null) {%>
        <%! int result ;%>
<%
        result = RegistrationBean.validate();
        if (result == 1)
        {

%>
<!-- Passa il controllo alla nuova pagina -->
            <jsp:setProperty name="UserBean" property="email"/>
            <jsp:setProperty name="UserBean" property="name"/>

            <%--<jsp:forward page="home.jsp" />&ndash;%&gt;--%>
<%
            UserBean.setAccountType(1);
            UserBean.setBalance(RegistrationBean.getBalance());
            response.sendRedirect("home.jsp");
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

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />

<div style="text-align: center">
        <%if (request.getParameter("submit") != null) {
            if (result == 2) {%>
        <div class="alert alert-danger" role="alert">This email is already associated with a user, try to log in.</div><%
            } if (result == 3) {%>
        <div class="alert alert-danger" role="alert">An error occur during the process. Please try again later</div><%
            } if(result == 4) {%>
        <div class="alert alert-danger" role="alert">Passwords do not match</div><%
            } if(result == 5) {%>
        <div class="alert alert-danger" role="alert">Missing fields found</div><%
             }
       }
        %>

        <form action="registrationForm.jsp" name="myform" method="post">

                Nome: <br>
                <input type = "text" name = "name" id="name"><br>
                Cognome: <br>
                <input type = "text" name = "surname" id="surname"><br>
                Email: <br>
                <input type = "text" name = "email" id="email"><br>
                Password: <br>
                <input type = "password" name = "password" id="password"><br>
                Conferma Password: <br>
                <input type = "password" name = "confirmpassword" id="confirmpassword"><br>
                <input type="submit" name = "submit" value="submit" style="padding: 5px"> <br>

        </form>
<%--<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />--%>
</div>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

</body>
</html>
