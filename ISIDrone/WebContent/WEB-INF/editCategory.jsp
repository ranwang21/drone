<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.Category" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<%
    Category category = (Category) request.getAttribute("category");
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    String msg = (String) request.getAttribute("message");
%>
<!-- /.container -->
<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <form name="editCategory" action="editCategory" method="post"
                  class="panel panel-primary form-horizontal"
                  style="float: unset; margin: auto;">
                <div class="panel-heading">
                    <h3 class="panel-title">Edit Category</h3>
                </div>
                <div class="panel-body">
                    <fieldset class="col-md-12">
                        <% if (msg != null) {%>
                        <div class="col-md-12 alert alert-success" role="alert">
                            Modification effectuée avec succès !!!
                        </div>
                        <%} %>

                        <input type="hidden" name="category_id" value="<%=category.getId()%>">

                        <div class="form-group col-md-6">
                            <label for="editCategoryName">Nom</label>
                            <input maxlength="45" type="text" class="form-control" id="editCategoryName" name="name"
                                   placeholder="Nom de la Catégorie"
                                   value="<%=category.getName()%>" required>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="editCategoryPosition">Position</label>
                            <select class="form-control" id="editCategoryPosition" name="order">
                                <% for (int i = 0; i <= categories.size(); i++) {%>
                                <option value="<%=i%>"
                                        <%if (category.getId() == i) {%>selected<% } %>>
                                    <%=i%>
                                </option>
                                <%}%>
                            </select>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="editCategoryDescription">Description</label>
                            <textarea maxlength="255" class="form-control" id="editCategoryDescription"
                                      name="description" rows="3"
                                      placeholder="Description de la Catégorie"><%=category.getDescription()%></textarea>
                        </div>

                        <div class="form-group col-md-12 form-check">
                            <input <%if (category.isActive()) {%> checked <% } %> type="checkbox"
                                                                  class="form-check-input" name="isActive"
                                                                  id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Category Actif</label>
                        </div>
                    </fieldset>

                    <div class="form-group text-center" style="clear: left; top: 15px; margin-bottom: 15px;">
                        <button type="submit" class="btn btn-default">Modifier</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>