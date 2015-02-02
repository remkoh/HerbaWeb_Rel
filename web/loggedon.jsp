<%-- 
    Document   : loggedon
    Created on : Jan 30, 2015, 10:20:11 PM
    Author     : Temp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<%
    BO.User loggedOnUser = ((BO.User) session.getAttribute("loggedOnUser"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged On</title>
    </head>
    <body>
        <%@include file="navigation.jsp" %>
        <h1>Hallo, <%= loggedOnUser.getFirstname()%></h1><br />
        <div>
            Debugging:<br/>
            Firstrun: <%= firstrun%><br/>
            loggedOn: <%= loggedOn%>
        </div>
    </body>
</html>
