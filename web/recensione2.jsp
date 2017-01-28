<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<jsp:useBean id="ArticleBean" scope="request" class="javabean.ArticleBean"/>
<jsp:setProperty name="ArticleBean" property="*"/>

<jsp:useBean id="ReviewBean" scope="session" class="javabean.ReviewBean"/>
<jsp:setProperty name="ReviewBean" property="*"/>

<%
    if(UserBean.getEmail() == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    else
        ReviewBean.resetBean();
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

<%
    /*ReviewBean.setUtente(UserBean.getEmail());*/
    ReviewBean.setArticolo(ArticleBean.getNome());
    ReviewBean.setProprietario(ArticleBean.getProprietario());
%>
<jsp:setProperty name="ReviewBean" property="utente" value="<%=UserBean.getEmail()%>"/>



<form action="recensione3.jsp" name="myform">
    <div style="text-align: center; padding:20px">

<%--        Email: <br>
        <input type = "text" name="testo" id="email"><br>--%>
        <label>
            <textarea name="testo" rows="10" cols="50" class="myTextArea">Inserisci la tua recensione qui</textarea>
        </label> <br>
        <input class="star star-5" id="star-5" type="radio" name="star" onclick="<%ReviewBean.setRating(5);%>"/>
        <label class="star star-5" for="star-5"></label>
        <input class="star star-4" id="star-4" type="radio" name="star" onclick="<%ReviewBean.setRating(4);%>"/>
        <label class="star star-4" for="star-4"></label>
        <input class="star star-3" id="star-3" type="radio" name="star" onclick="<%ReviewBean.setRating(3);%>"/>
        <label class="star star-3" for="star-3"></label>
        <input class="star star-2" id="star-2" type="radio" name="star" onclick="<%ReviewBean.setRating(2);%>"/>
        <label class="star star-2" for="star-2"></label>
        <input class="star star-1" id="star-1" type="radio" name="star" onclick="<%ReviewBean.setRating(1);%>"/>
        <label class="star star-1" for="star-1"></label>
        <input type="submit" name = "submit" value="Recensisci" >
    </div>
</form>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

<jsp:setProperty name="ReviewBean" property="utente" value="<%=UserBean.getEmail()%>"/>


<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="jspPageTemplates/js/owl.carousel.min.js"></script>
<script src="jspPageTemplates/js/jquery.sticky.js"></script>
<script src="jspPageTemplates/js/jquery.easing.1.3.min.js"></script>
<script src="jspPageTemplates/js/main.js"></script>

</body>
</html>
