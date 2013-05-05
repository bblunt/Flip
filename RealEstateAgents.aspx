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
        <br />
        <asp:LinkButton ID="btnInsertAgent" runat="server" Text="Add New Agent" ForeColor="Blue"
            Font-Underline="false" />
        <asp:DetailsView ID="dvAgents" runat="server" DataSourceID="dsAgents" DefaultMode="Insert"
            Visible="false" AutoGenerateRows="false">
            <Fields>
                <asp:TemplateField HeaderText="Agent Pic">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtAgentPic" runat="server" Text='<%# Eval("AgentPic")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("First Name")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("Last Name")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("City")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone Number">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Eval("Phone Number")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="false" ItemStyle-HorizontalAlign="Center">
                    <InsertItemTemplate>
                        <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Width="60" Text="Insert" />
                        <asp:Button ID="btnCancel" runat="server" OnClick="CancelAgentInsert" Width="60" Text="Cancel" />
                    </InsertItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="gvAgents" runat="server" AutoGenerateColumns="False" DataKeyNames="AgentID" DataSourceID="dsAgents"
            AllowSorting="true" Width="1058" BackColor="LightGoldenrodYellow" BorderColor="Tan" ForeColor="Black">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="Agent Pic" SortExpression="AgentPic" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Image ID="imgAgentPic" runat="server" Height="25%" Width="25%"
                            ImageUrl='<%# "~/Images/AgentPics/" + Eval("AgentPic")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAgentPic" runat="server" Text='<%# Eval("AgentPic")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name" SortExpression="First Name">
                    <ItemTemplate>
                        <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("First Name")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("First Name")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name" SortExpression="Last Name">
                    <ItemTemplate>
                        <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("Last Name")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("Last Name")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="City">
                    <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("City")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone Number" SortExpression="Phone Number">
                    <ItemTemplate>
                        <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("Phone Number")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Eval("Phone Number")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" ButtonType="Link" UpdateText="Save"
                    ItemStyle-HorizontalAlign="Center" ControlStyle-ForeColor="Blue"
                    ControlStyle-Font-Underline="false" />
                <asp:CommandField ShowDeleteButton="true" ButtonType="Link" DeleteText="Delete"
                    ItemStyle-HorizontalAlign="Center" ControlStyle-ForeColor="Blue"
                    ControlStyle-Font-Underline="false" />
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
        <asp:SqlDataSource ID="dsAgents" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateDatabaseConnection %>"
            ProviderName="<%$ ConnectionStrings:RealEstateDatabaseConnection.ProviderName %>"
            SelectCommand="SELECT * FROM [Agents] ORDER BY [Last Name], [First Name], [AgentID]"
            DeleteCommand="DELETE FROM [Agents] WHERE (([AgentID] = @AgentID) OR ([AgentID] IS NULL AND @AgentID IS NULL))"
            InsertCommand="INSERT INTO [Agents] ([AgentID], [Last Name], [First Name], [Address], [City], [Phone Number], [AgentPic]) VALUES (@AgentID, @Last_Name, @First_Name, @Address, @City, @Phone_Number, @AgentPic)"
            UpdateCommand="UPDATE [Agents] SET [Last Name] = @Last_Name, [First Name] = @First_Name, [Address] = @Address, [City] = @City, [Phone Number] = @Phone_Number, [AgentPic] = @AgentPic WHERE (([AgentID] = @AgentID) OR ([AgentID] IS NULL AND @AgentID IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="@AgentID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="@AgentID" Type="String" />
                <asp:Parameter Name="@Last_Name" Type="String" />
                <asp:Parameter Name="@First_Name" Type="String" />
                <asp:Parameter Name="@Address" Type="String" />
                <asp:Parameter Name="@City" Type="String" />
                <asp:Parameter Name="@Phone_Number" Type="String" />
                <asp:Parameter Name="@AgentPic" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="@Last_Name" Type="String" />
                <asp:Parameter Name="@First_Name" Type="String" />
                <asp:Parameter Name="@Address" Type="String" />
                <asp:Parameter Name="@City" Type="String" />
                <asp:Parameter Name="@Phone_Number" Type="String" />
                <asp:Parameter Name="@AgentPic" Type="String" />
                <asp:Parameter Name="@AgentID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </center>
    </div>
    </form>
</body>
</html>