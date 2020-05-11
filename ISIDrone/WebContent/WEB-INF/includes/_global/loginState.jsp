<%@page import="util.Const" %>
<%@page import="manager.MLogin" %>
<%@page import="action.ActionLogin" %>
<%@page import="manager.MCookies" %>
<%@ page import="entities.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    //S'il n'y a pas d'utilisateur déjà de connecté
    User user = (User) session.getAttribute("user");

//S'il n'y a pas d'utilisaeur de connecté présentement, on vérifie dans les cookies
// et si nous somme pas en train de nous déconnecter
    if (user == null && request.getAttribute("logout") == null) {
        user = ActionLogin.getUserFromAutoLogin(request);
        session.setAttribute("user", user);
    }

//Si le autoLogin a fonctionné
    if (user != null) {%>

<li class="nav-item dropdown user-state">
    <a class="nav-link btn dropdown-toggle" data-toggle="dropdown"
       href="#" style="padding-right: 20px; padding-left: 20px; outline: none"><%=user.getFirstName().toUpperCase()%>
    </a>

    <div class="dropdown-menu dropdown-menu-right" id="dropdownMenuUser">
        <style>
            #dropdownMenuUser a {
                transition: all .3s;
                font-weight: bold;
                color: gray;
                padding: 7px 10px;
                text-decoration: none !important;
            }

            #dropdownMenuUser a:hover {
                color: black;
                background-color: #7bbdf7 !important;
            }
        </style>
        <% if (user.getIsAdmin() == 0) {%>
        <a class="dropdown-item" href="<%="order-history"%>">Historique commande</a>
        <div class="dropdown-divider" style="margin: 0; border: 1px solid #7bbdf7;"></div>
        <a class="dropdown-item" href="<%="order-history"%>">Historique commande</a>
        <%--        <div class="dropdown-divider" style="margin: 0; border: 1px solid #7bbdf7;"></div>--%>
        <%--        <a class="dropdown-item" href="editProfil">Modifier mon profil</a>--%>
        <%} else {%>
        <a class="dropdown-item" id="men1" href="list-products?category=1">Liste des produits</a>
        <a class="dropdown-item" href="list-categories">Liste des catégories</a>
        <a class="dropdown-item" href="listOrders">Liste des commandes</a>
        <a class="dropdown-item" href="listClients">Liste des clients</a>
        <div class="dropdown-divider" style="margin: 0; border: 1px solid #7bbdf7;"></div>
        <a class="dropdown-item" href="addProduct">Ajouter un produit</a>
        <a class="dropdown-item" href="addCategory">Ajouter une catégorie</a>
        <%}%>
        <div class="dropdown-divider" style="margin: 0; border: 1px solid #7bbdf7;"></div>
        <a class="dropdown-item" href="login">Déconnexion</a
        <div class="dropdown-divider" style="margin: 0; border: 1px solid #7bbdf7;"></div>
        <a class="dropdown-item" href="login">Déconnexion</a>
    </div>
</li>

<% } else { %>
<li><a href="signup<%=(request.getParameter("fromCart") != null ? "?fromCart=true" : "")%>">S'enregistrer</a></li>
<li id="loginState"><a href="login">Connexion</a></li>
<% } %>