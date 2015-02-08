<%-- 
    Document   : customeredit
    Created on : Feb 7, 2015, 2:13:18 PM
    Author     : Temp
--%>

<%@page import="BO.Domicile"%>
<%@page import="java.util.List"%>
<%@page import="BO.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Domicile> domicilies = (List<Domicile>) session.getAttribute("domcilies");
    Customer editCust = (Customer)session.getAttribute("editCustomer");
%>

<html>
    <%@include file="../navigation.jsp" %>
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h1>Wijzig klant:</h1>
        <br />
        <br />

        <form action="customerServlet?action=edit" class="form-horizontal" method="post">
            <div class ="form-group">
                <input type="hidden" name="Customerid" value="<%=editCust.getId() %>">
            </div>
            <div class="form-group">
                <label  for="customerFirstname">Voornaam:</label>
                <input type="text" class="form-control" name="customerFirstname" required data-fv-notempty-message="The username is required and cannot be empty" value="<%=editCust.getFirstname()%>">
            </div>
            <div class="form-group">
                <label  for="customerLastname">Achternaam:</label>
                <input type="text" class="form-control" name="customerLastname" required data-fv-notempty-message="This field is required" value="<%=editCust.getLastname()%>">
            </div>
            <div class="form-group">
                <label  for="customerEmail">Email:</label>
                <input type="text" class="form-control" name="customerEmail" required data-fv-notempty-message="This field is required" value="<%=editCust.getEmail()%>">
            </div>
            <div class="form-group">
                <label  for="customerHeight">Lengte in CM:</label>
                <input type="text" class="form-control" name="customerHeight" required data-fv-notempty-message="This field is required" value="<%=editCust.getLengte()%>">
            </div>

            <%-- Adres class vanaf hier --%>


            <div class="form-group">
                <label  for="customerAddressStraat">Straat:</label>
                <input type="text" class="form-control" name="customerAddressStraat" required data-fv-notempty-message="This field is required" value="<%= editCust.getAddressidId().getStreet()%>">
            </div>
            <div class="form-group">
                <label  for="customerAddressNummer">Nummer:</label>
                <input type="text" class="form-control" name="customerAddressNummer" required data-fv-notempty-message="This field is required" value="<%=editCust.getAddressidId().getNumber()%>">
            </div>

            <%-- Domcile class vanaf hier --%>
            <div class="form-group">
                <label  for="customerAddressDomcile">Postcode:</label>
                <select id="postalcode" class="form-control" name="customerAddressDomcile">
                    <% for (Domicile Dom : domicilies) {%>
                    <option value="<%= Dom.getId()%>"   <% if (editCust.getAddressidId().getWoonplaatsidId().getId().equals(Dom.getId()) ) { %> selected value="<%=Dom%>"<% } %> ><%=Dom.getPostalcode()%> <%=Dom.getCity() %></option>
                    <% }%>
                </select>
            </div>
            <%-- einde van domicile class --%>

            <div class="col-md-4">
                <br />
                <button type="submit" class="btn btn-primary">Wijzig Klant!</button>
            </div>
        </form>



    </div>
    <div class="col-md-2"></div>
    <%@include file="../footer.jsp" %>
</html>
