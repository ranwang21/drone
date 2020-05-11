package action;


import manager.MDB;
import manager.MSignUp;
import manager.MUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ActionUser {
    public static void getSearchUsers(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("users", MUser.getSearchUsers(request.getParameter("search")));
    }

    public static void getClients(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("users", MUser.getClients());
    }

    public static boolean Activate(int id) {
        return MUser.Activate(id);
    }

    public static boolean Deactivate(int id) {
        return MUser.Deactivate(id);
    }
}
