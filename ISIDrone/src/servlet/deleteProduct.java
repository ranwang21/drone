package servlet;

import action.ActionItems;
import manager.MItem;
import util.Const;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "/deleteProduct", urlPatterns = {"/deleteProduct"})
public class deleteProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String removeProductRequest = request.getParameter("removeProdReq");
//        int removeProductId = Integer.parseInt(request.getParameter("productToRemoveId"));
//        if (removeProductRequest != null) {
//            ActionItems.removeProduct(request, removeProductId);
////            ActionItems.getItems(request, response);
//            request.getRequestDispatcher(Const.PATH_PAGE_LISTPRODUCTS).forward(request, response);
//        }

    }
}
