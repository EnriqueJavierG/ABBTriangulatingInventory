<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkArea.aspx.cs" Inherits="ABBDemo.WorkArea" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="ABBStyleSheet.css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div style="text-align:center">
             <h2>Where are you working from?</h2>
            <asp:Button ID="BtnFab" runat="server" Text="Fab" CssClass="button" OnClick="BtnFab_Click" />
            <asp:Button ID="BtnPlat1" runat="server" Text="Plat-in" CssClass="button" OnClick="BtnPlat1_Click" />
            <asp:Button ID="BtnPlat2" runat="server" Text="Plat-out" CssClass="button" OnClick="BtnPlat2_Click" />
        </div>
    </form>
</body>
</html>
