<%@page import="entities.Item" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entities.Category" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="action.ActionCategory" %>
<%
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    String msg = (String) request.getAttribute("message");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<!-- /.container -->
<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-sm-12">
            <form action="addCategory" id="formAddCategory" method="post" class="panel panel-primary form-horizontal"
                  style="float: unset; margin: auto;">
                <div class="panel-heading">
                    <h3 class="panel-title">Ajout d'une catégorie</h3>
                </div>
                <div class="panel-body">
                    <fieldset class="col-md-12">
                        <% if (msg != null) {%>
                        <div class="col-md-12 alert alert-success" role="alert">
                            Catégorie ajoutée avec succès !!!
                        </div>
                        <%} %>
                        <div style="display: none" class="alert alert-danger" id="addCategoryError" role="alert">
                            Tous les champs ci-dessous sont obligatoires
                            <p id="errorNameCategory">* Nom</p>
                            <p id="errorOrderCategory">* Position</p>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="addCategoryName">Nom</label>
                            <input type="text" class="form-control" id="addCategoryName" name="name"
                                   placeholder="Nom du produit">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="addCategoryDescription">Description</label>
                            <textarea class="form-control" id="addCategoryDescription" name="description" rows="3"
                                      placeholder="Description du produit"></textarea>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="addCategoryPosition">Position</label>
                            <input type="number" class="form-control" id="addCategoryPosition" name="order"
                                   placeholder="Position">
                        </div>
                        <div class="form-group col-md-12 form-check">
                            <input type="checkbox"
                                   class="form-check-input" name="isActive"
                                   id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Categorie Actif</label>
                        </div>
                    </fieldset>

                    <div class="form-group text-center" style="clear: left; top: 15px; margin-bottom: 15px;">
                        <a href="#" id="btnAddCategory" class="btn btn-default">Ajouter</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>