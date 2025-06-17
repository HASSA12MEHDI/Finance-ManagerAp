<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_new_transaction.aspx.cs" Inherits="FINANCE_MANAGER_AP.Add_new_transaction" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Transaction</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: none; /* removed background color */
        }

        form {
            width: 600px;
            background: #fff; /* solid white form */
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            border: 1px solid #ddd;
            transition: transform 0.3s ease;
        }

        form:hover {
            transform: scale(1.02);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 26px;
        }

        table {
            width: 100%;
            border-spacing: 12px;
        }

        td {
            padding: 10px 0;
        }

        label {
            display: block;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            box-sizing: border-box;
            background: #f9f9f9;
            color: #333;
            transition: box-shadow 0.3s ease;
        }

        .input-field:focus {
            outline: none;
            box-shadow: 0 0 5px #0078d4;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background: linear-gradient(45deg, #0078d4, #00c6ff);
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.4s ease, transform 0.2s ease;
        }

        .btn-submit:hover {
            background: linear-gradient(45deg, #005ea2, #00aaff);
            transform: scale(1.03);
        }

        .error {
            color: #d8000c;
            font-size: 13px;
        }

        .message-label {
            text-align: center;
            display: block;
            margin-top: 10px;
            font-size: 14px;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Add New Transaction</h2>

        <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" HeaderText="Please fix the following:" />

        <table>
            <tr>
                <td>
                    <label for="ddlTransactionType">Transaction Type</label>
                    <asp:DropDownList ID="ddlTransactionType" runat="server" CssClass="input-field">
                        <asp:ListItem Text="Select Type" Value="" />
                        <asp:ListItem Text="Income" Value="Income" />
                        <asp:ListItem Text="Expense" Value="Expense" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTransactionType" runat="server" ControlToValidate="ddlTransactionType"
                        InitialValue="" ErrorMessage="Transaction Type is required." CssClass="error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtDate">Date</label>
                    <asp:TextBox ID="txtDate" runat="server" CssClass="input-field" placeholder="MM/DD/YYYY" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                        ErrorMessage="Date is required." CssClass="error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtAmount">Amount</label>
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="input-field" placeholder="Enter Amount"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="txtAmount"
                        ErrorMessage="Amount is required." CssClass="error" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revAmount" runat="server" ControlToValidate="txtAmount"
                        ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Enter a valid amount."
                        CssClass="error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtCategory">Category</label>
                    <asp:TextBox ID="txtCategory" runat="server" CssClass="input-field" placeholder="Enter Category"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="txtCategory"
                        ErrorMessage="Category is required." CssClass="error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="txtDescription">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="input-field" placeholder="Enter Description"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                        ErrorMessage="Description is required." CssClass="error" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnAddTransaction" runat="server" Text="Add Transaction" CssClass="btn-submit" OnClick="btnAddTransaction_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnGoMainMenu" runat="server" Text="Go Main Menu" 
                        CssClass="btn-submit" OnClick="btnGoMainMenu_Click" CausesValidation="False" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
