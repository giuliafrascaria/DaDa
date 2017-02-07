
<jsp:setProperty name="ArticleBean" property="*"/>
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
                    <li class="active"><a href="home.jsp">Home</a></li>
                    <li onclick="showSlide()"><a>Ricerca</a></li>
                    <li><a href="ricerca.jsp">Ricerca avanzata</a></li>
                    <li><a href="insertArticle.jsp">Vendi</a></li>
                    <li><a href="dona.jsp">Dona</a></li>
                    <li><a href="recensione1.jsp">Recensisci</a></li>
                    <li><a href="aiuto.jsp">Aiuto</a></li>
                </ul>
                <div class="add-to-cart-link"  style="display: none" id="product-big-title-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-bit-title text-center">
                                    <form action="success.jsp" name="myform" method="post">
                                        <input name="nome" type="text" id="nome" placeholder="Cerca.." class="extendedInput"><br>
                                        <input name="cerca" type="submit" id="cerca" value="OK" class="OKButton">
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