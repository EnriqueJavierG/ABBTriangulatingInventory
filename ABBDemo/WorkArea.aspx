<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkArea.aspx.cs" Inherits="ABBDemo.WorkArea" %>


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
     
        <div style="text-align:center">
             <h2>Where are you working from?</h2>
            <asp:Button ID="BtnFab" runat="server" Text="Fab" CssClass="button" OnClick="BtnFab_Click" />
            <asp:Button ID="BtnPlat1" runat="server" Text="Plating" CssClass="button" OnClick="BtnPlat1_Click" />
           
        </div>
    </form>
</body>
</html>
