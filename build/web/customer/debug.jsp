<%-- 
    Document   : debug
    Created on : Feb 6, 2015, 11:53:05 AM
    Author     : Temp
--%>

<%@page import="BO.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Customer cust = (Customer)session.getAttribute("saveCust"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div><%=cust.getEmail()%></div><br />
        <div><%=cust.getFirstname()%></div><br />
        <div><%=cust.getLastname()%></div><br />
        <div><%=cust.getLengte()%></div><br />
        <div><%=cust.getAddressidId().getStreet() %></div><br />
        <div><%=cust.getAddressidId().getNumber() %></div><br />
        <div><%=cust.getAddressidId().getWoonplaatsidId().getCity() %></div><br />
        <div><%=cust.getAddressidId().getWoonplaatsidId().getPostalcode() %></div><br />
    </body>
</html>
