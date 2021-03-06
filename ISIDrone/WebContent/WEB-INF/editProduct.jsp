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
    int msg = request.getAttribute("message") != null ? (Integer) request.getAttribute("message") : 0;
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<!-- /.container -->
<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-sm-12">
            <form action="editProduct" id="formEditProduct" method="post" class="panel panel-primary form-horizontal"
                  enctype="multipart/form-data"
                  style="float: unset; margin: auto;">
                <div class="panel-heading">
                    <h3 class="panel-title">Modification d'un produit</h3>
                </div>
                <div class="panel-body">
                    <fieldset class="col-md-12">
                        <div class="col-md-12 alert alert-success" id="successMsgProduct" role="alert"
                             style="display: <%=(msg == 1 ? "block" : "none")%>">
                            Modification effectuée avec succès !!!
                        </div>

                        <% if (msg == 2) {%>
                        <div class="col-md-12 alert alert-danger" id="successMsgAddProduct" role="alert">
                            Une erreur est survenu lors du téléchargement de l'image
                        </div>
                        <%} %>
                        <input type="hidden" name="product_id" value="<%=item.getId()%>">
                        <input type="hidden" name="oldImgName" value="<%=item.getImage()%>">

                        <div class="form-group row col-md-10">
                            <label for="editProductFile">Image du produit</label>
                            <input type="file" class="form-control" accept="image/png, image/jpg, image/jpeg"
                                   id="editProductFile" name="editProductFile">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="editProductName">Nom</label>
                            <input type="text" class="form-control" id="editProductName" name="name"
                                   placeholder="Nom du produit"
                                   value="<%=item.getName()%>" maxlength="45" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputCategories">Categories</label>
                            <select id="inputCategories" name="category" class="form-control">
                                <% for (Category category : categories) {
                                    if ((category.getId() > 1)) {%>%>
                                <option value="<%=category.getId()%>"
                                        <%if (category.getId() == itemCategory.getId()) {%>selected<% } %>>
                                    <%=category.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="editProductPrice">Prix</label>
                            <input type="number" class="form-control" id="editProductPrice" name="price"
                                   min="0"
                                   step="any"
                                   placeholder="Prix du produit"
                                   value="<%=item.getPrice()%>" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="editProductSerial">Numero de serie</label>
                            <input type="text" class="form-control" id="editProductSerial" name="serial"
                                   placeholder="Numero de serie du produit"
                                   value="<%=item.getSerial()%>" maxlength="45">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="editProductStock">Quantite</label>
                            <input type="number" class="form-control" id="editProductStock" name="stock"
                                   placeholder="Quantite du produit"
                                   min="0"
                                   step="1"
                                   value="<%=item.getStock()%>" required>
                        </div>
                        <div class="col-md-6"></div>
                        <div class="form-group col-md-6">
                            <label for="editProductDescription">Description</label>
                            <textarea class="form-control" id="editProductDescription" name="description" rows="3"
                                      maxlength="255"
                                      placeholder="Description du produit"><%=item.getDescription()%></textarea>
                        </div>
                        <div class="form-group col-md-12 form-check">
                            <input <% if(item.isActive()) { %> checked <% } %> type="checkbox"
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

<script type="text/javascript" src="js/validation.js"></script>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>