using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABBDemo.Controls
{
    public partial class HeaderPrint : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var SessionUserRole = Session["UserRole"];
            
           
        }
    }
}