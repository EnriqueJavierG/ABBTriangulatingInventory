<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PalletView.aspx.cs" Inherits="ABBDemo.PalletView" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pallet List</title>
    <link rel="stylesheet" href="/ABBStyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div style="text-align: center">
            <div style="width: 50%; margin: 0 auto; text-align: center;">
                <h1>Pallet List </h1>

                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:GridView CssClass="grid" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="intPalletId" DataSourceID="SqlDataSource1" AllowPaging="True" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                 <Columns>
                     <asp:BoundField DataField="intPalletId" HeaderText="Pallet Id" InsertVisible="False" ReadOnly="True" SortExpression="intPalletId" />
                     <asp:BoundField DataField="strBuildingSiteName" HeaderText="From" SortExpression="strBuildingSiteName" />
                     <asp:BoundField DataField="strSiteShortName" HeaderText="To" SortExpression="strSiteShortName" />
                     <asp:BoundField DataField="intBinQuantity" HeaderText="Bin Quantity" SortExpression="intBinQuantity" />
                     <asp:BoundField DataField="strUserName" HeaderText="Submitted By" SortExpression="strUserName" />
                     <asp:BoundField DataField="dtDate" HeaderText="Date" SortExpression="dtDate" DataFormatString="{0:dd/MM/yyyy} " />
                     <asp:CommandField SelectText="View" ShowSelectButton="True" />
                 </Columns>
             </asp:GridView>
                </p>
                <p>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddPallet.aspx">Add New Pallet</asp:HyperLink>
                </p>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SP_PalletView" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>
</html>
