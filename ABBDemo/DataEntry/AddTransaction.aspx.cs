using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 @author Enrique Javier
 version: 1.0
 */
namespace ABBDemo
{
    public partial class AddTransaction : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["InventoryPDBConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //Labels
            lblSSO.Text = Session["UserSSO"] as string;
            lblFrom.Text = Session["From"] as string;
            lblTo.Text = Session["ToLocation"] as string;
            //TextBoxes(not visible)
            TextBoxSSO.Text = Session["User"] as string;
            TextBoxFrom.Text = Session["From"] as string;
            TextBoxTo.Text = Session["ToLocation"] as string;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (TextBoxTo.Text == "")
                {
                    TextBoxTo.Text = Session["ToLocation"] as string;
                }
                if (TextBoxFrom.Text == "")
                {
                    TextBoxFrom.Text = Session["From"] as string;
                }

                NewTransaction(DDLPartNumber.Text, TextBoxQuantity.Text, TextBoxFrom.Text, TextBoxTo.Text, TextBoxSSO.Text, Session["PalletId"].ToString());

                Response.Redirect("~/Views/CurrentPallet.aspx");
            }
        }
        protected void PrintTransaction_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string[] transaction = { DDLPartNumber.Text, TextBoxQuantity.Text, TextBoxFrom.Text, TextBoxTo.Text, TextBoxSSO.Text, Session["PalletId"].ToString() };
                Session["ctrl"] = transaction;
                ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('PrintData.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
            }
        }

        private void NewTransaction(string part, string quantity, string from, string to, string user, string Id)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["InventoryPDBConnectionString1"].ConnectionString);
            using (SqlCommand cmd = new SqlCommand("SP_NewTransaction", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PartNo", part);
                cmd.Parameters.AddWithValue("@Quantity", quantity);
                cmd.Parameters.AddWithValue("@FromLocation", from);
                cmd.Parameters.AddWithValue("@ToLocation", to);
                cmd.Parameters.AddWithValue("@UserSSO", user);
                cmd.Parameters.AddWithValue("@PalletId", Id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/CurrentPallet.aspx");
        }

        protected void TextBoxTo_TextChanged(object sender, EventArgs e)
        {

        }
    }
}