/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Customer;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Temp
 */
public class CustomerService {
    
    private static EntityManager em;
    
    public CustomerService() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HerbaWeb_RelPU");
        em = emf.createEntityManager();
    }
    
    public List<Customer> getAllCustomers() {
        Query q = em.createNamedQuery("Customer.findAll", Customer.class);
        List<Customer> customers = q.getResultList();
        return customers;
    }
    
    public Customer getByID(long id) {
        Query q = em.createNamedQuery("Customer.findById", Customer.class);
        q.setParameter("id", id);
        Customer foundCust = (Customer)q.getSingleResult();
        return foundCust; 
    }
    
    public void saveCust(Customer saveCust) {
        if (saveCust.getId() == null) {
            try {
                EntityTransaction transaction = em.getTransaction();
                transaction.begin();
                em.persist(saveCust);
                transaction.commit();
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else {
            try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();
            em.merge(saveCust);
            transaction.commit();
        } catch (Exception e) {
                System.out.println("Error: " + e);
        }
    }
    }
    
    public void deleteCust(long custID) {
        try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();
            Query q = em.createQuery("DELETE From Customer c WHERE c.id = :id");
            q.setParameter("id", custID);
            q.executeUpdate();
            transaction.commit();
            
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
    
}
