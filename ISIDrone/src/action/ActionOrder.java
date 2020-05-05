package action;

import java.util.List;

import entities.Cart;
import entities.Order;
import entities.User;
import manager.MOrder;
import manager.MSendMail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionOrder {

    // Methode executé lorse qu'une commande est completé
    public static int process(User user, Cart cart) {

        // Ajoute la commande a la base de donnée
        int orderId = MOrder.add(user, cart);

        // Envoie d'un email de confirmation
        String to = user.getEmail();
        sendEmail(to);

        return orderId;
    }

    private static void sendEmail(String to) {

        // Envoie d'un email de confirmation
        String sujet = "Achat completé";
        String message = "Félicitation, vous avez commander quelquechose.";

//        MSendMail.sendEmail(message, to, sujet);

    }

    public static List<Order> getHistoryByUserID(int userId) {
        List<Order> orderList = MOrder.getAllOrdersByUserId(userId);

        return orderList;
    }

    public static void getAllOrders(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("orders", MOrder.getAllOrders());
    }

    public static boolean deleteOrder(int idOrder) {
        return MOrder.delete(idOrder);
    }
}
