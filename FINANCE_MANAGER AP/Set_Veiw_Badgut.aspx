<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Set_Veiw_Badgut.aspx.cs" Inherits="FINANCE_MANAGER_AP.Set_Veiw_Transaction" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set and View Budget</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7f9;
        }

        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .btn {
            width: 48%;
            padding: 10px;
            background-color: #0078d4;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            margin-right: 4%;
            margin-bottom: 10px;
        }

        .btn:hover {
            background-color: #005ea2;
        }

        .message {
            margin-top: 15px;
            color: green;
            font-weight: bold;
            text-align: center;
        }

        .summary {
            margin-top: 20px;
            padding: 15px;
            background-color: #eef;
            border-radius: 8px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Set and View Your Budget</h2>

            <label for="txtBudget">Enter Monthly Budget:</label>
            <asp:TextBox ID="txtBudget" runat="server" CssClass="input-field"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBudget" runat="server" ControlToValidate="txtBudget"
                ErrorMessage="Please enter a budget amount." Display="Dynamic" ForeColor="Red" />

           <asp:Button ID="btnSetBudget" runat="server" Text="Set Budget" CssClass="btn" OnClick="btnSetBudget_Click" />
<asp:Button ID="btnViewBudget" runat="server" Text="View Budget" CssClass="btn" OnClick="btnViewBudget_Click" CausesValidation="False" />
<asp:Button ID="btnClearBudget" runat="server" Text="Clear Budget" CssClass="btn" OnClick="btnClearBudget_Click" CausesValidation="False" />
<asp:Button ID="Button1" runat="server" Text="Back To Main Menu" CssClass="btn" OnClick="Button1_Click" CausesValidation="False" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" />

            <div class="summary">
                <asp:Label ID="lblCurrentBudget" runat="server" /><br />
                <asp:Label ID="lblTotalIncome" runat="server" /><br />
                <asp:Label ID="lblTotalExpenses" runat="server" /><br />
                <asp:Label ID="lblRemainingBalance" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
