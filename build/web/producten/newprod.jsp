<%-- 
    Document   : newprod
    Created on : Feb 2, 2015, 7:58:50 PM
    Author     : Temp
--%>

<%@page import="BO.Productline"%>
<%@page import="java.util.List"%>
<%@page import="BO.Productcategory"%>
<%@page import="BO.Product"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Product editProduct = (Product) session.getAttribute("editProduct");
    List<Productcategory> alleCategorien = (List<Productcategory>) session.getAttribute("newCategorie");
    List<Productline> alleLijnen = (List<Productline>) session.getAttribute("newLines");
%>
<!DOCTYPE html>
<html>
    <%@include file="../navigation.jsp" %>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h1>Maak een nieuw product.</h1>
            <br />
            <br />
            <form action="productcreateServlet?action=create" class="form-horizontal" method="post">
                <div class="form-group">
                   <%-- nog op hidden na debug --%>
                   Debuginfo<br/>
                    <input type="text" value="<%= session.getAttribute("editProd") %>" readonly>
                    <input type="text" name="productID" readonly>
                    <%-- nog te hiden na debug --%>
                </div>
                <div class="form-group">
                    <label for="productNaam">Productnaam:</label>
                    <input type="text" class="form-control" name="productNaam" required data-fv-notempty-message="The username is required and cannot be empty">
                </div>
                <div class="form-group">
                    <label for="productOmschrijving">Productomschrijving:</label>
                    <input type="textarea" class="form-control" name="productOmschrijving" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="productPrice">Productprijs:</label>
                    <input type="text" class="form-control" name="productPrice" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="productSKU">SKU:</label>
                    <input type="text" class="form-control" name="productSKU" required data-fv-notempty-message="This field is required">
                </div>
                <div class="form-group">
                    <label for="productCategory">Categorie:</label>
                    <select class="form-control" name="productCategory" required data-fv-notempty-message="This field is required">
                        <% for (Productcategory Pcat : alleCategorien) {%>
                        <option> <%=Pcat%> <% }%></option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="productLine">Line:</label>
                    <select class="form-control" name="productLine" required data-fv-notempty-message="This field is required">
                        <% for (Productline Pline : alleLijnen) { %>
                        <option> <%= Pline %> <% } %></option>
                    </select>
                </div>
                <div >
                    <br />
                    <button type="submit" class="btn btn-primary">Maak aan!</button>
                </div>
            </form>



        </div>
        <div class="col-md-2"></div>
</html>
