using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABBDemo.Controls
{
    public partial class Header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var SessionUserRole = Session["UserRole"];
            
            //Admin Access Privilages
            if (Session["UserRole"].Equals(1))
            {
                HLUserView.Visible = true;
                HLAllPallets.Visible = true;
                HyperLink1.Visible = true; // This hyperlink is for the transactions 
            }
        }
    }
}