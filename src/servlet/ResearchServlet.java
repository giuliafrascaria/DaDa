package servlet;

import control.CatalogueController;
import entity.articles.Article;
import jdk.nashorn.internal.ir.RuntimeNode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/ResearchServlet")
public class ResearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*(String nome,  String proprietario,
                                String tipoArticolo, String editore, String autore, String titolo,
                                     String tipo, String marca, int taglia, String materia,
                                     int edizione, String modello) */
        ArrayList<Article> list = new ArrayList<Article>();
        String nome = "";
        String proprietario = "";
        String editore = "";
        String autore = "";
        String titolo = "";
        String tipo = "";
        String marca = "";
        String taglia = "0";
        String materia = "";
        String edizione = "0";
        String modello = "";
        String tipoArticolo = "";
        if(request.getParameter("radiob") != null) {
            System.out.println("valore del radio botton = " + request.getParameter("radiob"));
            if (request.getParameter("radiob").equals("inf")) {
                    tipoArticolo = "Electronics";
                    if (request.getParameter("infvenditore") != null)
                        proprietario = request.getParameter("infvenditore");
                    if (request.getParameter("inftipo") != null)
                        tipo = request.getParameter("inftipo");
                    if (request.getParameter("infnome") != null)
                        nome = request.getParameter("infnome");
                    if (request.getParameter("infmodello") != null)
                        modello = request.getParameter("infmodello");
                    if (request.getParameter("infmarca") != null)
                        marca = request.getParameter("infmarca");
            } else if (request.getParameter("radiob").equals("cloth")) {
                    tipoArticolo = "Clothing";
                    if (request.getParameter("abbvenditore") != null)
                        proprietario = request.getParameter("abbvenditore");
                    if (request.getParameter("abbtipo") != null)
                        tipo = request.getParameter("abbtipo");
                    if (request.getParameter("abbnome") != null)
                        nome = request.getParameter("abbnome");
                    if (request.getParameter("abbtaglia") != null)
                        taglia = request.getParameter("abbtaglia");
                    if (request.getParameter("infmarca") != null)
                        marca = request.getParameter("infmarca");
            } else if (request.getParameter("radiob").equals("libri")) {
                    tipoArticolo = "Book";
                    if (request.getParameter("libtitolo") != null)
                        titolo = request.getParameter("libtitolo");
                    if (request.getParameter("libvenditore") != null)
                        proprietario = request.getParameter("libvenditore");
                    if (request.getParameter("libnome") != null)
                        nome = request.getParameter("libnome");
                    if (request.getParameter("libautore") != null)
                        autore = request.getParameter("libautore");
                    if (request.getParameter("libcasa") != null)
                        editore = request.getParameter("libcasa");
            } else if (request.getParameter("radiob").equals("scolastico")) {
                    tipoArticolo = "TextBook";
                    if (request.getParameter("scotitolo") != null)
                        titolo = request.getParameter("scotitolo");
                    if (request.getParameter("scomateria") != null)
                        materia = request.getParameter("scomateria");
                    if (request.getParameter("sconome") != null)
                        nome = request.getParameter("sconome");
                    if (request.getParameter("scoautore") != null)
                        autore = request.getParameter("scoautore");
                    if (request.getParameter("scocasa") != null)
                        editore = request.getParameter("scocasa");
            } else {
                System.out.println("sono entrato nella ricerca normale");
                if(request.getParameter("nome")!= null)
                    nome = request.getParameter("nome");
            }
            try {
                list = CatalogueController.getInstance().createCatalogue(nome, proprietario, tipoArticolo, editore, autore, titolo, tipo, marca, Integer.parseInt(taglia), materia, Integer.parseInt(edizione), modello);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else
        {
            try {
                list = CatalogueController.getInstance().createCatalogue(request.getParameter("nome"), "", "", "", "", "", "", "", 0, "", 0, "");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("lista", list);
        request.getRequestDispatcher("success.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
