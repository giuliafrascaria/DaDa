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
                </ul>
                <div class="add-to-cart-link"  style="display: none" id="product-big-title-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-bit-title text-center">
                                    <form action="ResearchServlet">
                                        <input name="nome" type="text" id="nome" placeholder="Cerca..">
                                    </form>
                                    <label>
                                        <input type="radio" name="radiob" value="inf" class="inf" onchange="valueChanged1()">
                                    </label> informatica <br>
                                    <label>
                                        <input type="radio" name="radiob" value="cloth" class="cloth" onchange="valueChanged2()">
                                    </label> clothing <br>
                                    <label>
                                        <input type="radio" name="radiob" value="libri" class="libri" onchange="valueChanged3()">
                                    </label> libri <br>
                                    <label>
                                        <input type="radio" name="radiob" value="scolastico" class="scolastico" onchange="valueChanged4()">
                                    </label> libri <br>
                                    <div style="width:300px; margin:0 auto; display:inline-block;" >
                                        <label>
                                            <input class="mdl-slider mdl-js-slider" type="range"
                                                   min="0" max="100" value="0" tabindex="0">
                                        </label>
                                        <a type="label" name="label" >Max</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="informatic" style="text-align: center; display: none">
                        <div><label for="inftipo">Tipo </label><br><input name="inftipo" type="text" id="inftipo" class="extendedInput"></div>
                        <div><label for="infvenditore">Venditore </label><br><input name="infvenditore" type="text" id="infvenditore" class="extendedInput"></div>
                        <div><label for="infnome">Nome </label><br><input name="infnome" type="text" id="infnome" class="extendedInput"></div>
                        <div><label for="infmodello">Modello </label><br><input name="infmodello" type="text" id="infmodello" class="extendedInput"></div>
                        <div><label for="infmarca">Marca </label><br><input name="infmarca" type="text" id="infmarca" class="extendedInput"></div>
                    </div>
                    <div id="abbigli" style="text-align: center; display: none">
                        <div><label for="abbtipo">Tipo </label><br><input name="abbtipo" type="text" id="abbtipo" class="extendedInput"></div>
                        <div><label for="abbvenditore">Venditore </label><br><input name="abbvenditore" type="text" id="abbvenditore" class="extendedInput"></div>
                        <div><label for="abbnome">Nome </label><br><input name="abbnome" type="text" id="abbnome" class="extendedInput"></div>
                        <div><label for="abbtaglia">Taglia </label><br><input name="abbtaglia" type="text" id="abbtaglia" class="extendedInput"></div>
                        <div><label for="abbmarca">Marca </label><br><input name="abbmarca" type="text" id="abbmarca" class="extendedInput"></div>
                    </div>
                    <div id="lib" style="text-align: center; display: none">
                        <div><label for="libtitolo">Titolo </label><br><input name="libtitolo" type="text" id="libtitolo" class="extendedInput"></div>
                        <div><label for="libvenditore">Venditore </label><br><input name="libvenditore" type="text" id="libvenditore" class="extendedInput"></div>
                        <div><label for="libnome">Nome </label><br><input name="libnome" type="text" id="libnome" class="extendedInput"></div>
                        <div><label for="libautore">Autore </label><br><input name="libautore" type="text" id="libautore" class="extendedInput"></div>
                        <div><label for="libcasa">Casa Editrice </label><br><input name="libcasa" type="text" id="libcasa" class="extendedInput"></div>
                    </div>
                    <div id="sco" style="text-align: center; display: none">
                        <div><label for="scotitolo">Titolo </label><br><input name="scotitolo" type="text" id="scotitolo" class="extendedInput"></div>
                        <div><label for="scomateria">Materia </label><br><input name="scomateria" type="text" id="scomateria" class="extendedInput"></div>
                        <div><label for="sconome">Nome </label><br><input name="sconome" type="text" id="sconome" class="extendedInput"></div>
                        <div><label for="scoautore">Autore </label><br><input name="scoautore" type="text" id="scoautore" class="extendedInput"></div>
                        <div><label for="scocasa">Casa Editrice </label><br><input name="scocasa" type="text" id="scocasa" class="extendedInput"></div>
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
        var d = document.getElementById('sco');
        d.style.display = "none";
    }
    function valueChanged2(){
        var i = document.getElementById('informatic');
        i.style.display = "none";
        var c = document.getElementById('abbigli');
        c.style.display = "block";
        var b = document.getElementById('lib');
        b.style.display = "none";
        var d = document.getElementById('sco');
        d.style.display = "none";
    }
    function valueChanged3(){
        var i = document.getElementById('informatic');
        i.style.display = "none";
        var c = document.getElementById('abbigli');
        c.style.display = "none";
        var b = document.getElementById('lib');
        b.style.display = "block";
        var d = document.getElementById('sco');
        d.style.display = "none";
    }
    function valueChanged4(){
        var i = document.getElementById('informatic');
        i.style.display = "none";
        var c = document.getElementById('abbigli');
        c.style.display = "none";
        var b = document.getElementById('lib');
        b.style.display = "none";
        var d = document.getElementById('sco');
        d.style.display = "block";
    }
</script>