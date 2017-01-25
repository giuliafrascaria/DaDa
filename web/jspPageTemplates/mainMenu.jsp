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
                    <li class="active"><a href="home.jsp">Acquista</a></li>
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
                                        <label class="checkbox-labels">
                                            <input type="radio" name="cb[1][]" value="1" class="radio1" onchange="valueChanged1()">
                                        </label> Informatica<br>
    <div id="informatic" style="display: none">
        <label for="nome">Nome </label><input name="nome" type="text" id="inputInf">
        <input name="cerca" type="submit" id="cerca" value="Cerca">
    </div>
                                        <label class="checkbox-labels">
                                            <input type="radio" name="cb[1][]" value="1" class="radio2" onchange="valueChanged2()">
                                        </label> Abbigliamento<br>
    <div id="abbigli" style="display: none">
        ciao2
    </div>
                                        <label class="checkbox-labels">
                                            <input type="radio" name="cb[1][]" value="1" class="radio3" onchange="valueChanged3()">
                                        </label> Libri<br>
    <div id="lib" style="display: none">
        ciao3
    </div>
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

<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="jspPageTemplates/js/owl.carousel.min.js"></script>
<script src="jspPageTemplates/js/jquery.sticky.js"></script>
<script src="jspPageTemplates/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>
    function valueChanged1(){
        var i = document.getElementById('informatic');
        i.style.display = "block";
        var c = document.getElementById('abbigli');
        c.style.display = "none";
        var b = document.getElementById('lib');
        b.style.display = "none";
    }
    function valueChanged2(){
        var i = document.getElementById('informatic');
        i.style.display = "none";
        var c = document.getElementById('abbigli');
        c.style.display = "block";
        var b = document.getElementById('lib');
        b.style.display = "none";
    }
    function valueChanged3(){
        var i = document.getElementById('informatic');
        i.style.display = "none";
        var c = document.getElementById('abbigli');
        c.style.display = "none";
        var b = document.getElementById('lib');
        b.style.display = "block";
    }
</script>