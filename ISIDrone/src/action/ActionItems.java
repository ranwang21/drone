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

    public static void updateItemById(Item item, HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("message", MItem.updateItem(item));
    }
}