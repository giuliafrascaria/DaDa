

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="UserBean" scope="session" class="javabean.UserBean"/>
<html>
<head>
    <title>DaDa - aiuto </title>
    <jsp:include page="jspPageTemplates/head.jsp" flush="true" />


</head>
<body>
<jsp:include page="jspPageTemplates/headerArea.jsp" flush="true" />

<jsp:include page="jspPageTemplates/brandingArea.jsp" flush="true"/>

<jsp:include page="jspPageTemplates/mainMenuWithoutBar.jsp" flush="true" />
<div style="text-align: center">
    <label style="padding: 20px; font-family: 'Titillium Web', sans-serif; font-size: 16px;"> Ciao, Come possiamo aiutarti ?</label>
    <br>
    <textarea name="testo" rows="15" cols="50" class="myTextArea" style="padding: 20px; font-family: 'Titillium Web', sans-serif; border: none" readonly>
    Speriamo che l'esperienza offerta dalla Web Application DaDa sia di tuo gradimento. In caso contrario può trovare più in basso in questa pagina un pulsante relativo alle segnalazioni.Il nostro team continua a lavorare duramente per migliorare la stabilità del sito e ascolta ogni suggerimento offerto.Qualora si incontrino problemi con venditori meschini, sarà il nostro staff a occuparsene personalmente. Le consigliamo tuttavia di incontrare sempre il proprietario dell'articolo di persona e di usare metodi di pagamento tracciabili.

    Si ricorda che questo sito di e-Commerce non preleva percentuali dagli acquisti e non è stato sviluppato con scopi di lucro. Le uniche fonti di guadagno potrebbero essere in futuro inserimenti per fini commerciali di terze parti. Non chiederemo ne ora ne mai i suoi soldi.
    </textarea>
    <form action="segnalazione.jsp">
        <input type="submit" name = "submit" value="Segnalazione" >
    </form>
</div>






<jsp:include page="jspPageTemplates/footerArea.jsp" flush="true" />

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

<script src="jspPageTemplates/js/sliderImages.js"></script>


</body>
</html>

