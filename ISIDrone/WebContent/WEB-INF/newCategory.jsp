<%@page import="java.util.ArrayList" %>
<%@page import="entities.Category" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
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

                        <div style="display: none" class="alert alert-danger" id="addCategorySameNameError"
                             role="alert">
                            Ce nom est déjà associé à une catégorie existante
                        </div>

                        <div class="form-group col-md-12">
                            <label for="addCategoryName">Nom</label>
                            <input type="text" class="form-control" id="addCategoryName" name="name"
                                   placeholder="Nom du produit" maxlength="45" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="addCategoryDescription">Description</label>
                            <textarea class="form-control" id="addCategoryDescription" name="description" rows="3"
                                      placeholder="Description du produit"></textarea>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="addCategoryPosition">Position</label>
                            <input type="number" class="form-control" id="addCategoryPosition" name="order"
                                   placeholder="Position" min="0" step="1" required>
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
                        <button style="display: none" type="submit" id="btnAddCategorySubmit"
                                class="btn btn-default"></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function getById(param) {
        return document.getElementById(param)
    }

    const categories = [<% for (int i = 0; i < categories.size(); i++) { %>"<%= categories.get(i).getName() %>"<%= i + 1 < categories.size() ? ",":"" %><% } %>];

    // Validation du formulaire d'ajout d'une categorie
    const btnAddCategory = getById("btnAddCategory")
    const btnSubmit = getById("btnAddCategorySubmit")
    btnAddCategory.addEventListener('click', btnAddCategoryClick)

    function btnAddCategoryClick() {
        const addSameNameError = getById("addCategorySameNameError")
        const name = getById("addCategoryName")
        const form = getById("formAddCategory")
        if (categories.includes(name.value)) {
            addSameNameError.style.display = "block"
        } else {
            addSameNameError.style.display = "none";
            btnSubmit.click();
        }
    }
</script>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>