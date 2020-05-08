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

@WebServlet(name = "deleteProduct", urlPatterns = {"/delete-product"})
public class deleteProduct extends HttpServlet {
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
        request.getRequestDispatcher(Const.PATH_PAGE_LIST_PRODUCTS).forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
