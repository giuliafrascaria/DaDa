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
                    <li><a href="ricerca.jsp">Il mio Account</a></li>
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
                                    <form action="ResearchServlet">
                                        <input name="nome" type="text" id="nome" placeholder="Cerca..">
                                    </form>

                                    <div>
<%--                                        <a href="#" id="informatica">Informatica</a>
                                        <a href="#" id="abbigliamento">Abbigliamento</a>
                                        <a href="#" id="libri">Libri</a>--%>
                                        <label>
                                            <input type="checkbox" name="info" value="inf">
                                        </label> Informatica<br>
                                        <label>
                                            <input type="checkbox" name="clot" value="clo">
                                        </label> Abbigliamento<br>
                                        <label>
                                            <input type="checkbox" name="book" value="boo">
                                        </label> Libri<br>
                                    </div>
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


                <div class="add-to-cart-link"  style="display: none" id="product-big-title-area2">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-bit-title text-center">
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

<!-- Latest jQuery form server -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- Bootstrap JS form CDN -->

<!-- jQuery sticky menu -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>

<!-- jQuery easing -->

<!-- Main Script -->
<script src="js/main.js"></script>