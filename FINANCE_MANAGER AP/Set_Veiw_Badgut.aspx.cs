using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace FINANCE_MANAGER_AP
{
    public partial class Set_Veiw_Transaction : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadCurrentBudget();
            }
        }

        protected void btnSetBudget_Click(object sender, EventArgs e)
        {
            decimal budgetAmount;
            if (decimal.TryParse(txtBudget.Text, out budgetAmount))
            {
                decimal totalIncome = GetTotalIncome();

                if (budgetAmount > totalIncome)
                {
                    lblMessage.Text = "You cannot set a budget greater than your total income!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                string connectionString = ConfigurationManager.ConnectionStrings["FinanceDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Budget; INSERT INTO Budget (BudgetAmount) VALUES (@BudgetAmount)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@BudgetAmount", budgetAmount);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "Budget set successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                LoadCurrentBudget();
            }
            else
            {
                lblMessage.Text = "Invalid budget amount!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnViewBudget_Click(object sender, EventArgs e)
        {
            LoadCurrentBudget();
            LoadTransactionSummary();
        }

        private void LoadCurrentBudget()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FinanceDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 BudgetAmount FROM Budget";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    lblCurrentBudget.Text = "Current Budget: " + Convert.ToDecimal(result).ToString("C");
                }
                else
                {
                    lblCurrentBudget.Text = "No budget set.";
                }
            }
        }

        private void LoadTransactionSummary()
        {
            decimal totalIncome = 0;
            decimal totalExpenses = 0;
            decimal budgetAmount = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["FinanceDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Get Total Income
                SqlCommand cmdIncome = new SqlCommand("SELECT ISNULL(SUM(Amount), 0) FROM Transactions WHERE TransactionType = 'Income'", conn);
                totalIncome = Convert.ToDecimal(cmdIncome.ExecuteScalar());

                // Get Total Expenses
                SqlCommand cmdExpense = new SqlCommand("SELECT ISNULL(SUM(Amount), 0) FROM Transactions WHERE TransactionType = 'Expense'", conn);
                totalExpenses = Convert.ToDecimal(cmdExpense.ExecuteScalar());

                // Get Current Budget
                SqlCommand cmdBudget = new SqlCommand("SELECT TOP 1 BudgetAmount FROM Budget", conn);
                object result = cmdBudget.ExecuteScalar();
                if (result != null)
                {
                    budgetAmount = Convert.ToDecimal(result);
                }
            }

            // New Logic:
            decimal remainingBalance = budgetAmount - totalExpenses;

            lblTotalIncome.Text = "Total Income: " + totalIncome.ToString("C");
            lblTotalExpenses.Text = "Total Expenses: " + totalExpenses.ToString("C");

            if (totalExpenses > budgetAmount)
            {
                decimal qarza = totalExpenses - budgetAmount;
                lblRemainingBalance.Text = $"Your Expenses are greater than Your Budget. Please Extend Your Budget.<br/>Loan:" + qarza.ToString("C");
                lblRemainingBalance.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblRemainingBalance.Text = "Remaining Balance (Budget - Expenses): " + remainingBalance.ToString("C");
                lblRemainingBalance.ForeColor = System.Drawing.Color.Green;
            }
        }

        private decimal GetTotalIncome()
        {
            decimal totalIncome = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["FinanceDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT ISNULL(SUM(Amount), 0) FROM Transactions WHERE TransactionType = 'Income'";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                totalIncome = Convert.ToDecimal(cmd.ExecuteScalar());
            }
            return totalIncome;
        }

        protected void btnClearBudget_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["FinanceDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Budget";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Budget cleared successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblCurrentBudget.Text = "No budget set.";
            lblTotalIncome.Text = "";
            lblTotalExpenses.Text = "";
            lblRemainingBalance.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finance manager Main manu.aspx");
        }
    }
}
