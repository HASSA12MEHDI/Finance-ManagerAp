<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Veiw_Transaction.aspx.cs" Inherits="FINANCE_MANAGER_AP.Veiw_Transaction" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Transactions</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        .filter-panel {
            background-color: #fff;
            padding: 15px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
            border-radius: 8px;
        }
        .filter-panel label {
            margin-right: 10px;
            font-weight: bold;
        }
        .filter-panel input, .filter-panel select {
            margin-right: 15px;
            padding: 5px;
        }
        .filter-panel input[type="submit"], .filter-panel input[type="button"], .filter-panel input[type='text'] {
            padding: 6px 12px;
        }
        .filter-panel input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .filter-panel input[type="submit"]:hover {
            background-color: #45a049;
        }
        .gridview-style {
            border-collapse: collapse;
            width: 100%;
        }
        .gridview-style th, .gridview-style td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .gridview-style tr:nth-child(even) {background-color: #f2f2f2;}
        .gridview-style tr:hover {background-color: #ddd;}
        .gridview-style th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>View Transactions</h2>
        <div class="filter-panel">
            <asp:Label ID="Label1" runat="server" Text="Type:"></asp:Label>
            <asp:DropDownList ID="ddlFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                <asp:ListItem Text="All" Value="All"></asp:ListItem>
                <asp:ListItem Text="Income" Value="Income"></asp:ListItem>
                <asp:ListItem Text="Expense" Value="Expense"></asp:ListItem>
            </asp:DropDownList>

            <asp:Label ID="Label2" runat="server" Text="Category:"></asp:Label>
            <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>

            <asp:Label ID="Label3" runat="server" Text="Date (YYYY-MM-DD):"></asp:Label>
            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>

            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <asp:Button ID="BTMMANMENU" runat="server" Text="BACK TO MAIN MENU" OnClick="BTMMANMENU_Click" />
        </div>

        <asp:GridView ID="GridViewTransactions" runat="server" AutoGenerateColumns="true" CssClass="gridview-style"></asp:GridView>
    </form>
</body>
</html>

