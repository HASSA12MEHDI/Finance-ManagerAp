using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FINANCE_MANAGER_AP
{
    public partial class Veiw_Transaction : System.Web.UI.Page
    {
        // Connection string from Web.config
        string connectionString = ConfigurationManager.ConnectionStrings["FinanceDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load all transactions by default
                LoadTransactions("All", "", "");
              
               
            }
        }

        // Dropdown filter changed
        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadTransactions(ddlFilter.SelectedValue, txtCategory.Text.Trim(), txtDate.Text.Trim());
        }

        // Search button clicked
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadTransactions(ddlFilter.SelectedValue, txtCategory.Text.Trim(), txtDate.Text.Trim());
        }

        // Load transactions with filter
        private void LoadTransactions(string type, string category, string date)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Select Date + Time properly formatted
                string query = @"SELECT TransactionID, TransactionType, 
                                        FORMAT(TransactionDate, 'yyyy-MM-dd') AS TransactionDate, 
                                        Amount, Category, Description 
                                 FROM Transactions 
                                 WHERE 1=1";

                if (type != "All")
                {
                    query += " AND TransactionType = @Type";
                }
                if (!string.IsNullOrEmpty(category))
                {
                    query += " AND Category LIKE @Category";
                }
                if (!string.IsNullOrEmpty(date))
                {
                    query += " AND CONVERT(DATE, TransactionDate) = @Date";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (type != "All")
                        cmd.Parameters.AddWithValue("@Type", type);

                    if (!string.IsNullOrEmpty(category))
                        cmd.Parameters.AddWithValue("@Category", "%" + category + "%");

                    if (!string.IsNullOrEmpty(date))
                    {
                        DateTime dt;
                        if (DateTime.TryParse(date, out dt))
                        {
                            cmd.Parameters.AddWithValue("@Date", dt.Date); // Filter only by Date part
                        }
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dtTable = new DataTable();
                    da.Fill(dtTable);

                    GridViewTransactions.DataSource = dtTable;
                    GridViewTransactions.DataBind();
                }
            }
        }

        // Back to main menu button clicked
        protected void BTMMANMENU_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finance manager Main manu.aspx");
        }
    }
}
