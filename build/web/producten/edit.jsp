<%-- 
    Document   : edit
    Created on : Feb 1, 2015, 7:36:38 PM
    Author     : Temp
--%>

<%@page import="BO.Productline"%>
<%@page import="java.util.List"%>
<%@page import="BO.Productcategory"%>
<%@page import="BO.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Product editProduct = (Product) session.getAttribute("editProduct");
    List<Productcategory> alleCategorien = (List<Productcategory>) session.getAttribute("alleCategorien");
    List<Productline> alleLijnen = (List<Productline>) session.getAttribute("alleLines");
    session.setAttribute("editProd", "yes");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit: <%= editProduct.getProductname()%> </title>
    </head>
    <body>
        <%@include file="../navigation.jsp" %>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h1>Editeer <%= editProduct.getProductname()%></h1>
            <br />
            <br />
            <form action="producteditServlet" class="form-horizontal" method="post">
                <div class="form-group">
                   <%-- nog op hidden na debug --%>
                    <input type="text" value="<%= session.getAttribute("editProd") %>">
                    <input type="text" value="<%= editProduct.getId() %>" name="productID">
                </div>
                <div class="form-group">
                    <label for="productNaam">Productnaam:</label>
                    <input type="text" class="form-control" name="productNaam" value="<%= editProduct.getProductname()%>">
                </div>
                <div class="form-group">
                    <label for="productOmschrijving">Productomschrijving:</label>
                    <input type="textarea" class="form-control" name="productOmschrijving" value="<%= editProduct.getProductdescription()%>">
                </div>
                <div class="form-group">
                    <label for="productPrice">Productprijs:</label>
                    <input type="text" class="form-control" name="productPrice" value="<%= editProduct.getProductprice()%>">
                </div>
                <div class="form-group">
                    <label for="productSKU">SKU:</label>
                    <input type="text" class="form-control" name="productSKU" value="<%= editProduct.getSku()%>">
                </div>
                <div class="form-group">
                    <label for="productCategory">Categorie:</label>
                    <select class="form-control" name="productCategory">
                        <% for (Productcategory Pcat : alleCategorien) {%>
                        <option <% if (Pcat.getProductcategoryname().equals(editProduct.getProductcategoryidId().getProductcategoryname())) {%> selected value="<%= Pcat %>" <% }%> > <%=Pcat %></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="productLine">Line:</label>
                    <select class="form-control" name="productLine">
                        <% for (Productline Pline : alleLijnen) {%>
                        <option <% if (Pline.getLinename().equals(editProduct.getProductlineidId().getLinename())) {%> selected value="<%= Pline %>" <% }%> ><%=Pline%></option>
                        <% }%>
                    </select>
                </div>
                <div>
                    <button type="submit" class="btn btn-primary">Edit</button>
                </div>
            </form>



        </div>
        <div class="col-md-2"></div>

    </body>
</html>
