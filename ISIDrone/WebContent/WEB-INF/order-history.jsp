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
                        <table class="table table-condensed" style="height: 100px;">
                            <%
                                if (orderList.size() != 0) {
                            %>
                            <thead>
                            <tr>
                                <th class="text-center align-middle">ID</th>
                                <th class="text-center align-middle">Date</th>
                                <th class="text-center align-middle">Nombre d'item</th>
                                <th class="text-center align-middle">Livraison</th>
                                <th class="text-right align-middle">Total</th>
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
                                <td class="align-middle"
                                    style=":hover"><%="<a href='order?no=" + i + "'>" + order.getId() + "</a>"%>
                                </td>
                                <td class="text-center align-middle"><%=order.getDate()%>
                                </td>
                                <td class="text-center align-middle">
                                    <%
                                        int size = 0;
                                        for (ItemCart itemC : order.getCart().values()) {
                                            size += itemC.getQty();
                                        }
                                    %>
                                    <%=size%>
                                </td>
                                <% if (order.getShipped()) {%>
                                <td class="text-center text-success align-middle">Expédié</td>
                                <% } else { %>
                                <td class="text-center text-danger align-middle">En Attente</td>
                                <% } %>
                                <td class="text-right align-middle"><%=df.format(order.generateTotal())%>$</td>


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