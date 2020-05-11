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
@WebServlet(name = "deactivateClient", urlPatterns = {"/deactivate-client"})
public class DeactivateClient extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeactivateClient() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idClient = Integer.parseInt(request.getParameter("client_id"));
        // return true if deactivated
        boolean isDeleted = ActionUser.Deactivate(idClient);
        if (!isDeleted) {
            request.setAttribute("deleteError", "Delete Error");
        }
        ActionUser.getClients(request, response);
        request.getRequestDispatcher(Const.PATH_PAGE_LIST_CLIENTS).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
