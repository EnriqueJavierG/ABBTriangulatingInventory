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
    public partial class AddUser : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["InventoryPDBConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand("CreateUser", con)) {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", TBUserName.Text);
                cmd.Parameters.AddWithValue("@UserSSO", TBUserSSO.Text);
                cmd.Parameters.AddWithValue("@UserPassword", TBUserPassword.Text);
                cmd.Parameters.AddWithValue("@UserWorkingSite", DDLWorkingArea.SelectedValue);
                cmd.Parameters.AddWithValue("@UserRole", DDLRole.SelectedValue);
                //========================================================
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/Views/Default.aspx");

            }
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Default.aspx");
        }
    }
}