<%@page import="java.text.DecimalFormat" %>
<%@page import="entities.Item" %>
<%@page import="java.util.ArrayList" %>
<%@page import="entities.Category" %>
<%@page import="entities.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="action.ActionCategory" %>
<%
    @SuppressWarnings("unchecked")
    Item item = (Item) request.getAttribute("item");
    System.out.println(item.getName());
    System.out.println(item.getCategory());
    System.out.println(item.getStock());
    System.out.println(item.getSerial());
    System.out.println(item.isActive());

    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");

%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<!-- /.container -->
<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-sm-12">
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="input1">Nom</label>
                        <input type="text" class="form-control" id="input1" placeholder="Nom du produit"
                               value="<%=item.getName()%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputCategories">Categories</label>
                        <select id="inputCategories" class="form-control">
                            <% if (categories.size() > 0) {
                                for (Category category : categories) {
                            %>
                            <option value="<%=category.getId()%>"
                                    selected="<%=(category.getId() == item.getCategory())%>"><%=category.getName()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputCategories1">Categories</label>
                        <select id="inputCategories1" class="form-control">
                            <% if (categories.size() > 0) {
                                for (Category category : categories) {
                            %>
                            <option value="<%=category.getId()%>"><%=category.getName() + " " + category.getId()%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-12">
                        <label for="input3">Description</label>
                        <textarea class="form-control" id="input3" rows="3"
                                  placeholder="Description du produit"><%=item.getDescription()%></textarea>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="input4">Prix</label>
                        <input type="number" class="form-control" id="input4" placeholder="Prix du produit"
                               value="<%=item.getPrice()%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="input5">Numero de serie</label>
                        <input type="number" class="form-control" id="input5" placeholder="Numero de serie du produit"
                               value="<%=item.getSerial()%>">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="input6">Quantite</label>
                        <input type="number" class="form-control" id="input6" placeholder="Quantite du produit"
                               value="<%=item.getStock()%>">
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <input checked="<%=item.isActive()%>" class="form-check-input" type="radio"
                                   name="exampleRadios" id="exampleRadios1"
                                   value="option1" checked>
                            <label class="form-check-label" for="exampleRadios1">
                                Produit Actif
                            </label>
                        </div>
                        <div class="form-check">
                            <input checked="<%=!item.isActive()%>" class="form-check-input" type="radio"
                                   name="exampleRadios" id="exampleRadios2"
                                   value="option2">
                            <label class="form-check-label" for="exampleRadios2">
                                Produit Non Actif
                            </label>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Modifier</button>
            </form>
        </div>
    </div>
</div>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>