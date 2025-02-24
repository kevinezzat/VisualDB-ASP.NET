using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _5mon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowPlansButton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String mobileNo = MobileNoText.Text;
            conn.Open();
            string testquery = "SELECT COUNT(*) FROM Customer_Account WHERE mobileNo = @MobileNo";
            SqlCommand test = new SqlCommand(testquery, conn);
            test.Parameters.AddWithValue("@MobileNo", mobileNo);
            int count = (int)test.ExecuteScalar();
            if (count == 0)
            {
                Message.Text = "INVALID NUMBER, please enter a valid number";
                return;
            }
            string query = "SELECT * FROM dbo.[Subscribed_plans_5_Months](@MobileNo)";
            SqlCommand months = new SqlCommand(query, conn);
            months.Parameters.AddWithValue("@MobileNo", mobileNo);
            SqlDataReader reader = months.ExecuteReader();
            if (reader.HasRows)
            {
                PlansView.DataSource = reader;
                PlansView.DataBind();
            }
            else
            {
                Message.Text = "No Service Plans Subscribed To in The Past 5 Months";
                Message.CssClass = "text-danger";
            }
            conn.Close();
            

        }

        protected void Return_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer.aspx");
        }
    } 
}