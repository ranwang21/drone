package servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import action.ActionCategory;
import action.ActionItems;
import action.ActionUser;
import entities.Item;
import entities.User;
import util.Const;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet(name = "editClient", urlPatterns = {"/editClient"})

public class EditClient extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditClient() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idClient = Integer.parseInt(request.getParameter("client_id"));

        //ActionCategory.getCategories(request, response);
        //ActionUser.getClients().getItemById(idClient, request, response);
        request.getRequestDispatcher(Const.PATH_PAGE_EDIT_PRODUCT).forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User user = new User();
        user.setId(Integer.parseInt(request.getParameter("client_id")));
        /*
        user.setName(request.getParameter("name"));
        user.setCategory(Integer.parseInt(request.getParameter("category")));
        user.setDescription(request.getParameter("description"));

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
         */
        doGet(request, response);
    }
}
