<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.Order" %>
<%
    @SuppressWarnings("unchecked")
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("allOrders");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
    <h2 class="text-center">Administration: Liste des commandes</h2>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Nom</th>
            <th scope="col">Prénom</th>
            <th scope="col">Date</th>
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
            <td>
                <div class="dropdown">
                    <button class="btn btn-info">&#11167</button>
                    <div class="dropdown-content">
                        <a href="#">Action 1</a>
                        <a href="#">Action 2</a>
                    </div>
                </div>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>