<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Finance manager Main manu.aspx.cs" Inherits="FINANCE_MANAGER_AP.Finance_manager_Main_manu" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Finance Manager - Main Menu</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px 30px;
            width: 360px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            text-align: center;
        }

        .glass-title {
            font-size: 26px;
            font-weight: bold;
            color: #ffffff;
            margin-bottom: 25px;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
        }

        .menu-button {
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            color: #fff;
            cursor: pointer;
            background: linear-gradient(to right, #667eea, #764ba2);
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        .menu-button:hover {
            background: linear-gradient(to right, #5a67d8, #6b46c1);
            transform: scale(1.03);
        }

        .menu-button:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="glass-card">
            <asp:Label ID="LabelHeader" runat="server" CssClass="glass-title" Text="Finance Manager Menu"></asp:Label>

            <asp:Button ID="btnAddTransaction" runat="server" CssClass="menu-button" Text="➕ Add New Transaction" OnClick="btnAddTransaction_Click" />
            <asp:Button ID="btnViewTransaction" runat="server" CssClass="menu-button" Text="📋 View Transactions" OnClick="btnViewTransaction_Click" />
            <asp:Button ID="btnViewBudgetSummary" runat="server" CssClass="menu-button" Text="📊 View Budget Summary" OnClick="btnViewBudgetSummary_Click" />
            <asp:Button ID="btnViewMonthlyReport" runat="server" CssClass="menu-button" Text="📅 View Monthly Report" OnClick="btnViewMonthlyReport_Click" />
        </div>
    </form>
</body>
</html>
