using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shops.aspx");
        }

        protected void Months_Click(object sender, EventArgs e)
        {
            Response.Redirect("5mon.aspx");
        }

        protected void Renew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Renew.aspx");
        }

        protected void Cashback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cashback.aspx");
        }

        protected void Recharge_Click(object sender, EventArgs e)
        {
            Response.Redirect("Recharge.aspx");
        }

        protected void Redeem_Click(object sender, EventArgs e)
        {
            Response.Redirect("Redeem.aspx");
        }
    }
}