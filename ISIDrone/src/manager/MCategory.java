package manager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Category;
import entities.Item;

public class MCategory {

    public static ArrayList<Category> getCategories() {
        ArrayList<Category> categories = new ArrayList<Category>();

        try {
            MDB.connect();
            String query = "SELECT * FROM category";
            ResultSet rs = MDB.execQuery(query);
            while (rs.next()) {
                categories.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getBoolean(5)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return categories;
    }

    public static Category getCategoryById(int id) {
        Category category = null;
        try {
            MDB.connect();
            String query = "SELECT * FROM category WHERE id = ?";

            PreparedStatement ps = MDB.getPS(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                category = getCategoryFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return category;
    }

    private static Category getCategoryFromResultSet(ResultSet rs) {

        Category category = new Category();

        try {
            category.setId(rs.getInt("id"));
            category.setName(rs.getString("name"));
            category.setDescription(rs.getString("description"));
            category.setOrder(rs.getInt("order"));
            category.setActive(rs.getBoolean("isActive"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    public static int isExist(int category) {
        int isExist = -1;
        try {
            MDB.connect();
            String query = "SELECT 'exist' FROM category WHERE id = ?";
            PreparedStatement ps = MDB.getPS(query);

            ps.setInt(1, category);
            ResultSet rs = ps.executeQuery();

            isExist = (rs.first() ? 0 : 1);
        } catch (SQLException e) {
            isExist = -1;
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return isExist;
    }

    public static String updateCategoty(Category category) {

        try {
            MDB.connect();


            // Ajoute l'address a la BD
            String query = "UPDATE category SET name = ?, description = ?, `order` = ?, isActive = ?  WHERE id = ?";

            PreparedStatement ps = MDB.getPS(query);
            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getOrder());
            ps.setBoolean(4, (category.isActive()));
            ps.setInt(5, category.getId());

            System.out.println(ps);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return "msg";
    }

    public static String add(Category category) {

        try {
            MDB.connect();

            String query = "INSERT INTO category (`name`, `description`, `order`, `isActive`) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = MDB.getPS(query);

            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getOrder());
            ps.setBoolean(4, category.getActive());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return "msg";
    }

    public static boolean delete(int id) {
        try {
            MDB.connect();
            String query = "SELECT * FROM isidrone.category INNER JOIN isidrone.product ON isidrone.category.id = isidrone.product.category WHERE isidrone.category.id = ?;";

            PreparedStatement ps = MDB.getPS(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.first()) {
                return false;
            } else {
                String queryToDelete = "DELETE FROM isidrone.category WHERE id = ?";
                PreparedStatement psToDelete = MDB.getPS(queryToDelete);
                psToDelete.setInt(1, id);
                psToDelete.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }
        return true;
    }
}
