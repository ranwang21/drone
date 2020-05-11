package servlet;

import action.ActionCategory;
import action.ActionOrder;
import entities.User;
import util.Const;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveOrder", urlPatterns = {"/remove-order"})
public class RemoveOrder extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getIsAdmin() == 1) {
            int idOrder = Integer.parseInt(request.getParameter("order_id"));
            boolean isDeleted = ActionOrder.deleteOrder(idOrder);
            if (!isDeleted) {
                request.setAttribute("deleteError", "Delete Error");
            }
            ActionOrder.getAllOrders(request, response);
            request.getRequestDispatcher(Const.PATH_PAGE_LIST_ORDERS).forward(request, response);
        } else {
            response.sendRedirect(Const.PATH_REDIRECT_HOME);
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
