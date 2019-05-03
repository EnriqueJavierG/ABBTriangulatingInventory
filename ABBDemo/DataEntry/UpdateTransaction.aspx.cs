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
    public partial class UpdateTransaction : System.Web.UI.Page
    {

        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["InventoryPDBConnectionString1"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                var TransactionToEdit = Session["TransactionToEdit"];
                lblTransactionId.Text = TransactionToEdit.ToString();

                using (SqlCommand cmd = new SqlCommand("SP_SearchTransaction", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    cmd.Parameters.AddWithValue("@TransactionId", Session["TransactionToEdit"]);

                    cmd.Parameters.Add("@SearchPartNo", SqlDbType.VarChar, 20);
                    cmd.Parameters["@SearchPartNo"].Direction = ParameterDirection.Output;

                    cmd.Parameters.Add("@SearchUnitWeight", SqlDbType.Float);
                    cmd.Parameters["@SearchUnitWeight"].Direction = ParameterDirection.Output;

                    cmd.Parameters.Add("@SearchPrice", SqlDbType.Float);
                    cmd.Parameters["@SearchPrice"].Direction = ParameterDirection.Output;

                    cmd.Parameters.Add("@SearchQuantity", SqlDbType.Int);
                    cmd.Parameters["@SearchQuantity"].Direction = ParameterDirection.Output;

                    cmd.Parameters.Add("@SearchFromLocation", SqlDbType.VarChar, 20);
                    cmd.Parameters["@SearchFromLocation"].Direction = ParameterDirection.Output;

                    cmd.Parameters.Add("@SearchToLocation", SqlDbType.VarChar, 20);
                    cmd.Parameters["@SearchToLocation"].Direction = ParameterDirection.Output;

                    cmd.Parameters.Add("@SearchUserSSO", SqlDbType.VarChar, 10);
                    cmd.Parameters["@SearchUserSSO"].Direction = ParameterDirection.Output;


                    //Example of past implementation
                    //cmd.Parameters.Add("@PalletId", SqlDbType.BigInt);
                    //cmd.Parameters["@PalletId"].Direction = ParameterDirection.Output;
                    //Session["PalletId"] = cmd.Parameters["@PalletId"].Value.ToString();

                    cmd.ExecuteNonQuery();

                    //Display data in textboxes
                    TBTo.Text = cmd.Parameters["@SearchToLocation"].Value.ToString();
                    TBFrom.Text = cmd.Parameters["@SearchFromLocation"].Value.ToString();
                    TBQuantity.Text = cmd.Parameters["@SearchQuantity"].Value.ToString();
                    TBUserSSO.Text = cmd.Parameters["@SearchUserSSO"].Value.ToString();
                    DDLPartNumber.SelectedValue = cmd.Parameters["@SearchPartNo"].Value.ToString();

                    lblFrom.Text = TBFrom.Text;
                    lblTo.Text = TBTo.Text;
                    lblUserSSO.Text = TBUserSSO.Text;

                    con.Close();
                }
            }
        }


        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("SP_UpdateTransaction", con))
            {

                cmd.CommandType = CommandType.StoredProcedure;
                //============================================================
                cmd.Parameters.AddWithValue("@TransactionId", Session["TransactionToEdit"]);
                //============================================================
                cmd.Parameters.AddWithValue("@PartNo",DDLPartNumber.SelectedValue);
                cmd.Parameters.AddWithValue("@Quantity",TBQuantity.Text);
                cmd.Parameters.AddWithValue("@FromLocation",TBFrom.Text);
                cmd.Parameters.AddWithValue("@ToLocation",TBTo.Text);
                cmd.Parameters.AddWithValue("@UserSSO",TBUserSSO.Text);
                //=============================================================
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/Views/currentPallet.aspx");
            }
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/currentPallet.aspx");
        }
    }
}