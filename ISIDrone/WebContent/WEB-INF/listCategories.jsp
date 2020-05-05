<%@page import="java.text.DecimalFormat" %>
<%@page import="entities.Item" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entities.Category" %>
<%@page import="entities.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%
    @SuppressWarnings("unchecked")
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
    <h2 class="text-center">Administration: Liste des catégories</h2>
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
                        <a data-modal-target="#modal" href="#">Supprimer</a>
                        <a href="#">Action 3</a>
                    </div>
                </div>
            </td>
        </tr>

        <%

            }

        %>
        </tbody>
    </table>
    <div class=" modal-supp" id="modal">
        <div class="modal-header-supp">
            <div class="title-supp">Suppression</div>
            <button data-close-button class="close-button-supp">&times;</button>
        </div>
        <div class="modal-body-supp">
            Assurez-vous qu'aucun produit est associé à la catégorie que vous souhaitez supprimer.
            <div class="confirmer-button">
                <button class="btn btn-danger">Confirmer</button>
            </div>
        </div>
    </div>
    <div id="overlay-supp"></div>
</div>

<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>