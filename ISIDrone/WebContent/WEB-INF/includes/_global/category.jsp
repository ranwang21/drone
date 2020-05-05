<%@page import="action.ActionCategory" %>
<%@page import="java.util.ArrayList, entities.Category" %>
<%
    //V�rification si la cat�gorie s�lectionne est valide (Un utilisateur pourrait tenter d'entr� une cat�gorie invalide dans la barre d'adresse)
    @SuppressWarnings("unchecked")
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    int categorySelected = ActionCategory.getSelectedCategory(request, response);

    if (categories.size() > 0) {
        for (Category category : categories) {
            if (category.getActive()) {
%>
<a href="items?category=<%=category.getId()%>"
   class="list-group-item<%=(category.getId() == categorySelected ? " active" : "")%>"><%=category.getName()%>
</a>
<%
        }
    }
} else {
%>
Aucune Cat�gorie n'est pr�sente pour le moment.
<%
    }
%>