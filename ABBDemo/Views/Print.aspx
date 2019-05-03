<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Print.aspx.cs" Inherits="ABBDemo.Print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <asp:Panel ID="ToPrintPalletNumber" runat="server">
               <h1>
                   Pallet
                   <asp:Label ID="PalletNumber" runat="server" Text=""></asp:Label>
               </h1>
           </asp:Panel>
        </div>
    </form>
</body>
</html>
