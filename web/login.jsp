
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
        if (result == 1) {

            UserBean.setName(LoginBean.getName());
            UserBean.setEmail(LoginBean.getEmail());
            UserBean.setAccountType(LoginBean.getAccountType());
            UserBean.setBalance(LoginBean.getBalance());

            System.out.println(UserBean.getName());
            if(LoginBean.getAccountType() == 0){ //root user
                response.sendRedirect("AdminPage.jsp");
            }
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
        <input type = "password" name = "password" id="password">
        <div style="padding: 10px">
        <input type="submit" name = "submit" value="submit" >
        </div>
    </form>
</div>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

</body>
</html>
