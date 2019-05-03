using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABBDemo
{
    public partial class Print : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PalletNumber.Text = Session["PalletId"] as string;
            Control ctrl = (Control) ToPrintPalletNumber;
            PrintHelper.PrintWebControl(ctrl);
        }
    }
}