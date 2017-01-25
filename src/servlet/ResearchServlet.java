package servlet;

import control.CatalogueController;
import entity.articles.Article;

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
        System.out.println("sono prima del check");

        if(request.getParameter("radiob") != null) {
            System.out.println("valore del radio botton = " + request.getParameter("radiob"));
            if (request.getParameter("radiob").equals("inf")) {
                System.out.println("sono entrato nella ricerca elettronica");
                try {
                    tipoArticolo = "Electronics";
                    if (request.getParameter("infvenditore") != null)
                        proprietario = request.getParameter("infvenditore");
                    System.out.println(".");
                    if (request.getParameter("inftipo") != null)
                        tipo = request.getParameter("inftipo");
                    System.out.println(".");
                    if (request.getParameter("infnome") != null)
                        nome = request.getParameter("infnome");
                    System.out.println(".");
                    if (request.getParameter("infmodello") != null)
                        modello = request.getParameter("infmodello");
                    System.out.println(".");
                    if (request.getParameter("infmarca") != null)
                        marca = request.getParameter("infmarca");
                    System.out.println(".");
                    list = CatalogueController.getInstance().createCatalogue(nome, proprietario, tipoArticolo, editore, autore, titolo, tipo, marca, Integer.parseInt(taglia), materia, Integer.parseInt(edizione), modello);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else if (request.getParameter("radiob").equals("cloth")) {
                try {
                    list = CatalogueController.getInstance().createCatalogue("", "", "Clothing", "", "", "", request.getParameter("abbtipo"), "", 0, "", 0, "");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else if (request.getParameter("radiob").equals("libri")) {
                try {
                    list = CatalogueController.getInstance().createCatalogue("", "", "Book", "", "", "", request.getParameter("inftipo"), "", 0, "", 0, "");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                System.out.println("sono entrato nella ricerca normale");
                try {
                    list = CatalogueController.getInstance().createCatalogue(request.getParameter("nome"), "", "", "", "", "", "", "", 0, "", 0, "");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        else
        {
            System.out.println("il radio button era null");
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
