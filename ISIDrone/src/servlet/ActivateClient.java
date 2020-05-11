package servlet;

import action.ActionCategory;
import action.ActionUser;
import util.Const;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class RemoveCategory
 */
@WebServlet(name = "activateClient", urlPatterns = {"/activate-client"})
public class ActivateClient extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivateClient() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idClient = Integer.parseInt(request.getParameter("user_id"));
        // return true if deactivated
        boolean isDeleted = ActionUser.Activate(idClient);
        if (!isDeleted) {
            request.setAttribute("activateError", "Activate Error");
        }
        ActionUser.getClients(request, response);
        request.getRequestDispatcher(Const.PATH_PAGE_LIST_CLIENTS).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
