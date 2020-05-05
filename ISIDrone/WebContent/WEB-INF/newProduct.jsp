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
<%@ page import="entities.Item" %>
<%
    Item item = (Item) request.getAttribute("item");
    @SuppressWarnings("unchecked")
    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
    String itemAdded = (String) request.getAttribute("itemAdded");
%>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container ">
    <%--        <%if (itemAdded == null) { %>--%>
    <%--    <div class="col-md-5 col-md-offset-3 ">--%>
    <%--        <div class="form-area ">--%>
    <%--            <form role="form" action="item" method="post">--%>
    <%--                <h3 style="margin-bottom: 25px; text-align: center;">Ajouter un Produit</h3>--%>
    <%--                <div class="form-group">--%>
    <%--                    <label for="nom">Nom</label>--%>
    <%--                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom du Produit" required>--%>
    <%--                </div>--%>
    <%--                <div class="form-group">--%>
    <%--                    <label for="category">Categories</label>--%>
    <%--                    <select class="form-control" id="category" name="category">--%>
    <%--                        // for each category create option--%>
    <%--                        <% for (Category c : categories) {--%>
    <%--                                if (!c.getName().equals("Tous")) {--%>
    <%--                            %>--%>
    <%--                        <option value="<%= c.getId()%>"><%=c.getName() %>--%>
    <%--                        </option>--%>
    <%--                        <% }--%>
    <%--                        }%>--%>
    <%--                    </select>--%>
    <%--                </div>--%>
    <%--                <div class="form-group">--%>
    <%--                    <label for="description">Description</label>--%>
    <%--                    <input type="text" class="form-control" id="description" name="description"--%>
    <%--                           placeholder="Description du Produit" required>--%>
    <%--                </div>--%>
    <%--                <div class="form-group">--%>
    <%--                    <label for="prix">Prix</label>--%>
    <%--                    <input type="number" step="0.01" class="form-control" id="prix" name="prix"--%>
    <%--                           placeholder="Prix du Produit"--%>
    <%--                           required>--%>
    <%--                </div>--%>
    <%--                <div class="form-group">--%>
    <%--                    <label for="serial">Numéro de Série</label>--%>
    <%--                    <input type="text" class="form-control" id="serial" name="serial"--%>
    <%--                           placeholder="Numéro de Série du Produit"--%>
    <%--                           required>--%>
    <%--                </div>--%>
    <%--                <div class="form-group">--%>
    <%--                    <label for="qty">Quantité</label>--%>
    <%--                    <input type="number" class="form-control" id="qty" name="qty" placeholder="Quantite du Produit"--%>
    <%--                           required>--%>
    <%--                </div>--%>
    <%--                <div class="form-group">--%>
    <%--                    <label for="isActif">Actif</label>--%>
    <%--                    <select class="form-control" id="isActif" name="isActif">--%>
    <%--                        <option value="Actif">Actif</option>--%>
    <%--                        <option value="Inactif">Inactif</option>--%>
    <%--                    </select>--%>
    <%--                </div>--%>
    <%--                <button type="submit" id="submit" class="btn btn-default pull-right">Envoyer</button>--%>
    <%--            </form>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <%--</div>--%>
    <div class="row">
        <div class="col-sm-12">
            <form action="item" method="post" class="panel panel-primary form-horizontal"
                  style="float: unset; margin: auto;">
                <div class="panel-heading">
                    <h3 class="panel-title">Modification d'un produit</h3>
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
                        <button type="submit" class="btn btn-default">Modifier</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%--        <% } else { %>--%>
    <%--    <div class="alert alert-success" role="alert">--%>
    <%--        Produit ajouter !--%>
    <%--    </div>--%>

    <%--        <% } %>--%>
</body>
</html>
