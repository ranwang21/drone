package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionProvince;
import action.ActionUser;
import entities.User;
import manager.MUser;
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

        User user = (User) request.getSession().getAttribute("user");

        if (user != null && user.getIsAdmin() == 1) {
            int idClient = Integer.parseInt(request.getParameter("client_id"));
            ActionUser.getUser(idClient, request, response);
            ActionProvince.getProvinces(request, response);
            request.getRequestDispatcher(Const.PATH_PAGE_EDIT_CLIENT).forward(request, response);
        } else {
            response.sendRedirect(Const.PATH_REDIRECT_HOME);
        }


    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User userLogin = (User) request.getSession().getAttribute("user");

        if (userLogin != null && userLogin.getIsAdmin() == 1) {
            request.setCharacterEncoding("UTF-8");
            User user = new User();
            user.setEmail(request.getParameter("email"));
            user.setId(Integer.parseInt(request.getParameter("client_id")));
            int checkEmail = MUser.emailExist(user);
            request.setAttribute("message", checkEmail);
            if (checkEmail == 1) {
                ActionUser.updateUserById(request, response);
            }
            doGet(request, response);
        } else {
            response.sendRedirect(Const.PATH_REDIRECT_HOME);
        }


    }
}
