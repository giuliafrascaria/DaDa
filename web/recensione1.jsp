<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.articles.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<%--
<%@ page import="javabean.UserBean" %>
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



        <%
            if(UserBean.getEmail() != null){
                System.out.println("valore della mail (recensione) = " + UserBean.getEmail());
                ArrayList<Article> a = UserBean.getArticleList();
                System.out.println("sono arrivato fin qui");
                if(a!=null){
                    for (Article anA : a) {
                    %>
                <div class="container">
                    <div class="row" id ="riga">
                    <div class="col-md-3 col-sm-6">
                        <div class="single-shop-product">
                            <div >
                                <img src="img/<%= anA.getImage() %>" alt="" style="border-radius: 10px; height: 300px; width: 300px">
                            </div>
                            <h2><a href="article.jsp"> <%= anA.getNome() %> </a></h2>
                            <div class="product-carousel-price">
                                <ins>$<%= anA.getPrezzo() %></ins> <del>$<%= anA.getPrezzo()*2 %></del>
                            </div>

                            <div class="product-option-shop">
                                <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
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
            }
            else{
                    System.out.println("faccio il redirect");
                    response.sendRedirect("login.jsp");
                    return;
            }
        %>



<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="jspPageTemplates/js/owl.carousel.min.js"></script>
<script src="jspPageTemplates/js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="jspPageTemplates/js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="jspPageTemplates/js/main.js"></script>

</body>
</html>
