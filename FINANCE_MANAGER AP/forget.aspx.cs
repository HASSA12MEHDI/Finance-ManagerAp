using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace FINANCE_MANAGER_AP
{
    public partial class forget : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No action required on Page_Load
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = TextBox1.Text.Trim();
            string username = TextBox2.Text.Trim();
            string currentPassword = TextBox4.Text.Trim();
            string newPassword = TextBox3.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["FinanceDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Use your actual table name, assuming 'Login' instead of 'Users'
                string query = "SELECT COUNT(*) FROM Login WHERE Email = @Email AND Username = @Username AND Password = @CurrentPassword";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@CurrentPassword", currentPassword);

                    int userExists = (int)cmd.ExecuteScalar();

                    if (userExists > 0)
                    {
                        // Update password
                        string updateQuery = "UPDATE Login SET Password = @NewPassword WHERE Email = @Email AND Username = @Username";

                        using (SqlCommand updateCmd = new SqlCommand(updateQuery, con))
                        {
                            updateCmd.Parameters.AddWithValue("@NewPassword", newPassword);
                            updateCmd.Parameters.AddWithValue("@Email", email);
                            updateCmd.Parameters.AddWithValue("@Username", username);

                            updateCmd.ExecuteNonQuery();

                            // Redirect to Main Menu page
                            Response.Redirect("Finance manager Main manu.aspx");
                        }
                    }
                    else
                    {
                        // Invalid current credentials
                        Response.Write("<script>alert('Invalid email, username, or current password. Please try again.');</script>");
                    }
                }
            }
        }
    }
}
