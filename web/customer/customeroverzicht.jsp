<%-- 
    Document   : customeroverzicht
    Created on : Feb 2, 2015, 9:38:50 PM
    Author     : Temp
--%>

<%@page import="BO.Customer"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% List<Customer> customers = (List<Customer>) session.getAttribute("allCustomers");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overzicht van alle klanten</title>
    </head>
    <body>
        <%@include file="../navigation.jsp" %>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="text-center"><h1>Overzicht klanten</h1></div>
            <br />
            <br />
            <table class="table">
                <tr>
                    <th>Voornaam</th>
                    <th>Achternaam</th>
                    <th>Mailadres</th>
                    <th>Woonplaats</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <% for (Customer cust : customers) {%>
                <tr>
                    <td><%= cust.getFirstname()%></td>
                    <td><%= cust.getLastname()%></td>
                    <td><%= cust.getEmail()%></td>
                    <td><%= cust.getAddressidId().getWoonplaatsidId().getCity()%></td>
                    <td><a href="customerServlet?action=details&id=<%=cust.getId()%>"><span class="glyphicon glyphicon-search"></span></a></td>
                    <td><a href="customerServlet?action=delete&id=<%=cust.getId()%>"><span class="glyphicon glyphicon-remove"></span></a></td>
                    <td><a href="customerServlet?action=edit&id=<%=cust.getId()%>"><span class="glyphicon glyphicon-pencil"></span></a></td>

                </tr>
                <% }%>
            </table>
            <br />
            <br />
            <a href="customerServlet?action=create"><button type="button" class="btn btn-primary btn-lg">Nieuwe Klant</button></a>

        </div>
        <br />

        <div class="col-md-2"></div>
        <br />


    </body>
</html>
