<%-- 
    @author Enrique Javier
    version: 1.0

--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ABBDemo.Default" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB-Home</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <link rel="stylesheet" href="/ABBStyleSheet.css" />
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }
    </style>
</head>
<body>
    <%-- ========================================================== --%>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <div style="font-family: 'Montserrat',sans-serif">
            <div style="text-align: center">
                <h1>Welcome to ABB Inventory Transaction App! </h1>

            </div>
            <%-- ========================================================== --%>
            <asp:GridView CssClass="grid" ID="GridView1" runat="server"></asp:GridView>
            <div style="text-align: center">
                <div style="width: 30%; margin: 0 auto; text-align: left;">
                    <%-- ========================================================== --%>
                    <asp:Label Visible="false" ID="Label1" runat="server" Text="Latest Transactions in Fab"></asp:Label>
                    <asp:GridView Visible="false" CssClass="grid" ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="intTransactionId" DataSourceID="SqlDataSource1" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="strPartNumber" HeaderText="Part #" SortExpression="strPartNumber" />
                            <asp:BoundField DataField="intQuantity" HeaderText="Parts" SortExpression="intQuantity" />
                            <asp:BoundField DataField="fltPricePerUnit" HeaderText="Price" SortExpression="fltPricePerUnit" />
                            <asp:BoundField DataField="strBuildingSiteName" HeaderText="From" SortExpression="strBuildingSiteName" />
                            <asp:BoundField DataField="strSiteShortName" HeaderText="To" SortExpression="strSiteShortName" />
                            <asp:BoundField DataField="dtDate" HeaderText="Date" SortExpression="dtDate" DataFormatString="{0:dd/MM/yyyy}" />
                        </Columns>
                        <PagerSettings PageButtonCount="1" Visible="False" />
                    </asp:GridView>
                </div>
            </div>
            <p>
            </p>
            <div style="text-align: center">
                <div style="width: 50%; margin: 0 auto; text-align: left;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label Visible="false" ID="Label2" runat="server" Text="Latest Transactions in Plat-in"></asp:Label>
                                <asp:GridView Visible="false" CssClass="grid" ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="intTransactionId" DataSourceID="SqlDataSource2" PageSize="5">
                                    <Columns>
                                        <asp:BoundField DataField="strPartNumber" HeaderText="Part #" SortExpression="strPartNumber" />
                                        <asp:BoundField DataField="intQuantity" HeaderText="Parts" SortExpression="intQuantity" />
                                        <asp:BoundField DataField="fltPricePerUnit" HeaderText="Price" SortExpression="fltPricePerUnit" />
                                        <asp:BoundField DataField="strBuildingSiteName" HeaderText="From" SortExpression="strBuildingSiteName" />
                                        <asp:BoundField DataField="strSiteShortName" HeaderText="To" SortExpression="strSiteShortName" />
                                        <asp:BoundField DataField="dtDate" HeaderText="Date" SortExpression="dtDate" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <td>
                                <asp:Label Visible="false" ID="LblPlatOut" runat="server" Text="Latest Transactions in Plat-out"></asp:Label>
                                <asp:GridView Visible="false" CssClass="grid" ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="intTransactionId" DataSourceID="SqlDataSource3">
                                    <Columns>
                                        <asp:BoundField DataField="strPartNumber" HeaderText="Part #" SortExpression="strPartNumber" />
                                        <asp:BoundField DataField="intQuantity" HeaderText="Parts" SortExpression="intQuantity" />
                                        <asp:BoundField DataField="fltPricePerUnit" HeaderText="Price" SortExpression="fltPricePerUnit" />
                                        <asp:BoundField DataField="strBuildingSiteName" HeaderText="From" SortExpression="strBuildingSiteName" />
                                        <asp:BoundField DataField="strSiteShortName" HeaderText="To" SortExpression="strSiteShortName" />
                                        <asp:BoundField DataField="dtDate" HeaderText="Date" SortExpression="dtDate" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SP_FabTransactionView" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SP_PlateInTransactionView" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SP_PlateOutTransactionView" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </form>
</body>
</html>
