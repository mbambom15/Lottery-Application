<%-- 
    Document   : login
    Created on : 14 Jul 2025, 11:34:34
    Author     : nhlak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - LuckySpin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Orbitron', sans-serif;
            background-color: #121212;
            color: #f1f1f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
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

        form {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-bottom: 10px;
        }

        td {
            padding: 10px 5px;
            text-align: left;
            color: #ccc;
        }

        input[type="text"],
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

        .link-button {
            background-color: #00ff99;
            color: #121212;
            margin-top: 10px;
        }

        p {
            margin: 10px 0;
            color: #aaa;
        }

        @media (max-width: 500px) {
            h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Login to <span style="color:#00ff99;">LuckySpin</span></h1>
        
        <form action="LoginServlet" method="POST">
            <table>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="pswd" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="LOGIN"></td>
                </tr>
            </table>
        </form>

        <form action="forgotpassword.jsp" method="GET">
            <input type="submit" value="Forgot Password?" class="link-button">
        </form>

        <p>No account? Sign up below!</p>

        <form action="signup.jsp" method="GET">
            <input type="submit" value="SIGN-UP" class="link-button">
        </form>
    </div>
</body>
</html>
