package manager;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class MDB {
    private static Connection connection = null;
    private static final String osName = System.getProperty("os.name").toLowerCase();

    public static void connect() throws SQLException {

        final Properties prop = new Properties();
        InputStream input = null;

        try {
            String configFile = "";

            // Recuperation du fichier de configuration en fonction du type de systeme
            if (isUnix()) {
                configFile = File.separator + "isidrone" + File.separator + "conf" + File.separator + "configs.properties";
            } else if (isWindows()) {
                configFile = "C:" + File.separator + "isidrone" + File.separator + "conf" + File.separator + "configs.properties";
            }
            input = new FileInputStream(configFile);
            // load a properties file
            prop.load(input);

            String DB_USERNAME = prop.getProperty("DB_USERNAME");
            String DB_PASSWORD = prop.getProperty("DB_PASSWORD");
            String DB_NAME = prop.getProperty("DB_NAME");
            String DB_IP = prop.getProperty("DB_IP");
            String DB_PORT = prop.getProperty("DB_PORT");

            Class.forName("com.mysql.cj.jdbc.Driver");
            String mysqlURL = "jdbc:mysql://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME + "?serverTimezone=UTC";
            connection = DriverManager.getConnection(mysqlURL, DB_USERNAME, DB_PASSWORD);

        } catch (final IOException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (final IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static ResultSet execQuery(String query) {
        PreparedStatement ps = getPS(query);
        ResultSet rs = null;

        try {

            if (ps != null) {
                ps.execute();
                rs = ps.getResultSet();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static PreparedStatement getPS(String query) {
        PreparedStatement ps = null;
        try {
            if (connection == null || connection.isClosed())
                connect();
            ps = connection.prepareStatement(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ps;
    }

    public static PreparedStatement getPS(String query, int id) {
        PreparedStatement ps = null;
        try {
            if (connection == null || connection.isClosed())
                connect();
            if (id == 1)
                ps = connection.prepareStatement(query,
                        Statement.RETURN_GENERATED_KEYS);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ps;
    }

    public static PreparedStatement getPS(String query, String column) {
        return getPS(query, new String[]{column});
    }

    public static PreparedStatement getPS(String query, String[] columns) {
        PreparedStatement ps = null;
        try {
            if (connection == null || connection.isClosed())
                connect();
            ps = connection.prepareStatement(query, columns);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ps;
    }

    public static void disconnect() {
        try {
            if (connection != null && !connection.isClosed())
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connection = null;
        }
    }

    public static boolean isWindows() {
        return (osName.contains("win"));
    }

    public static boolean isUnix() {
        return (osName.contains("nix") || osName.contains("nux") || osName.indexOf("aix") > 0);
    }
}
