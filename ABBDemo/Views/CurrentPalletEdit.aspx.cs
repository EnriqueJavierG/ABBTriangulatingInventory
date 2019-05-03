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
    public partial class CurrentPalletEdit : System.Web.UI.Page
    {
        //Connection String
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["InventoryPDBConnectionString1"].ConnectionString);
        //Page load
        protected void Page_Load(object sender, EventArgs e)
        {
            var SessionPalletEdit = Session["PalletId"];
            lblPalletId.Text = SessionPalletEdit.ToString();
           
            
        }

        //Edit selected transaction
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            //Get the row selected
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int rowclicked = Convert.ToInt32(GridView1.Rows[index].Cells[0].Text);
                Session["FromLocation"] = GridView1.Rows[index].Cells[5].Text;
                Session["ToLocation"] = GridView1.Rows[index].Cells[6].Text;
                Session["TransactionToEdit"] = rowclicked;
                Response.Redirect("~/DataEntry/UpdateTransaction.aspx");
            }
        }

        //Add a new Transaction to the pallet
        protected void BtnAddTransaction_Click(object sender, EventArgs e)
        {
            Session["PalletId"] = Session["PalletToEdit"];
            
            Response.Redirect("AddTransaction.aspx");
        }
        //Submit finished pallet
        protected void BtnSubmit_Click(object sender, EventArgs e)
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
            Response.Redirect("PalletView.aspx");
        }
        //Exit current pallet without changing status
        protected void BtnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("OpenPallet.aspx");
        }
    }
}