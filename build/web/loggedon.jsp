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
    int aantalProducten = Integer.parseInt(session.getAttribute("numberofProducts").toString());
    int aantalKlanten = Integer.parseInt(session.getAttribute("numberofCustomers").toString());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged On</title>
    </head>
    <body>
        <%@include file="navigation.jsp" %>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="text-center"><h1>Hallo, <%= loggedOnUser.getFirstname()%></h1></div>
            <br />
            <br />
            <div class="text-center">
                <h3>Database informatie:</h3>
            </div>
            <br />
            <div>
                Er zijn momenteel <%= aantalProducten %> producten aanwezig in de database. <br />
                Er zijn momenteel <%= aantalKlanten %> klanten aanwezig in de database. <br />
            </div>
        </div>
        <div class="col-md-2"></div>
        <%@include file="footer.jsp" %>
    </body>
</html>
