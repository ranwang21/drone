package action;


import manager.MSignUp;
import manager.MUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionUser {
    public static void getSearchUsers(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("users", MUser.getSearchUsers(request.getParameter("search")));
    }

    public static void getClients(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("users", MUser.getClients());
    }
}
