using DevExpress.XtraPrinting.BarCode;
using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ABBDemo.DataEntry
{
    public partial class PrintData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //XRBarCode barcode = CreateCode93BarCode("Hello World");
            //System.Drawing.Image barImage = barcode.ToImage();
            //barImage.Save("/Images");


            barcode.Text = "";
            WebControl Grid = Set_Rows();

            Control ctrl = (Control)ToPrint;
            PrintHelper.PrintWebControl(ctrl);
        }


        private WebControl Set_Rows()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("Transaction Information", typeof(string)));
            dt.Columns.Add(new DataColumn(" ", typeof(string)));
            int counter = 0;
            foreach (string str in (string[])Session["ctrl"])
            {
                DataRow dr = null;

                dr = dt.NewRow();
                switch (counter)
                {
                    case 0:
                        dr["Transaction Information"] = "Part Number";
                        dr[" "] = str;
                        break;
                    case 1:
                        dr["Transaction Information"] = "Part QTY";
                        dr[" "] = str;
                        break;
                    case 2:
                        dr["Transaction Information"] = "From";
                        dr[" "] = str;
                        break;
                    case 3:
                        dr["Transaction Information"] = "To";
                        dr[" "] = str;
                        break;
                    case 4:
                        dr["Transaction Information"] = "Date";
                        dr[" "] = System.DateTime.Now.ToLongDateString();
                        break;
                    case 5:
                        dr["Transaction Information"] = "Is in Pallet ";
                        dr[" "] = str;
                        break;
                    default:
                        break;
                }


                dt.Rows.Add(dr);
                counter++;
                //dr = dt.NewRow();

                //Store the DataTable in ViewState

                ViewState["CurrentTable"] = dt;

                GridView1.DataSource = dt;

                GridView1.DataBind();

            }
            return GridView1;
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