<%-- 
    Document   : index
    Created on : Feb 1, 2015, 5:05:38 PM
    Author     : Temp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="bootstrap-datepicker.js"></script>

<% 
    session.setAttribute("loggedOn", 0);
    //session.setAttribute("firstRun", "yes");
    //String firstrun = session.getAttribute("firstRun").toString();
%>
<html>
    <head>
        <title>HerbaWeb</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@include file="navigation.jsp" %>
        <%--
        <div class="navbar  navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">                </button>
                    <a class="navbar-brand" href="index.jsp">Home</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Gelieve in te loggen aub.</a></li>
                    </ul>
                </div>
            </div>
        </div>
        --%>
        <div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="jumbotron text-center"><h2>Welkom op Herbaccountancy.</h2><br /><h3> Gelieve in te loggen aub!</h3></div>
                    
                    <form action="loginServlet" method="post">
                        <input type="text" class="form-control" name="account" placeholder="geef account in"/><br/>
                        <input type="password" class="form-control" name="password" placeholder="vul wachtwoord in"/><br/>
                        <br/>
                        <input type="submit" Value="Inloggen"/>
                    </form>

                </div>
                <div class="col-md-2"></div>
            </div>

        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
