package action;

import entities.Address;
import entities.Category;
import entities.User;
import manager.MCategory;
import manager.MSignUp;
import manager.MUser;
import util.Misc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;

public class ActionUser {
    public static void getSearchUsers(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("users", MUser.getSearchUsers(request.getParameter("search")));
    }

    public static void getClients(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("users", MUser.getClients());
    }

    public static void getUser(int idClient, HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("user", MUser.getUserById(idClient));
    }

    public static void updateUserById(HttpServletRequest request, HttpServletResponse response) {
        User user = new User();
        Address address = new Address();

        address.setId(Integer.parseInt(request.getParameter("address_id")));
        address.setNo(request.getParameter("addr_no"));
        address.setAppt(request.getParameter("addr_appt"));
        address.setStreet(request.getParameter("addr_street"));
        address.setZip(request.getParameter("addr_zip"));
        address.setCity(request.getParameter("addr_city"));
        address.setState(request.getParameter("addr_state"));
        address.setCountry(request.getParameter("addr_country"));

        user.setId(Integer.parseInt(request.getParameter("client_id")));
        user.setLastName(request.getParameter("lastName"));
        user.setFirstName(request.getParameter("firstName"));
        user.setEmail(request.getParameter("email"));
        user.setShipAdress(address);

        MUser.updateUser(user);
    }
}
