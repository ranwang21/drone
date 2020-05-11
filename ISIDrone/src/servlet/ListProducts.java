package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionCategory;
import entities.User;
import util.Const;
import action.ActionItems;

/**
 * Servlet implementation class ListProducts
 */
@WebServlet(name = "listProducts", urlPatterns = {"/list-products"})
public class ListProducts extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListProducts() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getIsAdmin() == 1) {
            ActionItems.getItems(request, response);
            ActionCategory.getCategories(request, response);
            request.getRequestDispatcher(Const.PATH_PAGE_LIST_PRODUCTS).forward(request, response);
        } else {
            response.sendRedirect(Const.PATH_REDIRECT_HOME);
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }
}

