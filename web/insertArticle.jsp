<%--
  Created by IntelliJ IDEA.
  User: giogge
  Date: 27/01/17
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<jsp:useBean id="ArticleBean" scope="request" class="javabean.ArticleBean"/>
<jsp:setProperty name="ArticleBean" property="*"/>

<%
    if(UserBean.getEmail() == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    if(request.getParameter("submit") != null){
%>
        <%! int result ;%>
<%
            System.out.println("zono cvi");
        System.out.println(ArticleBean.getNome());
        System.out.println(ArticleBean.getQuantita());
        System.out.println(ArticleBean.getPrezzo());
        ArticleBean.setProprietario(UserBean.getEmail());
        result = ArticleBean.insert();
        if (result == 1)
        {
            response.sendRedirect("home.jsp");
        }
    }
%>
<html>
<head>
    <title>DaDa - Vendi un prodotto</title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />
</head>
<body>

<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true" />
<jsp:include page="jspPageTemplates/mainMenu.jsp" flush="true" />



<%if (request.getParameter("submit") != null) {
    if(result == 2) {%>
<div class="alert alert-danger" role="alert">Missing fields found</div><%
    }if (result == 3) {%>
<div class="alert alert-danger" role="alert">An error occurred, please try again later</div><%
    }if (result == 4) {%>
<div class="alert alert-danger" role="alert">Un articolo con questo nome è già registrato, se ne hai due copie incrementane la quantità, altrimenti inserisci un nome più specifico</div><%
        }
    }%>


<form action="insertArticle.jsp" name="myform" method="post">
    <div style="text-align: center">
        <br>
        <h2>Dati obbligatori:</h2>
        <br>
        <label for="nome">Nome del prodotto*</label> <br> <input name="nome" type="text" id="nome" class="extendedInput"><br>
        <label for="prezzo">Prezzo*</label> <br> <input name="prezzo" type="text" id="prezzo" class="extendedInput"><br>
        <label for="quantita">Quantità*</label> <br> <input name="quantita" type="text" id="quantita" class="extendedInput"><br>
        <%--<button id="selectFile" onclick="return selectFileClick();" ></button>--%>

        <br>
        <h2>Dettagli aggiuntivi:</h2>
        <br>
        <label for="inp">Immagine</label> <br> <input id="inp" type="file" accept="image/*"> <br>

        <div style="align-items: baseline">
            <label>
                <input type="radio" name="radioB" value="inf" onchange="valueChanged1()">
            </label> Informatica <br>
            <label>
                <input type="radio" name="radioB" value="cloth"  onchange="valueChanged2()">
            </label> Abbigliamento <br>
            <label>
                <input type="radio" name="radioB" value="libri"  onchange="valueChanged3()">
            </label> Libri <br>
            <label>
                <input type="radio" name="radioB" value="scolastico"  onchange="valueChanged4()">
            </label> Libri scolastici <br>
        </div>
    </div>



    <div id="informatic" style="text-align: center; display: none">
        <div><label for="inftipo">Tipo </label><br><input name="tipo" type="text" id="inftipo" class="extendedInput"></div>
        <div><label for="infmodello">Modello </label><br><input name="modello" type="text" id="infmodello" class="extendedInput"></div>
        <div><label for="infmarca">Marca </label><br><input name="marca" type="text" id="infmarca" class="extendedInput"></div>
    </div>
    <div id="abbigli" style="text-align: center; display: none">
        <div><label for="abbtipo">Tipo </label><br><input name="tipo" type="text" id="abbtipo" class="extendedInput"></div>
        <div><label for="abbtaglia">Taglia </label><br><input name="taglia" type="text" id="abbtaglia" class="extendedInput"></div>
        <div><label for="abbmarca">Marca </label><br><input name="marca" type="text" id="abbmarca" class="extendedInput"></div>
    </div>
    <div id="lib" style="text-align: center; display: none">
        <div><label for="libtitolo">Titolo </label><br><input name="titolo" type="text" id="libtitolo" class="extendedInput"></div>
        <div><label for="libautore">Autore </label><br><input name="autore" type="text" id="libautore" class="extendedInput"></div>
        <div><label for="libcasa">Casa Editrice </label><br><input name="edizione" type="text" id="libcasa" class="extendedInput"></div>
    </div>
    <div id="sco" style="text-align: center; display: none">
        <div><label for="scotitolo">Titolo </label><br><input name="titolo" type="text" id="scotitolo" class="extendedInput"></div>
        <div><label for="scomateria">Materia </label><br><input name="materia" type="text" id="scomateria" class="extendedInput"></div>
        <div><label for="scoautore">Autore </label><br><input name="autore" type="text" id="scoautore" class="extendedInput"></div>
        <div><label for="scocasa">Casa Editrice</label> <br><input name="edizione" type="text" id="scocasa" class="extendedInput"></div>
    </div>

    <div style="text-align: center; padding: 10px">
        <input name="submit" type="submit" id="submit" value="Inserisci">
    </div>
</form>

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />


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

    function selectFileClick()
    {
        var fileName = filedialog();
// parsing file...
        return false;
    }
</script>


<script type="text/javascript">
    var allRadios = document.getElementsByName('radioB');
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

<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />


<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="jspPageTemplates/js/owl.carousel.min.js"></script>
<script src="jspPageTemplates/js/jquery.sticky.js"></script>
<script src="jspPageTemplates/js/jquery.easing.1.3.min.js"></script>
<script src="jspPageTemplates/js/main.js"></script>

</body>
</html>
