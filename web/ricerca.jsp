<%--
  Created by IntelliJ IDEA.
  User: dandi
  Date: 23/01/17
  Time: 15.52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ricerca</title>
</head>

<body>
<form action="ResearchServlet">
    <dev>
        <label for="nome">Nome </label><input name="nome" type="text" id="nome" class="extendedInput">
        <label>
            <input type="radio" name="cb[1][]" value="inf" class="inf" onchange="valueChanged1()">
        </label> informatica <br>
        <label>
            <input type="radio" name="cb[1][]" value="cloth" class="cloth" onchange="valueChanged2()">
        </label> clothing <br>
        <label>
            <input type="radio" name="cb[1][]" value="libri" class="libri" onchange="valueChanged3()">
        </label> libri <br>
    </dev>



    <div id="informatic">
        <label for="inftipo">tipo </label><input name="inftipo" type="text" id="inftipo" class="extendedInput">
        <label for="infvenditore">tipo </label><input name="infvenditore" type="text" id="infvenditore" class="extendedInput">
        <label for="infnome">tipo </label><input name="infnome" type="text" id="infnome" class="extendedInput">
        <label for="infmodello">tipo </label><input name="infmodello" type="text" id="infmodello" class="extendedInput">
        <label for="infmarca">tipo </label><input name="infmarca" type="text" id="infmarca" class="extendedInput">
    </div>
    <div id="abbigli">
        <label for="nome">Nome </label><input name="nome" type="text" id="abbiglinome" class="extendedInput">
        <input name="cerca" type="submit" id="abbigliInput" value="Cerca">
    </div>
    <div id="lib">
        <label for="nome">Nome </label><input name="nome" type="text" id="libnome" class="extendedInput">
        <input name="cerca" type="submit" id="libInput" value="Cerca">
    </div>



    <input name="cerca" type="submit" id="cerca" value="Cerca">
</form>

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
</body>
</html>
