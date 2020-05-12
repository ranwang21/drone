package servlet;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Const;
import util.PropertyLoader;

/**
 * Servlet implementation class About
 */
@WebServlet(name = "about", urlPatterns = {"/about"})
public class About extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public About() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("lang")) {
                    request.setAttribute("lang", cookie.getValue());
                }
            }
        } else {
            request.setAttribute("lang", Const.LANG_FR);
        }

        request.getRequestDispatcher(Const.PATH_PAGE_ABOUT).forward(request, response);
    }

}
