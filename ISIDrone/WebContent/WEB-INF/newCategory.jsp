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
                        <div style="display: none" class="alert alert-danger" id="addCategoryError" role="alert">
                            Tous les champs ci-dessous sont obligatoires
                            <p id="errorNameCategory">* Nom</p>
                            <p id="errorOrderCategory">* Position</p>
                        </div>

                        <div style="display: none" class="alert alert-danger" id="addCategorySameNameError"
                             role="alert">
                            Ce nom est déjà associé à une catégorie existante
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
<script>
    function getById(param) {
        return document.getElementById(param)
    }

    const categories = [<% for (int i = 0; i < categories.size(); i++) { %>"<%= categories.get(i).getName() %>"<%= i + 1 < categories.size() ? ",":"" %><% } %>];
    console.log(categories)

    // Validation du formulaire d'ajout d'une categorie
    const btnAddCategory = getById("btnAddCategory")
    btnAddCategory.addEventListener('click', btnAddCategoryClick)

    function btnAddCategoryClick() {
        const errorMessage = getById("addCategoryError")
        const addSameNameError = getById("addCategorySameNameError")
        const errorName = getById("errorNameCategory")
        const errorOrder = getById("errorOrderCategory")

        const form = getById("formAddCategory")
        const name = getById("addCategoryName")
        const order = getById("addCategoryPosition")

        if (name.value.length === 0 || order.value.length === 0) {
            errorMessage.style.display = "block";
            errorName.style.display = name.value.length === 0 ? "block" : "none"
            errorOrder.style.display = order.value.length === 0 ? "block" : "none"
        } else {
            errorMessage.style.display = "none";
            if (categories.includes(name.value)) {
                addSameNameError.style.display = "block"
            } else {
                addSameNameError.style.display = "none";
                form.submit()
            }
        }
    }
</script>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>