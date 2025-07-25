<%-- 
    Document   : Withdraw
    Created on : 25 Jul 2025, 13:23:47
    Author     : nhlak
--%>
<%@page import="za.ac.tut.entities.UsernameTBL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Withdraw Winnings</title>
    <style>
        body {
            background: radial-gradient(circle at top left, #1c1c1c 0%, #000000 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #e0e0e0;
            margin: 0;
            padding: 40px;
            text-align: center;
        }
        h1 {
            color: #facc15;
            text-shadow: 0 0 8px #facc15, 0 0 16px #facc15;
            margin-bottom: 10px;
        }
        h3 {
            color: #bbb;
            margin-bottom: 30px;
        }
        .card {
            background: #1f1f1f;
            border-radius: 12px;
            padding: 30px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.6);
        }
        label {
            display: block;
            font-size: 1.1em;
            margin-bottom: 8px;
            text-align: left;
            color: #ccc;
        }
        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: none;
            border-radius: 6px;
            font-size: 1em;
        }
        .btn {
            display: inline-block;
            padding: 12px 30px;
            margin: 10px 5px;
            font-size: 1em;
            text-decoration: none;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }
        .btn-withdraw {
            background: #10b981;
            text-shadow: 0 0 8px rgba(16,185,129,0.7);
        }
        .btn-withdraw:hover {
            background: #059669;
            transform: scale(1.05);
        }
        .btn-back {
            background: #424242;
        }
        .btn-back:hover {
            background: #616161;
        }
        .error {
            color: #ef4444;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>💸 Withdraw Winnings</h1>
        <h3>Enter the amount you wish to withdraw</h3>
        <%
            UsernameTBL user = (UsernameTBL) session.getAttribute("user");
            Double balance = user.getBalance();
        %>
        <h4>Balance Available :R<%=balance%></h4>
        <form action="WithdrawServlet" method="POST">
            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
                <div class="error"><%= message %></div>
            <%
                }
            %>
            <label for="amount">Amount (R):</label>
            <input type="number"
                   id="amount"
                   name="amount"
                   min="1"
                   step="0.01"
                   placeholder="e.g. R500.00"
                   required />
            <button type="submit" class="btn btn-withdraw">Withdraw</button>
            <button type="button"
                    class="btn btn-back"
                    onclick="location.href='menu.jsp'">
                Back to Menu
            </button>
        </form>
    </div>
</body>
</html>
