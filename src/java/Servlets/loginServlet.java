/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Services.CustomerService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Services.LoginService;
import Services.ProductService;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Temp
 */
public class loginServlet extends HttpServlet {

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

        LoginService ls = new LoginService();
        BO.User matchUser = ls.getUserByEmail(request.getParameter("account"));
        RequestDispatcher dispatcher;
        if (matchUser != null) {
            String tomatchPwd = matchUser.getPassword();
            String enteredPwd = request.getParameter("password");
            if (tomatchPwd.equals(enteredPwd)) {
                request.getSession().setAttribute("loggedOnUser", matchUser);
                request.getSession().setAttribute("loggedOn", 1);
                request.getSession().setAttribute("firstRun", "no");
                
                CustomerService cs = new CustomerService();
                ProductService ps = new ProductService();
                
                int aantalProducten = ps.GetAllProducts().size();
                int aantalKlanten = cs.getAllCustomers().size();
                
                request.getSession().setAttribute("numberofProducts", aantalProducten);
                request.getSession().setAttribute("numberofCustomers", aantalKlanten);
                
                
                dispatcher = request.getRequestDispatcher("loggedon.jsp");
                dispatcher.forward(request, response);
            } else {
                dispatcher = request.getRequestDispatcher("badlogin.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            dispatcher = request.getRequestDispatcher("badlogin.jsp");
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
