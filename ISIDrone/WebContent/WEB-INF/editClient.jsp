<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.User" %>
<%
    User user = (User) request.getAttribute("user");
    int msg = request.getAttribute("message") != null ? (Integer) request.getAttribute("message") : 0;
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<!-- /.container -->
<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-sm-12">
            <form action="editClient" id="formEditClient" method="post" class="panel panel-primary form-horizontal"
                  style="float: unset; margin: auto;">
                <div class="panel-heading">
                    <h3 class="panel-title">Modification d'un client</h3>
                </div>
                <div class="panel-body">
                    <fieldset class="col-md-12">
                        <% if (msg == 1) {%>
                        <div class="col-md-12 alert alert-success" id="successMsgClient" role="alert">
                            Modification effectuée avec succès !!!
                        </div>
                        <%} %>
                        <% if (msg == 2) {%>
                        <div class="col-md-12 alert alert-danger" id="errorMsgEmail" role="alert">
                            Cette adresse courriel existe déjà
                        </div>
                        <%} %>
                        <input type="hidden" name="client_id" value="<%=user.getId()%>">


                        <div class="form-group col-md-6">
                            <label for="clientLastName">Nom</label>
                            <input type="text" class="form-control" id="clientLastName" name="lastName"
                                   placeholder="Nom"
                                   value="<%=user.getLastName()%>" required maxlength="45">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="clientFirstName">Prénom</label>
                            <input type="text" class="form-control" id="clientFirstName" name="firstName"
                                   placeholder="Prénom"
                                   value="<%=user.getFirstName()%>" required maxlength="45">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="clientEmail">Email</label>
                            <input type="text" class="form-control" id="clientEmail" name="email"
                                   placeholder="Email"
                                   value="<%=user.getEmail()%>" required maxlength="45">
                        </div>

                        <div class="panel panel-primary form-horizontal col-md-12"
                             style="float: unset; margin: auto;">
                            <div class="panel-heading">
                                <h3 class="panel-title">Adresse</h3>
                            </div>
                            <div class="panel-body">
                                <fieldset class="col-md-12">

                                    <div class="form-group col-md-6">
                                        <label for="addNo">Numero civique</label>
                                        <input type="text" class="form-control" id="addNo" name="no"
                                               placeholder="Numero civique"
                                               value="<%=user.getShipAddress().getNo()%>">
                                    </div>

                                </fieldset>
                            </div>
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