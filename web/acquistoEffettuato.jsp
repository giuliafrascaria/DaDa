<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>


<jsp:useBean id="BuyArticleBean" scope="session" class="javabean.BuyArticleBean"/>
<jsp:setProperty name="BuyArticleBean" property="*"/>



<%
    if(UserBean.getEmail() == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        System.out.println("sono qui dentro");
%>
        <%! boolean check; %>
<%
        check = BuyArticleBean.SpendYourMoney();
    }

%>

<html>
<head>
    <title>DaDa-Segnalazione</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>
<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />



<%
    if(check)
    {
        UserBean.setBalance(UserBean.getBalance() - (BuyArticleBean.getPrezzo()*BuyArticleBean.getQuantitaBuy()));
%>
<div style="text-align: center">
    <label style=" font-family: 'Titillium Web', sans-serif; font-size: 16px; padding: 12px 20px 12px 40px; color: black;"> Segnalazione Inviata con Successo</label>
    <form action="home.jsp">
        <input type="submit" name = "submit" value="Torna alla home" >
    </form>
</div>
<%
}
else
{
%>
<div style="text-align: center">
    <label style=" font-family: 'Titillium Web', sans-serif; font-size: 16px; padding: 12px 20px 12px 40px; color: black;"> C'è stato un problema. <br>
        Probabilmente hai già inviato una segnalazione per questo articolo</label>
    <form action="home.jsp">
        <input type="submit" name = "submit" value="Torna alla home" >
    </form>
</div>
<%
    }


%>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />


<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="jspPageTemplates/js/owl.carousel.min.js"></script>
<script src="jspPageTemplates/js/jquery.sticky.js"></script>
<script src="jspPageTemplates/js/jquery.easing.1.3.min.js"></script>
<script src="jspPageTemplates/js/main.js"></script>

</body>
</html>
