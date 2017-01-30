<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 29/01/17
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<jsp:useBean id="WalletBean" scope="request" class="javabean.WalletBean"/>


<%
    if (request.getParameter("submit") != null) {%>

    <%! float result ;%>
    <%
        WalletBean.setBalance(UserBean.getBalance());
        result = WalletBean.incrementBalance();
        if (result == 1)
        {
            UserBean.setBalance(result);
            response.sendRedirect("home.jsp");
        }
    }
%>

<html>
<head>
    <title>DaDa - Saldo e Movimenti</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />

<div style="text-align: center">

<h3>Saldo attuale: <br> $<jsp:getProperty name="UserBean" property="balance"/> </h3>

<h3>Ricarica</h3>


<form action="wallet.jsp" name="myform" method="post">

    Importo in $: <br>
    <input type = "number" name = "importo" id="importo"><br>

    <input type="submit" id="submit" name = "submit" value="submit" style="padding: 5px"> <br>

</form>

</div>


<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

</body>
</html>
