/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets.Customer;

import BO.Customer;
import BO.Domicile;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Services.CustomerService;
import Services.DomicileService;
import java.util.List;
import BO.Address;
import Services.AddressService;
import org.jboss.weld.servlet.SessionHolder;

/**
 *
 * @author Temp
 */
public class customerServlet extends HttpServlet {

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
        CustomerService cs = new CustomerService();

        if (action.equals("overview")) {
            List<Customer> allCustomers = cs.getAllCustomers();
            request.getSession().setAttribute("allCustomers", allCustomers);

            dispatcher = request.getRequestDispatcher("customer/customeroverzicht.jsp");
            dispatcher.forward(request, response);

        }

        if (action.equals("create")) {
            DomicileService ds = new DomicileService();

            List<Domicile> domicilies = ds.getAll();
            request.getSession().setAttribute("domcilies", domicilies);

            dispatcher = request.getRequestDispatcher("customer/customercreate.jsp");
            dispatcher.forward(request, response);
        }
        
        if (action.equals("creation")) {
            DomicileService ds = new DomicileService();
            AddressService as = new AddressService();
            
            Customer cust = new Customer();
            Address custAdd = new Address();
            Long domID = Long.parseLong(request.getParameter("customerAddressDomcile"));
            Domicile custDom = ds.getByID(domID);
            int custLengte = Integer.parseInt(request.getParameter("customerHeight"));
            
            custAdd.setStreet(request.getParameter("customerAddressStraat"));
            custAdd.setNumber(request.getParameter("customerAddressNummer"));
            custAdd.setWoonplaatsidId(custDom);
            
            cust.setFirstname(request.getParameter("customerFirstname"));
            cust.setLastname(request.getParameter("customerLastname"));
            cust.setEmail(request.getParameter("customerEmail"));
            cust.setLengte(custLengte);
            cust.setAddressidId(custAdd);
            boolean addSaveOK = as.saveAdd(custAdd);
            if (addSaveOK == true) {
                cs.saveCust(cust);
            }
            
//            request.getSession().setAttribute("saveCust", cust);
//            
//            dispatcher = request.getRequestDispatcher("customer/debug.jsp");
//            dispatcher.forward(request, response);
            
            dispatcher = request.getRequestDispatcher("customerServlet?action=overview");
            dispatcher.forward(request, response);
            
        }
        if (action.equals("details")) { 
            Long custID = Long.parseLong(request.getParameter("id"));
            Customer detailCust = cs.getByID(custID);
            
            request.getSession().setAttribute("detailCust", detailCust);
            
            dispatcher = request.getRequestDispatcher("customer/customerdetails.jsp");
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
