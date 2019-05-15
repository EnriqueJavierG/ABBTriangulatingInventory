<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserView.aspx.cs" Inherits="ABBDemo.UserView" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB-Users</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <link rel="stylesheet" href="/ABBStyleSheet.css" />
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }

        .auto-style1 {
            width: 24%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div style="text-align: center">
            <div style="margin: 0 auto; text-align: left;" class="auto-style1">
                <h1>Users</h1>
                <asp:GridView CssClass="grid" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="SSO" HeaderText="SSO" SortExpression="SSO" />
                        <asp:BoundField DataField="Working Area" HeaderText="Working Area" SortExpression="Working Area" />
                        <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    </Columns>
                </asp:GridView>

                <asp:Button CssClass="button" ID="BtnAddUser" runat="server" OnClick="BtnAddUser_Click" Text="Add New User" />
                <br />
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="UserView" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>
</html>
