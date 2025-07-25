<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="za.ac.tut.entities.Game"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Game Outcome</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(to right, #1f1c2c, #928dab);
                color: #333;
                padding: 40px;
            }
            .card {
                background: #fff;
                border-radius: 12px;
                padding: 30px;
                max-width: 600px;
                margin: auto;
                box-shadow: 0 8px 20px rgba(0,0,0,0.2);
                text-align: center;
            }
            h2 {
                color: #4a148c;
                margin-bottom: 20px;
            }
            .info {
                margin: 10px 0;
                font-size: 18px;
            }
            .numbers {
                font-weight: bold;
                color: #0d47a1;
            }
            .success {
                color: #2e7d32;
                font-size: 20px;
                font-weight: bold;
            }
            .fail {
                color: #c62828;
                font-size: 20px;
                font-weight: bold;
            }
            a {
                display: inline-block;
                margin-top: 25px;
                padding: 10px 20px;
                background-color: #6a1b9a;
                color: #fff;
                text-decoration: none;
                border-radius: 8px;
                transition: background-color 0.3s ease;
            }
            a:hover {
                background-color: #4a148c;
            }
        </style>
    </head>
    <body>
        <div class="card">
            <h2>🎲 Game Outcome 🎲</h2>
            <%
                Game game = (Game) request.getAttribute("game");
                List<Integer> numbers = game.getChosenNumbers();
                int matchCount = game.getMatchedNumbers();
                Double winnings = game.getWinnings();
            %>

            <div class="info">🎯 Correct Draw: <span class="numbers"><%= game.getDraw().getDrawNumbers()%></span></div>
            <div class="info">🏁 Outcome: <strong><%= game.getOutcome()%></strong></div>

            <div class="info">🗓️ Played on: <strong><%= game.getPlayedAt()%></strong></div>
            <div class="info">🔢 Your Numbers: <span class="numbers"><%= numbers.toString()%></span></div>
            <div class="info">✅ Numbers Matched: <strong><%= matchCount%></strong></div>

            <div class="info">
                <span class="<%= winnings > 0 ? "success" : "fail"%>">
                    <%= winnings > 0 ? "🎉 You won R" + winnings : "🙁 You didn't win this round"%>
                </span>
            </div>

            <a href="PlayGame.jsp">Play Again</a>
        </div>
    </body>
</html>
