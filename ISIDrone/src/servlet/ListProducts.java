package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionCategory;
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


        String productId = request.getParameter("productToremoveId");
        int removeProductId = Integer.parseInt(productId);

        if (removeProductId != -1) {
            ActionItems.removeProduct(request, removeProductId);

        } else {
            request.setAttribute("result", -1);
            
        }


        ActionItems.getItems(request, response);
        ActionCategory.getCategories(request, response);


        request.getRequestDispatcher(Const.PATH_PAGE_LISTPRODUCTS).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
//
//        String removeProductRequest = request.getParameter("removeProdReq");
//        String removeProductId = request.getParameter("productToRemoveId");
//        if (removeProductRequest != null) {
//            ActionItems.removeProduct(request, removeProductId);
//            request.getRequestDispatcher(Const.PATH_PAGE_LISTPRODUCTS).forward(request, response);


    }
}

