<%-- 
    Document   : debug
    Created on : Feb 6, 2015, 11:53:05 AM
    Author     : Temp
--%>

<%@page import="BO.Customerdata"%>
<%@page import="BO.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <% Customer cust = (Customer)session.getAttribute("saveCust"); %> --%>
<%-- String id = request.getParameter("id").toString(); --%>

<% Customerdata cdata = (Customerdata)session.getAttribute("gewogenKlant"); %>

<%-- <% String action = request.getParameter("action").toString(); %> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%--
        <div><%=cust.getEmail()%></div><br />
        <div><%=cust.getFirstname()%></div><br />
        <div><%=cust.getLastname()%></div><br />
        <div><%=cust.getLengte()%></div><br />
        <div><%=cust.getAddressidId().getStreet() %></div><br />
        <div><%=cust.getAddressidId().getNumber() %></div><br />
        <div><%=cust.getAddressidId().getWoonplaatsidId().getCity() %></div><br />
        <div><%=cust.getAddressidId().getWoonplaatsidId().getPostalcode() %></div><br />
        
        <br/><br /> --%>
        <%-- <div> <%= id %> </div> --%>
        <%-- <div <%= action %> --%>
        
        
        Nieuwe wegingingave test 
        <%= cdata.getWeighingdate() %> <br />
        <%= cdata.getBmi() %> <br />
        <%= cdata.getBonemass() %> <br />
        <%= cdata.getCkalrest() %> <br />
        <%= cdata.getCustomerID() %> <br />
        <%= cdata.getFattymass() %> <br />
        <%= cdata.getMetabolicage() %> <br />
        <%= cdata.getMusclemass() %> <br />
        <%= cdata.getVisceralfat() %> <br />
        <%= cdata.getWaterpercentage() %> <br />
        <%= cdata.getWeight() %> <br />
        
        
        <%-- nieuwe quickweging test --%>
        Quickweging test: <br/>
        <%= request.getParameter("custdetWeighDate") %> <br />
        <%= request.getParameter("customerQuickID") %> <br />
        <%= request.getParameter("custdetWeight") %> <br />
        <%= request.getParameter("custdetWater") %> <br />
        <%= request.getParameter("custdetFatty") %> <br />
        <%= request.getParameter("custdetMuscle") %> <br />
        <%= request.getParameter("custdetViscFat") %> <br />
        <%= request.getParameter("custdetMetAge") %> <br />
        <%= request.getParameter("custdetCkalRest") %> <br />
        <%= request.getParameter("custdetBonemass") %> <br />
        <%= request.getParameter("custdetBMI") %> <br />
        
        
    </body>
</html>
