package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Category;
import entities.Item;
import manager.MCategory;
import manager.MItem;

import java.util.Arrays;

public class ActionCategory {

    public static void getCategories(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("categories", MCategory.getCategories());
    }

    public static int getSelectedCategory(HttpServletRequest request, HttpServletResponse response) {
        //Permet de recevoir la catégorie sélectionné par l'utilisateur
        String paramCategory = request.getParameter("category");

        //ArrayList<Category> categories = MCategory.getCategories();
        int categorySelected;

        if (paramCategory != null) {
            try {
                //Si l'utilisateur entre lui même une valeur pour le paramêtre category dans la barre d'adresse
                // alors s'il la catégorie est invalide, alors la catégorie sélectionné deviendra 1 (qui représente toutes les catégories)
                categorySelected = Integer.valueOf(paramCategory);
                if (MCategory.isExist(categorySelected) != 0)
                    categorySelected = 1;
            } catch (NumberFormatException e) {
                categorySelected = 1;
            }
        } else
            categorySelected = 0;

        return categorySelected;
    }

    public static void getCategoryById(int id, HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("category", MCategory.getCategoryById(id));
    }

    public static Category getCategory(int idCategory) {
        return MCategory.getCategoryById(idCategory);
    }

    public static void updateCategoryById(HttpServletRequest request, HttpServletResponse response) {

        Category category = new Category();
        category.setId(Integer.parseInt(request.getParameter("category_id")));
        category.setName(request.getParameter("name"));
        category.setDescription(request.getParameter("description"));
        category.setOrder(Integer.parseInt(request.getParameter("order")));
        category.setActive(!Arrays.toString(request.getParameterValues("isActive")).equals("null"));
        request.setAttribute("category_id", category.getId());
        request.setAttribute("message", MCategory.updateCategoty(category));
    }

    public static void addCategory(HttpServletRequest request, HttpServletResponse response) {
        Category category = new Category();
        category.setName(request.getParameter("name"));
        category.setOrder(Integer.parseInt(request.getParameter("order")));
        category.setDescription(request.getParameter("description"));
        category.setActive(!Arrays.toString(request.getParameterValues("isActive")).equals("null"));
        request.setAttribute("message", MCategory.add(category));
    }

    public static boolean deleteCategory(int idCategory) {
        return MCategory.delete(idCategory);
    }
}
