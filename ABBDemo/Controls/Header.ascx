<%-- 
    @author Enrique Javier
    @ version : 1.0
--%>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="ABBDemo.Controls.Header" %>


<asp:Panel ID="Panel1" runat="server">
    <%--===========================================================--%>
    <%--Header style--%>
    <header>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    </header>
    <style>
        body {
            margin: 0;
            font-family: 'Montserrat', sans-serif;
        }

        .header {
            overflow: hidden;
            background-color: white;
            padding: 15px 10px;
            box-shadow: 0px 4px 4px -4px gray;
            z-index: 1;
            position: relative;
            -webkit-transition: color 2s;
        }

            .header a:hover {
              border-bottom: 1px solid red;
              padding-bottom: 3px;
              border-bottom-width: 3px;
              border-bottom-style: solid;

            }

        h1 a:hover {
            color: red;
            cursor: pointer;
        }

        .header-right {
            float: right;
        }

            .header-right a:hover {
                color: red;
            }

        .header a {
            float: left;
            color: black;
            text-align: center;
            padding: 12px;
            text-decoration: none;
            font-size: 25px;
            line-height: 25px;
            border-radius: 4px;
        }
    </style>
    <%--===========================================================--%>
    <div class="header">
        <%--images--%>
        <img alt="ABB" src="../Images/logo.png" width="120" height="40" />
        <%--===========================================================--%>
        <%-- All the hyperlinks in the menu--%>
        <div class="header-right ">
            <asp:HyperLink ID="HLDefault" runat="server" href="../Views/Default.aspx" Style="color: #767575">Home</asp:HyperLink>
            <asp:HyperLink ID="HLPartView" runat="server" href="../Views/PartsView.aspx" Style="color: #767575">Part List</asp:HyperLink>
            <asp:HyperLink ID="HLAllPallets" runat="server" href="../Views/PalletView.aspx" Style="color: #767575" Visible="false">All Pallet</asp:HyperLink>
            <asp:HyperLink ID="HLOpenPallet" runat="server" href="../Views/OpenPallet.aspx" Style="color: #767575">Open Pallet</asp:HyperLink>
            <asp:HyperLink ID="HyperLink1" runat="server" href="../Views/TransactionView.aspx" Style="color: #767575" Visible="false">All Transactions</asp:HyperLink>
            <asp:HyperLink ID="HLUserView" runat="server" href="../Views/UserView.aspx" Style="color: #767575" Visible="false">Users</asp:HyperLink>
        </div>
    </div>
</asp:Panel>

