package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionCategory;
import action.ActionItems;
import action.ActionSignUp;
import entities.User;
import util.Const;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet(name = "editCategory", urlPatterns = {"/editCategory"})
public class EditCategory extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategory() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getIsAdmin() == 1) {
            int idCategory = Integer.parseInt(request.getParameter("category_id"));

            ActionCategory.getCategories(request, response);
            ActionCategory.getCategoryById(idCategory, request, response);
            request.getRequestDispatcher(Const.PATH_PAGE_EDIT_CATEGORY).forward(request, response);
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
            ActionCategory.updateCategoryById(request, response);
            doGet(request, response);
        } else {
            response.sendRedirect(Const.PATH_REDIRECT_HOME);
        }

    }

}
