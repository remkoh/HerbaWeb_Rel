<%-- 
    Document   : customerdetails
    Created on : Feb 6, 2015, 1:46:21 PM
    Author     : Temp
--%>

<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.sql.Date"%>
<%@page import="org.eclipse.persistence.jpa.jpql.parser.DateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BO.Customerdata"%>
<%@page import="java.util.List"%>
<%@page import="BO.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Customer detailCust = (Customer) session.getAttribute("detailCust"); %>
<% List<Customerdata> wegingsdata = (List<Customerdata>) session.getAttribute("cdList");%>
<% Collections.sort(wegingsdata); %>
<% SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-YYYY"); %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Klantendetails</title>
    </head>
    <body>
        <%@include file="../navigation.jsp" %>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="text-center"><h1>Klantendetails:</h1></div>
            <br/>
            <br/>
            <table class="table">
                <tr>
                    <th>Voornaam</th>
                    <th>Achternaam</th>
                    <th>Mailadres</th>
                    <th>Woonplaats</th>
                    <th>Straat + nummer</th>
                    <th>Lengte</th>
                </tr>
                <tr>
                    <td><%= detailCust.getFirstname()%></td>
                    <td><%= detailCust.getLastname()%></td>
                    <td><%= detailCust.getEmail()%></td>
                    <td><%= detailCust.getAddressidId().getWoonplaatsidId().getCity()%></td>
                    <td><%= detailCust.getAddressidId().getStreet()%> <%= detailCust.getAddressidId().getNumber()%></td>
                    <td><%= detailCust.getLengte()%></td>
                </tr>
            </table>
            <% if (!wegingsdata.isEmpty()) { %>
            <div class="text-center"><h2>Wegingen:</h2></div>
            <br />
            <table class="table table-striped">
                <tr>
                    <th></th>
                    <th>Datum weging</th>
                    <th>Gewicht</th>
                    <th>Waterpercentage</th>
                    <th>Vetmassa</th>
                    <th>Spiermassa</th>
                    <th>Buikvet</th>
                    <th>MetabolischeLeeftijd</th>
                    <th>Ckal in rust</th>
                    <th>BMI</th>
                </tr>
                
                <% for (Customerdata cdata : wegingsdata) {%>
                <tr>
                    <td><a href="wegingServlet?action=deleteWeging&wID=<%=cdata.getId()%>"><span class="glyphicon glyphicon-remove"/></a></td>
                    <td><%= sdf.format(cdata.getWeighingdate()) %></td>
                    <td><%= cdata.getWeight()%></td>
                    <td><%= cdata.getWaterpercentage()%></td>
                    <td><%= cdata.getFattymass()%></td>
                    <td><%= cdata.getMusclemass()%></td>
                    <td><%= cdata.getVisceralfat()%></td>
                    <td><%= cdata.getMetabolicage()%></td>
                    <td><%= cdata.getCkalrest()%></td>
                    <td><%= cdata.getBmi()%></td>
                </tr>
                <% }}%>
            </table>

            <br />

            <div class="container">
                <a href="customerServlet?action=newweging"><button type="button" class="btn btn-info">Nieuwe meting</button></a>
                <br />
            </div>
            
        </div>

        <div class="col-md-2"></div>
        <%@include file="../footer.jsp" %>
    </body>
</html>
