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
            <th class="text-center" scope="col">Nom</th>
            <th class="text-center" scope="col">Prénom</th>
            <th class="text-center" scope="col">Status d'expédition</th>
            <th class="text-center" scope="col">Date</th>
            <th class="text-center" scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%for (Order order : orders) {%>
        <tr>
            <td class="text-center"><%=order.getUser().getLastName()%>
            </td>
            <td class="text-center"><%=order.getUser().getFirstName()%>
            </td>
            <% if (order.getShipped()) { %>
            <td class="text-center text-success">Expédié</td>
            <% } else { %>
            <td class="text-center">
                <a data-modal-target="#modal" href="#" onclick="setIdUpdateExp(<%=order.getId()%>, 'true')">
                    <button class="btn btn-danger">&#9992;</button>
                </a>
            </td>
            <% } %>
            <td class="text-center"><%=order.getDate()%>
            </td>
            <td class="text-center">
                <div class="dropdown">
                    <button class="btn btn-info">&#11167</button>
                    <div class="dropdown-content">
                        <% if (!order.getShipped()) {%>
                        <a data-modal-target="#modal" href="#"
                           onclick="setIdOrder(<%=order.getId()%>)">Supprimer</a>
                        <%}%>
                        <% if (order.getShipped()) {%>
                        <a data-modal-target="#modal" href="#"
                           onclick="setIdUpdateExp(<%=order.getId()%>, 'false')">Annuler l'expédition</a>
                        <% } %>
                    </div>
                </div>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <div class="modal-supp" id="modal">
        <div class="modal-header-supp">
            <div id="order-main-title" class="title-supp"></div>
            <button data-close-button class="close-button-supp">&times;</button>
        </div>
        <div class="modal-body-supp">
            <p id="order-body-title"></p>
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