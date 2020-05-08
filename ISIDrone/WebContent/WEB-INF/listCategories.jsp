<%@page import="java.util.ArrayList" %>
<%@page import="entities.Category" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="java.util.Collections" %>
<%
    @SuppressWarnings("unchecked")
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    Collections.sort(categories);
    String error = (String) request.getAttribute("deleteError");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
    <h2 class="text-center">Administration: Liste des catégories</h2>
    <%if (error != null) {%>
    <br>
    <div class="alert alert-danger text-center" role="alert">
        Impossible de supprimer la catégorie demandée. Des produits sont associés à celle-ci
    </div>
    <%}%>
    <br>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Nom</th>
            <th scope="col">Ordre d'affichage</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Category category : categories) {
                if (!category.getName().equals("Tous")) {
        %>
        <tr>
            <td><%=category.getName()%>
            </td>
            <td><%=category.getOrder()%>
            </td>
            <td>
                <div class="dropdown">
                    <button class="btn btn-info">&#11167</button>
                    <div class="dropdown-content">
                        <a href="editCategory?category_id=<%=category.getId()%>">Modifier</a>
                        <a data-modal-target="#modal" href="#"
                           onclick="setIdCategory(<%=category.getId()%>)">Supprimer</a>
                    </div>
                </div>
            </td>
        </tr>

        <%
                }
            }

        %>
        </tbody>
    </table>
    <div class="modal-supp" id="modal">
        <div class="modal-header-supp">
            <div class="title-supp">Suppression</div>
            <button data-close-button class="close-button-supp">&times;</button>
        </div>
        <div class="modal-body-supp">
            Assurez-vous qu'aucun produit est associé à la catégorie que vous souhaitez supprimer.
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