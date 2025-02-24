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
    public partial class Renew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                int plan = Int16.Parse(Plan.Text);
                decimal amount = decimal.Parse(Amnt.Text);
                String mobile = Mobile.Text;
                String payment = Method.SelectedValue;
                SqlCommand renewproc = new SqlCommand("[Initiate_plan_payment]", conn);
                renewproc.CommandType = CommandType.StoredProcedure;
                renewproc.Parameters.Add(new SqlParameter("@mobile_num", mobile));
                renewproc.Parameters.Add(new SqlParameter("@amount", amount));
                renewproc.Parameters.Add(new SqlParameter("@payment_method", payment));
                renewproc.Parameters.Add(new SqlParameter("@plan_id", plan));
                conn.Open();
                renewproc.ExecuteNonQuery();
                Message.Text = "Subscription renewed successfully!";
            }
            catch (SqlException ex)
            {
                Message.Text = "INCORRECT DATA, please ensure that all data is filled in and the mobile number and plan ID are correct";
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