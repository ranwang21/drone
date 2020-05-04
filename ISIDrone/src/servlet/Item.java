package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        int item;
        try {
            item = Integer.parseInt(request.getParameter("item"));
        } catch (NumberFormatException e) {
            item = -1;
        }

        ActionItems.getItemById(item, request, response);
        request.getRequestDispatcher(Const.PATH_PAGE_ITEM).forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String strId = request.getParameter("itemId");
        String strQty = request.getParameter("qty");
//        String strNom = request.getParameter("nom");
//        String strCategorie = request.getParameter("categorie");
//        String strDescription = request.getParameter("description");
//        String strPrix = request.getParameter("prix");
//        String strSerial = request.getParameter("serial");
//        String strIsActif = request.getParameter("isActif");
//        Boolean isActif = true;

        if (strId != null && strQty != null) {
            ActionCart.addItem(request, response, strId, strQty);
            doGet(request, response);
        }
//        else if (strNom != null) {
//            int qty = Integer.parseInt(strQty);
//            double prix = Double.parseDouble(strPrix);
//            if (!strIsActif.equals("Actif")) {
//                isActif = false;
//            }
//            Item newItem = new entities.Item(strCategorie, strNom, strDescription, prix, strSerial, "imgDefault", qty, isActif);
//        }
    }
}
