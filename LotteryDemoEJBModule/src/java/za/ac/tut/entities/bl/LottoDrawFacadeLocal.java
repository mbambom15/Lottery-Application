/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.entities.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.entities.LottoDraw;

/**
 *
 * @author nhlak
 */
@Local
public interface LottoDrawFacadeLocal {

    void create(LottoDraw lottoDraw);

    void edit(LottoDraw lottoDraw);

    void remove(LottoDraw lottoDraw);

    LottoDraw find(Object id);

    List<LottoDraw> findAll();

    List<LottoDraw> findRange(int[] range);
    
    LottoDraw findLatestDraw();

    int count();
    
}
