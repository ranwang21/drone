<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="util.Const" %>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<!-- /.container -->
<!-- Page Content -->
<div class="container">
    <!-- Introduction Row -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">À propos de nous</h1>
            <p>ISI Drone se spécialise dans la vente de drone et d'accessoire
                de drone.</p>
        </div>
    </div>

    <!-- Team Members Row -->
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">Notre équipe</h2>
        </div>
        <div class="col-lg-3 col-sm-3 text-center">
            <img class="img-circle img-responsive img-center"
                 src="images/about/David.jpg" alt="Photo de David"
                 style="max-width: 250px; max-height: 250px; min-width: 250px;">
            <h3>
                David Pelletier
            </h3>
            <h3><small>Webmestre</small></h3>
        </div>
        <div class="col-lg-3 col-sm-3 text-center">
            <img class="img-circle img-responsive img-center"
                 src="images/about/Laurent.jpg" alt="Photo de Laurent"
                 style="max-width: 250px; max-height: 250px; min-width: 250px;">
            <h3>
                Laurent Beauregard
            </h3>
            <h3><small>Webmestre</small></h3>
        </div>

        <div class="col-lg-3 col-sm-3 text-center">
            <img class="img-circle img-responsive img-center"
                 src="images/about/yannick.png" alt="Photo yannick "
                 style="max-width: 250px; max-height: 250px; min-width: 250px;">
            <h3>
                Yannick Djemani
            </h3>
            <h3><small>Webmestre</small></h3>
        </div>

        <div class="col-lg-3 col-sm-3 text-center">
            <img class="img-circle img-responsive img-center"
                 src="images/about/ran.png" alt="Photo marco "
                 style="max-width: 250px; max-height: 250px; min-width: 250px;">
            <h3>
                Ran wang
            </h3>
            <h3><small>Webmestre</small></h3>
        </div>

    </div>
    <div class="row">

        <div class="col-lg-3 col-sm-3 text-center">
            <img class="img-circle img-responsive img-center"
                 src="images/about/derrick.jpeg" alt="Photo  de derrick "
                 style="max-width: 250px; max-height: 250px; min-width: 250px;">
            <h3>
                Derrick Thoihoun
            </h3>
            <h3><small>Webmestre</small></h3>
        </div>

        <div class="col-lg-3 col-sm-3 text-center">
            <img class="img-circle img-responsive img-center"
                 src="images/about/fred.jpg" alt="Photo  fred "
                 style="max-width: 250px; max-height: 250px; min-width: 250px;">
            <h3>
                Fred Gaudreau
            </h3>
            <h3><small>Webmestre</small></h3>
        </div>

        <div class="col-lg-3 col-sm-3 text-center">
            <img class="img-circle img-responsive img-center"
                 src="images/about/marco.jpg" alt="Photo marco "
                 style="max-width: 250px; max-height: 250px; min-width: 250px;">
            <h3>
                Marco Orellana
            </h3>
            <h3><small>Webmestre</small></h3>
        </div>

    </div>

    <hr>
</div>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>