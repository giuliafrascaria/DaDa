<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.users.RegisteredUser" %><%--
  Created by IntelliJ IDEA.
  User: v2devnull
  Date: 31/01/17
  Time: 11.46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<jsp:setProperty name="UserBean" property="*"/>


<jsp:useBean id="ListRegisteredUserBean" scope="request" class="javabean.ListRegisteredUsersBean"/>
<jsp:setProperty name="ListRegisteredUserBean" property="*"/>

<html>
<head>
    <title>Hello, Admin!</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>
<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true"/>

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />

<div class="container">
    <div class="row" id ="riga">
        <table border="1">
        <%
            ArrayList<RegisteredUser> reglist = ListRegisteredUserBean.listRegisteredUsers();
            if(reglist!=null) {
                for (RegisteredUser registeredUser : reglist) {

        %>

        <div class="col-md-3 col-sm-6">

                <tr>
                    <td><%=registeredUser.getEmail()%></td>
                    <td><%=registeredUser.getType()%></td>
                    <td><%=registeredUser.getContact()%></td>
                    <td><%=registeredUser.getPwd()%></td>
                    <td><%=registeredUser.getValid()%></td>
                </tr>

        </div>
        <%
                }
            }
        %>
        </table>

    </div>
</div>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />
</body>
</html>
