/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Address;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Temp
 */
public class AddressService {
    
    private static EntityManager em;
    
    public AddressService() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HerbaWeb_RelPU");
        em = emf.createEntityManager();
    }
    
    public Address getAddByID(long id) {
        Query q = em.createNamedQuery("Address.findById", Address.class);
        q.setParameter("id", id);
        Address foundAdd = (Address)q.getSingleResult();
        return foundAdd;
    }
    
    public boolean saveAdd(Address saveAdd) {
        if (saveAdd.getId() == null) {
            try {
                EntityTransaction transaction = em.getTransaction();
                transaction.begin();
                em.persist(saveAdd);
                transaction.commit();
                return true;
            } catch (Exception e) {
                System.out.println("Error:" + e);
                return false;
            }
        } else {
            try {
                EntityTransaction transaction = em.getTransaction();
                transaction.begin();
                em.merge(saveAdd);
                transaction.commit();
                return true;
            } catch (Exception e) {
                System.out.println("Error: " + e);
                return false;
            }    
        }
    }
    
    public void deleteAdd(long addID) {
        try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();
            Query q = em.createQuery("DELETE FROM Address WHERE a.id = :id");
            q.setParameter("id", addID);
            q.executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
    
}
