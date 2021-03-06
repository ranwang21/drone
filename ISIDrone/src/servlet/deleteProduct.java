package servlet;

import action.ActionCategory;
import action.ActionItems;
import entities.User;
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
        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getIsAdmin() == 1) {
            int removeProductId = Integer.parseInt(request.getParameter("productToremoveId"));
            boolean isDeleted = ActionItems.removeProduct(removeProductId);
            if (!isDeleted) {
                request.setAttribute("result", "Error");
            }
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
