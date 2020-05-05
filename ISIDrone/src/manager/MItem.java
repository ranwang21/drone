package manager;


import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Item;
import entities.User;
import manager.MDB;
import util.Hash;

public class MItem {

    public static ArrayList<Item> getItems(int category) {
        ArrayList<Item> items = new ArrayList<Item>();
        try {
            MDB.connect();
            String query;
            PreparedStatement ps;
            ResultSet rs;

            if (category == 1) {
                query = "SELECT * FROM product";
                ps = MDB.getPS(query);
            } else {
                query = "SELECT * FROM product WHERE category = ?";
                ps = MDB.getPS(query);
                ps.setInt(1, category);
            }

            rs = ps.executeQuery();

            while (rs.next())
                items.add(getItemFromResultSet(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return items;
    }

    public static ArrayList<Item> getSearchItems(String search) {
        ArrayList<Item> items = new ArrayList<Item>();
        try {
            MDB.connect();
            String query;
            PreparedStatement ps;
            ResultSet rs;

            query = "SELECT * FROM product WHERE UPPER(name) LIKE UPPER(?) OR UPPER(description) LIKE UPPER(?) ";
            ps = MDB.getPS(query);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");

            rs = ps.executeQuery();

            while (rs.next())
                items.add(getItemFromResultSet(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return items;
    }

    public static Item getItemById(int id) {
        Item item = null;
        try {
            MDB.connect();
            String query = "SELECT * FROM product WHERE id = ?";

            PreparedStatement ps = MDB.getPS(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                item = getItemFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return item;
    }

    public static ArrayList<Item> getFeaturedItems() {
        ArrayList<Item> items = new ArrayList<Item>();
        try {
            MDB.connect();
            String query;
            ResultSet rs;

            query = "SELECT * FROM product WHERE id IN (SELECT product FROM featured_product)";

            rs = MDB.execQuery(query);

            while (rs.next())
                items.add(getItemFromResultSet(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return items;
    }

    private static Item getItemFromResultSet(ResultSet rs) {

        Item item = new Item();

        try {
            item.setId(rs.getInt("id"));
            item.setCategory(rs.getInt("category"));
            item.setName(rs.getString("name"));
            item.setDescription(rs.getString("description"));
            item.setPrice(rs.getDouble("price"));
            item.setSerial(rs.getString("serialNumber"));
            item.setImage(rs.getString("imgName"));
            item.setStock(rs.getInt("stockQty"));
            item.setActive(rs.getBoolean("isActive"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return item;
    }

    public static String updateItem(Item item) {

        try {
            MDB.connect();

            // Ajoute l'address a la BD
            String query = "UPDATE product SET category = ?, name = ?, description = ?, price = ?, serialNumber = ?, stockQty = ?, isActive = ?  WHERE id = ?";

            PreparedStatement ps = MDB.getPS(query);
            ps.setInt(1, item.getCategory());
            ps.setString(2, item.getName());
            ps.setString(3, item.getDescription());
            ps.setDouble(4, item.getPrice());
            ps.setString(5, item.getSerial());
            ps.setInt(6, item.getStock());
            ps.setBoolean(7, (item.isActive()));
            ps.setInt(8, item.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return "msg";
    }

    public static void addItem(Item item) {

        try {
            MDB.connect();

            String query = "INSERT INTO product (`category`, `name`, `description`, `price`, `serialNumber`, `imgName` , `stockQty` , `isActive`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = MDB.getPS(query);

            ps.setInt(1, item.getCategory());
            ps.setString(2, item.getName());
            ps.setString(3, item.getDescription());
            ps.setDouble(4, item.getPrice());
            ps.setString(5, item.getSerial());
            ps.setString(6, item.getImage());
            ps.setInt(7, item.getStock());
            ps.setBoolean(8, item.isActive());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
    }
}


