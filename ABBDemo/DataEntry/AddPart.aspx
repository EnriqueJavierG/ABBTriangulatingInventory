<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPart.aspx.cs" Inherits="ABBDemo.DataEntry.AddPart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TBPartNumber" runat="server" ></asp:TextBox>
            <asp:TextBox ID="TBCDE" runat="server"></asp:TextBox>
            <asp:TextBox ID="TBUnitWeight" runat="server"></asp:TextBox>
            <asp:TextBox ID="TBPrice" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
