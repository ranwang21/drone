package servlet;

import java.io.IOException;
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
import action.ActionItems;
import entities.Item;
import entities.User;
import util.Const;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet(name = "editProduct", urlPatterns = {"/editProduct"})
@MultipartConfig
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

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getIsAdmin() == 1) {
            int idProduct = Integer.parseInt(request.getParameter("product_id"));

            ActionCategory.getCategories(request, response);
            ActionItems.getItemById(idProduct, request, response);
            request.getRequestDispatcher(Const.PATH_PAGE_EDIT_PRODUCT).forward(request, response);
        } else {
            response.sendRedirect(Const.PATH_REDIRECT_HOME);
        }
        
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getIsAdmin() == 1) {
            request.setCharacterEncoding("UTF-8");
            Item item = new Item();
            item.setId(Integer.parseInt(request.getParameter("product_id")));
            item.setName(request.getParameter("name"));
            item.setCategory(Integer.parseInt(request.getParameter("category")));
            item.setDescription(request.getParameter("description"));
            item.setPrice(Double.parseDouble(request.getParameter("price")));
            item.setSerial(request.getParameter("serial"));
            item.setStock(Integer.parseInt(request.getParameter("stock")));
            item.setActive(!Arrays.toString(request.getParameterValues("isActive")).equals("null"));
            request.setAttribute("product_id", item.getId());
            item.setImage(request.getParameter("oldImgName"));

            final Part filePart = request.getPart("editProductFile");
            final String fileName = ActionItems.getFileName(filePart);

            int numError = 1;

            if (!Objects.equals(fileName, "")) {
                String outFile = UUID.randomUUID().toString() + "." + ActionItems.getFileExtension(fileName);
                int retour = ActionItems.uploadProductImg(outFile, filePart);
                item.setImage(outFile);

                if (retour == 0) {
                    //erreur pendant telechargement de l'image
                    numError = 2;
                }
            }

            if (numError == 1) ActionItems.updateItemById(request, response, item);
            request.setAttribute("message", numError);
            doGet(request, response);
        } else {
            response.sendRedirect(Const.PATH_REDIRECT_HOME);
        }


    }
}
