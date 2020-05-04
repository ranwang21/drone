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
}
