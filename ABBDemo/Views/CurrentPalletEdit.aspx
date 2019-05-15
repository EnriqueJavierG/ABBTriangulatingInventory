<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentPalletEdit.aspx.cs" Inherits="ABBDemo.CurrentPalletEdit" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pallet Edit</title>
     <link rel="stylesheet" href="/ABBStyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <h1>Pallet Id:
                <asp:Label ID="lblPalletId" runat="server"></asp:Label>
            </h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView2_RowCommand">
                <Columns>
                    <asp:BoundField DataField="intTransactionId" HeaderText="Transaction Id" SortExpression="intTransactionId" />
                    <asp:BoundField DataField="strPartNumber" HeaderText="Part Number" SortExpression="strPartNumber" />
                    <asp:BoundField DataField="intQuantity" HeaderText="Quantitiy" SortExpression="intQuantity" />
                    <asp:BoundField DataField="fltUnitWeight" HeaderText="Unit Weight" SortExpression="fltUnitWeight" />
                    <asp:BoundField DataField="fltPricePerUnit" HeaderText="Price" SortExpression="fltPricePerUnit" />
                    <asp:BoundField DataField="strBuildingSiteName" HeaderText="From" SortExpression="strBuildingSiteName" />
                    <asp:BoundField DataField="strSiteShortName" HeaderText="To" SortExpression="strSiteShortName" />
                    <asp:BoundField DataField="dtDate" DataFormatString="{0:dd/MM/yyyy} " HeaderText="Date" SortExpression="dtDate" />
                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>

            <p>
                <asp:Button ID="BtnAddTransaction" runat="server" OnClick="BtnAddTransaction_Click" Text="Add Transaction" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnExit" runat="server" OnClick="BtnExit_Click" Text="Exit" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="Submit Pallet" Height="26px" />
                <br />
            </p>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SP_TransactionByPalletView" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="PalletId" SessionField="PalletId" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
