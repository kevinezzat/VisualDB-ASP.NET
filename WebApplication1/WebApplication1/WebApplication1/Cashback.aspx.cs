using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Cashback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetCash_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                String mobile = Mobile.Text;
                int payment = Int16.Parse(Payment.Text);
                int benefit = Int16.Parse(Benefit.Text);
                conn.Open();
                string cashquery = "SELECT amount FROM Payment WHERE paymentID = @payment_id";
                SqlCommand test = new SqlCommand(cashquery, conn);
                test.Parameters.AddWithValue("@payment_id", payment);
                object cashbackres = test.ExecuteScalar();
                decimal cashback = Convert.ToDecimal(cashbackres);
                decimal cashbackamount = 0.1m* cashback;
                SqlCommand cashbackproc = new SqlCommand("[Payment_wallet_cashback]", conn);
                cashbackproc.CommandType = CommandType.StoredProcedure;
                cashbackproc.Parameters.Add(new SqlParameter("@mobile_num", mobile));
                cashbackproc.Parameters.Add(new SqlParameter("@payment_id", payment));
                cashbackproc.Parameters.Add(new SqlParameter("@benefit_id", benefit));
                cashbackproc.ExecuteNonQuery();
                Message.Text = "Cashback added successfully! Cashback Amount:" + cashbackamount.ToString();
            }
            catch (SqlException ex)
            {
                Message.Text = "INCORRECT DATA, please ensure that all data is filled in and the mobile number, payment ID and benefit ID are correct";
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