<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.User" %>
<%
    @SuppressWarnings("unchecked")
    ArrayList<User> clients = (ArrayList<User>) request.getAttribute("clients");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
    <h2 class="text-center">Administration: Liste des clients</h2>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Nom</th>
            <th scope="col">Prénom</th>
            <th scope="col">Email</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%for (User user : clients) {%>
        <tr>
            <td><%=user.getLastName()%>
            </td>
            <td><%=user.getFirstName()%>
            </td>
            <td><%=user.getEmail()%>
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