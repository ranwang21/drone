package manager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.sun.org.apache.xpath.internal.operations.Or;
import entities.Cart;
import entities.Item;
import entities.ItemCart;
import entities.Order;
import entities.User;

import entities.Cart;
import entities.Item;
import entities.ItemCart;
import entities.Order;
import entities.User;

import entities.*;


public class MOrder {
    public static int add(User user, Cart cart) {

        int orderId = 0;

        try {
            // TODO Faire une transaction
            MDB.connect();

            // Partie 1
            // Creer une commande et récupere le ID
            String query = "INSERT INTO `order` (`user_id`, `date`, `isShipped`) VALUES (?, now(), 0)";

            PreparedStatement ps = MDB.getPS(query, 1);

            ps.setInt(1, user.getId());

            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();

            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            }

            // Partie 2
            // Ajoute tout les items de la commande dans la table order_info

            for (ItemCart itemC : cart.getCart().values()) {

                query = "INSERT INTO `order_info` (`order_id`, `product_id`, `qty`, `price`) VALUES (?, ?, ?, ?)";
                ps = MDB.getPS(query);

                ps.setInt(1, orderId);
                ps.setInt(2, itemC.getId());
                ps.setInt(3, itemC.getQty());
                ps.setDouble(4, itemC.getPrice());

                ps.executeUpdate();

            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return orderId;

    }

    public static List<Order> getAllOrdersByUserId(int userId) {
        List<Order> orderList = new ArrayList<Order>();
        try {

            MDB.connect();

            String query = "SELECT `order`.id, `order`.date,`order`.isShipped,"
                    + " `order_info`.order_id, `order_info`.product_id, `order_info`.qty, `order_info`.price "
                    + "FROM `order` INNER JOIN `order_info` ON `order`.id = `order_info`.order_id WHERE `order`.user_id = ?;";

            PreparedStatement ps = MDB.getPS(query);

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            int orderId = 0;

            Order order = new Order();

            // Une ligne = un item avec qte
            while (rs.next()) {

                // Si nouvel commande, creer une nouvelle commande
                if (orderId != rs.getInt("id")) {

                    // Ecraser le orderId de condition
                    orderId = rs.getInt("id");

                    // Nouvelle commande
                    order = new Order();

                    order.setId(orderId);
                    order.setUserId(userId);
                    order.setDate(rs.getString("order.date"));
                    order.setShipped(rs.getBoolean("order.isShipped"));

                    // Ajouter la commande a la liste
                    orderList.add(order);
                }

                // Recupérer l'item suivant
                int itemId = rs.getInt("order_info.product_id");

                // Recuperer l'item complet de la BD
                Item item = MItem.getItemById(itemId);

                // Ecraser le prix et ajouter la quantité
                ItemCart itemC = new ItemCart(item);
                itemC.setQty(rs.getInt("order_info.qty"));
                itemC.setPrice(rs.getDouble("order_info.price"));

                // Ajouter l'itemPanier au panier
                order.addItem(itemC.getSerial(), itemC);
            }

            //orderList.add(order);


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }


        return orderList;
    }


//    public static ArrayList<Order> getAllOrders() {
//
//        ArrayList<Order> orderList = new ArrayList<>();
//
//
//        try {
//            MDB.connect();
//
//            String query = "SELECT user.id,`order`.date,`order`.isShipped, `order`.id FROM `order` INNER JOIN user ON `order`.user_id = user.id;";
//            ResultSet rs = MDB.execQuery(query);
//
//
//            while (rs.next()) {
//
//                Order unOrder = new Order();
//                unOrder.setId(rs.getInt(1));
//                unOrder.setDate(rs.getString(2));
//                unOrder.setShipped(rs.getBoolean(3));
//                unOrder.setUserId(rs.getInt(4));
//
//                orderList.add(unOrder);
//
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            MDB.disconnect();
//        }
//
//        return orderList;
//
//    }


    public static List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<Order>();
        try {
            MDB.connect();
            String query = "SELECT `order`.id, `order`.date, `order`.user_id,"
                    + " `user`.firstName, `user`.lastName, `user`.email "
                    + " FROM `order` "
                    + " INNER JOIN `user` ON `order`.user_id = `user`.id;";

            PreparedStatement ps = MDB.getPS(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                User user = new User();

                order.setId(rs.getInt("order.id"));
                order.setUserId(rs.getInt("order.user_id"));
                order.setDate(rs.getString("order.date"));

                user.setId(rs.getInt("order.user_id"));
                user.setFirstName(rs.getString("user.firstName"));
                user.setLastName(rs.getString("user.lastName"));

                order.setUser(user);
                // Ajouter la commande a la liste
                orders.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MDB.disconnect();
        }

        return orders;
    }

    public static boolean delete(int id) {
        boolean isSuccess = true;
        try {
            String queryToDelete = "DELETE FROM isidrone.order WHERE id = ?";
            PreparedStatement psToDelete = MDB.getPS(queryToDelete);
            psToDelete.setInt(1, id);
            psToDelete.executeUpdate();
        } catch (SQLException e) {
            isSuccess = false;
        } finally {
            MDB.disconnect();
        }
        return isSuccess;
    }
}



