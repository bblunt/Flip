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
        <asp:Image ID="imgBanner" runat="server" ImageUrl="~/Images/FlipBanner.png" />
        <br />
        <br />
        <asp:GridView ID="gvAgents" runat="server" AutoGenerateColumns="False" DataKeyNames="AgentID" DataSourceID="dsAgents"
            AllowSorting="true">
            <Columns>
                <asp:TemplateField HeaderText="Agent Pic" SortExpression="AgentPic">
                    <ItemTemplate>
                        <asp:Image ID="imgAgent" runat="server" ImageAlign="Middle" Height="25%" Width="25%"
                            ImageUrl='<%# "~/Images/AgentPics/" + Eval("AgentPic")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="AgentID" HeaderText="Agent ID" ReadOnly="True" SortExpression="AgentID" />
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" />
                <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Phone Number" HeaderText="Phone Number" SortExpression="Phone Number" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsAgents" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateDatabaseConnection %>"
            ProviderName="<%$ ConnectionStrings:RealEstateDatabaseConnection.ProviderName %>"
            SelectCommand="SELECT * FROM [Agents] ORDER BY [Last Name], [First Name], [AgentID]" />
    </center>
    </div>
    </form>
</body>
</html>