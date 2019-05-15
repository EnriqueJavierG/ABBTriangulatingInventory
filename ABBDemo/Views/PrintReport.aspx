<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintReport.aspx.cs" Inherits="ABBDemo.Views.PrintReport" %>

<%@ Register assembly="DevExpress.XtraReports.v18.2.Web.WebForms, Version=18.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB-Report</title>
    <link rel="stylesheet" href="/ABBStyleSheet.css" />
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <img alt="ABB" src="../Images/logo.png" width="120" height="40" /><span class="auto-style1"> Industrial Connections and Solutions</span>
            <p>980 Ave. San Luis Arecibo P.R. 00685</p>
            <asp:Label ID="LblDatePurchase" runat="server" Text="Date: "></asp:Label>
            <asp:Label ID="LblDate" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Sold To: "></asp:Label>
            <asp:Label ID="LblSoldTo" runat="server" Text=""></asp:Label>
            &nbsp;&nbsp;&nbsp;
            Ship To:<asp:Label ID="LblSoldTo1" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="DM:A   "></asp:Label>
            <asp:Label ID="LblDM" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Label ID="LblPacker" runat="server" Text="Packer: "></asp:Label>
            <asp:Label ID="LblPackerName" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="LblBin" runat="server" Text="Number of Bins:"></asp:Label>
            <asp:Label ID="LblIntBin" runat="server" Text=""></asp:Label>
            <asp:GridView CssClass="grid" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="strPartNumber" HeaderText="Part Number" SortExpression="strPartNumber" />
                    <asp:BoundField DataField="Total Parts" HeaderText="Total Parts" SortExpression="Total Parts" ReadOnly="True" />
                    <asp:BoundField DataField="QTY" HeaderText="Bins" SortExpression="QTY" ReadOnly="True" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Signature: "></asp:Label>

            ______________________&nbsp;<br />
            <asp:Label ID="Label3" runat="server" Text="Date: "></asp:Label>

            ____/_____/_____</div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString %>" SelectCommand="TransactionByPart" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="PalletId" SessionField="PalletId" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
