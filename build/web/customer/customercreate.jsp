<%-- 
    Document   : customercreate
    Created on : Feb 5, 2015, 8:56:34 PM
    Author     : Temp
--%>

<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="BO.Domicile"%>


<%
    List<Domicile> domicilies = (List<Domicile>) session.getAttribute("domcilies");
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../navigation.jsp" %>
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h1>Klant creatie:</h1>
        <br />
        <br />
        <div class="form-group">
            <%-- nog op hidden na debug --%>
            <input type="text" class="form-control" name="debugpostcode" value="<%= domicilies.size()%>" readonly="true">
        <%-- nog op hidden na debug --%>
        </div>

        <form action="customerServlet?action=creation" class="form-horizontal" method="post">
            <div class="form-group">
                <label  for="customerFirstname">Voornaam:</label>
                <input type="text" class="form-control" name="customerFirstname" required data-fv-notempty-message="The username is required and cannot be empty">
            </div>
            <div class="form-group">
                <label  for="customerLastname">Achternaam:</label>
                <input type="text" class="form-control" name="customerLastname" required data-fv-notempty-message="This field is required">
            </div>
            <div class="form-group">
                <label  for="customerEmail">Email:</label>
                <input type="text" class="form-control" name="customerEmail" required data-fv-notempty-message="This field is required">
            </div>
            <div class="form-group">
                <label  for="customerHeight">Lengte in CM:</label>
                <input type="text" class="form-control" name="customerHeight" required data-fv-notempty-message="This field is required">
            </div>

    <%-- Adres class vanaf hier --%>
    

        <div class="form-group">
            <label  for="customerAddressStraat">Straat:</label>
            <input type="text" class="form-control" name="customerAddressStraat" required data-fv-notempty-message="This field is required">
        </div>
        <div class="form-group">
            <label  for="customerAddressNummer">Nummer:</label>
            <input type="text" class="form-control" name="customerAddressNummer" required data-fv-notempty-message="This field is required">
        </div>

        <%-- Domcile class vanaf hier --%>
        <div class="form-group">
            <label  for="customerAddressDomcile">Postcode:</label>
            <select id="postalcode" class="form-control" name="customerAddressDomcile">
                <% for (Domicile Dom : domicilies) {%>
                <option value="<%= Dom.getId()%>"><%=Dom.getPostalcode()%> <%=Dom.getCity()%></option>
                <% }%>
            </select>
        </div>
        <%-- einde van domicile class --%>

    <div class="col-md-4">
        <br />
        <button type="submit" class="btn btn-primary">Maak aan!</button>
    </div>
</form>



</div>
<div class="col-md-2"></div>
</html>
