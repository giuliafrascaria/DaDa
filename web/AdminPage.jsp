<%@ page import="entity.articles.Article" %>
<%@ page import="entity.users.RegisteredUser" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: v2devnull
  Date: 31/01/17
  Time: 11.46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<jsp:setProperty name="UserBean" property="*"/>

<jsp:useBean id="ArticleBean" scope="request" class="javabean.ArticleBean"/>
<jsp:setProperty name="ArticleBean" property="*"/>

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
    if (request.getParameter("Validate") != null) {
        if (request.getParameter("action").equals("validate_article")) {
            String email_proprietario = request.getParameter("email_utente");
            String nome_articolo = request.getParameter("nome_articolo");
            System.out.println(email_proprietario + " " + nome_articolo);
            ArticleBean.validateArticle(email_proprietario, nome_articolo);
        }
        if (request.getParameter("action").equals("validate_user")) {
            String email = request.getParameter("email_utente");
            System.out.println(email);
            ListRegisteredUserBean.validateUser(email);
        }
    }
    if (request.getParameter("Delete") != null) {
        if (request.getParameter("action").equals("delete_article")) {
            String email_proprietario = request.getParameter("email_utente");
            String nome_articolo = request.getParameter("nome_articolo");
            System.out.println(email_proprietario + " " + nome_articolo);
            ArticleBean.deleteArticle(email_proprietario, nome_articolo);

        }
        if (request.getParameter("action").equals("delete_user")) {
            String email = request.getParameter("email_utente");
            System.out.println(email);
            ListRegisteredUserBean.deleteUser(email);
        }
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
                    <td><%=registeredUser.getType()%></td>
                    <td><%=registeredUser.getContact()%></td>
                    <td><%=registeredUser.getPwd()%></td>
                    <td><%=registeredUser.getValid()%>
                    </td>
                    <td>
                        <form action="AdminPage.jsp" name="myform" method="post">
                            <div>
                                <input type="text" hidden="true" name="action" value="validate_user">
                                <input type="text" hidden="true" name="email_utente" value="<%=registeredUser.getEmail()%>">
                                <input type="submit" name="Validate" value="validate" >
                            </div>
                        </form>
                        <form>
                            <div>
                                <input type="text" hidden="true" name="action" value="delete_user">
                                <input type="text" hidden="true" name="email_utente" value="<%=registeredUser.getEmail()%>">
                                <input type="submit" name="Delete" value="delete" >
                            </div>
                        </form>
                    </td>
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

        <div class="container">
            <div class="row" id ="riga2">
                <h2> Inserted articles </h2>
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
                        <th>Nome articolo</th>
                        <th>Proprietario</th>
                        <th>Prezzo</th>
                        <th>Quantità</th>
                        <th>da validare</th>
                        <th>Seriale</th>
                    </tr>
                    <%
                        ArrayList<Article> artlist = ArticleBean.listArticles();
                        if(artlist!=null) {
                            for (Article article : artlist) {

                    %>

                    <div class="col-md-3 col-sm-6">
                        <tr>
                            <td><%=article.getNome()%></td>
                            <td><%=article.getProprietario().getEmail()%></td>
                            <td><%=article.getPrezzo()%></td>
                            <td><%=article.getQuantità()%></td>
                            <td><%=article.getValidation()%></td>
                            <td><%=article.getImage()%></td>
                            <td>
                                <form action="AdminPage.jsp" name="myform" method="post">
                                    <div>
                                        <input type="text" hidden="true" name="action" value="validate_article">
                                        <input type="text" hidden="true" name="nome_articolo" value="<%=article.getNome()%>">
                                        <input type="text" hidden="true" name="email_utente" value="<%=article.getProprietario().getEmail()%>">
                                        <input type="submit" name="Validate" value="validate" >
                                    </div>
                                </form>
                                <form>
                                    <div>
                                        <input type="text" hidden="true" name="action" value="delete_article">
                                        <input type="text" hidden="true" name="nome_articolo" value="<%=article.getNome()%>">
                                        <input type="text" hidden="true" name="email_utente" value="<%=article.getProprietario().getEmail()%>">
                                        <input type="submit" name="Delete" value="delete" >
                                    </div>
                                </form>
                            </td>
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
