/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.Customerdata;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

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
}
