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
    <title>DaDa - HOMEPAGE </title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />


</head>
<body>
<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true"/>

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />
<div>
    <div style="text-align: center" class="container">
        <div class='slider'>
            <div class='slide1'></div>
            <div class='slide2'></div>
            <div class='slide3'></div>
        </div>
    </div>
</div>






<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

<script>
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 2000); // Change image every 2 seconds
    }
</script>

<script src="jspPageTemplates/js/sliderImages.js"></script>


</body>
</html>
