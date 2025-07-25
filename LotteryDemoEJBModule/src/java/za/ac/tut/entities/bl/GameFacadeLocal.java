/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.entities.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.entities.Game;

/**
 *
 * @author nhlak
 */
@Local
public interface GameFacadeLocal {

    void create(Game game);

    void edit(Game game);

    void remove(Game game);

    Game find(Object id);

    List<Game> findAll();

    List<Game> findRange(int[] range);

    int count();
    
}
