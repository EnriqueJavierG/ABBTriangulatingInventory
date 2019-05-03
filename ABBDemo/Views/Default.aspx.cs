using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Printing;
using DevExpress.XtraPrinting.BarCode;
using DevExpress.XtraReports.UI;
using DevExpress.XtraEditors;

namespace ABBDemo
{
    public partial class Default : System.Web.UI.Page
    {
        public DateTime today = DateTime.Now.Date;
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblDate.Text = today.ToShortDateString();
            //lblTime.Text = DateTime.Now.ToShortTimeString();
            XRBarCode barcode = CreateCode93BarCode("Hello World");
          
            if (Session["UserRole"].Equals(1))
            {
                LblPlatOut.Visible = true;
                Label1.Visible = true;
                Label2.Visible = true;
                GridView2.Visible = true;
                GridView3.Visible = true;
                GridView4.Visible = true;
            }
            else
            {
                //WorkArea-Show only the Grid from respective area
                switch (Session["From"])
                {
                    case "Fab":
                        GridView2.Visible = true;
                        Label1.Visible = true;
                        break;
                    case "Plat-in":
                        GridView3.Visible = true;
                        Label2.Visible = true;
                        break;
                    case "Plat-out":
                        GridView4.Visible = true;
                        LblPlatOut.Visible = true;
                        break;
                    default:
                        break;
                }
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Session["ctrl"] = GridView2;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
        }

        public XRBarCode CreateCode93BarCode(string BarCodeText)
        {
            // Create a bar code control. 
            XRBarCode barCode = new XRBarCode();

            // Set the bar code's type to Code 93. 
            barCode.Symbology = new Code93Generator();

            // Adjust the bar code's main properties. 
            barCode.Text = BarCodeText;
            barCode.Width = 400;
            barCode.Height = 100;

            // Adjust the properties specific to the bar code type. 
            ((Code93Generator)barCode.Symbology).CalcCheckSum = false;

            return barCode;
        }

     
    }
}