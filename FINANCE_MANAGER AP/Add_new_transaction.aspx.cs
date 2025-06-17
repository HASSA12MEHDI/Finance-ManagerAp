using System;
using System.Configuration; // Required for ConfigurationManager
using System.Data.SqlClient; // Required for SQL Server Connection
using System.Web.UI;

namespace FINANCE_MANAGER_AP
{
    public partial class Add_new_transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                // Automatically set today's date and time
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            }
        }


        protected void btnAddTransaction_Click(object sender, EventArgs e)
        {
            string transactionType = ddlTransactionType.SelectedValue;
            DateTime transactionDate;
            decimal amount;
            string category = txtCategory.Text.Trim();
            string description = txtDescription.Text.Trim();

            // Validate Date
            if (!DateTime.TryParse(txtDate.Text, out transactionDate))
            {
                lblMessage.Text = "Invalid Date format!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Validate Amount
            if (!decimal.TryParse(txtAmount.Text, out amount))
            {
                lblMessage.Text = "Invalid Amount!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // SQL Server Connection String (from Web.config)
            string connectionString = ConfigurationManager.ConnectionStrings["FinanceDB"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Transactions (TransactionType, TransactionDate, Amount, Category, Description) " +
                                   "VALUES (@TransactionType, @TransactionDate, @Amount, @Category, @Description)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@TransactionType", transactionType);
                        cmd.Parameters.AddWithValue("@TransactionDate", transactionDate);
                        cmd.Parameters.AddWithValue("@Amount", amount);
                        cmd.Parameters.AddWithValue("@Category", category);
                        cmd.Parameters.AddWithValue("@Description", description);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                // Show success message in label
                lblMessage.Text = "Your transaction added successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // Reset fields (but keep Date as today's date)
                ddlTransactionType.SelectedIndex = 0;
                txtAmount.Text = string.Empty;
                txtCategory.Text = string.Empty;
                txtDescription.Text = string.Empty;
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd"); // Keep today's date
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnGoMainMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finance manager Main manu.aspx");
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

