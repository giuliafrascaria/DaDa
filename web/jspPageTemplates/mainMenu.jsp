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
                                        <label class="checkbox-labels">
                                            <input type="checkbox" name="cb[1][]" value="1" class="radio1" onchange="valueChanged()">
                                        </label> Informatica<br>
                                        <label class="checkbox-labels">
                                            <input type="checkbox" name="cb[1][]" value="1" class="radio2" onchange="valueChanged()">
                                        </label> Abbigliamento<br>
                                        <label class="checkbox-labels">
                                            <input type="checkbox" name="cb[1][]" value="1" class="radio3" onchange="valueChanged()">
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

<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
    function valueChanged()
    {
        if($('.radio1').is(":checked")) {
            /* $(".answer").show();*/
/*
            window.alert("checkato 1");
*/
        }
        else if($('.radio2').is(":checked")) {
            /* $(".answer").show();*/
/*
            window.alert("checkato 2");
*/
        }
        else if($('.radio3').is(":checked")) {
            /* $(".answer").show();*/
            /*window.alert("checkato 3");*/
        }
        else
            $(".answer").hide();
    }
</script>