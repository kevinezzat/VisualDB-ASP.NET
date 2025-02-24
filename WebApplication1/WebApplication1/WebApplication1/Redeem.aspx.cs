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
    public partial class Redeem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RedeemVoucher_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                String mobile = Mobile.Text;
                int voucher = Int16.Parse(Voucher.Text);
                conn.Open();
                string testquery = "SELECT COUNT(*) FROM Customer_Account WHERE mobileNo = @MobileNo";
                SqlCommand test = new SqlCommand(testquery, conn);
                test.Parameters.AddWithValue("@MobileNo", mobile);
                string testquery2 = "SELECT voucherID FROM Voucher WHERE mobileNo = @MobileNo";
                SqlCommand test2 = new SqlCommand(testquery2, conn);
                test2.Parameters.AddWithValue("@MobileNo", mobile);
                Object vouchertest = test2.ExecuteScalar();
                int vouchertest2 = Convert.ToInt16(vouchertest);
                int count = (int)test.ExecuteScalar();
                if (count == 0)
                {
                    Message.Text = "INVALID NUMBER, please enter a valid number";
                    return;
                }
                else if (voucher!=vouchertest2)
                {
                    Message.Text = "INVALID VOUCHER, please enter a valid voucher";
                    return;
                }
                SqlCommand redeemproc = new SqlCommand("[Redeem_voucher_points]", conn);
                redeemproc.CommandType = CommandType.StoredProcedure;
                redeemproc.Parameters.Add(new SqlParameter("@mobile_num", mobile));
                redeemproc.Parameters.Add(new SqlParameter("@voucher_id", voucher));
                Message.Text = "Voucher Redeemed successfully!";
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