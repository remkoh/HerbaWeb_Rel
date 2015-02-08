<%-- 
    Document   : navigation
    Created on : Feb 1, 2015, 6:58:29 PM
    Author     : Temp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="bootstrap-datepicker.js"></script>
<link rel="stylesheet" href="datepicker.css"
<%
    
    //String firstrun = session.getAttribute("firstRun").toString();
    String loggedOn = session.getAttribute("loggedOn").toString();
    BO.User logUser = ((BO.User) session.getAttribute("loggedOnUser"));
%>
<html>
    <div class="navbar  navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"></button>
                    <a href="<% if (loggedOn.equals("1")) {%>homeServlet<% } else { %>#<% } %>"class="navbar-brand">Home</a> 
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <% //if (!firstrun.equals("yes")) {
                                if (loggedOn.equals("1")) {
                        %>
                        <li><a href="productServlet">Overzicht producten</a></li>
                        <li><a href="customerServlet?action=overview">Overzicht klanten</a></li>
                        <li><a href="customerServlet?action=quickweging">Ingave Weging</a></li>

                        <% } else {%>
                        <p class="navbar-text">Please log on</p>
                        <% }
                            //}%>
                    </ul>
                    <% //if (!firstrun.equals("yes")) {
                                if (loggedOn.equals("1")) {
                        %>
                    <div class="navbar-collapse collapse navbar-right">
                        <ul class="nav nabar-nav">
                            <p class="navbar-text navbar-right">Ingelogd als: <%=logUser.getFirstname() %> <%= logUser.getLastname() %> - <a href="logout.jsp">Logout</a></p>
                        </ul>
                    </div>
                    <% }
                            //}%>

                </div>

            </div>
        </div>
</html>
