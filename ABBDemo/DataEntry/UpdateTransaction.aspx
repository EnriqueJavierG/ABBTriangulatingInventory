<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateTransaction.aspx.cs" Inherits="ABBDemo.UpdateTransaction" %>

<%@ Register Src="/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
    </style>
    <link rel="stylesheet" href="/ABBStyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div>

            <h1>Editing Transaction :<asp:Label ID="lblTransactionId" runat="server"></asp:Label>
                &nbsp;</h1>

        </div>
        <p class="auto-style1">
            UserSSO:
            <asp:Label ID="lblUserSSO" runat="server"></asp:Label>
            <asp:TextBox ID="TBUserSSO" runat="server" Visible="False"></asp:TextBox>
        </p>
        <p class="auto-style1">
            From:
            <asp:Label ID="lblFrom" runat="server"></asp:Label>
            <asp:TextBox ID="TBFrom" runat="server" Visible="False"></asp:TextBox>
        </p>
        <p class="auto-style1">
            To:
            <asp:Label ID="lblTo" runat="server"></asp:Label>
            <asp:TextBox ID="TBTo" runat="server" Visible="False"></asp:TextBox>
        </p>
        <p class="auto-style1">
            Part Number:
            <asp:DropDownList ID="DDLPartNumber" runat="server" DataSourceID="SqlDataSource1" DataTextField="strPartNumber" DataValueField="strPartNumber">
            </asp:DropDownList>
        </p>
        <p class="auto-style1">
            Quantity:
            <asp:TextBox ID="TBQuantity" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1">
            <asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="Update" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="BtnCancel" runat="server" OnClick="BtnCancel_Click" Text="Cancel" />
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SELECT [intPartId], [strPartNumber] FROM [tblPart]"></asp:SqlDataSource>
    </form>
</body>
</html>
