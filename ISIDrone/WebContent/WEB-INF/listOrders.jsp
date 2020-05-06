<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.Order" %>
<%
    @SuppressWarnings("unchecked")
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
    String error = (String) request.getAttribute("deleteError");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
    <h2 class="text-center">Administration: Liste des commandes</h2>
    <%if (error != null) {%>
    <br>
    <div class="alert alert-danger text-center" role="alert">
        Impossible de supprimer la commande demandée.
    </div>
    <%}%>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Nom</th>
            <th scope="col">Prénom</th>
            <th scope="col">Date</th>
            <th scope="col">Livraison</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%for (Order order : orders) {%>
        <tr>
            <td><%=order.getUser().getLastName()%>
            </td>
            <td><%=order.getUser().getFirstName()%>
            </td>
            <td><%=order.getDate()%>
            </td>
            <% if (order.getShipped()) {%>
            <td class="text-center text-success align-middle">Expédié</td>
            <% } else { %>
            <td class="text-center text-danger align-middle">En Attente</td>
            <% } %>
            <td>
                <div class="dropdown">
                    <button class="btn btn-info">&#11167</button>
                    <div class="dropdown-content">
                        <a href="#">Action 1</a>
                        <% if (!order.getShipped()) { %>
                        <a data-modal-target="#modal" href="#"
                           onclick="setIdOrder(<%=order.getId()%>)">Supprimer</a>
                        <% } %>
                        <a href="#">Action 3</a>
                    </div>
                </div>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <div class="modal-supp" id="modal">
        <div class="modal-header-supp">
            <div class="title-supp">Suppression</div>
            <button data-close-button class="close-button-supp">&times;</button>
        </div>
        <div class="modal-body-supp">
            Supprimer la commande?
            <div class="confirmer-button">
                <a id="confirm-link">
                    <button class="btn btn-danger">Confirmer</button>
                </a>
            </div>
        </div>
    </div>
    <div id="overlay-supp"></div>
</div>

<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>