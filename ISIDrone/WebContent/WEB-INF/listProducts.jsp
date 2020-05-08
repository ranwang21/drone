<%@page import="java.text.DecimalFormat" %>
<%@page import="entities.Item" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entities.Category" %>
<%@page import="entities.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%

    ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    String result = (String) request.getAttribute("result");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
    <h2 class="text-center">Administration: Liste des produits</h2>
    <br>
    <%if (result != null) {%>
    <br>
    <div class="alert alert-danger text-center" role="alert">
        Impossible de supprimer le produit demandée. Des commandes sont associés à celle-ci
    </div>
    <%}%>
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
                        <a href="editProduct?product_id=<%=item.getId()%>">Modifier</a>
                        <a data-modal-target="#modal" href="#"
                           onclick="setIdProduct(<%=item.getId()%>)">Supprimer</a>
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
    <div class="modal-supp" id="modal">
        <div class="modal-header-supp">
            <div class="title-supp">Suppression</div>
            <button data-close-button class="close-button-supp">&times;</button>
        </div>
        <div class="modal-body-supp">
            Assurez-vous qu'aucune commande est associé au produit que vous souhaitez supprimer.
            <div class="confirmer-button">
                <a id="confirm-link">
                    <button class="btn btn-danger">Confirmer</button>
                </a>
            </div>
        </div>
    </div>
    <div id="overlay-supp"></div>
</div>

<script type="text/javascript" src="js/suppression.js"></script>

<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>