<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.User" %>
<%
    @SuppressWarnings("unchecked")
    ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
    String search = request.getParameter("search");

%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
    <h2 class="text-center">Administration: Liste des clients</h2>
    <%if (search != null) { %>
    <div style="padding-bottom: 0.7em; font-size: 1.5em;text-align: center">
        Resultat de recherche en fonction du mot clé <span style="color: #3399f3; font-size: 1.2em"><%=search%></span>
    </div>
    <% }%>

    <form class="navbar-form" role="search" action="search-users?">
        <div class="form-group col-lg-offset-9" style="padding-right:0;">
            <input class="form-control biginput" name="search" placeholder="Rechercher" type="text">
            <button type="submit" class="btn btn-primary"><span
                    class="glyphicon glyphicon-search"></span></button>
        </div>

    </form>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Nom</th>
            <th scope="col">Prénom</th>
            <th scope="col">Email</th>
            <th scope="col">Status</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%for (User user : users) {%>
        <tr>
            <td><%=user.getLastName()%>
            </td>
            <td><%=user.getFirstName()%>
            </td>
            <td><%=user.getEmail()%>
            </td>
            <td>
                <button type="button"
                        class="btn disabled <%=user.getStatus().toUpperCase().equals("ACTIVATED") ? "btn-success" : "btn-danger"%>"
                        disabled><%=user.getStatus().toUpperCase()%>
                </button>
            </td>
            <td>
                <div class="dropdown">
                    <button class="btn btn-info">&#11167</button>
                    <div class="dropdown-content">

                        <% if (user.getStatus().toUpperCase().equals("ACTIVATED")) {%>
                        <a data-modal-target="#modal" href="#" onclick="setIdUserToDeactivate(<%=user.getId()%>)">Déactiver</a>
                        <% } else if (user.getStatus().toUpperCase().equals("DEACTIVATED")) { %>
                        <a data-modal-target="#modal" href="#"
                           onclick="setIdUserToActivate(<%=user.getId()%>)">Activer</a>
                        <% } %>
                    </div>
                </div>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<div class="modal-supp" id="modal">
    <div class="modal-header-supp">
        <div class="title-supp">Confirmation</div>
        <button data-close-button class="close-button-supp">&times;</button>
    </div>
    <div class="modal-body-supp">
        Veillez confirmer votre action.
        <div class="confirmer-button">
            <a id="confirm-link">
                <button class="btn btn-danger">Confirmer</button>
            </a>
        </div>
    </div>
</div>
<div id="overlay-supp"></div>

<script type="text/javascript" src="js/suppression.js"></script>

<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>