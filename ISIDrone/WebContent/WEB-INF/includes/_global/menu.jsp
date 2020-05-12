<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="util.Const" %>
<%@ page import="entities.User" %>
<%@ page import="util.PropertyLoader" %>

<%
    //S'il n'y a pas d'utilisateur déjà de connecté
    User user = (User) session.getAttribute("user");

    // get lang attribute
    String lang = "lang_fr";

    if (request.getAttribute("lang") != null) {
        lang = (String) request.getAttribute("lang");
    }

    // load lang properties file
    PropertyLoader langProp = new PropertyLoader(lang);
    System.out.println(langProp.getConfig("INTRODUCTION"));
%>

<!-- Navigation -->
<div class="container">
    <div class="panel panel-default">
        <div class="panel-body">
            <a href="home"><img src="images/isi_drone.png"/></a>
            <div class="navbar-right" style="margin-right:0">
                <ul class="nav navbar-nav">
                    <li>
                        <!-- La recherche n'est pas fini d'être implementé -->
                        <form class="navbar-form" role="search" action="search-items?">
                            <div class="form-group" style="padding-right:0;">
                                <input class="form-control biginput" name="search"
                                       placeholder="<%=langProp.getConfig("RECHERCHER")%>" type="text">
                            </div>
                            <button type="submit" class="btn btn-default"><span
                                    class="glyphicon glyphicon-search"></span></button>
                        </form>
                    </li>
                    <jsp:include page="<%=Const.PATH_CART_DROPDOWN_JSP%>"/>
                </ul>
                <div style="margin-right:0; text-align: right">
                    <a href="home?lang=fr" style="padding-left:10px;">FR</a>
                    <a href="home?lang=en" style="padding-left:10px;">EN</a>
                </div>

            </div>


        </div>
    </div>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span>
                </button>
                <%-- 				<a class="navbar-brand" href="home"><%=Const.COMP_NAME %></a> --%>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="about"><%=langProp.getConfig("A_PROPS")%>
                    </a></li>
                    <li><a href="service"><%=langProp.getConfig("SERVICES")%>
                    </a></li>
                    <li><a href="contact"><%=langProp.getConfig("CONTACT")%>
                    </a></li>
                    <li><a href="items?category=1"><%=langProp.getConfig("BOUTIQUE")%>
                    </a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right" style="margin-right: 0px">
                    <jsp:include page="loginState.jsp"/>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
</div>