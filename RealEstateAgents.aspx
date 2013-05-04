<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RealEstateAgents.aspx.vb" Inherits="RealEstateAgents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Real Estate Agents</title>
</head>
<body>
    <form id="frmRealEstateAgents" runat="server">
    <div>
    <center>
        <asp:ImageButton ID="imgBanner" runat="server" ImageUrl="~/Images/FlipBanner.png" />
        <br />
        <br />
        <asp:Label ID="lblAgents" runat="server" Font-Size="X-Large" Text="Flip's Real Estate Agents" />
        <br />
        <br />
        <asp:GridView ID="gvAgents" runat="server" AutoGenerateColumns="False" DataKeyNames="AgentID" DataSourceID="dsAgents"
            AllowSorting="true" Width="1058">
            <Columns>
                <asp:TemplateField HeaderText="Agent Pic" SortExpression="AgentPic" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Image ID="imgAgentPic" runat="server" Height="25%" Width="25%"
                            ImageUrl='<%# "~/Images/AgentPics/" + Eval("AgentPic")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAgentPic" runat="server" Text='<%# Bind("AgentPic")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Phone Number" HeaderText="Phone Number" SortExpression="Phone Number" />
                <asp:CommandField ShowEditButton="true" ButtonType="Link" UpdateText="Save"
                    ItemStyle-HorizontalAlign="Center" />
                <asp:CommandField ShowDeleteButton="true" ButtonType="Link" DeleteText="Delete"
                    ItemStyle-HorizontalAlign="Center" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsAgents" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateDatabaseConnection %>"
            ProviderName="<%$ ConnectionStrings:RealEstateDatabaseConnection.ProviderName %>"
            SelectCommand="SELECT * FROM [Agents] ORDER BY [Last Name], [First Name], [AgentID]"
            DeleteCommand="DELETE FROM [Agents] WHERE (([AgentID] = ?) OR ([AgentID] IS NULL AND ? IS NULL))"
            InsertCommand="INSERT INTO [Agents] ([AgentID], [Last Name], [First Name], [Address], [City], [Phone Number], [AgentPic]) VALUES (?, ?, ?, ?, ?, ?, ?)"
            UpdateCommand="UPDATE [Agents] SET [Last Name] = ?, [First Name] = ?, [Address] = ?, [City] = ?, [Phone Number] = ?, [AgentPic] = ? WHERE (([AgentID] = ?) OR ([AgentID] IS NULL AND ? IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="AgentID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AgentID" Type="String" />
                <asp:Parameter Name="Last_Name" Type="String" />
                <asp:Parameter Name="First_Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Phone_Number" Type="String" />
                <asp:Parameter Name="AgentPic" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Last_Name" Type="String" />
                <asp:Parameter Name="First_Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Phone_Number" Type="String" />
                <asp:Parameter Name="AgentPic" Type="String" />
                <asp:Parameter Name="AgentID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </center>
    </div>
    </form>
</body>
</html>