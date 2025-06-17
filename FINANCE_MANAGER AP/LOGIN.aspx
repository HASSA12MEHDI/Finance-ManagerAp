<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="FINANCE_MANAGER_AP.LOGIN" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Login Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            background-color: #f0f2f5;
        }

        .login-container {
            background: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            width: 350px;
            box-sizing: border-box;
            border: 1px solid #ddd;
        }

        .login-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            background: #f9f9f9;
            font-size: 14px;
            color: #333;
            transition: box-shadow 0.3s ease;
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            outline: none;
            box-shadow: 0 0 5px #007BFF;
        }

        .btnLogin {
            width: 100%;
            padding: 12px;
            background: #007BFF;
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 15px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s ease, transform 0.2s ease;
            margin-top: 10px;
        }

        .btnLogin:hover {
            background: #0056b3;
            transform: scale(1.03);
        }

        .error-message {
            color: red;
            font-size: 0.85em;
            margin: 4px 0 8px 0;
            min-height: 16px;
        }

        .forgot-link {
            display: block;
            text-align: center;
            margin-top: 12px;
            color: #007BFF;
            text-decoration: underline;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .forgot-link:hover {
            color: #0056b3;
        }
    </style>

    <script>
        function validateForm() {
            document.getElementById('usernameError').textContent = '';
            document.getElementById('passwordError').textContent = '';

            let valid = true;
            const username = document.getElementById('<%= txtUsername.ClientID %>').value.trim();
            const password = document.getElementById('<%= txtPassword.ClientID %>').value.trim();

            if (username === '') {
                document.getElementById('usernameError').textContent = 'Please enter your username';
                valid = false;
            }
            if (password === '') {
                document.getElementById('passwordError').textContent = 'Please enter your password';
                valid = false;
            }
            return valid;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm();">
        <div class="login-container">
            <h2>Login</h2>

            <asp:TextBox ID="txtUsername" runat="server" CssClass="input" Placeholder="Username"></asp:TextBox>
            <div id="usernameError" class="error-message"></div>

            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input" Placeholder="Password"></asp:TextBox>
            <div id="passwordError" class="error-message"></div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btnLogin" OnClick="btnLogin_Click" />

            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="forgot-link" OnClick="LinkButton1_Click">Forgot Password?</asp:LinkButton>
        </div>
    </form>
</body>
</html>
