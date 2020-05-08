package servlet;

import action.ActionCategory;
import manager.MCategory;
import manager.MItem;
import util.Const;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class RemoveCategory
 */
@WebServlet(name = "removeCategory", urlPatterns = {"/remove-category"})
public class RemoveCategory extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCategory() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCategory = Integer.parseInt(request.getParameter("category_id"));
        boolean isDeleted = ActionCategory.deleteCategory(idCategory);
        if (!isDeleted) {
            request.setAttribute("deleteError", "Delete Error");
        }
        ActionCategory.getCategories(request, response);
        request.getRequestDispatcher(Const.PATH_PAGE_LIST_CATEGORIES).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
