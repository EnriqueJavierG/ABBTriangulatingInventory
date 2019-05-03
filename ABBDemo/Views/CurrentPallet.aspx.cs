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
    public partial class CurrentPallet : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["InventoryPDBConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //int binQuantity;
            lblCount.Text = "";
            lblPalletId.Text = Session["PalletId"] as string;
        }
        protected void btnSubmitPallet_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("SP_FinishedPallet", con))
            {
                int binQuantity = GridView1.Rows.Count;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PalletId", Session["PalletId"]);
                cmd.Parameters.AddWithValue("@BinQuantity", binQuantity);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Redirect("OpenPallet.aspx");
        }
        protected void BtnPrintReporte_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('~/Views/Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
        }
        protected void BtnPrintPalletNumber_Click(object sender, EventArgs e)
        {        
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('~/Views/Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
        }
        protected void BtnAddTransaction_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DataEntry/AddTransaction.aspx");
        }
        protected void BtnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("OpenPallet.aspx");
        }
    }
}