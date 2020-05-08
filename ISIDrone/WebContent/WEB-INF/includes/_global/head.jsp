<%@page import="action.ActionStartup" %>
<%@page import="entities.ItemCart" %>
<%@page import="entities.Cart" %>
<%@page import="util.Misc" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> jsp default meta-->
    <title>Drone pour tout le monde</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-homepage.css" rel="stylesheet">
    <link href="css/cart_dropdown.css" rel="stylesheet">
    <link href="css/auto-complete.css" rel="stylesheet">
    <link href="css/listProducts.css" rel="stylesheet">
    <link href="css/suppression.css" rel="stylesheet">

    <link href="css/design.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


    <![endif]-->

    <%
        String pageUrl = request.getRequestURI();
        String fileName = Misc.getFileNameFromUrl(pageUrl);

        switch (fileName) {
            case "invoice": {
                out.println("<link href=\"css/invoice.css\" rel=\"stylesheet\">");
                break;
            }
        }
    %>

</head>
<body>
    <%
	ActionStartup.init(request, response);	
%>
