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
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="col-md-5">
        <div class="form-area">
            <form role="form" action="contact" method="post">
                <h3 style="margin-bottom: 25px; text-align: center;">Formulaire de contact</h3>
                <div class="form-group">
                    <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom" required>
                </div>
                <div class="form-group">
                    <label for="isActive">Actif</label>
                    <select class="form-control" id="category">
                        // for each category create option
                        <option>Actif</option>
                        <option>Inactif</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="description" name="description"
                           placeholder="Description" required>
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" id="prix" name="prix" placeholder="Prix" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="serial" name="serial" placeholder="Serial" required>
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" id="qty" name="qty" placeholder="qty" required>
                </div>
                <div class="form-group">
                    <label for="isActive">Actif</label>
                    <select class="form-control" id="isActive">
                        <option>Actif</option>
                        <option>Inactif</option>
                    </select>
                </div>
                <button type="submit" id="submit" class="btn btn-default pull-right">Envoyer</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
