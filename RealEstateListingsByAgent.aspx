<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RealEstateListingsByAgent.aspx.vb" Inherits="RealEstateListingsByAgent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Real Estate Listings By Agent</title>
    </head>
<body>
    <form id="frmRealEstateListingsByAgent" runat="server">
    <center>
    <div>
    <asp:ImageButton ID="imgBanner" runat="server" ImageUrl="~/Images/FlipBanner.png" />
    </div>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:RealEstateDatabaseConnection %>" 
            ProviderName="<%$ ConnectionStrings:RealEstateDatabaseConnection.ProviderName %>" 
            
            SelectCommand="SELECT AgentID, [First Name] + ' ' + [Last Name] AS FirstLastName FROM Agents ORDER BY [Last Name]">
        </asp:SqlDataSource>
    </p>
    <p align="center">
        <asp:Label ID="Label1" runat="server" 
            Text="Choose an agent to see their available listings below"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataValueField="AgentID" DataTextField="FirstLastName"  >
        </asp:DropDownList>
    </p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:RealEstateDatabaseConnection %>" 
            ProviderName="<%$ ConnectionStrings:RealEstateDatabaseConnection.ProviderName %>" 
            
            
            SelectCommand="SELECT [State], [City], [Address], [Zip], [School District] AS School_District, [AskingPrice], [Taxes], [Number of Stories] AS Number_of_Stories, [Frame Type] AS Frame_Type, [Basement], [Heating Type] AS Heating_Type, [Central Air] AS Central_Air, [Picture] FROM [Listings] WHERE ([AgentID] = ?) ORDER BY [State]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="AgentID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                <asp:BoundField DataField="School_District" HeaderText="School_District" 
                    SortExpression="School_District" />
                <asp:BoundField DataField="AskingPrice" HeaderText="AskingPrice" 
                    SortExpression="AskingPrice" />
                <asp:BoundField DataField="Taxes" HeaderText="Taxes" SortExpression="Taxes" />
                <asp:BoundField DataField="Number_of_Stories" HeaderText="Number_of_Stories" 
                    SortExpression="Number_of_Stories" />
                <asp:BoundField DataField="Frame_Type" HeaderText="Frame_Type" 
                    SortExpression="Frame_Type" />
                <asp:CheckBoxField DataField="Basement" HeaderText="Basement" 
                    SortExpression="Basement" />
                <asp:BoundField DataField="Heating_Type" HeaderText="Heating_Type" 
                    SortExpression="Heating_Type" />
                <asp:BoundField DataField="Central_Air" HeaderText="Central_Air" 
                    SortExpression="Central_Air" />
                <asp:BoundField DataField="Picture" HeaderText="Picture" 
                    SortExpression="Picture" />
            </Columns>
        </asp:GridView>
    </p>
    </center>
    </form>
    </body>
</html>