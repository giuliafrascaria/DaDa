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
    <div>
        <label for="nome">Nome </label><input name="nome" type="text" id="nome" class="extendedInput">
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
    </div>



    <div id="informatic" style="text-align: center; display: none">
        <div><label for="inftipo">Tipo </label><input name="inftipo" type="text" id="inftipo" class="extendedInput"></div>
        <div><label for="infvenditore">Venditore </label><input name="infvenditore" type="text" id="infvenditore" class="extendedInput"></div>
        <div><label for="infnome">Nome </label><input name="infnome" type="text" id="infnome" class="extendedInput"></div>
        <div><label for="infmodello">Modello </label><input name="infmodello" type="text" id="infmodello" class="extendedInput"></div>
        <div><label for="infmarca">Marca </label><input name="infmarca" type="text" id="infmarca" class="extendedInput"></div>
    </div>
    <div id="abbigli" style="text-align: center; display: none">
        <div><label for="abbtipo">Tipo </label><input name="abbtipo" type="text" id="abbtipo" class="extendedInput"></div>
        <div><label for="abbvenditore">Venditore </label><input name="abbvenditore" type="text" id="abbvenditore" class="extendedInput"></div>
        <div><label for="abbnome">Nome </label><input name="abbnome" type="text" id="abbnome" class="extendedInput"></div>
        <div><label for="abbtaglia">Taglia </label><input name="abbtaglia" type="text" id="abbtaglia" class="extendedInput"></div>
        <div><label for="abbmarca">Marca </label><input name="abbmarca" type="text" id="abbmarca" class="extendedInput"></div>
    </div>
    <div id="lib" style="text-align: center; display: none">
        <div><label for="libtitolo">Titolo </label><input name="libtitolo" type="text" id="libtitolo" class="extendedInput"></div>
        <div><label for="libvenditore">Venditore </label><input name="libvenditore" type="text" id="libvenditore" class="extendedInput"></div>
        <div><label for="libnome">Nome </label><input name="libnome" type="text" id="libnome" class="extendedInput"></div>
        <div><label for="libautore">Autore </label><input name="libautore" type="text" id="libautore" class="extendedInput"></div>
        <div><label for="libcasa">Casa Editrice </label><input name="libcasa" type="text" id="libcasa" class="extendedInput"></div>
    </div>
    <div id="sco" style="text-align: center; display: none">
        <div><label for="scotitolo">Titolo </label><input name="scotitolo" type="text" id="scotitolo" class="extendedInput"></div>
        <div><label for="scomateria">Materia </label><input name="scomateria" type="text" id="scomateria" class="extendedInput"></div>
        <div><label for="sconome">Nome </label><input name="sconome" type="text" id="sconome" class="extendedInput"></div>
        <div><label for="scoautore">Autore </label><input name="scoautore" type="text" id="scoautore" class="extendedInput"></div>
        <div><label for="scocasa">Casa Editrice </label><input name="scocasa" type="text" id="scocasa" class="extendedInput"></div>
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
</body>
</html>
