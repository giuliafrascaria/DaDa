
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<jsp:useBean id="ArticleBean" scope="request" class="javabean.ArticleBean"/>


<%
    if(UserBean.getEmail() == null) {
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
<div>
<%--
    nome articolo = <jsp:getProperty name="ArticleBean" property="nome"/>
--%>
    nome articolo = <%=ArticleBean.getNome()%>

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
