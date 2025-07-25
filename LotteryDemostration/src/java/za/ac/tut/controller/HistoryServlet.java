package za.ac.tut.controller;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import za.ac.tut.entities.Game;
import za.ac.tut.entities.UsernameTBL;
import za.ac.tut.entities.bl.GameFacadeLocal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="HistoryServlet", urlPatterns={"/history"})
public class HistoryServlet extends HttpServlet {

    @EJB
    private GameFacadeLocal gameFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Check logged‑in user
        HttpSession session = request.getSession(false);
        UsernameTBL user = session == null
                          ? null
                          : (UsernameTBL)session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Fetch all games and filter for this user
        List<Game> all = gameFacade.findAll();
        List<Game> history = new ArrayList<>();
        for (Game g : all) {
            if (g.getPlayer() != null &&
                g.getPlayer().getId().equals(user.getId())) {
                history.add(g);
            }
        }

        // 3. Set on request and forward
        request.setAttribute("history", history);
        request.getRequestDispatcher("history.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}
