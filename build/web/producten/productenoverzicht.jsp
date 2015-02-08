<%-- 
    Document   : productenoverzicht
    Created on : Feb 1, 2015, 6:15:24 PM
    Author     : Temp
--%>

<%@page import="java.util.List"%>
<%@page import="BO.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Product> producten = (List<Product>)session.getAttribute("Producten");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overzicht van alle producten</title>
    </head>
    <body>
        <%@include file="../navigation.jsp" %>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="text-center"><h1>Overzicht producten</h1></div>
            <br />
            <br />
            <table class="table">
                <tr>
                    <th>Naam</th>
                    <th>Omschrijving</th>
                    <th>Prijs</th>
                    <th>SKU</th>
                    <th>Line</th>
                    <th>Category</th>
                    <th></th>
                    <th></th>
                </tr>
                <% for (Product prod : producten) {%>
                <tr>
                    <td><%= prod.getProductname()%></td>
                    <td><%= prod.getProductdescription() %></td>
                    <td><%= prod.getProductprice() %></td>
                    <td><%= prod.getSku() %></td>
                    <td><%= prod.getProductlineidId().getLinename() %></td>
                    <td><%= prod.getProductcategoryidId().getProductcategoryname() %></td>
                    <td><a href="productServlet?ID=<%=prod.getId()%>">Edit</a>
                    <td><a href="productdelServlet?Delete=<%=prod.getId()%>">Delete</a></td>
                </tr>
                <% } %>
            </table>
            <br />
            <a href="productcreateServlet?action=load"><button type="button" class="btn btn-primary btn-lg">Nieuw Product</button></a>
        <div class="col-md-2"></div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
