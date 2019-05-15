using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABBDemo
{
    public partial class PalletView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            //Get the row selected
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
               // lblcheck.Text = GridView1.Rows[index].Cells[0].Text;
                int rowclicked = Convert.ToInt32(GridView1.Rows[index].Cells[0].Text);
                Session["PalletId"] = rowclicked;
                Response.Redirect("../Views/CurrentPallet.aspx");
            }
        }
    }
}