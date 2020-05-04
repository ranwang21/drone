<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
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