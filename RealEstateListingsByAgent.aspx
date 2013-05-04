<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RealEstateListingsByAgent.aspx.vb" Inherits="RealEstateListingsByAgent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Real Estate Listings By Agent</title>
    </head>
<body>
    <form id="frmRealEstateListingsByAgent" runat="server">
    <center>
    <div>
    <asp:ImageButton ID="imgBanner" runat="server" ImageUrl="~/Images/FlipBanner.png" />
    </div>
    <p>
        <asp:SqlDataSource ID="dsListAgents" runat="server"
            ConnectionString="<%$ ConnectionStrings:RealEstateDatabaseConnection %>"
            ProviderName="<%$ ConnectionStrings:RealEstateDatabaseConnection.ProviderName %>"
            SelectCommand="SELECT AgentID, [First Name] + ' ' + [Last Name] AS FirstLastName FROM Agents ORDER BY [Last Name]">
        </asp:SqlDataSource>
    </p>
    <p align="center">
        <asp:Label ID="lblChooseAgent" runat="server" 
            Text="Choose an agent to see their available listings below"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="ddlAgent" runat="server" AutoPostBack="True"
            DataSourceID="dsListAgents" DataValueField="AgentID" DataTextField="FirstLastName"  >
        </asp:DropDownList>
    </p>
        <asp:SqlDataSource ID="dsListByAgent" runat="server"
            ConnectionString="<%$ ConnectionStrings:RealEstateDatabaseConnection %>"
            ProviderName="<%$ ConnectionStrings:RealEstateDatabaseConnection.ProviderName %>"
            SelectCommand="SELECT [State], [City], [Address], [Zip], [School District] AS School_District, [AskingPrice], [Taxes], [Number of Stories] AS Number_of_Stories, [Frame Type] AS Frame_Type, [Basement], [Heating Type] AS Heating_Type, [Central Air] AS Central_Air, [Picture] FROM [Listings] WHERE ([AgentID] = ?) ORDER BY [State]">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAgent" Name="AgentID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    <p>
        <asp:GridView ID="gvListByAgent" runat="server" AutoGenerateColumns="False" 
            DataSourceID="dsListByAgent" AllowSorting="True"  
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
            <asp:TemplateField HeaderText="Picture" SortExpression="Picture" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Image ID="imgListingPic" runat="server" Height="35%" Width="35%"
                            ImageUrl='<%# "~/Images/HousePics/" + Eval("Picture")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtListPic" runat="server" Text='<%# Bind("Picture")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />               
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" 
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" >

                </asp:BoundField>
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" 
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" >              

                </asp:BoundField>
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" 
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">

                </asp:BoundField>
                <asp:BoundField DataField="Frame_Type" HeaderText="Frame_Type" 
                    SortExpression="Frame_Type" HeaderStyle-HorizontalAlign="Center" 
                    HeaderStyle-VerticalAlign="Middle" >

                </asp:BoundField>
                <asp:CheckBoxField DataField="Basement" HeaderText="Basement" 
                    SortExpression="Basement" HeaderStyle-HorizontalAlign="Center" 
                    HeaderStyle-VerticalAlign="Middle" >

                </asp:CheckBoxField>
                <asp:BoundField DataField="Heating_Type" HeaderText="Heating_Type" 
                    SortExpression="Heating_Type" HeaderStyle-HorizontalAlign="Center" 
                    HeaderStyle-VerticalAlign="Middle" >

                </asp:BoundField>
                <asp:BoundField DataField="Central_Air" HeaderText="Central_Air" 
                    SortExpression="Central_Air" HeaderStyle-HorizontalAlign="Center" 
                    HeaderStyle-VerticalAlign="Middle" >

                </asp:BoundField>
                <asp:BoundField DataField="Number_of_Stories" HeaderText="Number_of_Stories" 
                    SortExpression="Number_of_Stories" HeaderStyle-HorizontalAlign="Center" 
                    HeaderStyle-VerticalAlign="Middle" >

                </asp:BoundField>
                <asp:BoundField DataField="School_District" HeaderText="School_District" 
                    SortExpression="School_District" HeaderStyle-HorizontalAlign="Center" 
                    HeaderStyle-VerticalAlign="Middle" >

                </asp:BoundField>
                <asp:BoundField DataField="Taxes" HtmlEncode="False" DataFormatString="{0:C2}" HeaderText="Taxes"  SortExpression="Taxes"  
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" >

                </asp:BoundField>
                <asp:BoundField DataField="AskingPrice" HtmlEncode="False" DataFormatString="{0:C2}" HeaderText="AskingPrice" 
                    SortExpression="AskingPrice" HeaderStyle-HorizontalAlign="Center" 
                    HeaderStyle-VerticalAlign="Middle" >

                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </p>
    </center>
    </form>
    </body>
</html>