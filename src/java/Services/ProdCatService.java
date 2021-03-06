/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Productcategory;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Temp
 */
public class ProdCatService {
    
    private static EntityManager em;

    public ProdCatService() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HerbaWeb_RelPU");
        em = emf.createEntityManager();
    }
    
    public List<Productcategory> getAllCategories() {
        Query q = em.createNamedQuery("Productcategory.findAll", Productcategory.class);
        List<Productcategory>prodcats = q.getResultList();
        return prodcats;
    }
    
    public Productcategory getCategoryByName(String name) {
        Query q = em.createNamedQuery("Productcategory.findByProductcategoryname", Productcategory.class);
        q.setParameter("productcategoryname", name);
        
        Productcategory returnCat = (Productcategory)q.getSingleResult();
        return returnCat;
    }
    
}
