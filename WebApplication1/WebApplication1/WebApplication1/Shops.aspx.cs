using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace WebApplication1
{
    public partial class Shops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void ShopsButton_Click1(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string query = "SELECT * FROM shop";
            SqlCommand select = new SqlCommand(query, conn);
            conn.Open();
            int count = (int)select.ExecuteScalar();
            if (count == 0)
            {
                Message.Text = "No Shops Available";
            }
            SqlDataReader reader = select.ExecuteReader();

            ShopsView.DataSource = reader;
            ShopsView.DataBind();

            conn.Close();

        }

        protected void Return_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer.aspx");
        }
    }
}