<%-- 
    Document   : navigation
    Created on : Feb 1, 2015, 6:58:29 PM
    Author     : Temp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<%
    String firstrun = session.getAttribute("firstRun").toString();
    String loggedOn = session.getAttribute("loggedOn").toString();
%>
<html>
    <div class="navbar  navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"></button>
                    <a class="navbar-brand">Home</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <% if (!firstrun.equals("yes")) {
                                if (loggedOn.equals("1")) {
                        %>
                        <li><a href="productServlet">Overzicht producten</a></li>
                        <li><a href="klantServlet">Overzicht klanten</a></li>
                        <li><a href="weging/weging.jsp">Ingave Weging</a></li>

                        <% } else {%>
                        <div>Please log on</div>
                        <% }
                            }%>
                    </ul>
                    <% if (!firstrun.equals("yes")) {
                                if (loggedOn.equals("1")) {
                        %>
                    <div class="navbar-collapse collapse navbar-right">
                        <ul class="nav nabar-nav">
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                    <% }
                            }%>

                </div>

            </div>
        </div>
</html>
