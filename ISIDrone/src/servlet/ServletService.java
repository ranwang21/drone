package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Const;

/**
 * Servlet implementation class ServletService
 */
@WebServlet(name = "service", urlPatterns = {"/service"})
public class ServletService extends HttpServlet {
    private static final long serialVersionUID = 1L;


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

        request.getRequestDispatcher(Const.PATH_PAGE_SERVICE).forward(request, response);
    }

}