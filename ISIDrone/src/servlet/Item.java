package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionCategory;
import manager.MItem;
import util.Const;
import action.ActionCart;
import action.ActionItems;

/**
 * Servlet implementation class Item
 */
@WebServlet(name = "item", urlPatterns = {"/item"})
public class Item extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Item() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strAjouterProduit = request.getParameter("ajouterProduit");
        if (request.getParameter("item") != null) {
            int item;
            try {
                item = Integer.parseInt(request.getParameter("item"));
            } catch (NumberFormatException e) {
                item = -1;
            }

            ActionItems.getItemById(item, request, response);
            request.getRequestDispatcher(Const.PATH_PAGE_ITEM).forward(request, response);
        } else if (strAjouterProduit != null) {
            ActionCategory.getCategories(request, response);
            request.getRequestDispatcher(Const.PATH_NEW_PRODUCT_JSP).forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String strId = request.getParameter("itemId");
        String strQty = request.getParameter("qty");
        String strNom = request.getParameter("nom");
        String strCategory = request.getParameter("category");
        String strDescription = request.getParameter("description");
        String strPrix = request.getParameter("prix");
        String strSerial = request.getParameter("serial");
        String strIsActif = request.getParameter("isActif");

        Boolean isActif = false;

        if (strId != null && strQty != null) {
            ActionCart.addItem(request, response, strId, strQty);
            doGet(request, response);
        } else if (strNom != null) {
            int qty = Integer.parseInt(strQty);
            int category = Integer.parseInt(strCategory);
            double prix = Double.parseDouble(strPrix);
            if (strIsActif != null) {
                isActif = true;
            }
            System.out.println(strIsActif);
            entities.Item newItem = new entities.Item(category, strNom, strDescription, prix, strSerial, "drone_default", qty, isActif);
            ActionItems.addItem(request, response, newItem);
            ActionCategory.getCategories(request, response);
            String itemAdded = "itemAdded";
            request.setAttribute("itemAdded", itemAdded);
            request.getRequestDispatcher(Const.PATH_NEW_PRODUCT_JSP).forward(request, response);

        }
    }
}
