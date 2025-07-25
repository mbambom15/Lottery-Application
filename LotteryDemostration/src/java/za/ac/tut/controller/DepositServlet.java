/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.controller;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import za.ac.tut.entities.UsernameTBL;
import za.ac.tut.entities.bl.UsernameTBLFacadeLocal;

/**
 *
 * @author nhlak
 */
public class DepositServlet extends HttpServlet {
    
    @EJB
    UsernameTBLFacadeLocal userFacade;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Double newBalance = Double.parseDouble(request.getParameter("deposit"));
        HttpSession session = request.getSession(false);
        String message = "";
        if (newBalance < 0) {
            message = "Enter valid amount";
            
            RequestDispatcher disp = request.getRequestDispatcher("Deposit.jsp");
            request.setAttribute("message", message);
            disp.forward(request, response);
        } else if (newBalance > 5000) {
            message = "Balance should be less than R5000!!";
            RequestDispatcher disp = request.getRequestDispatcher("Deposit.jsp");
            request.setAttribute("message", message);
            disp.forward(request, response);
        } else {
            UsernameTBL user = (UsernameTBL) session.getAttribute("user");
            Double currentBal = user.getBalance();
            Double totalBal = currentBal + newBalance;
            user.setBalance(totalBal);
            userFacade.edit(user);
            RequestDispatcher disp = request.getRequestDispatcher("deposit_out.jsp");
            disp.forward(request, response);
        }
        
    }
    
}
