<%@page import="util.Const" %>
<%@ page import="util.PropertyLoader" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<%
    // get lang attribute
    String lang = "lang_fr";

    if (request.getAttribute("lang") != null) {
        lang = (String) request.getAttribute("lang");
    }

    // load lang properties file
    PropertyLoader langProp = new PropertyLoader(lang);
    System.out.println(langProp.getConfig("INTRODUCTION"));

%>

<div class="container">
    <h1><%=langProp.getConfig("SERVICE_DE_REPARATION")%>
    </h1>
    <div class="row">
        <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="well">
                <h2 class="muted"><%=langProp.getConfig("ARGENT")%>
                </h2>
                <p><span class="label label-default"><%=langProp.getConfig("POPULAIRE")%></span></p>
                <ul>
                    <li><%=langProp.getConfig("PROBLEM_AU_DEMARRAGE")%>
                    </li>
                    <li><%=langProp.getConfig("PROBLEM_DE_ANTENNE")%>
                    </li>
                    <li><%=langProp.getConfig("DEPOUSSIERAGE")%>
                    </li>
                    <li><%=langProp.getConfig("SUPPORT_EMAIL")%>
                    </li>
                </ul>
                <p><%=langProp.getConfig("DESCRIPTION_SILVER")%>
                </p>
                <hr>
                <h3><%=langProp.getConfig("SILVER_PRIX")%>
                </h3>
                <hr>
                <p><a class="btn btn-primary" href="#"><i
                        class="icon-ok"></i> <%=langProp.getConfig("SELECTIONNER_PLAN")%>
                </a></p>
            </div>
        </div>
        <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="well">
                <h2 class="text-warning"><%=langProp.getConfig("BRONZE")%>
                </h2>
                <p><span class="label label-success"><%=langProp.getConfig("POPULAIRE")%></span></p>
                <ul>
                    <li><%=langProp.getConfig("PROBLEM_AU_DEMARRAGE")%>
                    </li>
                    <li><%=langProp.getConfig("PROBLEM_DE_ANTENNE")%>
                    </li>
                    <li><%=langProp.getConfig("DEPOUSSIERAGE")%>
                    </li>
                    <li style="visibility: hidden;"></li>
                </ul>
                <p><%=langProp.getConfig("DESCRIPTION_BRONZE")%>
                </p>
                <hr>
                <h3><%=langProp.getConfig("BRONZE_PRIX")%>
                </h3>
                <hr>
                <p><a class="btn btn-success btn-large" href="#"><i
                        class="icon-ok"></i> <%=langProp.getConfig("SELECTIONNER_PLAN")%>
                </a></p>
            </div>
        </div>
        <div class="col-sm-4 col-lg-4 col-md-4">
            <div class="well">
                <h2 class="text-info"><%=langProp.getConfig("ECONOMIE")%>
                </h2>
                <p><span class="label label-info"><%=langProp.getConfig("BUDGET")%></span></p>
                <ul>
                    <li><%=langProp.getConfig("PROBLEM_AU_DEMARRAGE")%>
                    </li>
                    <li><%=langProp.getConfig("PROBLEM_DE_ANTENNE")%>
                    </li>
                    <li style="visibility: hidden;"></li>
                    <li style="visibility: hidden;"></li>
                </ul>
                <p><%=langProp.getConfig("DESCRIPTION_BRONZE")%>
                </p>
                <hr>
                <h3><%=langProp.getConfig("PRIX_ECONOMIE")%>
                </h3>
                <hr>
                <p><a class="btn btn-primary" href="#"><i
                        class="icon-ok"></i> <%=langProp.getConfig("SELECTIONNER_PLAN")%>
                </a></p>
            </div>
        </div>
    </div>
</div>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>