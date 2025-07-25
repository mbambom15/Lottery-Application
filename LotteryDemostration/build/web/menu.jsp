<%-- 
    Document   : menu
    Created on : 22 Jul 2025, 20:02:59
    Author     : nhlak
--%>

<%@page import="za.ac.tut.entities.UsernameTBL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Casino Menu</title>
        <style>
            body {
                background: radial-gradient(ellipse at center, #1c1c1c 0%, #000000 100%);
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #f2f2f2;
                text-align: center;
                padding: 50px;
            }

            h1 {
                color: #facc15;
                text-shadow: 0 0 10px #facc15, 0 0 20px #facc15;
            }

            ul {
                list-style: none;
                padding: 0;
            }

            li {
                margin: 15px 0;
            }

            a {
                text-decoration: none;
                color: #00f0ff;
                font-size: 1.2em;
                transition: color 0.3s;
            }

            a:hover {
                color: #39ff14;
            }

            form {
                margin-top: 40px;
            }

            input[type="submit"] {
                padding: 10px 25px;
                background-color: #dc2626;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 1em;
                cursor: pointer;
                transition: background 0.3s, transform 0.2s;
            }

            input[type="submit"]:hover {
                background-color: #ef4444;
                transform: scale(1.05);
            }
        </style>
    </head>
    <body>
        <%
            UsernameTBL users = (UsernameTBL) session.getAttribute("user");
            String name = users.getUsername();
            Double balance = users.getBalance();
        %>
        <h1>🎲 Welcome <b><%=name%></b>, you have <span style="color:#34d399;">R<%=balance%></span> available</h1>
        <h3>How do you wish to proceed?</h3>
        <ul>
            <li><a href="PlayGame.jsp">▶ Play Game</a></li>
            <li><a href="HistoryServlet">📜 View History of Games</a></li>
            <li><a href="Withdraw.jsp">💸 Withdraw Winnings</a></li>
            <li><a href="Deposit.jsp">🏧Deposit money</a></li>
        </ul>
        <form action="LogoutServlet" method="GET">
            <input type="submit" value="LOG OUT">
        </form>
    </body>
</html>
