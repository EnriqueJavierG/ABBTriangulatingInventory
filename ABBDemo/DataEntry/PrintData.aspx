<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintData.aspx.cs" Inherits="ABBDemo.DataEntry.PrintData" %>

<%@ Register Src="/Controls/HeaderPrint.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB Print Transaction</title>
      <link rel="stylesheet" href="/ABBStyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="ToPrint" runat="server">
            <img alt="ABB" src="/Images/logo.png" width="120" height="40" />
            <br />
            &nbsp;

          
            <div style="text-align:center">
                <asp:GridView CssClass="grid" ID="GridView1" runat="server"></asp:GridView>
            </div>        
            <asp:Label ID="barcode" runat="server" CssClass="barcode"></asp:Label>
        </asp:Panel>
    </form>
</body>
</html>
