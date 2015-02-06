/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Domicile;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Temp
 */
public class DomicileService {
    
    private static EntityManager em;

    public DomicileService() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HerbDerpPU");
        em = emf.createEntityManager();
    }
    
    public List<Domicile> getAll() {
        Query q = em.createNamedQuery("Domicile.findAll", Domicile.class);
        List<Domicile> alleDomicilies = q.getResultList();
        return alleDomicilies;
    }
    
    public Domicile getByID(long id) {
        Query q = em.createNamedQuery("Domicile.findById", Domicile.class);
        q.setParameter("id", id);
        Domicile rDom = (Domicile)q.getSingleResult();
        return rDom;
        
                
    }
    
}
