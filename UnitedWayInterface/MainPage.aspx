<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="UnitedWayInterface.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                    United Way Email Supression Interface</p>
        </div>
        <p>
            Select Suppresions Needed</p>
        <p>
            &nbsp;</p>
        <p>
            <!-- drop down list made to select which suppresion category is to be ran -->
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SupressionDropDown" DataTextField="Category" DataValueField="sid" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
            </asp:DropDownList>
            <asp:SqlDataSource ID="SupressionDropDown" runat="server" ConnectionString="<%$ ConnectionStrings:UWPC_TestConnectionString2 %>" SelectCommand="SELECT * FROM [SupressionCategories] ORDER BY [sid]"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <!-- Check box created for the custom suppresion selection of the drop down menu-->
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="CustomSuppresionBoxes" DataTextField="SubCategory" DataValueField="ssid">
            </asp:CheckBoxList>
            <asp:SqlDataSource ID="CustomSuppresionBoxes" runat="server" ConnectionString="<%$ ConnectionStrings:UWPC_TestConnectionString2 %>" SelectCommand="SELECT ssid, SubCategory FROM SupressionSubCategories WHERE (sid = @sid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="sid" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <!-- Created for the preview of the list that will be exported to designated file location-->
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="GridViewFill" PageSize="25">
        </asp:GridView>
        <asp:SqlDataSource ID="GridViewFill" runat="server" ConnectionString="<%$ ConnectionStrings:UWPC_TestConnectionString2 %>" SelectCommand="splocal_ReturnCustomerList" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="4" Name="ListType" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="CustomSuppressionGrid" PageSize="25" Visible="False">
            <HeaderStyle BackColor="#CC0066" />
        </asp:GridView>
        <asp:SqlDataSource ID="CustomSuppressionGrid" runat="server" ConnectionString="<%$ ConnectionStrings:UWPC_TestConnectionString2 %>" SelectCommand="sp_local_CustomSuppression" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="ListType" SessionField="CustomSuppressionSession" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Update Grid" OnClick="Button1_Click" Enabled="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Export" />
        
    <br />
    </form>
</body>
</html>
