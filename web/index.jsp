<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 16/01/17
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />



<style>
    input[type=text] {
        width: 130px;
        box-sizing: border-box;
        border: 2px solid #ccc;
        border-radius: 4px;
        font-family: 'Titillium Web', sans-serif;
        font-size: 16px;
        background: white no-repeat 10px 10px;
        padding: 12px 20px 12px 40px;
        -webkit-transition: width 0.4s ease-in-out;
        transition: width 0.4s ease-in-out;
    }

    input[type=text]:focus {
        width: 100%;
    }

    #informatica {display:inline-block;margin-right:10px; font-family: 'Titillium Web', sans-serif; font-size: 16px; padding: 12px 20px 12px 40px;color: white;}
    #abbigliamento {display:inline-block; width:200px; font-family: 'Titillium Web', sans-serif; font-size: 16px; padding: 12px 20px 12px 40px; color: white;}
    #libri {display:inline-block; width:200px; font-family: 'Titillium Web', sans-serif; font-size: 16px; padding: 12px 20px 12px 40px; color: white;}
</style>


<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />



<div class="sliderImage" style="position: static;text-align:center;max-width:100px;">
  <img class="mySlides" src="img/product-2.jpg" style="width:50%">
  <img class="mySlides" src="img/product-4.jpg" style="width:50%">
  <img class="mySlides" src="img/product-2.jpg" style="width:50%">
</div>


<div class="single-product-area">
  <%--<div class="zigzag-bottom"></div>--%>

  <div class="container">
    <div class="row" id ="riga">
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-2.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-1.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-3.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-4.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-2.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-1.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-3.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-4.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-2.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-1.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-3.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
      <div class="col-md-3 col-sm-6">
        <div class="single-shop-product">
          <div class="product-upper">
            <img src="img/product-4.jpg" alt="">
          </div>
          <h2><a href="article.jsp">Apple new mac book 2015 March :P</a></h2>
          <div class="product-carousel-price">
            <ins>$899.00</ins> <del>$999.00</del>
          </div>

          <div class="product-option-shop">
            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">Add to cart</a>
          </div>
        </div>
      </div>
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
</div>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

<!-- Latest jQuery form server -->
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

<script type="text/javascript">
    var elem = document.createElement("img");
    elem.setAttribute("src", "img/DaDalogo.png");
    elem.setAttribute("height", "768");
    elem.setAttribute("width", "1024");
    elem.setAttribute("alt", "Flower");
    document.getElementById("riga").appendChild(elem);
</script>

<script type="text/javascript">
    function showSlide(){
        var productbigtitlearea = document.getElementById('product-big-title-area');
      if(productbigtitlearea.style.display == "none") {
        productbigtitlearea.style.display = "block";
      }
      else{
          productbigtitlearea.style.display = "none"
      }
    }
</script>


