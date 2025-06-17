<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Veiw_Monthly_Repo.aspx.cs" Inherits="FINANCE_MANAGER_AP.Veiw_Monthly_Repo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Monthly Financial Report</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #fff;
            color: #333;
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        form {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            color: #333;
        }

        form:hover {
            transform: scale(1.01);
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .report-label {
            font-weight: bold;
            color: #333;
            font-size: 16px;
        }

        .value {
            font-size: 18px;
            color: #0078D7;
            margin-left: 8px;
        }

        .status {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
            text-align: center;
            display: block;
        }

        .success {
            color: #4caf50;
        }

        .warning {
            color: #ff5722;
        }

        .datetime {
            text-align: right;
            font-size: 14px;
            color: #666;
            margin-bottom: 15px;
            display: block;
        }

        .styled-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .styled-grid th, .styled-grid td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
            color: #333;
        }

        .styled-grid th {
            background-color: #0078D7;
            color: #fff;
            font-size: 16px;
        }

        .styled-grid tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .styled-grid tr:hover {
            background-color: #f1f1f1;
            transition: 0.3s ease;
        }

        .btn {
            display: block;
            margin: 20px auto 0 auto;
            padding: 10px 20px;
            background-color: #0078D7;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .btn:hover {
            background-color: #005a9e;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Monthly Financial Report</h2>

        <asp:Label ID="lblCurrentDateTime" runat="server" CssClass="datetime"></asp:Label>

        <p><span class="report-label">Total Income:</span> 
           <asp:Label ID="lblTotalIncome" runat="server" CssClass="value"></asp:Label></p>
        <p><span class="report-label">Total Expenses:</span> 
           <asp:Label ID="lblTotalExpenses" runat="server" CssClass="value"></asp:Label></p>
        <p><span class="report-label">Net Savings:</span> 
           <asp:Label ID="lblNetSavings" runat="server" CssClass="value"></asp:Label></p>
        <p><span class="report-label">Budget Amount:</span> 
           <asp:Label ID="lblBudgetAmount" runat="server" CssClass="value"></asp:Label></p>
        <p><span class="report-label">Remaining Budget:</span> 
           <asp:Label ID="lblRemainingBudget" runat="server" CssClass="value"></asp:Label></p>

        <asp:Label ID="lblBudgetStatus" runat="server" CssClass="status"></asp:Label>

        <h3 style="text-align:center; color:#0078D7;">Category-wise Spending</h3>
        <asp:GridView ID="gvCategorySpending" runat="server" AutoGenerateColumns="True" CssClass="styled-grid">
        </asp:GridView>

        <!-- Back to Main Menu Button -->
        <asp:Button ID="btnBackToMainMenu" runat="server" Text="Back to Main Menu" CssClass="btn" CausesValidation="False" OnClick="btnBackToMainMenu_Click" />
    </form>
</body>
</html>
