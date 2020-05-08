<%--
  Created by IntelliJ IDEA.
  User: morellan
  Date: 5/1/2020
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.Category" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    int msg = request.getAttribute("message") != null ? (Integer) request.getAttribute("message") : 0;
%>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container ">

    <div class="row">
        <div class="col-sm-12">
            <form action="addProduct" id="formAddProduct" method="post" class="panel panel-primary form-horizontal"
                  enctype="multipart/form-data"
                  style="float: unset; margin: auto;">
                <div class="panel-heading">
                    <h3 class="panel-title">Ajout d'un produit</h3>
                </div>
                <div class="panel-body">
                    <fieldset class="col-md-12">
                        <% if (msg == 1) {%>
                        <div class="col-md-12 alert alert-success" id="successMsgAddProduct" role="alert">
                            Produit ajouté avec succès !!!
                        </div>
                        <%} %>
                        <% if (msg == 2) {%>
                        <div class="col-md-12 alert alert-danger" id="successMsgAddProduct" role="alert">
                            Une erreur est survenu lors du téléchargement de l'image
                        </div>
                        <%} %>
                        <input type="hidden" name="product_id" value="2">

                        <div class="form-group row col-md-10">
                            <label for="addProductFile">Image du produit</label>
                            <input type="file" class="form-control" accept="image/png, image/jpg, image/jpeg"
                                   id="addProductFile" name="addProductFile">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="nom">Nom</label>
                            <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom du produit"
                                   required value="new prod">
                        </div>
                        <div class="col-md-6"></div>
                        <div class="form-group col-md-6">
                            <label for="description">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3"
                                      placeholder="Description du produit">eygbgdhcydggxhfc</textarea>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="category">Categories</label>
                            <select id="category" name="categoryId" class="form-control">
                                <% for (Category category : categories) {
                                    if ((category.getId() > 1)) {%>
                                <option value="<%=category.getId()%>">
                                    <%=category.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="price">Prix</label>
                            <input type="number" class="form-control" id="price" name="price"
                                   placeholder="Prix du produit" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="serial">Numero de serie</label>
                            <input type="text" class="form-control" id="serial" name="serial"
                                   placeholder="Numero de serie du produit" value="dfdgfgh">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="qty">Quantite</label>
                            <input type="number" class="form-control" id="qty" name="qty"
                                   placeholder="Quantite du produit" required value="3">
                        </div>
                        <div class="form-group col-md-12 form-check">
                            <input type="checkbox"
                                   class="form-check-input" name="isActive"
                                   checked
                                   id="isActive">
                            <label class="form-check-label" for="isActive">Produit Actif</label>
                        </div>
                    </fieldset>

                    <div class="form-group text-center" style="clear: left; top: 15px; margin-bottom: 15px;">
                        <button type="submit" class="btn btn-default">Ajouter</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>
