<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPallet.aspx.cs" Inherits="ABBDemo.AddPallet" %>

<%@ Register Src="/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB-Adding Pallet</title>
    <link rel="stylesheet" href="/ABBStyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div style="text-align: center">
            <h1>Adding Pallet</h1>
            <p>
                <asp:Label ID="lblFrom" runat="server" Text="From:  "></asp:Label>
                &nbsp;<asp:Label ID="LblFrom1" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;
                <asp:DropDownList ID="DropDownListFromLocation" runat="server" DataSourceID="SqlDataSource1" DataTextField="strBuildingSiteName" DataValueField="strBuildingSiteName" Visible="False">
                </asp:DropDownList>
            </p>
            <p>
                <asp:Label ID="lblTo" runat="server" Text="To:  "></asp:Label>
                <asp:DropDownList ID="DropDownListToLocation" runat="server" DataSourceID="SqlDataSource2" DataTextField="strSiteShortName" DataValueField="intSiteId" OnSelectedIndexChanged="DropDownListToLocation_SelectedIndexChanged">
                </asp:DropDownList>
            </p>
            <p>
                <asp:Button ID="btnSubmit" runat="server" OnClick="Button1_Click" Text="Submit" CssClass="button" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" CssClass="button" />
            </p>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SELECT [intBuildingSiteId], [strBuildingSiteName] FROM [tblBuildingSite]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SELECT [intSiteId], [strSiteShortName] FROM [tblSite]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
