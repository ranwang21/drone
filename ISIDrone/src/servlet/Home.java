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
        //Creation cookie lang si il existe pas
        Cookie[] mesCookies = request.getCookies();
        if (mesCookies != null) {
            for (Cookie cookie : mesCookies) {
                System.out.println(cookie.getValue());
                if (!cookie.getName().equals("lang")) {
                    Cookie langCookie = new Cookie("lang", Const.LANG_FR);
                    langCookie.setMaxAge(60 * 60 * 24 * 365);
                    response.addCookie(langCookie);
                } else {
                    if (lang.equals("fr")) {
                        Cookie langCookie = new Cookie("lang", Const.LANG_FR);
                        langCookie.setMaxAge(60 * 60 * 24 * 365);
                        response.addCookie(langCookie);
                    } else if (lang.equals("en")) {
                        Cookie langCookie = new Cookie("lang", Const.LANG_EN);
                        langCookie.setMaxAge(60 * 60 * 24 * 365);
                        response.addCookie(langCookie);
                    }
                }
            }
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
