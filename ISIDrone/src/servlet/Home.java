package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionCart;
import action.ActionCategory;
import action.ActionFeaturedProduct;
import util.Const;

/**
 * Servlet implementation class Index
 */
@WebServlet(name = "index", urlPatterns = {"/home"})
public class Home extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Récupération des catégories
        ActionCategory.getCategories(request, response);
        //Récupération des produits en vedettes
        ActionFeaturedProduct.getFeaturedProduct(request);

        String lang = request.getParameter("lang");
        Cookie[] mesCookies = request.getCookies();
        Cookie cookieLang = null;

        if (mesCookies != null) {
            for (Cookie cookie : mesCookies) {
                if (cookie.getName().equals("lang")) {
                    cookieLang = cookie;
                }
            }
        }
        if (cookieLang != null) {
            if (lang != null) {
                if (lang.equals("fr")) {
                    cookieLang.setValue(Const.LANG_FR);
                } else if (lang.equals("en")) {
                    cookieLang.setValue(Const.LANG_EN);
                }
            }
            response.addCookie(cookieLang);
        } else {
            Cookie monCookie = new Cookie("lang", Const.LANG_FR);
            monCookie.setMaxAge(60 * 60 * 24 * 365);
            response.addCookie(monCookie);
        }

        //Redirection
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String strId = request.getParameter("itemId");
        String strQty = request.getParameter("qty");

        ActionCart.addItem(request, response, strId, strQty);
        doGet(request, response);
    }


}
