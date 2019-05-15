using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABBDemo.Views
{
    public partial class PrintReport : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["InventoryPDBConnectionString1"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            LblIntBin.Text = Session["Count"] as  string;
            LblPackerName.Text = Session["UserName"] as string;
            LblDM.Text = Session["PalletId"] as string; 
            

        }
    }
}