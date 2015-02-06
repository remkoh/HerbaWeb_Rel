<%-- 
    Document   : customerdetails
    Created on : Feb 6, 2015, 1:46:21 PM
    Author     : Temp
--%>

<%@page import="java.sql.Date"%>
<%@page import="org.eclipse.persistence.jpa.jpql.parser.DateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BO.Customerdata"%>
<%@page import="java.util.List"%>
<%@page import="BO.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Customer detailCust = (Customer) session.getAttribute("detailCust"); %>
<% List<Customerdata> wegingsdata = detailCust.getCustomerdataList();%>


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
            <div class="text-center"><h2>Wegingen:</h2></div>
            <br />
            <table class="table table-striped">
                <tr>
                    <th>Datum weging</th>
                    <th>Gewicht</th>
                    <th>Water%</th>
                    <th>Vetmassa</th>
                    <th>Spiermassa</th>
                    <th>Buikvet</th>
                    <th>Metab.Leeftijd</th>
                    <th>Ckal in rust</th>
                    <th>BMI</th>
                </tr>
                <% for (Customerdata cdata : wegingsdata) {%>
                <tr>
                    <td><%= cdata.getWeighingdate().toString()%></td>
                    <td><%= cdata.getWeight()%></td>
                    <td><%= cdata.getWaterpercentage()%></td>
                    <td><%= cdata.getFattymass()%></td>
                    <td><%= cdata.getMusclemass()%></td>
                    <td><%= cdata.getVisceralfat()%></td>
                    <td><%= cdata.getMetabolicage()%></td>
                    <td><%= cdata.getCkalrest()%></td>
                    <td><%= cdata.getBmi()%></td>
                </tr>
                <% }%>
            </table>

            <br />

            <div class="container">
                <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#formMeting">Nieuwe meting</button>
                <br />
                <div id="formMeting" class="collapse in">
                    collapse test.
                </div>
                    <form action="customerServlet?action=newWeging" class="form-horizontal" method="post">
                        <div class="form-group">
                            <label for="custdetWeighDate">Wegingsdatum:</label>
                            <input type="date" name="custdetWeighDate">
                        </div>
                        <div class="form-group">
                            <label for="custdetWeight">Gewicht</label>
                            <input type="text" class="form-control" name="custdetWeight" required data-fv-notempty-message="This field is required">
                        </div>
                        <div class="form-group">
                            <label for="custdetWater">Water%</label>
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
                            <label for="custdetMetAge">Meta leeftijd:</label>
                            <input type="text" class="form-control" name="custdetMetAge" required data-fv-notempty-message="This field is required">
                        </div>
                        <div class="form-group">
                            <label for="custdetCkalRest">Ckal in rust:</label>
                            <input type="text" class="form-control" name="custdetCkalRest" required data-fv-notempty-message="This field is required">
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
            </div>
            <div class="col-md-2"></div>
    </body>
</html>
