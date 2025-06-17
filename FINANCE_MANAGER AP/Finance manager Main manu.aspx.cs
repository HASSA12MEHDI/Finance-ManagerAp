using System;
using System.Web.UI;

namespace FINANCE_MANAGER_AP
{
    public partial class Finance_manager_Main_manu : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: code to run on page load
        }

        protected void btnAddTransaction_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_new_transaction.aspx");
        }

        protected void btnViewTransaction_Click(object sender, EventArgs e)
        {
            Response.Redirect("Veiw_Transaction.aspx");
        }

        protected void btnViewBudgetSummary_Click(object sender, EventArgs e)
        {
            Response.Redirect("Set_Veiw_Badgut.aspx");
        }

        protected void btnViewMonthlyReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("Veiw_Monthly_Repo.aspx");
        }

      
    }
}
