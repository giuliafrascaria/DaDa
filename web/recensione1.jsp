<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.articles.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<%--
<jsp:useBean id="ArticleBean" scope="request" class="javabean.ArticleBean"/>
--%>

<%--
<%@ page import="javabean.UserBean" %>
--%>
<%
    if(UserBean.getEmail() == null) {
        System.out.println("faccio il redirect");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%--
<jsp:setProperty name="ArticleBean" property="*"/>
--%>

<html>
<head>
    <title>DaDa-Recensione</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>
<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />


<div class="container">
    <div class="row" id ="riga">
        <%
            System.out.println("valore della mail (recensione) = " + UserBean.getEmail());
            ArrayList<Article> a = UserBean.getArticleList();
            System.out.println("sono arrivato fin qui");
            if(a!=null){
                for (Article anA : a) {
        %>
        <form action="home.jsp" name="myform" method="post">
                <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                        <div class="containerx">
                            <img src="img/<%= anA.getImage() %>" class="imagex">
                            <div class="middlex">
                                <div class="textx" >
                                    <input type="hidden" name="nome" value="<%= anA.getNome() %>">
                                    <input type="hidden" name="proprietario" value="<%= anA.getProprietario()%>">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </form>
        <%
                }
            }
            else{
                    System.out.println("non ho trovato nulla");
        %>
                <div style="text-align: center; padding: 100px" >
                    <label> Non sono presenti articoli da recensire</label><br>
                </div>
        <%
            }
        %>
    </div>
</div>



<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />


<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="jspPageTemplates/js/owl.carousel.min.js"></script>
<script src="jspPageTemplates/js/jquery.sticky.js"></script>
<script src="jspPageTemplates/js/jquery.easing.1.3.min.js"></script>
<script src="jspPageTemplates/js/main.js"></script>

</body>
</html>
