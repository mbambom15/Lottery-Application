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
public class WithdrawServlet extends HttpServlet {
    @EJB 
    UsernameTBLFacadeLocal userfacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Double withdraw = Double.parseDouble(request.getParameter("amount"));
        String message = "";
        HttpSession session = request.getSession(false);
        UsernameTBL user = (UsernameTBL) session.getAttribute("user");
        Double balance = user.getBalance();
        if(withdraw < 0 || withdraw > balance){
            message = "Amount invalid or excedding balance";
            RequestDispatcher disp = request.getRequestDispatcher("Withdraw.jsp");
            request.setAttribute("message", message);
            disp.forward(request, response);
        }else{
            Double newBalance = balance - withdraw;
            user.setBalance(newBalance);
            userfacade.edit(user);
            RequestDispatcher disp = request.getRequestDispatcher("withdraw_out.jsp");
            session.setAttribute("user", user);
            disp.forward(request, response);
        }
    }

}
