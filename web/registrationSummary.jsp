<%@ page import="entity.articles.Article" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 25/01/17
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<jsp:setProperty name="UserBean" property="*"/>

<jsp:useBean id="ArticleBean" scope="request" class="javabean.ArticleBean"/>
<jsp:setProperty name="ArticleBean" property="*"/>
<html>
<head>
    <title>Profilo Personale</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<div class="site-branding-area" style="display: block">
    <div class="container">
        <div class="row">

            <div class="col-sm-6">
                <div class="logo">
                    <%--<h1><a href="index.jsp"><span>DaDa</span></a></h1>--%>
                    <h1><a href="home.jsp"></a></h1>
                    <img src="img/DaDalogo.png" style="width:150px;height:150px; padding:10px">
                </div>
            </div>

            <div class="col-sm-6">
                <div class="shopping-item2">
                    <span class="cart-amunt"> Account: <jsp:getProperty name="UserBean" property="name"/> </span> <img class="img-circle" src="img/cats-politics-TN.jpg">
                </div>

            </div>

            <div class="user-menu">
                <ul>

                    <li><a href="registrationSummary.jsp"><i class="fa fa-user"></i>Ciao, <jsp:getProperty name="UserBean" property="name"/></a></li>
                    <li><a href="login.jsp"><i class="fa fa-user"></i>Logout</a></li>
                </ul>
            </div>


        </div>
    </div>
</div><!-- End site branding area -->

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />


<div style="text-align: center">
    <label style="padding: 20px; font-family: 'Titillium Web', sans-serif ; font-size: 16px">
Benvenuto in DaDa!
    </label>
<br>
Nome: <jsp:getProperty property="name" name="UserBean" /><br>
Email: <jsp:getProperty property="email" name="UserBean" /><br>

</div>

<div class="container">
    <div class="row" id ="riga">
        <%
            ArrayList<Article> a = UserBean.getSoldList();
            if(a!=null){
                for (Article anA : a) {
        %>

        <label style="padding: 20px; font-family: 'Titillium Web', sans-serif ; font-size: 16px">
            Articoli Venduti
        </label>

        <div class="col-md-3 col-sm-6">
            <div class="single-shop-product">
                <div class="containerx">
                    <img src="img/<%=anA.getImage()%>" class="imagex">
                    <div class="middlex">

                        <form action="recensione2.jsp" name="myform">
                            <div class="textx" >
                                <label for="nome"><%=anA.getNome()%> </label><br><input name="nome" type="hidden" id="nome" value="<%=anA.getNome()%>">
                                <label for="proprietario"><%=anA.getProprietario().getEmail()%> </label><br><input name="proprietario" type="hidden" id="proprietario" value="<%=anA.getProprietario().getEmail()%>">
                                <input type="submit" name = "submit" value="Recensisci" >
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%
            }
        }
        else{
            System.out.println("non ho trovato nulla");
        %>
        <div style="text-align: center; padding: 100px" >
            <label> Non hai venduto articoli</label><br>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
