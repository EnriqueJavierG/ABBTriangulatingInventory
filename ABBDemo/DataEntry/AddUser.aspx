<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="ABBDemo.AddUser" %>

<%@ Register Src="/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB - Add User</title>
     <link rel="stylesheet" href="/ABBStyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <h1>Add User
        </h1>
        <p>
            <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TBUserName" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="lblUserSSO" runat="server" Text="User SSO"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TBUserSSO" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TBUserPassword" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="lblBuilding" runat="server" Text="Working Area"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DDLWorkingArea" runat="server" DataSourceID="SqlDataSource1" DataTextField="strBuildingSiteName" DataValueField="strBuildingSiteName">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="lblRole" runat="server" Text="Role"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DDLRole" runat="server" DataSourceID="SqlDataSource2" DataTextField="strUserRoleName" DataValueField="strUserRoleName">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Button ID="BtnSubmit" runat="server" OnClick="BtnSubmit_Click" Text="Submit" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="BtnCancel" runat="server" OnClick="BtnCancel_Click" Text="Cancel" />
        </p>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SELECT [strBuildingSiteName] FROM [tblBuildingSite]"></asp:SqlDataSource>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SELECT [strUserRoleName] FROM [tblUserRole]"></asp:SqlDataSource>
    </form>
</body>
</html>
