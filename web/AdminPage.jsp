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


<%
    if (request.getParameter("submit") != null) {
%>
<%! String result ;%>
<%
        result = ListRegisteredUserBean.submission();
        System.out.println(result);
    }
%>


<div class="container">
    <div class="row" id ="riga">
        <h2> Registered users </h2>
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
            th, td {
                padding: 15px;
            }
        </style>
        <table style="width:100%">
            <tr>
                <th>Email address</th>
                <th>Type of user</th>
                <th>User contact</th>
                <th>User password</th>
                <th>Is user valid</th>
                <th>Validate or delete user</th>
            </tr>
        <%
            ArrayList<RegisteredUser> reglist = ListRegisteredUserBean.listRegisteredUsers();
            if(reglist!=null) {
                for (RegisteredUser registeredUser : reglist) {

        %>

        <div class="col-md-3 col-sm-6">
                <tr>
                    <td><%=registeredUser.getEmail()%></td>
                    <td>
                        <%=registeredUser.getType()%>
                    </td>
                    <td><%=registeredUser.getContact()%></td>
                    <td><%=registeredUser.getPwd()%></td>
                    <td>
                        <%=registeredUser.getValid()%>

                    </td>
                    <td> <form action="AdminPage.jsp" name="myform" method="post">
                        <div>
                            <input type="submit" name = "Validate" value="validate" >
                        </div>
                        <br><br>
                        <div>
                            <input type="submit" name = "Delete" value="delete" >
                        </div>
                    </form></td>
                </tr>

        </div>
        <%
                }
            }
        %>
        </table>
        <p>0: Moderators</p>
        <p>1: Simple user</p>
        <p>2: Corporate</p>



    </div>
    </div>
</div>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />
</body>
</html>
