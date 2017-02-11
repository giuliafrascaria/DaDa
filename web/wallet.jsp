<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 29/01/17
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<jsp:useBean id="WalletBean" scope="session" class="javabean.WalletBean"/>
<jsp:setProperty name="WalletBean" property="*"/>


<%
    if (request.getParameter("submit") != null) {%>

    <%! float result ;%>
    <%
        System.out.println("sto per incrementare il bilancio");
        WalletBean.setBalance(UserBean.getBalance());
        WalletBean.setUser(UserBean.getEmail());
        result = WalletBean.incrementBalance();
        if (result == 0)
        {
            UserBean.setBalance(WalletBean.getNewbalance());
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
<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />

<div style="text-align: center">

<h3>Saldo attuale: <br> $<jsp:getProperty name="UserBean" property="balance"/> </h3>

<h3>Ricarica</h3>

    <%if (request.getParameter("submit") != null) {
        if (result == 1) {%>
    <div class="alert alert-danger" role="alert">Error in Payment</div><%
        } if (result == 2) {%>
    <div class="alert alert-danger" role="alert">System error</div><%
        }
    }
%>
<form action="wallet.jsp" name="myform" method="post">

    Importo in $: <br>
    <input type = "number" name = "importo" id="importo"><br>

    <input type="submit" id="submit" name = "submit" value="submit" style="padding: 5px"> <br>

</form>

</div>


<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

</body>
</html>
