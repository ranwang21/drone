<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.User" %>
<%
    User user = (User) request.getAttribute("user");
    int msg = request.getAttribute("message") != null ? (Integer) request.getAttribute("message") : 10;
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
                <div class="panel-body"
                     style="display: flex; flex-direction: column;align-items: center;">
                    <fieldset class="col-md-12">
                        <% if (msg == 1) {%>
                        <div class="col-md-12 alert alert-success" id="successMsgClient" role="alert">
                            Modification effectuée avec succès !!!
                        </div>
                        <%} %>
                        <% if (msg == 0) {%>
                        <div class="col-md-12 alert alert-danger" id="errorMsgEmail" role="alert">
                            Cette adresse courriel existe déjà
                        </div>
                        <%} %>
                        <% if (msg == -1) {%>
                        <div class="col-md-12 alert alert-danger" id="errorMsgEmail" role="alert">
                            Un problème de connexion est survenue lors de la mise a jour
                        </div>
                        <%} %>
                        <input type="hidden" name="client_id" value="<%=user.getId()%>">
                        <input type="hidden" name="address_id" value="<%=user.getShipAddress().getId()%>">

                        <div class="form-group col-md-12">
                            <label for="clientLastName">Nom</label>
                            <input type="text" class="form-control" id="clientLastName" name="lastName"
                                   pattern="^([a-zA-ZàéèêâïçÀÉÈÊÏÇ])+([ -][a-zA-ZàéèêâïçÀÉÈÊÏÇ]+)*"
                                   value="<%=user.getLastName()%>" required maxlength="45">
                        </div>

                        <div class="form-group col-md-12">
                            <label for="clientFirstName">Prénom</label>
                            <input type="text" class="form-control" id="clientFirstName" name="firstName"
                                   pattern="^([a-zA-ZàéèêâïçÀÉÈÊÏÇ])+([ -][a-zA-ZàéèêâïçÀÉÈÊÏÇ]+)*"
                                   value="<%=user.getFirstName()%>" required maxlength="45">
                        </div>

                        <div class="form-group col-md-12">
                            <label for="clientEmail">Email</label>
                            <input type="text" class="form-control" id="clientEmail" name="email"
                                   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                   value="<%=user.getEmail()%>" required maxlength="45">
                        </div>

                        <fieldset class="col-md-12">
                            <legend>Adresse</legend>
                            <div class="form-group col-md-4">
                                <label for="addressNo">Numero civique</label>
                                <input type="text" class="form-control" id="addressNo" name="addr_no"
                                       value="<%=user.getShipAddress().getNo()%>" required maxlength="10">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="addressAppt">Appartement</label>
                                <input type="text" class="form-control" id="addressAppt" name="addr_appt"
                                       value="<%=user.getShipAddress().getAppt()%>" maxlength="10">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="addressStreet">Rue</label>
                                <input type="text" class="form-control" id="addressStreet" name="addr_street"
                                       value="<%=user.getShipAddress().getStreet()%>" required maxlength="45">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="addressCity">Ville</label>
                                <input type="text" class="form-control" id="addressCity" name="addr_city"
                                       pattern="^([a-zA-ZàéèêâïçÀÉÈÊÏÇ])+([ -][a-zA-ZàéèêâïçÀÉÈÊÏÇ]+)*"
                                       value="<%=user.getShipAddress().getCity()%>" required maxlength="45">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="addressState">Province</label>
                                <input type="text" class="form-control" id="addressState" name="addr_state"
                                       pattern="^([a-zA-ZàéèêâïçÀÉÈÊÏÇ])+([ -][a-zA-ZàéèêâïçÀÉÈÊÏÇ]+)*"
                                       value="<%=user.getShipAddress().getState()%>" required maxlength="45">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="addressCountry">Pays</label>
                                <input type="text" class="form-control" id="addressCountry" name="addr_country"
                                       pattern="^([a-zA-ZàéèêâïçÀÉÈÊÏÇ])+([ -][a-zA-ZàéèêâïçÀÉÈÊÏÇ]+)*"
                                       value="<%=user.getShipAddress().getCountry()%>" required maxlength="45">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="addressZip">Code Postal</label>
                                <input type="text" class="form-control" id="addressZip" name="addr_zip"
                                       pattern="^(?!.*[DFIOQU])[A-VXY][0-9][A-Z] ?[0-9][A-Z][0-9]$"
                                       value="<%=user.getShipAddress().getZip()%>" required maxlength="45">
                            </div>
                        </fieldset>

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