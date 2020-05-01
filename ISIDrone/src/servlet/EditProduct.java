package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionCategory;
import action.ActionItems;
import action.ActionSignUp;
import util.Const;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet(name = "editProduct", urlPatterns = {"/editProduct"})
public class EditProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("product_id"));

        ActionCategory.getCategories(request, response);
        ActionItems.getItemById(idProduct, request, response);
        request.getRequestDispatcher(Const.PATH_PAGE_EDIT_PRODUCT).forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ActionItems.updateItemById(request, response);
        doGet(request, response);
    }

}
