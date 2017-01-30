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

    <link rel="stylesheet" href="fade-slider.css">
</head>
<body>
<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true"/>

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />


    <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">
    <div class="slides">

        <ul> <!-- slides -->
            <li><img src="img/intro1(dada).jpg" alt="image01" />
                <div>Benvenuto in DaDa</div>
            </li>
            <li><img src="img/intro2(compra).jpg" alt="image02" />
                <div>Compra l'articolo che desideri</div>
            </li>
            <li><img src="img/intro3(vendi).jpg" alt="image03" />
                <div>Fai affari</div>
            </li>
            <li><img src="img/intro4(dona).jpg" alt="image04" />
                <div>Dona</div>
            </li>
        </ul>
    </div>
<%--
<div class="promo-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-refresh"></i>
                    <p>30 Days return</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-truck"></i>
                    <p>Free shipping</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-lock"></i>
                    <p>Secure payments</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-gift"></i>
                    <p>New products</p>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End promo area -->--%>



<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

</body>
</html>
