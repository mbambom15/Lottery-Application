<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="za.ac.tut.entities.Game" %>
<%@ page import="za.ac.tut.entities.LottoDraw" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Game History</title>
    <style>
        body {
            background: radial-gradient(circle, #0a0a0a 0%, #1f1f1f 100%);
            color: #e0e0e0;
            font-family: 'Segoe UI', sans-serif;
            padding: 40px;
        }
        h1 {
            color: #facc15;
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: auto;
            background: #1b1b1b;
            box-shadow: 0 0 10px rgba(0,0,0,0.8);
        }
        th, td {
            padding: 12px 8px;
            border-bottom: 1px solid #333;
            text-align: center;
        }
        th {
            background: #272727;
            color: #ffeb3b;
            text-transform: uppercase;
        }
        tr:hover {
            background: #2e2e2e;
        }
        .numbers {
            font-family: monospace;
            color: #81d4fa;
        }
        .WIN {
            color: #66bb6a;
            font-weight: bold;
        }
        .PARTIAL {
            color: #ffa726;
            font-weight: bold;
        }
        .LOSS {
            color: #ef5350;
            font-weight: bold;
        }
        a.back {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 20px;
            background: #424242;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
        }
        a.back:hover {
            background: #616161;
        }
    </style>
</head>
<body>
    <h1>Your Game History</h1>
    <%
        List<Game> history = (List<Game>) request.getAttribute("history");
        if (history == null || history.isEmpty()) {
    %>
        <p style="text-align:center;">You have not played any games yet.</p>
    <%
        } else {
    %>
    <table>
        <tr>
            <th>Draw Date</th>
            <th>Draw Numbers</th>
            <th>Your Numbers</th>
            <th>Matches</th>
            <th>Outcome</th>
            <th>Winnings (R)</th>
        </tr>
        <%
            for (Game g : history) {
                LottoDraw d = g.getDraw();
        %>
        <tr>
            <td><%= d != null ? d.getDrawDate() : "—" %></td>
            <td class="numbers">
                <%= d != null ? d.getDrawNumbers() : "—" %>
            </td>
            <td class="numbers"><%= g.getChosenNumbers() %></td>
            <td><%= g.getMatchedNumbers() %></td>
            <td class="<%= g.getOutcome() %>"><%= g.getOutcome() %></td>
            <td><%= String.format("%.2f", g.getWinnings()) %></td>
        </tr>
        <% } %>
    </table>
    <% } %>

    <div style="text-align:center;">
        <a href="menu.jsp" class="back">← Back to Menu</a>
    </div>
</body>
</html>
