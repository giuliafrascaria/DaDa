
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="ArticleBean" scope="session" class="javabean.ArticleBean"/>
<jsp:setProperty name="ArticleBean" property="*"/>

<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>

<jsp:useBean id="BuyArticleBean" scope="session" class="javabean.BuyArticleBean"/>
<jsp:setProperty name="BuyArticleBean" property="*"/>



<%
/*    if(request.getParameter("submit") != null) {
        System.out.println("sono qui dentro");
        if(UserBean.getEmail() == null) {
            response.sendRedirect("login.jsp");
            return;
        }*/
        BuyArticleBean.setProprietario(ArticleBean.getProprietario());
        BuyArticleBean.setNome(UserBean.getEmail());
        BuyArticleBean.setPrezzo(Float.parseFloat(ArticleBean.getPrezzo()));
        BuyArticleBean.setSaldo(UserBean.getBalance());
        BuyArticleBean.setQuantitatot(Integer.parseInt(ArticleBean.getQuantita()));
        BuyArticleBean.setArticolo(ArticleBean.getNome());

        /*if(BuyArticleBean.SpendYourMoney())
        {
            response.sendRedirect("home.jsp");
        }*/

/*    }*/
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DaDa- Articolo</title>

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

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true"/>

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />


<div class="single-product-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="product-breadcroumb">
                        <a href="home.jsp">Home</a>
                        <a href="success.jsp">Ricerca</a>
                        <a href="#"><%=ArticleBean.getNome()%></a>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="product-images">
                                <div class="product-main-img">
                                    <img src="img/<%=ArticleBean.getImageName()%>" alt="">
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="product-inner">
                                <h2 class="product-name"><%=ArticleBean.getNome()%></h2>
                                <div class="product-inner-price">
                                    <ins>$<%=ArticleBean.getPrezzo()%></ins> <%--<del>$800.00</del>--%>
                                </div>

                                <form action="acquistoEffettuato.jsp">
                                    <div class="quantity">
                                        <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="quantitaBuy" min="1" step="1" id="quantita">
                                    </div>
                                    <button class="add_to_cart_button" type="submit" name ="submit" id="submit" value="submit">Compra tramite DaDa</button>
                                </form>

                                <div role="tabpanel">
                                    <ul class="product-tab" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Descrizione</a></li>
                                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Recensioni</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                                            <h2>Descrizione del prodotto</h2>
                                            <p>Questa è una descrizione di prova. in future release verrà inserito nel database un campo descrizione che permette all'utente di visualizzare la descrizione dell'articolo. Momentaneamente per ciascun prodotto viene riportato il seguente testo di prova</p>

                                            <p>Ci scusiamo per il disagio ma ricordiamo che il sito è in versione non commerciale. Non può essere venduto e non ha fini di lucro. In una eventuale versione finale, ciascuna mancanza verrà colmata con la stessa cura posta nelle altre sezioni.</p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="profile">
                                            <h2>Reviews</h2>
                                            <div class="submit-review">
                                                <p><label for="name">Name</label> <input name="name" id="name" type="text"></p>
                                                <p><label for="email">Email</label> <input name="email" id="email" type="email"></p>
                                                <div class="rating-chooser">
                                                    <p>Your rating</p>

                                                    <div class="rating-wrap-post">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                                <p><label for="review">Your review</label> <textarea name="review" id="review" cols="30" rows="10"></textarea></p>
                                                <p><input type="submit" value="Submit"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
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
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="js/jquery.easing.1.3.min.js"></script>

<!-- Main Script -->
<script src="js/main.js"></script>
</body>
</html>
