/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Productline;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Temp
 */
public class ProdLineService {
    
    private static EntityManager em;

    public ProdLineService() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HerbaWeb_RelPU");
        em = emf.createEntityManager();
    }
    
    public List<Productline> GetAllProdLines() {
        Query q = em.createNamedQuery("Productline.findAll", Productline.class);
        List<Productline>returnLines = q.getResultList();
        return returnLines;
    }
    
    public Productline GetLineByName(String name) {
        Query q = em.createNamedQuery("Productline.findByLinename", Productline.class);
        q.setParameter("linename", name);
        Productline returnLine = (Productline)q.getSingleResult();
        return returnLine;
    }
    
}
