package control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import databaseINIT.Provider;
import entity.users.RegisteredUser;

import static control.RegisteredDBController.*;

/**
 * Created by v2devnull on 02/02/17.
 */
@WebServlet(name = "RegisteredUserController")

public class RegisteredUserController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void init() {
        //call provider
        Provider provider = new Provider();
        provider.getConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        //use switch instead
        try {
            if (action.equals("/list")) {
                listRegisteredUsers(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listRegisteredUsers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {


        List<RegisteredUser> list = null;
        try {
            list = getOurInstance().listAllUsers();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("listRegisteredUser", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
        dispatcher.forward(request, response);

    }
}
