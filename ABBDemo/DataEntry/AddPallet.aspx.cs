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
    public partial class AddPallet : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["InventoryPDBConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !Session["UserRole"].Equals(1))
            {
                LblFrom1.Text = Session["From"] as string;
                // DropDownListFromLocation.SelectedValue = Session["From"] as string;
            }


            if (Session["UserRole"].Equals(1))
            {
                DropDownListFromLocation.Visible = true;
                LblFrom1.Visible = false;
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //Submit button
        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("SP_NewPallet", con))
            {

                cmd.CommandType = CommandType.StoredProcedure;

                if (!Session["UserRole"].Equals(1))
                {
                    cmd.Parameters.AddWithValue("@FromLocation", Session["from"]);
                }
                else cmd.Parameters.AddWithValue("@FromLocation", DropDownListFromLocation.SelectedValue.ToString());
                //  cmd.Parameters.AddWithValue("@FromLocation", DropDownListFromLocation.SelectedValue);
                //cmd.Parameters.AddWithValue("@FromLocation", DropDownListFromLocation.SelectedValue);

                cmd.Parameters.AddWithValue("@UserSSO", Session["UserSSO"]);

                cmd.Parameters.AddWithValue("@ToLocationId", DropDownListToLocation.SelectedValue.ToString());

                //Returning the pallet Id that was created in the server

                cmd.Parameters.Add("@PalletId", SqlDbType.BigInt);
                cmd.Parameters["@PalletId"].Direction = ParameterDirection.Output;


                // SqlParameter returnParameter = cmd.Parameters.Add("@PalletId", SqlDbType.BigInt);

                con.Open();
                cmd.ExecuteNonQuery();

                //Session variables
                // Session["FromLocation"] = DropDownListFromLocation.SelectedItem.Text;

                Session["ToLocation"] = DropDownListToLocation.SelectedItem.Text;

                Session["PalletId"] = cmd.Parameters["@PalletId"].Value.ToString();

                con.Close();

                Response.Redirect("~/Views/CurrentPallet.aspx");


            }

        }

        protected void DropDownListToLocation_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //Cancel button
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Default.aspx");
        }
    }
}