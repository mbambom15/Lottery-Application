<%@page import="za.ac.tut.entities.UsernameTBL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UsernameTBL user = (UsernameTBL) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String name = user.getUsername();
    Double balance = user.getBalance();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Play Game</title>
        <style>
            body {
                background-color: #0d0d0d;
                color: #f2f2f2;
                font-family: 'Segoe UI', sans-serif;
                text-align: center;
                padding: 30px;
            }

            h1 {
                color: #facc15;
            }

            form {
                margin-top: 30px;
                background-color: #1f1f1f;
                padding: 20px;
                border-radius: 12px;
                display: inline-block;
            }

            input[type="number"] {
                width: 50px;
                padding: 8px;
                margin: 5px;
                border-radius: 6px;
                border: 1px solid #ccc;
            }

            input[type="submit"] {
                margin-top: 20px;
                padding: 10px 25px;
                background-color: #10b981;
                border: none;
                border-radius: 8px;
                color: white;
                font-size: 1em;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #059669;
            }

            .error {
                color: #ef4444;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <h1>🎰 Welcome <%=name%>, your balance is R<%=balance%></h1>

        <form action="PlayGameServlet" method="POST">
            <h2>Enter your 6 lucky numbers (between 1 and 49)</h2>

            <%
                if (request.getAttribute("error") != null) {
            %>
            <p class="error"><%=request.getAttribute("error")%></p>
            <%
                }
            %>

            <div>
                <% for (int i = 1; i <= 6; i++) {%>
                <input type="number" name="number<%=i%>" min="1" max="49" required />
                <% }%>
            </div>

            <div style="margin-top:20px;">
                <label for="amount">Enter your bet (min R100): </label>
                <input type="number" name="amount" min="100" max="<%=balance.intValue()%>" required />
            </div>

            <input type="submit" value="Play Now">
        </form>
    </body>
</html>
