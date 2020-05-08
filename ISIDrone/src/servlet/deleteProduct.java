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


        int resultat = ActionItems.removeProduct(request, removeProductId);
        if (resultat != 0) {
            request.setAttribute("result", resultat + "");
        }


        ActionItems.getItems(request, response);
        ActionCategory.getCategories(request, response);
        request.getRequestDispatcher(Const.PATH_PAGE_LISTPRODUCTS).forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
