package servlet;

import action.ActionCategory;
import action.ActionItems;
import action.ActionSignUp;
import action.ActionUser;
import entities.User;
import util.Const;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ListCategories
 */
@WebServlet(name = "listClients", urlPatterns = {"/listClients"})
public class ListClients extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListClients() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getIsAdmin() == 1) {
            ActionUser.getClients(request, response);
            request.getRequestDispatcher(Const.PATH_PAGE_LIST_CLIENTS).forward(request, response);
        } else {
            response.sendRedirect(Const.PATH_REDIRECT_HOME);
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
