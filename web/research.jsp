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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DaDa Marketplace</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu">
                    <ul>
                        <li><a href="#"><i class="fa fa-user"></i> My Account</a></li>
                        <li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
                        <li><a href="cart.html"><i class="fa fa-user"></i> My Cart</a></li>
                        <li><a href="checkout.html"><i class="fa fa-user"></i> Checkout</a></li>
                        <li><a href="signup.jsp"><i class="fa fa-user"></i> Login</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="header-right">
                    <ul class="list-unstyled list-inline">
                        <li class="dropdown dropdown-small">
                            <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">currency :</span><span class="value">USD </span><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">USD</a></li>
                                <li><a href="#">INR</a></li>
                                <li><a href="#">GBP</a></li>
                            </ul>
                        </li>

                        <li class="dropdown dropdown-small">
                            <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="key">language :</span><span class="value">English </span><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">English</a></li>
                                <li><a href="#">French</a></li>
                                <li><a href="#">German</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->

<div class="site-branding-area" style="display: block">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="logo">
                    <%--<h1><a href="index.jsp"><span>DaDa</span></a></h1>--%>
                    <h1><a href="index.jsp"></a></h1>
                    <img src="img/DaDalogo.png" style="width:150px;height:150px; padding:10px">
                </div>
            </div>



            <div class="col-sm-6">
                <div class="shopping-item2">
                    <span class="cart-amunt">Simone D'Aniello</span> <img class="img-circle" src="img/slide-2.jpg">
                </div>
            </div>




        </div>
    </div>
</div> <!-- End site branding area -->

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

<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Acquista</a></li>
                    <li><a href="article.jsp">Vendi</a></li>
                    <li><a href="article.jsp">Dona</a></li>
                    <li><a href="template.jsp">Recensisci</a></li>
                    <li><a href="#">Il mio Account</a></li>
                    <li onclick="showSlide()"><a>Barra</a></li>
                    <li><a href="#">Aiuto</a></li>
                    <%--<li><a href="#">Others</a></li>--%>
                    <%--<li><a href="#">Contact</a></li>--%>
                </ul>
                <div class="add-to-cart-link"  style="display: block" id="product-big-title-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-bit-title text-center">
                                    <input type="text" name="search" placeholder="Cerca..">
                                    <div>
                                        <a href="#" id="informatica">Informatica</a>
                                        <a href="#" id="abbigliamento">Abbigliamento</a>
                                        <a href="#" id="libri">Libri</a>
                                    </div>
                                    <div style="width:300px; margin:0 auto; display:inline-block;" >
                                        <input class="mdl-slider mdl-js-slider" type="range"
                                               min="0" max="100" value="0" tabindex="0">
                                        <a type="label" name="label" >Max</a>
                                    </div>
                                    <button onclick="research()"> OK </button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="add-to-cart-link"  style="display: none" id="product-big-title-area2">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-bit-title text-center">
                                    <%--<h2>Dalla curva si alzerààààà</h2>--%>
                                    <input type="text" name="search" placeholder="Cerca..">
                                    <div style="width:300px; margin:0 auto; display:inline-block;" >
                                        <input class="mdl-slider mdl-js-slider" type="range"
                                               min="0" max="100" value="0" tabindex="0">
                                        <a type="label" name="label" >Max</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>
    </div>
</div> <!-- End mainmenu area -->

<div id="wrapSlider">
    <div id="sliderImage">
        <img class="mySlides" src="img/product-2.jpg" style="width:300px; height: 400px;">
        <img class="mySlides" src="img/product-4.jpg" style="width:300px; height: 400px;">
        <img class="mySlides" src="img/DaDalogo.png" style="width:300px; height: 400px;">
    </div>
</div>

<div id="areaProdotti">

    <div class="rigaProdotti">
        <div class="rigaProd">
            <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;">
            <h2><a href="article.jsp">Articolo 1</a></h2>
        </div>
        <div class="rigaProd">
            <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;">
            <h2><a href="article.jsp">Articolo 1</a></h2>
        </div>
        <div class="rigaProd">
            <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;">
            <h2><a href="article.jsp">Articolo 1</a></h2>
        </div>
        <div class="rigaProd">
            <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;">
            <h2><a href="article.jsp">Articolo 1</a></h2>
        </div>
    </div>
    <div class="rigaProdotti">
        <div class="rigaProd">
            <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;">
            <h2><a href="article.jsp">Articolo 1</a></h2>
        </div>
        <div class="rigaProd">
            <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;">
            <h2><a href="article.jsp">Articolo 1</a></h2>
        </div>
        <div class="rigaProd">
            <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;">
            <h2><a href="article.jsp">Articolo 1</a></h2>
        </div>
        <div class="rigaProd">
            <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;">
            <h2><a href="article.jsp">Articolo 1</a></h2>
        </div>
    </div>

</div>

<!--
<div class="single-product-area">
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
-->

<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2><span>DaDa</span></h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                    <div class="footer-social">
                        <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">User Navigation </h2>
                    <ul>
                        <li><a href="">My account</a></li>
                        <li><a href="">Order history</a></li>
                        <li><a href="">Wishlist</a></li>
                        <li><a href="">Vendor contact</a></li>
                        <li><a href="">Front page</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">Categories</h2>
                    <ul>
                        <li><a href="">Mobile Phone</a></li>
                        <li><a href="">Home accesseries</a></li>
                        <li><a href="">LED TV</a></li>
                        <li><a href="">Computer</a></li>
                        <li><a href="">Gadets</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-newsletter">
                    <h2 class="footer-wid-title">Newsletter</h2>
                    <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                    <div class="newsletter-form">
                        <input type="email" placeholder="Type your email">
                        <input type="submit" value="Subscribe">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p>&copy; 2017 DaDa. All Rights Reserved. Coded with <i class="fa fa-heart"></i> by <a href="http://wpexpand.com" target="_blank">WP Expand</a></p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="footer-card-icon">
                    <i class="fa fa-cc-discover"></i>
                    <i class="fa fa-cc-mastercard"></i>
                    <i class="fa fa-cc-paypal"></i>
                    <i class="fa fa-cc-visa"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Latest jQuery form server -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="js/main.js"></script>
<script src="js/jquery-3.1.1.js"></script>
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

    function research() {
        $('#areaProdotti').prepend('<div class="rigaProdotti"> <div class="rigaProd"> <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;"> <h2><a href="article.jsp">Articolo 1</a></h2> </div> <div class="rigaProd"> <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;"> <h2><a href="article.jsp">Articolo 1</a></h2> </div> <div class="rigaProd"> <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;"> <h2><a href="article.jsp">Articolo 1</a></h2> </div> <div class="rigaProd"> <img src="img/product-2.jpg" alt="" style="width:150px; height: 200px;"> <h2><a href="article.jsp">Articolo 1</a></h2> </div> </div>')
    }
</script>

