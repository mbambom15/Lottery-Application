package za.ac.tut.controller;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import za.ac.tut.entities.UsernameTBL;
import za.ac.tut.entities.bl.UsernameTBLFacadeLocal;

import java.io.IOException;
import java.util.List;

public class ForgotPasswordServlet extends HttpServlet {

    @EJB
    private UsernameTBLFacadeLocal usernameF;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("pswd");

        List<UsernameTBL> users = usernameF.findAll();
        boolean found = false;

        for (UsernameTBL user : users) {
            if (user.getEmail().equalsIgnoreCase(email)) {
                user.setPassword(newPassword);
                usernameF.edit(user);
                found = true;
                break;
            }
        }

        if (found) {
            request.setAttribute("message", "Password reset successful!");
            request.setAttribute("msgType", "success");
            RequestDispatcher disp = request.getRequestDispatcher("login.jsp");
        disp.forward(request, response);
        } else {
            request.setAttribute("message", "Email not found. Please try again.");
            request.setAttribute("msgType", "error");
            RequestDispatcher disp = request.getRequestDispatcher("forgotpassword.jsp");
            disp.forward(request, response);
        }

    }
}
