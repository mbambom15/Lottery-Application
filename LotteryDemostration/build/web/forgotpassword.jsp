<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password - LuckySpin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Orbitron', sans-serif;
            background-color: #121212;
            color: #f1f1f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .reset-container {
            background: linear-gradient(145deg, #1e1e1e, #2a2a2a);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.2);
            width: 90%;
            max-width: 400px;
            text-align: center;
        }

        h1 {
            color: #ffd700;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
        }

        td {
            padding: 10px 5px;
            text-align: left;
            color: #ccc;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: none;
            border-radius: 8px;
            background-color: #2e2e2e;
            color: #f1f1f1;
            font-size: 1rem;
        }

        input[type="submit"] {
            background-color: #ffd700;
            color: #121212;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #e6c200;
        }

        .message {
            color: #ff4d4d;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .success {
            color: #00ff99;
        }
    </style>
</head>
<body>
    <div class="reset-container">
        <h1>Reset Your Password</h1>

        <% 
            String msg = (String) request.getAttribute("message"); 
            String type = (String) request.getAttribute("msgType"); 
            if (msg != null) { 
        %>
            <p class="message <%= "success".equals(type) ? "success" : "" %>"><%= msg %></p>
        <% } %>

        <form action="ForgotPasswordServlet" method="POST">
            <table>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <td>New Password:</td>
                    <td><input type="password" name="pswd" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Reset Password"></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
F