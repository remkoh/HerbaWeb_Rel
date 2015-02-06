/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import BO.User;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Temp
 */
public class LoginService {

    private static EntityManager em;

    public LoginService() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("HerbDerpPU");
        em = emf.createEntityManager();
    }

    public User getUserByEmail(String email) {
        if (!email.isEmpty()) {
            Query q = em.createNamedQuery("User.findByEmail", User.class);
            q.setParameter("email", email);
            User rUser = (User)q.getSingleResult();
            return rUser;
        }
        else {
            return null;
        }
    }

}
