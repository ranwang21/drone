<%@page import="entities.Item" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entities.Category" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="action.ActionCategory" %>
<%
    Item item = (Item) request.getAttribute("item");
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    Category itemCategory = ActionCategory.getCategory(item.getCategory());
    String msg = (String) request.getAttribute("message");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<!-- /.container -->
<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-sm-12">
            <form action="editProduct" method="post" class="panel panel-primary form-horizontal"
                  style="float: unset; margin: auto;">
                <div class="panel-heading">
                    <h3 class="panel-title">Modification d'un produit</h3>
                </div>
                <div class="panel-body">
                    <fieldset class="col-md-12">
                        <% if (msg != null) {%>
                        <div class="col-md-12 alert alert-success" role="alert">
                            Modification effectuée avec succès !!!
                        </div>
                        <%} %>
                        <input type="hidden" name="product_id" value="<%=item.getId()%>">

                        <div class="form-group col-md-6">
                            <label for="input1">Nom</label>
                            <input type="text" class="form-control" id="input1" name="name" placeholder="Nom du produit"
                                   value="<%=item.getName()%>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputCategories">Categories</label>
                            <select id="inputCategories" name="category" class="form-control">
                                <% for (Category category : categories) {%>
                                <option value="<%=category.getId()%>"
                                        <%if (category.getId() == itemCategory.getId()) {%>selected<% } %>>
                                    <%=category.getName()%>
                                </option>
                                <%}%>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="input4">Prix</label>
                            <input type="number" class="form-control" id="input4" name="price"
                                   placeholder="Prix du produit"
                                   value="<%=item.getPrice()%>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="input5">Numero de serie</label>
                            <input type="text" class="form-control" id="input5" name="serial"
                                   placeholder="Numero de serie du produit"
                                   value="<%=item.getSerial()%>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="input6">Quantite</label>
                            <input type="number" class="form-control" id="input6" name="stock"
                                   placeholder="Quantite du produit"
                                   value="<%=item.getStock()%>">
                        </div>
                        <div class="col-md-6"></div>
                        <div class="form-group col-md-6">
                            <label for="input3">Description</label>
                            <textarea class="form-control" id="input3" name="description" rows="3"
                                      placeholder="Description du produit"><%=item.getDescription()%></textarea>
                        </div>
                        <div class="form-group col-md-12 form-check">
                            <input <%if (item.isActive()) {%> checked <% } %> type="checkbox"
                                                              class="form-check-input" name="isActive"
                                                              id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Produit Actif</label>
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