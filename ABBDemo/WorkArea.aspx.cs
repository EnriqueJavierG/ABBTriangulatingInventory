using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABBDemo
{
    public partial class WorkArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnFab_Click(object sender, EventArgs e)
        {
            Session["From"] = "Fab";
            Response.Redirect("Views/OpenPallet.aspx");
        }

        protected void BtnPlat1_Click(object sender, EventArgs e)
        {
            Session["From"] = "Plat-in";
            Response.Redirect("Views/OpenPallet.aspx");
        }

        protected void BtnPlat2_Click(object sender, EventArgs e)
        {
            Session["From"] = "Plat-out";
            Response.Redirect("Views/OpenPallet.aspx");
        }
    }
}