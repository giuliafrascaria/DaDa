<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 23/01/17
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<html>
<head>
    <title>DaDa - Dona </title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />

    <link rel="stylesheet" href="fade-slider.css">
</head>
<body>
<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true"/>

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />


<div style="text-align: center">
    <img src="img/grazie.jpg" />
    <br>
    <label style="padding: 20px; font-family: 'Titillium Web', sans-serif; font-size: 22px;">Grazie !!!</label>
    <br>
    <textarea name="testo" rows="6" cols="50" class="myTextArea" style="padding: 20px; font-family: 'Titillium Web', sans-serif; border: none" readonly>
    Sei davvero una bella persona se compi questo gesto ! Molte persone non hanno avuto la nostra stessa fortuna e necessitano di beni primari. Una tua Donazione è importante.Clicca il pulsante più in basso e inserisci un articolo. Sarà immediatamente destinato presso l'ente benefico da te scelto !
    </textarea>
    <form action="#">
        <input type="submit" name = "submit" value="Dona !!" >
    </form>
</div>





<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

</body>
</html>
