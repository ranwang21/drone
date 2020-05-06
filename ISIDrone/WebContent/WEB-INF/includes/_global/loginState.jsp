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
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><%=user.getFirstName().toUpperCase()%>
    </a>


    <div class="dropdown-menu dropdown-menu-right" id="dropdownMenuUser">
        <% if (user.getIsAdmin() == 0) {%>
        <a class="dropdown-item" href="<%="order-history"%>">Historique commande</a>
        <%} else {%>

        <a class="dropdown-item" href="list-products?category=1">Liste des produits</a>
        <a class="dropdown-item" href="list-categories">Liste des catégories</a>
        <a class="dropdown-item" href="listOrders">Liste des commandes</a>
        <a class="dropdown-item" href="listClients">Liste des clients</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="item?ajouterProduit=1">Ajouter un produit</a>
        <a class="dropdown-item" href="addCategory">Ajouter une catégorie</a>
        <%}%>

        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="login">Déconnexion</a>
    </div>
</li>

<% } else { %>
<li><a href="signup<%=(request.getParameter("fromCart") != null ? "?fromCart=true" : "")%>">S'enregistrer</a></li>
<li id="loginState"><a href="login">Connexion</a></li>
<% } %>