package action;

import entities.Address;
import entities.Category;
import entities.Province;
import entities.User;
import manager.MCategory;
import manager.MSignUp;
import manager.MUser;
import util.Misc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
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

    public static void getUser(int idClient, HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("user", MUser.getUserById(idClient));
    }

    public static boolean Deactivate(int id) {
        return MUser.Deactivate(id);
    }

    public static void updateUserById(HttpServletRequest request, HttpServletResponse response) {
        User user = new User();
        Address address = new Address();
        Province province = new Province();
        province.setId(Integer.parseInt(request.getParameter("addr_state")));

        address.setId(Integer.parseInt(request.getParameter("address_id")));
        address.setNo(request.getParameter("addr_no"));
        address.setStreet(request.getParameter("addr_street"));
        address.setZip(request.getParameter("addr_zip"));
        address.setCity(request.getParameter("addr_city"));
        address.setProvince(province);
        address.setTelephone(request.getParameter("addr_tel"));

        user.setId(Integer.parseInt(request.getParameter("client_id")));
        user.setLastName(request.getParameter("lastName"));
        user.setFirstName(request.getParameter("firstName"));
        user.setEmail(request.getParameter("email"));
        user.setStatus(request.getParameter("status"));
        user.setShipAdress(address);

        MUser.updateUser(user);
    }
}
