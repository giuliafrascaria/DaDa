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

        ArrayList<Article> list = new ArrayList<Article>();
        if(request.getParameter("inftipo") == null) {
            try {
                list = CatalogueController.getInstance().createCatalogue(request.getParameter("nome"), "", "", "", "", "", "", "", 0, "", 0, "");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                list = CatalogueController.getInstance().createCatalogue("","","Electronics","","","",request.getParameter("inftipo"),  "", 0, "", 0, "");
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
