package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Item;
import manager.MItem;

public class ActionItems {

    public static void getItems(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("items", MItem.getItems(ActionCategory.getSelectedCategory(request, response)));
    }

    public static void getSearchItems(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("items", MItem.getSearchItems(request.getParameter("search")));
    }

    public static void getItemById(int id, HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("item", MItem.getItemById(id));
    }

    public static void updateItemById(HttpServletRequest request, HttpServletResponse response) {
        Item item = new Item();
        item.setId(Integer.parseInt(request.getParameter("product_id")));
        item.setName(request.getParameter("name"));
        item.setCategory(Integer.parseInt(request.getParameter("category")));
        item.setDescription(request.getParameter("description"));
        item.setPrice(Double.parseDouble(request.getParameter("price")));
        item.setSerial(request.getParameter("serial"));
        item.setStock(Integer.parseInt(request.getParameter("stock")));
        item.setActive(Boolean.parseBoolean(request.getParameter("isActive")));

        request.setAttribute("product_id", item.getId());
        request.setAttribute("message", MItem.updateItem(item));
    }
}