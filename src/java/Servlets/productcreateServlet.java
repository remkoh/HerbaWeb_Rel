/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import BO.Product;
import BO.Productcategory;
import BO.Productline;
import Services.ProdCatService;
import Services.ProdLineService;
import Services.ProductService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Temp
 */
public class productcreateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
        String action = request.getParameter("action").toString();
        RequestDispatcher dispatcher;
        ProdCatService pcs = new ProdCatService();
        ProdLineService pls = new ProdLineService();
        
        if (action.equals("load")) {         
            List<Productcategory> allCategories = pcs.getAllCategories();
            List<Productline> allLines = pls.GetAllProdLines();
            
            request.getSession().setAttribute("newCategorie", allCategories);
            request.getSession().setAttribute("newLines", allLines);
            
            dispatcher = request.getRequestDispatcher("producten/newprod.jsp");
            dispatcher.forward(request, response);           
        }
        
        if (action.equals("create")) {
            ProductService ps = new ProductService();
            
            Product createProduct = new Product();
            createProduct.setProductname(request.getParameter("productNaam"));
            createProduct.setProductdescription(request.getParameter("productOmschrijving"));
            createProduct.setProductprice(Double.parseDouble(request.getParameter("productPrice")));
            createProduct.setSku(request.getParameter("productSKU"));
            createProduct.setProductcategoryidId((Productcategory)pcs.getCategoryByName(request.getParameter("productCategory")));
            createProduct.setProductlineidId((Productline)pls.GetLineByName(request.getParameter("productLine")));
            
            ps.SaveProd(createProduct);
            
            dispatcher = request.getRequestDispatcher("productServlet");
            dispatcher.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
