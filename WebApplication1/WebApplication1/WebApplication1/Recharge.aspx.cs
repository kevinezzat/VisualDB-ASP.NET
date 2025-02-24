using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Recharge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RechargeButton_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                String mobile = Mobile.Text;
                int amount = Int16.Parse(Amount.Text);
                String method = Method.SelectedValue;
                conn.Open();
                string testquery = "SELECT COUNT(*) FROM Customer_Account WHERE mobileNo = @MobileNo";
                SqlCommand test = new SqlCommand(testquery, conn);
                test.Parameters.AddWithValue("@MobileNo", mobile);
                int count = (int)test.ExecuteScalar();
                if (count == 0)
                {
                    Message.Text = "INVALID NUMBER, please enter a valid number";
                    return;
                }
                SqlCommand rechargeproc = new SqlCommand("[Initiate_balance_payment]", conn);
                rechargeproc.CommandType = CommandType.StoredProcedure;
                rechargeproc.Parameters.Add(new SqlParameter("@mobile_num", mobile));
                rechargeproc.Parameters.Add(new SqlParameter("@amount", amount));
                rechargeproc.Parameters.Add(new SqlParameter("@payment_method", method));
                rechargeproc.ExecuteNonQuery();
                Message.Text = "Balance renewed successfully!";
            }
            catch (Exception ex)
            {
                Message.Text = "MISSING DATA, please ensure that all data is filled in";
            }
            conn.Close();
        }

        protected void Return_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer.aspx");
        }
    }
}