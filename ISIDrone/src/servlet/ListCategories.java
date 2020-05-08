package servlet;

import action.ActionCategory;
import action.ActionItems;
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
@WebServlet(name = "listCategories", urlPatterns = {"/list-categories"})
public class ListCategories extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCategories() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ActionCategory.getCategories(request, response);
        request.getRequestDispatcher(Const.PATH_PAGE_LIST_CATEGORIES).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
