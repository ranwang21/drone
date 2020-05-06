<%@page import="java.text.DecimalFormat" %>
<%@page import="entities.ItemCart" %>
<%@page import="entities.Order" %>
<%@page import="java.util.List" %>
<%@page import="util.Const" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    //Format a deux decimal
    DecimalFormat df = new DecimalFormat("####0.00");

    // Recupere la liste de commande
    @SuppressWarnings("unchecked")
    List<Order> orderList = (List<Order>) session.getAttribute("orderList");
%>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Historique des commandes</strong></h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <%
                                if (orderList.size() != 0) {
                            %>
                            <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Date</th>
                                <th class="text-center">Nombre d'item</th>
                                <th class="text-center">Livraison</th>
                                <th class="text-right">Total</th>
                                <th class="text-center"></th>
                            </tr>
                            </thead>
                            <%
                            } else {
                            %>
                            <span>Aucune commande</span>
                            <%
                                }
                            %>
                            <%
                                int i = 0;
                                for (Order order : orderList) {
                                    i++;
                            %>
                            <tbody>
                            <tr>
                                <td style=":hover"><%="<a href='order?no=" + i + "'>" + order.getId() + "</a>"%>
                                </td>
                                <td class="text-center"><%=order.getDate()%>
                                </td>
                                <td class="text-center">
                                    <%
                                        int size = 0;
                                        for (ItemCart itemC : order.getCart().values()) {
                                            size += itemC.getQty();
                                        }
                                    %>
                                    <%=size%>
                                </td>
                                <%--                                <% if (order.getShipped()) {%>--%>
                                <%--                                <td class="text-center text-success">Expédié</td>--%>
                                <%--                                <% } else { %>--%>
                                <%--                                <td class="text-center text-danger">En attente</td>--%>
                                <%--                                <% } %>--%>
                                <%--                                <td class="text-right"><%=df.format(order.generateTotal())%>$</td>--%>
                                <%--                                <% if (order.getShipped()) {%>--%>
                                <%--                                <td class="text-center">--%>
                                <%--                                    <button type="button" class="btn btn-danger">Supprimer</button>--%>
                                <%--                                </td>--%>
                                <%--                                <% } else { %>--%>
                                <%--                                <td class="text-center">--%>
                            </tr>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Footer -->
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>