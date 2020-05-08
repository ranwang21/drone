package servlet;

import java.io.*;
import java.util.Arrays;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import action.ActionCategory;
import entities.Item;
import util.Const;
import action.ActionItems;

/**
 * Servlet implementation class Item
 */
@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
@MultipartConfig
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ActionCategory.getCategories(request, response);
        request.getRequestDispatcher(Const.PATH_NEW_PRODUCT_JSP).forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Item item = new Item();
        item.setName(request.getParameter("nom"));
        item.setCategory(Integer.parseInt(request.getParameter("categoryId")));
        item.setDescription(request.getParameter("description"));
        item.setPrice(Double.parseDouble(request.getParameter("price")));
        item.setSerial(request.getParameter("serial"));
        item.setStock(Integer.parseInt(request.getParameter("qty")));
        item.setActive(!Arrays.toString(request.getParameterValues("isActive")).equals("null"));
        item.setImage("drone_default.png");

        final Part filePart = request.getPart("addProductFile");
        final String fileName = ActionItems.getFileName(filePart);

        int numError = 1;

        if (!Objects.equals(fileName, "")) {
            String outFile = UUID.randomUUID().toString() + "." + ActionItems.getFileExtension(fileName);
            int retour = ActionItems.uploadProductImg(outFile, filePart);
            item.setImage(outFile);

            if (retour == 0)
                //erreur pendant telechargement de l'image
                numError = 2;
        }

        if (numError == 1) ActionItems.addItem(request, response, item);
        request.setAttribute("message", numError);
        doGet(request, response);
    }
}
