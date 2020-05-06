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
    String itemAdded = (String) request.getAttribute("itemAdded");
%>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container ">

    <div class="row">
        <div class="col-sm-12">
            <form action="item" method="post" class="panel panel-primary form-horizontal"
                  style="float: unset; margin: auto;">
                <div class="panel-heading">
                    <h3 class="panel-title">Ajout d'un produit</h3>
                </div>
                <div class="panel-body">
                    <fieldset class="col-md-12">
                        <% if (itemAdded != null) {%>
                        <div class="col-md-12 alert alert-success" role="alert">
                            Produit ajouté avec succès !!!
                        </div>
                        <%} %>
                        <input type="hidden" name="product_id" value="2">
                        <div class="form-group col-md-6">
                            <label for="nom">Nom</label>
                            <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom du produit">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="category">Categories</label>
                            <select id="category" name="category" class="form-control">
                                <% for (Category category : categories) {
                                    if (!category.getName().equals("Tous")) {
                                %>
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
                            <label for="prix">Prix</label>
                            <input type="number" step="0.01" class="form-control" id="prix" name="prix"
                                   placeholder="Prix du produit">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="serial">Numero de serie</label>
                            <input type="text" class="form-control" id="serial" name="serial"
                                   placeholder="Numero de serie du produit">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="qty">Quantite</label>
                            <input type="number" class="form-control" id="qty" name="qty"
                                   placeholder="Quantite du produit">
                        </div>
                        <div class="col-md-6"></div>
                        <div class="form-group col-md-6">
                            <label for="description">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3"
                                      placeholder="Description du produit"></textarea>
                        </div>
                        <div class="form-group col-md-12 form-check">
                            <input type="checkbox"
                                   class="form-check-input" name="isActif"
                                   value="Actif"
                                   id="isActif">
                            <label class="form-check-label" for="isActif">Produit Actif</label>
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
