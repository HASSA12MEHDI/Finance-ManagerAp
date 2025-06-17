<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="FINANCE_MANAGER_AP.forget" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f2f5;
            margin: 0;
        }
        .forgot-container {
            background: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            width: 350px;
            box-sizing: border-box;
            border: 1px solid #ddd;
        }
        .forgot-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .forgot-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #555;
        }
        .forgot-container input[type="text"],
        .forgot-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background: #f9f9f9;
            font-size: 14px;
            color: #333;
            transition: box-shadow 0.3s ease;
        }
        .forgot-container input[type="text"]:focus,
        .forgot-container input[type="password"]:focus {
            outline: none;
            box-shadow: 0 0 5px #007BFF;
        }
        .btnForgot {
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
        }
        .btnForgot:hover {
            background: #0056b3;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="forgot-container">
            <h2>Change Password</h2>

            <label for="TextBox1">Enter Email</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="input" Placeholder="Email" TextMode="Email"></asp:TextBox>

            <label for="TextBox2">Username</label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="input" Placeholder="Username"></asp:TextBox>

            <label for="TextBox4">Current Password</label>
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" CssClass="input" Placeholder="Current Password"></asp:TextBox>

            <label for="TextBox3">New Password</label>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" CssClass="input" Placeholder="New Password"></asp:TextBox>

            <asp:Button ID="Button1" runat="server" Text="Reset Password" CssClass="btnForgot" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
