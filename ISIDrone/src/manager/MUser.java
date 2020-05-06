package manager;


import entities.Item;
import entities.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MUser {
    private static User getUserFromResultSet(ResultSet rs) {

        User user = new User();

        try {
            user.setId(rs.getInt("id"));
            user.setLastName(rs.getString("lastName"));
            user.setFirstName(rs.getString("firstName"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setIsAdmin(rs.getInt("isAdmin"));

//            must implement
//            user.setShipAdress(rs.getInt("ship_adress_id"));

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static ArrayList<User> getSearchUsers(String search) {
        ArrayList<User> users = new ArrayList<>();
        try {
            MDB.connect();
            String query;
            PreparedStatement ps;
            ResultSet rs;

            query = "SELECT * FROM user WHERE (UPPER(firstName) LIKE UPPER(?) OR UPPER(lastName) LIKE UPPER(?) OR UPPER(email) LIKE UPPER(?)) AND isAdmin = ? ";
            ps = MDB.getPS(query);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            ps.setString(3, "%" + search + "%");
            ps.setInt(4, 0);


            rs = ps.executeQuery();

            while (rs.next())
                users.add(getUserFromResultSet(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return users;
    }

    public static ArrayList<User> getClients() {
        ArrayList<User> clients = new ArrayList<>();
        try {
            MDB.connect();
            String query = "SELECT * FROM user WHERE isAdmin = ?";

            PreparedStatement ps = MDB.getPS(query);
            ps.setInt(1, 0);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setLastName(rs.getString("lastName"));
                user.setFirstName(rs.getString("firstName"));
                user.setEmail(rs.getString("email"));

                clients.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return clients;
    }
}
