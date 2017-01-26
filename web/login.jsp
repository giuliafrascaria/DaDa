<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 23/01/17
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="LoginBean" scope="session" class="javabean.LoginBean"/>

<jsp:setProperty name="LoginBean" property="*"/>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<%
    if (request.getParameter("submit") != null) {
%>
        <%! int result ;%>
<%
        result = LoginBean.validate();
        if (result == 1)
        {
%>
            <jsp:setProperty name="UserBean" property="email"/>
            <jsp:setProperty name="UserBean" property="name"/>
<%
            response.sendRedirect("home.jsp");
        }
    }
%>
<html>
<head>
    <title>DaDa - Login</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />


<div style="text-align: center">
    <%if (request.getParameter("submit") != null) {
        if (result == 2) {%>
    <div class="alert alert-danger" role="alert">Missing fields found</div><%
        } if (result == 3) {%>
    <div class="alert alert-danger" role="alert">This mail is not registered, sign up before log in</div><%
        } if(result == 4) {%>
    <div class="alert alert-danger" role="alert">Wrong password</div><%
        } if(result == 5) {%>
    <div class="alert alert-danger" role="alert">An error occurred, please try again later</div><%
            }
        }
    %>

    <form action="login.jsp" name="myform" method="post">

        Email: <br>
        <input type = "text" name = "email" id="email"><br>
        Password: <br>
        <input type = "password" name = "password" id="password"><br>
        <input type="submit" name = "submit" value="submit" style="padding: 10px"> <br>

    </form>
</div>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

</body>
</html>
