<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deposit Funds</title>
    <style>
        body {
            background: radial-gradient(circle at top left, #1c1c1c 0%, #000000 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #e0e0e0;
            text-align: center;
            padding: 40px;
        }
        h1 {
            color: #22d3ee;
            text-shadow: 0 0 8px #22d3ee, 0 0 16px #22d3ee;
            margin-bottom: 30px;
        }
        .message {
            color: #10b981;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .form-container {
            background-color: #1f1f1f;
            padding: 30px;
            border-radius: 12px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.6);
        }
        table {
            width: 100%;
            margin: auto;
        }
        td {
            padding: 12px;
            font-size: 1.1em;
            color: #ccc;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-size: 1em;
        }
        input[type="submit"] {
            padding: 12px 30px;
            background: #3b82f6;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }
        input[type="submit"]:hover {
            background: #2563eb;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <div class="message"><%= message %></div>
    <%
        }
    %>        
    <h1>💰 Add to Your Balance</h1>
    <div class="form-container">
        <form action="DepositServlet" method="POST">
            <table>
                <tr>
                    <td>Deposit Amount (R):</td>
                    <td><input type="text" name="deposit" required /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="DEPOSIT"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
