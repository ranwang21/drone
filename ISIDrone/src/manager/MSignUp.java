package manager;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Category;
import util.Hash;
import entities.Address;
import entities.User;

public class MSignUp {

    /* -1 : Problème de connexion
     *  0 : L'adresse email est déjà présente dans la base de données
     *  1 : L'ajout c'est fait sans problème
     * */
    public static int signUp(User user, String isCheck) {
        int code = isExist(user);

        if (code == 1) {
            try {
                MDB.connect();

                // Ajoute l'address a la BD
                MSignUp.addAddress(user.getBillAddress());
                if (isCheck == null) {
                    MSignUp.addAddress(user.getShipAddress());
                }

                String query = "INSERT INTO user (`lastName`, `firstName`, `email`, `isAdmin`, `password`, `bill_address_id`, `ship_address_id`) VALUES (?, ?, ?, ?, ?, ?, ?)";

                PreparedStatement ps = MDB.getPS(query);

                ps.setString(1, user.getLastName());
                ps.setString(2, user.getFirstName());
                ps.setString(3, user.getEmail());
                ps.setInt(4, user.getIsAdmin());
                ps.setString(5, Hash.SHA1(user.getPassword()));
                ps.setInt(6, user.getBillAddress().getId());
                ps.setInt(7, user.getShipAddress().getId());

                ps.executeUpdate();
            } catch (SQLException | NoSuchAlgorithmException | UnsupportedEncodingException e) {
                e.printStackTrace();
            } finally {
                MDB.disconnect();
            }
        }
        return code;
    }

    /* -1 : Problème de connexion
     *  0 : L'adresse email est déjà présente dans la base de données
     *  1 : L'adresse email n'est pas présente dans la base de données
     * */
    public static int isExist(User user) {
        int isExist = -1;

        try {
            MDB.connect();

            String query = "SELECT id FROM user WHERE email = ?";
            PreparedStatement ps = MDB.getPS(query);

            ps.setString(1, user.getEmail());
            ResultSet rs = ps.executeQuery();

            isExist = (rs.first() ? 0 : 1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return isExist;
    }

    /* 	0 : Erreur d'insertion
     *  >0 : Id (cle primaire)
     * */
    private static int addAddress(Address address) {

        // TODO Faire une transaction

        int id = 0;

        try {
            MDB.connect();
            String query = "INSERT INTO address (`no`, `street`, `zip`, `city`, `province_id`, `telephone`) VALUES (?, ?, ?, ?, ?, ?)";

            // Genere un prepare statement qui attent l'id creer
            PreparedStatement ps = MDB.getPS(query, 1);

            ps.setString(1, address.getNo());
            ps.setString(2, address.getStreet());
            ps.setString(3, address.getZip());
            ps.setString(4, address.getCity());
            ps.setInt(5, address.getProvince().getId());
            ps.setString(6, address.getTelephone());

            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();

            if (generatedKeys.next()) {
                address.setId(generatedKeys.getInt(1));
            } else {
                throw new SQLException("Creating user failed, no ID obtained.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return id;
    }

}
