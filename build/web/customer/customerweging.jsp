<%-- 
    Document   : customerweging
    Created on : Feb 7, 2015, 10:26:44 AM
    Author     : Temp
--%>

<%@page import="Services.CustomerService"%>
<%@page import="java.util.List"%>
<%@page import="BO.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Customer wegingCust = (Customer)session.getAttribute("detailCust");%>
<% String quickweging = session.getAttribute("quickweging").toString(); %>

<!DOCTYPE html>
<html>
    <%-- debug purposes 
    <%= quickweging %>
    <%= wegingCust.getFirstname()%>
    --%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% if (quickweging.equalsIgnoreCase("no")) { %>
        <title>Nieuwe weging voor <%= wegingCust.getFirstname() %></title>
        <% } if (quickweging.equalsIgnoreCase("yes")) { %>
        <title>Nieuwe weging </title>
        <% } %>
    </head>
    <body>
        <%@include file="../navigation.jsp" %>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="text-center"><h2>Nieuwe weging <% if (quickweging.equalsIgnoreCase("no")) { %> voor <%=wegingCust.getFirstname()%>:<% } %></h2></div>
            <% if (quickweging.equalsIgnoreCase("no")) { %>
        <form action="customerServlet?action=newWeging" class="form-horizontal" method="post">
            <input type="hidden" name="customerID" value="<%=wegingCust.getId() %>">
            <% } else { %>
        <form action="customerServlet?action=qWeging"<%--"customer/debug.jsp0--%>" class="form-horizontal" method="post">
            <% } %>
                <div class="form-group">
                    <label for="custdetWeighDate">Wegingsdatum:</label>
                    <input type="date" name="custdetWeighDate" required class="form-control">
                </div>
            <% if (quickweging.equalsIgnoreCase("yes")) { 
                CustomerService cs = new CustomerService();
                List<Customer>customers = (List<Customer>)cs.getAllCustomers();
             %>
                <div class="form-group">
                    <label for="customerQuickID">Klant:</label>
                    <select class="form-control" name="customerQuickID" required>
                        <% for (Customer cust : customers) { %>
                        <option value="<%=cust.getId()%>"><%= cust %></option>
                        <% } %>
                    </select>
                </div>
                <% }%>
                <div class="form-group">
                    <label for="custdetWeight">Gewicht</label>
                    <input type="text" class="form-control" name="custdetWeight" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="custdetWater">Waterpercentage</label>
                    <input type="text" class="form-control" name="custdetWater" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="custdetFatty">Vetmassa</label>
                    <input type="text" class="form-control" name="custdetFatty" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="custdetMuscle">Spiermassa:</label>
                    <input type="text" class="form-control" name="custdetMuscle" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="custdetViscFat">Visceraalvet:</label>
                    <input type="text" class="form-control" name="custdetViscFat" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="custdetMetAge">Metabolische leeftijd:</label>
                    <input type="text" class="form-control" name="custdetMetAge" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="custdetCkalRest">Ckal in rust:</label>
                    <input type="text" class="form-control" name="custdetCkalRest" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="custdetBonemass">Beenmassa:</label>
                    <input type="text" class="form-control" name="custdetBonemass" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="custdetBMI">BMI:</label>
                    <input type="text" class="form-control" name="custdetBMI" required data-fv-notempty-message="This field is required">
                </div>
                <br />
                <div>
                    <br />
                    <button type="submit" class="btn btn-primary">Toevoegen</button>
                </div>
            </form>
        </div>
        <div class="col-md-2"></div>
    </body>
</html>
