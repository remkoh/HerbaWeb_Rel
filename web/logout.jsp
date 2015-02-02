<%-- 
    Document   : logout
    Created on : Feb 1, 2015, 5:55:33 PM
    Author     : Temp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.setAttribute("loggedOnUser", null);
            session.setAttribute("loggedOn", 0);
            session.setAttribute("firstRun", "no");
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
        <h1>Bye</h1>
    </body>
</html>
