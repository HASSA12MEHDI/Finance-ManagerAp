using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace FINANCE_MANAGER_AP
{
    public partial class Veiw_Monthly_Repo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblCurrentDateTime.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy hh:mm tt");
                LoadMonthlyReport();
            }
        }

        private void LoadMonthlyReport()
        {
            decimal totalIncome = 0;
            decimal totalExpenses = 0;
            decimal netSavings = 0;
            decimal budgetAmount = 0;
            decimal remainingBudget = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["Financedb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Total Income
                SqlCommand cmdIncome = new SqlCommand("SELECT ISNULL(SUM(Amount), 0) FROM Transactions WHERE TransactionType='Income'", conn);
                totalIncome = Convert.ToDecimal(cmdIncome.ExecuteScalar());

                // Total Expenses
                SqlCommand cmdExpenses = new SqlCommand("SELECT ISNULL(SUM(Amount), 0) FROM Transactions WHERE TransactionType='Expense'", conn);
                totalExpenses = Convert.ToDecimal(cmdExpenses.ExecuteScalar());

                // Budget Amount
                SqlCommand cmdBudget = new SqlCommand("SELECT TOP 1 BudgetAmount FROM Budget", conn);
                var result = cmdBudget.ExecuteScalar();
                budgetAmount = result != null ? Convert.ToDecimal(result) : 0;

                netSavings = totalIncome - totalExpenses;

                // Calculate Remaining Budget (Budget - Expenses)
                remainingBudget = budgetAmount - totalExpenses;

                // Category-wise Spending with latest Transaction Date
                SqlCommand cmdCategory = new SqlCommand(@"
                    SELECT Category, SUM(Amount) AS Total, 
                           CONVERT(varchar(10), MAX(TransactionDate), 120) AS TransactionDate 
                    FROM Transactions 
                    WHERE TransactionType='Expense' 
                    GROUP BY Category", conn);

                SqlDataAdapter da = new SqlDataAdapter(cmdCategory);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvCategorySpending.DataSource = dt;
                gvCategorySpending.DataBind();

                // Budget Status
                if (remainingBudget < 0)
                {
                    lblBudgetStatus.Text = "Warning: Over Budget!";
                    lblBudgetStatus.CssClass = "warning";
                }
                else
                {
                    lblBudgetStatus.Text = "Within Budget";
                    lblBudgetStatus.CssClass = "success";
                }

                // Display Values
                lblTotalIncome.Text = totalIncome.ToString("C");
                lblTotalExpenses.Text = totalExpenses.ToString("C");
                lblNetSavings.Text = netSavings.ToString("C");
                lblBudgetAmount.Text = budgetAmount.ToString("C");
                lblRemainingBudget.Text = remainingBudget.ToString("C");
            }
        }

        protected void btnBackToMainMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finance manager Main manu.aspx");
        }
    }
}
