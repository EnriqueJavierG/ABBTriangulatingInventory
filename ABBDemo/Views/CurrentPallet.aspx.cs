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
            
            int sum = 0;
            for (int i = 0; i < GridView2.Rows.Count; ++i)
            {
                sum += Convert.ToInt32(GridView2.Rows[i].Cells[2].Text);
            }
            using (SqlCommand cmd = new SqlCommand("PalletToSite", con))
            {
                //int binQuantity = GridView1.Rows.Count;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@strSiteName",Session["To"]);
                cmd.Parameters.AddWithValue("@datDateStart", DateTime.Now);
                cmd.Parameters.AddWithValue("@datDateEnd", DateTime.Now.AddDays(1));
                cmd.Parameters.Add("@Count", SqlDbType.VarChar,75);
                cmd.Parameters["@Count"].Direction = ParameterDirection.Output;
                Session["CountPlace"] = cmd.Parameters["@Count"].Value.ToString();
                //cmd.Parameters.Add("@PalletId", SqlDbType.BigInt);
                //cmd.Parameters["@PalletId"].Direction = ParameterDirection.Output;
                //cmd.Parameters.AddWithValue("@PalletId", Session["PalletId"]);
                //cmd.Parameters.AddWithValue("@BinQuantity", binQuantity);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            //int binQuantity;
            lblCount.Text = sum.ToString();
            lblPalletId.Text = Session["PalletId"] as string;
            Session["Count"] = lblCount.Text;
            LblCountPlace.Text = Session["CountPlace"] as string;
            
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
            Response.Redirect("~/Views/OpenPallet.aspx");
        }
        protected void BtnPrintReporte_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(
             GetType(), "pop", "window.open('../Views/PrintReport.aspx','_newtab');", true);
        }
        protected void BtnPrintPalletNumber_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('../Views/Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
        }
        protected void BtnAddTransaction_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DataEntry/AddTransaction.aspx");
        }
        protected void BtnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/OpenPallet.aspx");
        }
    }
}