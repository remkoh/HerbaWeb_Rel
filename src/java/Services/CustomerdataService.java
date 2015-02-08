/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Customer;
import BO.Customerdata;
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
public class CustomerdataService {

    private static EntityManager em;

    public CustomerdataService() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HerbaWeb_RelPU");
        em = emf.createEntityManager();
    }

    public void Delete(long dataID) {

        try {
            EntityTransaction transaction = em.getTransaction();
            transaction.begin();
            Query q = em.createQuery("DELETE From Customerdata cd WHERE cd.id = :id");
            q.setParameter("id", dataID);
            q.executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void saveCustData(Customerdata saveData) {
        if (saveData.getId() == null) {
            try {

                EntityTransaction transaction = em.getTransaction();
                transaction.begin();
                em.persist(saveData);
                transaction.commit();
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else {
            try {

                EntityTransaction transaction = em.getTransaction();
                transaction.begin();
                em.merge(saveData);
                transaction.commit();
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }
    }
    
    public List<Customerdata> getByCustID(Customer cid) {
        Query q = em.createNamedQuery("Customerdata.findByCustId", Customerdata.class);
        q.setParameter("cid", cid);
        List<Customerdata> cdList = q.getResultList();
        return cdList;
    }
}
