package za.ac.tut.controller;

import jakarta.ejb.EJB;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import za.ac.tut.entities.Game;
import za.ac.tut.entities.UsernameTBL;
import za.ac.tut.entities.bl.UsernameTBLFacadeLocal;

public class SignUpServlet extends HttpServlet {
    @EJB
    UsernameTBLFacadeLocal userFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("pswd");
        String id = request.getParameter("sa_id");

        // Validate ID format
        if (id == null || id.length() != 13 || !id.matches("\\d{13}")) {
            request.setAttribute("message", "Invalid SA ID format. Must be 13 numeric digits.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Check Luhn algorithm
        if (!isValidLuhn(id)) {
            request.setAttribute("message", "Invalid SA ID. Failed Luhn check.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        // Check age
        int age = getAgeFromID(id);
        if (age < 18) {
            request.setAttribute("message", "You must be at least 18 years old to sign up.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        List<Game> games = new ArrayList<>();

        // If all checks pass, redirect to login.jsp
        userFacade.create(new UsernameTBL(email, username, password, id, 1000.00, games));
        response.sendRedirect("login.jsp");
    }

    private boolean isValidLuhn(String id) {
        int sum = 0;
        boolean alternate = false;

        for (int i = id.length() - 1; i >= 0; i--) {
            int n = Integer.parseInt(id.substring(i, i + 1));
            if (alternate) {
                n *= 2;
                if (n > 9) {
                    n = (n % 10) + 1;
                }
            }
            sum += n;
            alternate = !alternate;
        }

        return (sum % 10 == 0);
    }

    private int getAgeFromID(String id) {
        String birthDatePart = id.substring(0, 6);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
        LocalDate birthDate;

        try {
            birthDate = LocalDate.parse(birthDatePart, formatter);

            // Adjust century (assumes anyone younger than 100 is valid)
            if (birthDate.isAfter(LocalDate.now())) {
                birthDate = birthDate.minusYears(100);
            }

            int age = LocalDate.now().getYear() - birthDate.getYear();
            return age;
        } catch (Exception e) {
            return -1; // Invalid birth date format
        }
    }
}
