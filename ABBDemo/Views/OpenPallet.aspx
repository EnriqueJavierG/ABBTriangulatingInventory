<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpenPallet.aspx.cs" Inherits="ABBDemo.OpenPallet" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open Pallet</title>
    <link rel="stylesheet" href="~/ABBStyleSheet.css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }
    </style>
</head>
<body style="font-family: 'Montserrat',sans-serif">
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div style="text-align: center">
            <div style="text-align: center; width: 50%; margin: 10px auto; text-align: left;">
                <h2>Created Pallets(Pallets to submit) </h2>
                <asp:GridView CssClass="grid" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="intPalletId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="intPalletId" HeaderText="PalletId" InsertVisible="False" ReadOnly="True" SortExpression="intPalletId" />
                        <asp:BoundField DataField="strBuildingSiteName" HeaderText="From" SortExpression="strBuildingSiteName" />
                        <asp:BoundField DataField="strSiteShortName" HeaderText="To" SortExpression="strSiteShortName" />
                        <asp:BoundField DataField="strUserName" HeaderText="Operator" SortExpression="strUserName" />
                        <asp:BoundField DataField="dtDate" HeaderText="Date" SortExpression="dtDate" DataFormatString="{0:dd/MM/yyyy} " />
                        <asp:CommandField SelectText="Continue" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:Button CssClass="button" ID="BtnAddPallet" runat="server" Text="Add Pallet" OnClick="BtnAddPallet_Click" />
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SP_CreatedPalletView" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="RoleId" SessionField="UserRole" Type="Int32" />
                <asp:SessionParameter Name="WorkingArea" SessionField="From" Type="String" Size="20" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
