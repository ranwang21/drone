package manager;

import entities.Province;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MProvince {

    public static ArrayList<Province> getProvinces() {
        ArrayList<Province> provinces = new ArrayList<Province>();

        try {
            MDB.connect();
            String query = "SELECT * FROM provinces";
            ResultSet rs = MDB.execQuery(query);
            while (rs.next()) {
                provinces.add(new Province(rs.getInt(1), rs.getString(2)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return provinces;
    }
}
