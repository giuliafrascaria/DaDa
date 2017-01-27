<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.articles.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<jsp:useBean id="ArticleBean" scope="request" class="javabean.ArticleBean"/>
<jsp:setProperty name="ArticleBean" property="*"/>


<%
    if(UserBean.getEmail() == null) {
        System.out.println("faccio il redirect");
        response.sendRedirect("login.jsp");
        return;
    }
%>


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
        <form action="recensione2.jsp" name="myform">
        <%
            ArrayList<Article> a = UserBean.getArticleList();
            if(a!=null){
                for (Article anA : a) {
        %>

                <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                        <div class="containerx">
                            <img src="img/<%=anA.getImage()%>" class="imagex">
                            <div class="middlex">

                                    <div class="textx" >
                                        <label for="nome"><%=anA.getNome()%> </label><br><input name="nome" type="hidden" id="nome">
                                        <label for="proprietario"><%=anA.getProprietario()%> </label><br><input name="proprietario" type="hidden" id="proprietario">
                                        <input type="submit" name = "submit" value="Recensisci" >
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
                    <label> Non sono presenti articoli da recensire</label><br>
                </div>
        <%
            }
        %>
        </form>
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
