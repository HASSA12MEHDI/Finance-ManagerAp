using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace FINANCE_MANAGER_AP
{
    public partial class LOGIN : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Disable unobtrusive validation explicitly
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                // Optional server-side check in case JS is disabled
                ShowAlert("Please enter both username and password.");
                return;
            }

            // Get connection string from Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["FinanceDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM login WHERE username = @username AND password = @password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Use parameters to prevent SQL Injection
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    con.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count == 1)
                    {
                        // Successful login
                        Response.Redirect("Finance manager Main manu.aspx"); // redirect to your main page
                    }
                    else
                    {
                        // Invalid credentials
                        ShowAlert("Invalid Username or Password.");
                    }
                }
            }
        }

        private void ShowAlert(string message)
        {
            string script = $"alert('{message}');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("forget.aspx");
        }
    }
}
