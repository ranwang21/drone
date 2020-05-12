<%@page import="util.Misc" %>
<%@page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<%@ page import="entities.Province" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<%
    @SuppressWarnings("unchecked")
    HashMap<String, String> hm_formParamValue = (HashMap<String, String>) request.getAttribute("hm_formParamValue");
    @SuppressWarnings("unchecked")
    HashMap<String, String> hm_fieldErrorMsg = (HashMap<String, String>) request.getAttribute("hm_fieldErrorMsg");
    ArrayList<Province> provinces = (ArrayList<Province>) request.getAttribute("provinces");
    String error = (String) request.getAttribute("error");
%>
<!-- Page Content -->
<div class="container">
    <%
        if (request.getParameter("fromCart") != null) {
    %>
    <div class="progress-cart">
        <span class="label label-success">Panier</span>
        <span class="label label-success">Sommaire</span>
        <span class="label label-warning">Compte</span>
        <span class="label label-warning">Facture</span>
    </div>
    <%
        }
    %>
    <%
        if (error != null) {
            if (error.equals("accountExisting")) {
    %>
    <div class="alert alert-info">
        Un compte existe déjà pour cette adresse email.
    </div>
    <%
    } else if (error.equals("DBProblem")) {
    %>
    <div class="alert alert-danger">
        Une erreur de connexion c'est produite. Veuillez attendre quelques temps avant de faire une nouvelle tentative.
        Si vous voyez ce message pour la deuxième fois, veuillez contactez l'administrateur du site pour lui informer du
        problème.
    </div>
    <%
            }
        }
    %>

    <form action="signup" method="post" class="panel panel-primary form-horizontal" style="float: unset; margin: auto;">
        <div class="panel-heading">
            <h3 class="panel-title">Enregistrement d'un nouveau compte</h3>
        </div>
        <div class="panel-body">
            <fieldset class="col-sm-6 col-lg-6 col-md-6">
                <legend>Information Utilisateur</legend>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("lastName")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("lastName")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Nom</label>
                        <input type="text" id="lastName" class="form-control" name="lastName"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "lastName", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("firstName")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("firstName")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="firstName" class="col-sm-2 control-label">*Prénom</label>
                        <input type="text" id="firstName" class="form-control" name="firstName"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "firstName", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("email")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("email")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="email" class="col-sm-2 control-label">*Email</label>
                        <input type="email" id="email" class="form-control" name="email" placeholder="Email"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "email", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("confirmEmail")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("confirmEmail")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="confirmEmail" class="col-sm-2 control-label" style="padding-top: 0px;">(Confirmation)<br/>*Email</label>
                        <input type="email" id="confirmEmail" class="form-control" name="confirmEmail"
                               placeholder="Email" value="<%=Misc.getOrDefault(hm_formParamValue, "confirmEmail", "")%>"
                               required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("password")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("password")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="password" class="col-sm-2 control-label">*Mot&nbsp;de&nbsp;passe</label>
                        <input type="password" id="password" class="form-control" name="password" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("confirmPassword")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("confirmPassword")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="confirmPassword" class="col-sm-2 control-label" style="padding-top: 0px;">(Confirmation)<br/>*Mot&nbsp;de&nbsp;passe</label>
                        <input type="password" id="confirmPassword" class="form-control" name="confirmPassword"
                               required/>
                    </div>
                </div>
            </fieldset>
            <fieldset class="col-sm-6 col-lg-6 col-md-6">
                <legend>Adresse de facturation</legend>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("addr_no")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("addr_no")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Numéro&nbsp;civique</label>
                        <input type="text" id="addr_no" class="form-control" name="addr_no"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "addr_no", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("addr_street")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("addr_street")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Rue</label>
                        <input type="text" id="addr_street" class="form-control" name="addr_street"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "addr_street", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("addr_zip")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("addr_zip")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Code&nbsp;postal</label>
                        <input type="text" id="addr_zip" class="form-control" name="addr_zip"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "addr_zip", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("addr_city")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("addr_city")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Ville</label>
                        <input type="text" id="addr_city" class="form-control" name="addr_city"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "addr_city", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("addr_state")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("addr_state")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Province</label>
                        <select id="addr_state" name="addr_state" class="form-control">
                            <% for (Province province : provinces) { %>
                            <option value="<%=province.getId() + province.getName()%>"><%=province.getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("addr_tel")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("addr_tel")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Téléphone</label>
                        <input type="text" id="addr_tel" class="form-control" name="addr_tel"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "addr_tel", "")%>" required/>
                    </div>
                </div>
            </fieldset>
            <fieldset class="col-sm-6 col-lg-6 col-md-6">
                <legend>Adresse de livraison</legend>
                <input type="checkbox" id="liv_box" name="liv_box" value="liv_box" onclick="disableFormLiv()">
                <label for="liv_box">Utiliser la même adresse de facturation</label>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("liv_no")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("liv_no")%>
                </div>
                <%
                    }
                %>
                <br>
                <br>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Numéro&nbsp;civique</label>
                        <input type="text" id="liv_no" class="form-control" name="liv_no"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "liv_no", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("liv_street")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("liv_street")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Rue</label>
                        <input type="text" id="liv_street" class="form-control" name="liv_street"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "liv_street", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("liv_zip")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("liv_zip")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Code&nbsp;postal</label>
                        <input type="text" id="liv_zip" class="form-control" name="liv_zip"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "liv_zip", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("liv_city")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("liv_city")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Ville</label>
                        <input type="text" id="liv_city" class="form-control" name="liv_city"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "liv_city", "")%>" required/>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("liv_state")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("liv_state")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Province</label>
                        <select id="liv_state" name="liv_state" class="form-control">
                            <% for (Province province : provinces) { %>
                            <option value="<%=province.getId()%>"><%=province.getName()%>
                            </option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <%
                    if (hm_fieldErrorMsg != null && hm_fieldErrorMsg.containsKey("liv_tel")) {
                %>
                <div class="alert alert-warning"
                     style="margin-bottom: 0px; white-space: pre-line;"><%=hm_fieldErrorMsg.get("liv_tel")%>
                </div>
                <%
                    }
                %>
                <div class="form-group">
                    <div class="col-sm-10">
                        <label for="lastName" class="col-sm-2 control-label">*Téléphone</label>
                        <input type="text" id="liv_tel" class="form-control" name="liv_tel"
                               value="<%=Misc.getOrDefault(hm_formParamValue, "liv_tel", "")%>" required/>
                    </div>
                </div>
            </fieldset>
            <%
                if (request.getParameter("fromCart") != null) {
            %>
            <input type="hidden" name="fromCart" value="true">
            <%
                }
            %>
            <div class="form-group text-center" style="clear: left; top: 15px; margin-bottom: 15px;">
                <button type="submit" class="btn btn-default">S'enregistrer</button>
            </div>
        </div>
    </form>
</div>
<!-- Footer -->
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>
