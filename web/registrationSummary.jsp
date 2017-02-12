<%@ page import="entity.articles.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<jsp:setProperty name="UserBean" property="*"/>

<html>
<head>
    <title>Profilo Personale</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />


<div style="text-align: center">
    <label style="padding: 20px; font-family: 'Titillium Web', sans-serif ; font-size: 16px">
Benvenuto in DaDa!
    </label>
<br>
    <label style="font-family: 'Titillium Web', sans-serif ; font-size: 16px" >Nome: <jsp:getProperty property="name" name="UserBean" /></label> <br>
<label style="font-family: 'Titillium Web', sans-serif ; font-size: 16px" > Email: <jsp:getProperty property="email" name="UserBean" /> </label> <br>
    <label style="padding: 20px; font-family: 'Titillium Web', sans-serif ; font-size: 16px">
        Articoli Venduti
    </label>
</div>

<div class="container">
    <div class="row" id ="riga">
        <%
            ArrayList<Article> a = UserBean.getSoldList();
            if(a!=null){
                for (Article anA : a) {
        %>
        <div class="col-md-3 col-sm-6">
            <div class="single-shop-product">
                <div class="containerx">
                    <img src="img/<%=anA.getImage()%>" class="imagex">
                    <div class="middlex">
                        <div class="textx" >
                            <label for="nome"><%=anA.getNome()%> </label><br><input name="nome" type="hidden" id="nome" value="<%=anA.getNome()%>">
                            <label for="proprietario"><%=anA.getProprietario().getEmail()%> </label><br><input name="proprietario" type="hidden" id="proprietario" value="<%=anA.getProprietario().getEmail()%>">
                        </div>
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
