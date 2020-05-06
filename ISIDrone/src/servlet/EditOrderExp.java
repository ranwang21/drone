package servlet;

import action.ActionCategory;
import action.ActionOrder;
import util.Const;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class EditOrderExp
 */
@WebServlet(name = "editOrderExp", urlPatterns = {"/edit-order-exp"})
public class EditOrderExp extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditOrderExp() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(Const.PATH_PAGE_LIST_ORDERS).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
