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
    public partial class LogIn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["InventoryPDBConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            LblWrong.Visible = false;
        }

        protected void BtnLogIn_Click(object sender, EventArgs e)
        {
            int Sucess = 0;
            if (Page.IsValid)
            {
                //Session["User"] = TBSSO.Text;
                // Session["Password"] = TBPassword.Text;
                using (SqlCommand cmd = new SqlCommand("SP_UserLogIn", con))
                {
                    con.Open();

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserSSO", TBSSO.Text);
                    cmd.Parameters.AddWithValue("@UserPassword", TBPassword.Text);
                    //User Role
                    cmd.Parameters.Add("@UserRoleId", SqlDbType.Int);
                    cmd.Parameters["@UserRoleId"].Direction = ParameterDirection.Output;
                    //User Name
                    cmd.Parameters.Add("@UserName", SqlDbType.VarChar, 20);
                    cmd.Parameters["@UserName"].Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("@sucess", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

                    cmd.ExecuteNonQuery();

                    var UserRole = cmd.Parameters["@UserRoleId"].Value;
                    var UserName = cmd.Parameters["@UserName"].Value.ToString();
                    Sucess =  int.Parse(cmd.Parameters["@sucess"].Value.ToString());

                    con.Close();
                    Session["UserRole"] = UserRole;
                    Session["UserName"] = UserName;
                    Session["UserSSO"] = TBSSO.Text;
                }
                if (Sucess == 1)
                {
                    if (Session["UserRole"] != null)
                    {
                        if (Session["UserRole"].Equals(2))
                        {
                            Response.Redirect("~/WorkArea.aspx");
                        }
                        else
                            Response.Redirect("~/Views/Default.aspx");
                    }
                }
                else if (Sucess == 2)
                {
                        LblWrong.Visible = true;   
                }
                else
                {

                }
            }
        }
    }
}