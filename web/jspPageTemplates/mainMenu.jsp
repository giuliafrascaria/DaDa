
<jsp:useBean id="ArticleBean" scope="request" class="javabean.ArticleBean"/>

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
                    <li><a href="ricerca.jsp">Cerca</a></li>
                    <li onclick="showSlide()"><a>Barra</a></li>
                    <li><a href="#">Aiuto</a></li>
                </ul>
                <div class="add-to-cart-link"  style="display: none" id="product-big-title-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-bit-title text-center">
                                    <form action="success.jsp" name="myform" method="post">
                                        <input name="nome" type="text" id="nome" placeholder="Cerca.." class="extendedInput">
                                    </form>
                                    <form action="ricerca.jsp" method="get">
                                        <div style="padding: 5px"><input type="submit" value="Ricerca avanzata"
                                               name="Submit" id="frm1_submit" /></div>
                                    </form>
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
                                    <input type="text" name="search" placeholder="Cerca.." class="extendedInput">
                                    <div style="width:300px; margin:0 auto; display:inline-block;" ></div>
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

<script type="text/javascript">
    var allRadios = document.getElementsByName('radiob');
    var booRadio;
    var x;
    for(x = 0; x < allRadios.length; x++){

        allRadios[x].onclick = function() {
            if(booRadio == this){
                this.checked = false;
                booRadio = null;
                var i = document.getElementById('informatic');
                i.style.display = "none";
                var c = document.getElementById('abbigli');
                c.style.display = "none";
                var b = document.getElementById('lib');
                b.style.display = "none";
                var d = document.getElementById('sco');
                d.style.display = "none";
            }else{
                booRadio = this;
            }
        };
    }
</script>