package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Const;
import action.ActionCart;
import action.ActionCategory;
import action.ActionItems;

/**
 * Servlet implementation class Products
 */
@WebServlet(name = "search-items", urlPatterns = {"/search-items"})
public class SearchItems extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchItems() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ActionItems.getSearchItems(request, response);
        request.getRequestDispatcher(Const.PATH_PAGE_SEARCH_ITEMS).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
