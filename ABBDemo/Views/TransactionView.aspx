<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionView.aspx.cs" Inherits="ABBDemo.TransactionView" %>

<%@ Register Src="/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%-- 
    @author Enrique Javier
    version: 1.0

--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB-Transaction List</title>
    <link rel="stylesheet" href="/ABBStyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div style="text-align: center">
            <div style="width: 50%; margin: 0 auto; text-align: left;">
                <h1>Transaction List </h1>
                <asp:GridView CssClass="grid" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="intTransactionId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="strPartNumber" HeaderText="Part Number" SortExpression="strPartNumber" />
                        <asp:BoundField DataField="intQuantity" HeaderText="Quantity" SortExpression="intQuantity" />
                        <asp:BoundField DataField="fltUnitWeight" HeaderText="Unit Weight" SortExpression="fltUnitWeight" />
                        <asp:BoundField DataField="fltPricePerUnit" HeaderText="Price" SortExpression="fltPricePerUnit" />
                        <asp:BoundField DataField="strBuildingSiteName" HeaderText="From" SortExpression="strBuildingSiteName" />
                        <asp:BoundField DataField="strSiteShortName" HeaderText="To" SortExpression="strSiteShortName" />
                        <asp:BoundField DataField="dtDate" DataFormatString="{0:dd/MM/yyyy} " HeaderText="Date" SortExpression="dtDate" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" DeleteCommand="DELETE FROM [tblTransactions] WHERE [intTransactionId] = @intTransactionId"
            InsertCommand="INSERT INTO [tblTransactions] ([intUserId], [intPartId], [intQuantity], [intSiteId], [dtDate]) VALUES (@intUserId, @intPartId, @intQuantity, @intSiteId, @dtDate)"
            SelectCommand="SELECT tblTransaction.intTransactionId, tblPart.strPartNumber, tblTransaction.intQuantity, tblTransaction.fltPricePerUnit, tblBuildingSite.strBuildingSiteName, tblSite.strSiteShortName, tblTransaction.dtDate, tblTransaction.fltUnitWeight FROM tblTransaction INNER JOIN tblPart ON tblTransaction.intPartId = tblPart.intPartId INNER JOIN tblBuildingSite ON tblTransaction.intBuildingSiteId = tblBuildingSite.intBuildingSiteId INNER JOIN tblSite ON tblTransaction.intSiteId = tblSite.intSiteId"
            UpdateCommand="UPDATE [tblTransactions] SET [intUserId] = @intUserId, [intPartId] = @intPartId, [intQuantity] = @intQuantity, [intSiteId] = @intSiteId, [dtDate] = @dtDate WHERE [intTransactionId] = @intTransactionId">
            <DeleteParameters>
                <asp:Parameter Name="intTransactionId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="intUserId" Type="Int32" />
                <asp:Parameter Name="intPartId" Type="Int32" />
                <asp:Parameter Name="intQuantity" Type="Int32" />
                <asp:Parameter Name="intSiteId" Type="Int32" />
                <asp:Parameter Name="dtDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="intUserId" Type="Int32" />
                <asp:Parameter Name="intPartId" Type="Int32" />
                <asp:Parameter Name="intQuantity" Type="Int32" />
                <asp:Parameter Name="intSiteId" Type="Int32" />
                <asp:Parameter Name="dtDate" Type="DateTime" />
                <asp:Parameter Name="intTransactionId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
