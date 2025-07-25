package za.ac.tut.controller;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import za.ac.tut.entities.Game;
import za.ac.tut.entities.LottoDraw;
import za.ac.tut.entities.UsernameTBL;
import za.ac.tut.entities.bl.GameFacadeLocal;
import za.ac.tut.entities.bl.LottoDrawFacadeLocal;
import za.ac.tut.entities.bl.UsernameTBLFacadeLocal;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.*;

@WebServlet(name = "PlayGameServlet", urlPatterns = {"/PlayGameServlet"})
public class PlayGameServlet extends HttpServlet {

    @EJB
    private UsernameTBLFacadeLocal userFacade;

    @EJB
    private GameFacadeLocal gameFacade;

    @EJB
    private LottoDrawFacadeLocal drawFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Session & user check
        HttpSession session = request.getSession(false);
        UsernameTBL user = (UsernameTBL) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Parse & validate bet
        double betAmount;
        try {
            betAmount = Double.parseDouble(request.getParameter("amount"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid amount entered.");
            request.getRequestDispatcher("PlayGame.jsp").forward(request, response);
            return;
        }
        if (betAmount < 100 || betAmount > user.getBalance()) {
            request.setAttribute("error", "Bet must be between R100 and your balance.");
            request.getRequestDispatcher("PlayGame.jsp").forward(request, response);
            return;
        }

        // 3. Collect 6 unique user numbers
        Set<Integer> userNumbers = new LinkedHashSet<>();
        for (int i = 1; i <= 6; i++) {
            try {
                int n = Integer.parseInt(request.getParameter("number" + i));
                if (n < 1 || n > 49 || !userNumbers.add(n)) {
                    throw new NumberFormatException();
                }
            } catch (NumberFormatException ex) {
                request.setAttribute("error", "Enter 6 unique numbers between 1 and 49.");
                request.getRequestDispatcher("PlayGame.jsp").forward(request, response);
                return;
            }
        }

        // 4. **Generate a brand-new draw** every time
        Set<Integer> drawnNumbers = generateRandomLottoNumbers();
        LottoDraw draw = new LottoDraw(
            LocalDateTime.now(),
            new ArrayList<>(drawnNumbers),
            betAmount  // initial pool is just this bet
        );
        drawFacade.create(draw);

        // 5. Compare matches
        int matchCount = 0;
        for (int n : userNumbers) if (drawnNumbers.contains(n)) matchCount++;

        // 6. Determine outcome & winnings
        Game.Result outcome;
        double amountWon = 0;
        if (matchCount == 6) {
            outcome = Game.Result.WIN;
            amountWon = betAmount * 100;
        } else if (matchCount == 3) {
            outcome = Game.Result.PARTIAL;
            amountWon = betAmount * 50;
        } else {
            outcome = Game.Result.LOSS;
        }

        // 7. Update user balance
        double newBalance = user.getBalance() - betAmount + amountWon;
        user.setBalance(newBalance);
        userFacade.edit(user);

        // 8. Persist Game
        Game game = new Game(
            LocalDateTime.now(),
            betAmount,
            new ArrayList<>(userNumbers),
            matchCount,
            amountWon,
            user,
            draw,
            outcome
        );
        gameFacade.create(game);

        // 9. Prepare for JSP
        session.setAttribute("user", user);
        request.setAttribute("game", game);

        // 10. Forward to themed outcome page
        request.getRequestDispatcher("game_result.jsp")
               .forward(request, response);
    }

    private Set<Integer> generateRandomLottoNumbers() {
        Random rnd = new Random();
        Set<Integer> nums = new LinkedHashSet<>();
        while (nums.size() < 6) nums.add(rnd.nextInt(49) + 1);
        return nums;
    }
}
