<%@page import="java.text.DecimalFormat" %>
<%@page import="entities.Item" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entities.Category" %>
<%@page import="entities.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%
    @SuppressWarnings("unchecked")
    ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
    @SuppressWarnings("unchecked")
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
    <h2 class="text-center">Administration: Liste des produits</h2>
    <br>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Nom</th>
            <th scope="col">Catégorie</th>
            <th scope="col">Prix</th>
            <th scope="col">Quantité en stock</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            //Format a deux decimal
            DecimalFormat df = new DecimalFormat("####0.00");
            if (items.size() > 0) {
                for (Item item : items) {
                    for (Category category : categories
                    ) {
                        if (item.getCategory() == category.getId()) {
        %>
        <tr>
            <td><%=item.getName()%>
            </td>
            <td><%=category.getName()%>
            </td>
            <td><%=df.format(item.getPrice()) + "$"%>
            </td>
            <td><%=item.getStock()%>
            </td>
            <td>
                <div class="dropdown">
                    <button class="btn btn-info">&#11167</button>
                    <div class="dropdown-content">
                        <a href="#">Action 1</a>
                        <a href="#">Action 2</a>
                        <a href="#">Action 3</a>
                    </div>
                </div>
            </td>
        </tr>
        <%
                        }
                    }
                }
            } %>
        </tbody>
    </table>
</div>

<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>