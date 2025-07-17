<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up - LuckySpin</title>
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
            min-height: 100vh;
            flex-direction: column;
        }

        .signup-container {
            background: linear-gradient(145deg, #1e1e1e, #2a2a2a);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.2);
            width: 90%;
            max-width: 500px;
        }

        h1 {
            text-align: center;
            color: #ffd700;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            color: #ccc;
        }

        input[type="email"],
        input[type="password"],
        input[type="text"] {
            width: 100%;
            padding: 8px;
            border-radius: 8px;
            border: none;
            background-color: #2e2e2e;
            color: #fff;
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
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #e6c200;
        }

        #strengthMsg {
            font-size: 0.9rem;
            margin-top: 5px;
        }

        .weak { color: red; }
        .medium { color: orange; }
        .strong { color: #00ff99; }
    </style>
</head>
<body>
    <div class="signup-container">
        <% String message = (String) request.getAttribute("message");
           if (message != null) { %>
            <p style="color: gold; text-align:center;"><%=message%></p>
        <% } %>

        <h1>Create your account</h1>
        <form action="SignUpServlet" method="POST">
            <table>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <input type="password" name="pswd" id="pswd" required minlength="8" onkeyup="checkStrength()">
                        <div id="strengthMsg"></div>
                    </td>
                </tr>
                <tr>
                    <td>South African ID:</td>
                    <td>
                        <input type="text" name="sa_id" title="13-digit numeric ID only">
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="SIGN UP"></td>
                </tr>
            </table>
        </form>
    </div>

    <script>
        function checkStrength() {
            const password = document.getElementById("pswd").value;
            const msg = document.getElementById("strengthMsg");

            let strength = 0;
            if (password.length >= 8) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[@$!%*?&]/.test(password)) strength++;

            if (strength <= 1) {
                msg.innerText = "Weak password";
                msg.className = "weak";
            } else if (strength === 2 || strength === 3) {
                msg.innerText = "Medium strength";
                msg.className = "medium";
            } else {
                msg.innerText = "Strong password";
                msg.className = "strong";
            }
        }
    </script>
</body>
</html>
