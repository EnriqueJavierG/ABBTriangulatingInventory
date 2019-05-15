<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PartsView.aspx.cs" Inherits="ABBDemo.InventoryView1" %>

<%@ Register Src="~/Controls/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<%-- 
    @author Enrique Javier
    version: 1.0

--%>
<!DOCTYPE html>
<%--===========================================================--%>

<%--===========================================================--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Part List</title>
   <link rel="stylesheet" href="/ABBStyleSheet.css" />
    <style type="text/css">
        .auto-style1 {
            width: 25%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Header runat="server" />
        <div>
            <div style="text-align: center">
                <div style="margin: 0 auto; text-align: left;" class="auto-style1">
                    <h1>Part List </h1>
                        <dx:ASPxGridView CssClass="grid" ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="Metropolis">
                            <SettingsPager NumericButtonCount="3">
                            </SettingsPager>
                        <Settings ShowGroupPanel="True" />
                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                        <SettingsSearchPanel Visible="True" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="strPartNumber" caption="Part Number" VisibleIndex ="0" ShowInCustomizationForm="True" Name="Part Number">
                                <HeaderStyle BackColor="Gray" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="strCDE" caption="CDE" VisibleIndex="1" ShowInCustomizationForm="True" Name="CDE">
                                <HeaderStyle BackColor="Gray" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="fltUnitWeight" caption="Field Name" VisibleIndex="2" ShowInCustomizationForm="True" Name="Unit Weight">
                                <HeaderStyle BackColor="Gray" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        </dx:ASPxGridView>
                   
                    <%--===========================================================--%>
                    <%--Grid View Data--%>
                </div>
            </div>
        </div>
        <%--===========================================================--%>
        <%--Data source--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:InventoryPDBConnectionString1 %>" SelectCommand="SELECT [strPartNumber], [strCDE], [fltUnitWeight] FROM [tblPart]"></asp:SqlDataSource>
        <%--===========================================================--%>
    </form>
</body>
</html>
