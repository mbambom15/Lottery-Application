/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.entities.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.entities.UsernameTBL;

/**
 *
 * @author nhlak
 */
@Local
public interface UsernameTBLFacadeLocal {

    void create(UsernameTBL usernameTBL);

    void edit(UsernameTBL usernameTBL);

    void remove(UsernameTBL usernameTBL);

    UsernameTBL find(Object id);

    List<UsernameTBL> findAll();

    List<UsernameTBL> findRange(int[] range);

    int count();
    
}
