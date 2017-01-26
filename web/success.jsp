<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.articles.Article" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="ArticleBean" scope="session" class="javabean.ArticleBean"/>
<jsp:setProperty name="ArticleBean" property="*"/>
<html>
<head>
    <title>Successo</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>
<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />


nome : <jsp:getProperty name="ArticleBean" property="nome"/><br>
proprietario : <jsp:getProperty name="ArticleBean" property="proprietario"/><br>
editore : <jsp:getProperty name="ArticleBean" property="editore"/><br>
tipo : <jsp:getProperty name="ArticleBean" property="tipo"/><br>
tipoArticolo : <jsp:getProperty name="ArticleBean" property="tipoArticolo"/><br>


<div class="container">
    <div class="row" id ="riga">
        <%
            ArticleBean.setLista();
            System.out.println("fatto");
            ArrayList<Article> a = ArticleBean.getLista();
            for (Article anA : a) {
        %>

        <div class="col-md-3 col-sm-6">
            <div class="single-shop-product">
                <div class="product-upper">
                    <img src="img/product-2.jpg" alt="">
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

        <%
            }
        %>

    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="product-pagination text-center">
                <nav>
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

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
