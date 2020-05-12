package manager;


import entities.Address;
import entities.Province;
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
            user.setStatus(rs.getString("status"));

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
                user.setStatus(rs.getString("status"));

                clients.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return clients;
    }

    public static boolean Deactivate(int id) {
        try {
            MDB.connect();
            String queryToDelete = "UPDATE user SET status = 'DISACTIVATED' WHERE id = ?";
            PreparedStatement psToDelete = MDB.getPS(queryToDelete);
            psToDelete.setInt(1, id);
            int rs = psToDelete.executeUpdate();
            if (rs <= 0) {
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return true;
    }

    public static boolean Activate(int id) {
        try {
            MDB.connect();
            String queryToDelete = "UPDATE user SET status = 'ACTIVATED' WHERE id = ?";
            PreparedStatement psToDelete = MDB.getPS(queryToDelete);
            psToDelete.setInt(1, id);
            int rs = psToDelete.executeUpdate();
            if (rs <= 0) {
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return true;
    }

    public static User getUserById(int id) {
        User user = new User();
        try {
            MDB.connect();
            String query = "SELECT user.id, lastName, firstName, email, status, ship_address_id, no, street, zip, city, province_id, telephone " +
                    "FROM user INNER JOIN address ON user.ship_address_id = address.id " +
                    "WHERE user.id = ?";

            PreparedStatement ps = MDB.getPS(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            Address address = new Address();
            Province province = new Province();
            while (rs.next()) {
                province.setId(rs.getInt("province_id"));
                address.setId(rs.getInt("ship_address_id"));
                address.setNo(rs.getString("no"));
                address.setStreet(rs.getString("street"));
                address.setZip(rs.getString("zip"));
                address.setCity(rs.getString("city"));
                address.setTelephone(rs.getString("telephone"));
                address.setProvince(province);
                user.setId(rs.getInt("id"));
                user.setLastName(rs.getString("lastName"));
                user.setFirstName(rs.getString("firstName"));
                user.setEmail(rs.getString("email"));
                user.setStatus(rs.getString("status"));
                user.setShipAdress(address);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return user;
    }

    public static void updateUser(User user) {

        try {
            MDB.connect();

            updateUserAddress(user.getShipAddress());

            String query = "UPDATE user SET lastName = ?, firstName = ?, email = ?, status = ?  WHERE id = ?";
            PreparedStatement ps = MDB.getPS(query);

            ps.setString(1, user.getLastName());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getStatus());
            ps.setInt(5, user.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
    }

    private static void updateUserAddress(Address address) {

        try {
            MDB.connect();

            String query = "UPDATE address SET no = ?, street = ?, zip = ?, city = ?, province_id = ?, telephone = ?  WHERE id = ?";

            PreparedStatement ps = MDB.getPS(query);
            ps.setString(1, address.getNo());
            ps.setString(2, address.getStreet());
            ps.setString(3, address.getZip());
            ps.setString(4, address.getCity());
            ps.setInt(5, address.getProvince().getId());
            ps.setString(6, address.getTelephone());
            ps.setInt(7, address.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
    }


    /* -1 : Problème de connexion
     *  0 : L'adresse email est déjà associee a un autre user
     *  1 : L'adresse email n'est pas associer a un autre user
     * */
    public static int emailExist(User user) {
        int isExist = -1;
        try {
            MDB.connect();

            String query = "SELECT id FROM user WHERE email = ? AND id <> ?";
            PreparedStatement ps = MDB.getPS(query);

            ps.setString(1, user.getEmail());
            ps.setInt(2, user.getId());
            ResultSet rs = ps.executeQuery();

            isExist = (rs.first() ? 0 : 1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return isExist;
    }
}
