/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.entities.bl;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.List;
import za.ac.tut.entities.LottoDraw;

/**
 *
 * @author nhlak
 */
@Stateless
public class LottoDrawFacade extends AbstractFacade<LottoDraw> implements LottoDrawFacadeLocal {

    @PersistenceContext(unitName = "LotteryDemoEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LottoDrawFacade() {
        super(LottoDraw.class);
    }

   @Override
    public LottoDraw findLatestDraw() {
        TypedQuery<LottoDraw> q = em.createQuery(
            "SELECT d FROM LottoDraw d ORDER BY d.drawDate DESC", LottoDraw.class);
        q.setMaxResults(1);
        List<LottoDraw> results = q.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
    
}
