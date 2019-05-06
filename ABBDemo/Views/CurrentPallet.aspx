<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentPallet.aspx.cs" Inherits="ABBDemo.CurrentPallet" %>

<%@ Register Src="/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABB-Current Pallet</title>
    <link rel="stylesheet" href="/ABBStyleSheet.css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }

        .auto-style1 {
            width: 50%;
        }

        .auto-style2 {
            width: 37%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header ID="Header1" runat="server" />
        <%--==================================================================--%>
        <div>
            <h3>Pallet:
            <asp:Label ID="lblPalletId" runat="server"></asp:Label>
            </h3>
            <h3>Transaction Count:&nbsp;
            <asp:Label ID="lblCount" runat="server"></asp:Label>
            </h3>
            <%--==================================================================--%>
              <%-- Buttons--%>
            <p>
                 <asp:Button CssClass="button" ID="BtnPrintPallet" runat="server" Text="Print Pallet Number" OnClick="BtnPrintPalletNumber_Click" />
                <asp:Button CssClass="button" ID="BtnPrintReport" runat="server" Text="Print Pallet Report" Height="26px" OnClick="" />
            <asp:Button CssClass="button" ID="btnSubmitPallet" runat="server" Text="Submit Pallet" Height="26px" OnClick="btnSubmitPallet_Click" />
                </p>
    
            <asp:Button CssClass="button" ID="BtnAddTransaction" runat="server" OnClick="BtnAddTransaction_Click" Text="Add Transaction" />

            <asp:Button CssClass="button buttinb" ID="BtnExit" runat="server" OnClick="BtnExit_Click" Text="Exit" />

               <%-- /Buttons--%>
            <table>
                <tr>
                    <td>
                        <asp:Label CssClass="control-label" ID="LblSummary" runat="server" Text="Summary"></asp:Label>
                        <%--==================================================================--%>
                        <asp:GridView CssClass="grid" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" PageSize="5">
                            <Columns>
                                <asp:BoundField DataField="strPartNumber" HeaderText="Part Number" SortExpression="strPartNumber" />
                                <asp:BoundField DataField="Total Parts" HeaderText="Total Parts" ReadOnly="True" SortExpression="Total Parts" />
                                <asp:BoundField DataField="QTY" HeaderText="QTY" ReadOnly="True" SortExpression="QTY" />
                            </Columns>
                        </asp:GridView>
                    </td>
                    <%--==================================================================--%>

                    <%--==================================================================--%>
                    <td>
                        <asp:Label CssClass="control-label" ID="LblCurrent" runat="server" Text="All Transactions"></asp:Label>
                        <asp:GridView CssClass="grid" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="5">
                            <Columns>
                                <asp:BoundField DataField="strPartNumber" HeaderText="Part Number" SortExpression="strPartNumber" />
                                <asp:BoundField DataField="intQuantity" HeaderText="Quantity" SortExpression="intQuantity" />
                                <asp:BoundField DataField="fltUnitWeight" HeaderText="Unit Weight" SortExpression="fltUnitWeight" />
                                <asp:BoundField DataField="fltPricePerUnit" HeaderText="Price" SortExpression="fltPricePerUnit" />
                                <asp:BoundField DataField="strBuildingSiteName" HeaderText="From" SortExpression="strBuildingSiteName" />
                                <asp:BoundField DataField="strSiteShortName" HeaderText="To" SortExpression="strSiteShortName" />
                                <asp:BoundField DataField="dtDate" HeaderText="Date" SortExpression="dtDate" DataFormatString="{0:dd/MM/yyyy}" />
                            </Columns>
                        </asp:GridView>
                    </td>
                    <%--==================================================================--%>
                </tr>
            </table>
        </div>
        <%--==================================================================--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SP_TransactionByPalletView" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="PalletId" SessionField="PalletId" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="TransactionByPart" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="PalletId" SessionField="PalletId" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--==================================================================--%>
    </form>
</body>
</html>
