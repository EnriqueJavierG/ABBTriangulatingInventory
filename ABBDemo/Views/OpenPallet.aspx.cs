using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABBDemo
{
    public partial class OpenPallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["From"] = GridView1.Rows[index].Cells[1].Text;
                Session["ToLocation"] = GridView1.Rows[index].Cells[2].Text;
                int rowclicked = Convert.ToInt32(GridView1.Rows[index].Cells[0].Text);
                Session["PalletId"] = rowclicked;
                Response.Redirect("CurrentPallet.aspx");
            }
        }
        protected void BtnAddPallet_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DataEntry/AddPallet.aspx");
        }
    }
}