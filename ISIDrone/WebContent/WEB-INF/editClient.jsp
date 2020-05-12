<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.User" %>
<%@ page import="entities.Province" %>
<%@ page import="java.util.ArrayList" %>
<%
    User user = (User) request.getAttribute("user");
    ArrayList<Province> provinces = (ArrayList<Province>) request.getAttribute("provinces");
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
                  style="margin: auto;">
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
                                <label for="addressPhone">Telephone</label>
                                <input type="number" class="form-control" id="addressPhone" name="addr_tel"
                                       value="<%=user.getShipAddress().getTelephone()%>" maxlength="45">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="addressState">Province</label>
                                <select class="form-control" id="addressState" name="addr_state">
                                    <% for (Province province : provinces) {%>
                                    <option value="<%=province.getId()%>"
                                            <%if (province.getId() == user.getShipAddress().getProvince().getId()) {%>selected<% } %>>
                                        <%=province.getName()%>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="addressZip">Code Postal</label>
                                <input type="text" class="form-control" id="addressZip" name="addr_zip"
                                       pattern="^(?!.*[DFIOQU])[A-VXY][0-9][A-Z] ?[0-9][A-Z][0-9]$"
                                       value="<%=user.getShipAddress().getZip()%>" required maxlength="45">
                            </div>
                        </fieldset>

                        <fieldset class="col-md-12">
                            <legend>Status du compte</legend>
                            <div class="form-group col-md-6">
                                <label for="status">Status du compte</label>
                                <a style="opacity: 0" id="modalDisactivation" data-modal-target="#modal"
                                   href="#"></a>
                                <select class="form-control" id="status" name="status">
                                    <option <%if(user.getStatus().equals("ACTIVATED")){%>selected<%}%>
                                            value="ACTIVATED">ACTIVER
                                    </option>
                                    <option <%if(user.getStatus().equals("DISACTIVATED")){%>selected<%}%>
                                            value="DISACTIVATED" id="statusDesactivated">DESACTIVER
                                    </option>
                                </select>
                            </div>
                            <div class="form-group col-md-6" id="reasonDiv">
                                <label for="reason">Raison de la desactivation</label>
                                <textarea class="form-control" id="reason" name="reason"></textarea>
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
<script>
    const deacivationValue = "DISACTIVATED"
    const status = document.getElementById("status")
    let oldValue
    checkReasonDiv()
    status.addEventListener("focus", function () {
        oldValue = this.value
    })

    status.addEventListener("change", function () {
        const newValue = this.value
        if (newValue === deacivationValue) {
            document.getElementById("modalDisactivation").click()
            status.value = oldValue
        }
        checkReasonDiv()
    })

    function btnConfirmClick() {
        status.value = deacivationValue
        document.getElementById("btnCloseModal").click()
        checkReasonDiv()
    }

    function checkReasonDiv() {
        if (status.value === deacivationValue)
            document.getElementById("reasonDiv").style.display = "block"
        else
            document.getElementById("reasonDiv").style.display = "none"
    }

</script>
<div class="modal-supp" id="modal">
    <div class="modal-header-supp">
        <div class="title-supp">Confirmation</div>
        <button data-close-button class="close-button-supp" id="btnCloseModal">&times;</button>
    </div>
    <div class="modal-body-supp">
        Veuillez confirmer la désactivation du compte
        <div class="confirmer-button">
            <a id="confirm-link">
                <button class="btn btn-danger" onclick="btnConfirmClick()">Confirmer</button>
            </a>
        </div>
    </div>
</div>
<div id="overlay-supp"></div>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>