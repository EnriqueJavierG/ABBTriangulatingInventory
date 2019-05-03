<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTransaction.aspx.cs" Inherits="ABBDemo.AddTransaction" %>

<%@ Register Src="/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%-- 
    @author Enrique Javier
    version: 1.0

--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB Inventory - Transaction - </title>
    <link rel="stylesheet" href="/ABBStyleSheet.css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }

        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: red;
            color: white; /*  box-shadow: 0 5px 0 darkred; looks cool but does not meet abb branding requirements*/
            ;
            padding: 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            font-weight: bold;
            margin-left: 10px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 10px;
            position: relative;
            text-transform: uppercase;
            left: 1px;
            top: 2px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div style="text-align: center">
            <h1>Adding Transaction</h1>
            &nbsp;<p>
                User SSO:
            <asp:Label ID="lblSSO" runat="server" Text=""></asp:Label>

                &nbsp;<asp:TextBox ID="TextBoxSSO" runat="server" Visible="False"></asp:TextBox>

            </p>
            <p>
                From:
             <asp:Label ID="lblFrom" runat="server"></asp:Label>

                &nbsp;<asp:TextBox ID="TextBoxFrom" runat="server" Visible="False"></asp:TextBox>

            </p>
            <p>
                To:
             <asp:Label ID="lblTo" runat="server"></asp:Label>

                <asp:TextBox ID="TextBoxTo" runat="server" Visible="False" OnTextChanged="TextBoxTo_TextChanged"></asp:TextBox>

            </p>

            <p>
                Part Number
                    <asp:DropDownList CssClass="label-wrapper" ID="DDLPartNumber" runat="server" DataSourceID="SqlDataSource3" DataTextField="strPartNumber" DataValueField="strPartNumber">
                    </asp:DropDownList>
            </p>

            <p>
                Quantity
            <asp:TextBox ID="TextBoxQuantity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This cannot be empty" ControlToValidate="TextBoxQuantity" EnableClientScript="false"></asp:RequiredFieldValidator>

                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be an integer greater than zero" Type="Integer" MinimumValue="1" MaximumValue="10000" ControlToValidate="TextBoxQuantity" EnableClientScript="false"></asp:RangeValidator>
            </p>
            <p>
                <asp:Button CssClass="auto-style1" ID="PrintButton" runat="server" Text="Print Transaction " OnClick="PrintTransaction_Click" />

            </p>
            <p>
                &nbsp;<asp:Button CssClass="button" ID="btnSubmit" runat="server" Text="Submit" OnClick="Submit_Click" />
                &nbsp;&nbsp;&nbsp;
             <asp:Button CssClass="button" ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />
            </p>
        </div>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SELECT [intPartId], [strPartNumber] FROM [tblPart]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SELECT [intLineId], [strLineType] FROM [tblLineType]"></asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
