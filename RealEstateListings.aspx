<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RealEstateListings.aspx.vb" Inherits="RealEstateListings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Real Estate Listings</title>
</head>
<body>
    <form id="frmRealEstateListings" runat="server">
    <div>
    <center>
        <asp:ImageButton ID="imgBanner" runat="server" ImageUrl="~/Images/FlipBanner.png" />
        <br />
        <br />
        <asp:Label ID="lblListings" runat="server" Font-Size="X-Large" Text="Flip's Real Estate Listings" />
        <br />
        <br />
        <br />
        <asp:LinkButton ID="btnInsertListing" runat="server" Text="Add New Listing" ForeColor="Blue"
            Font-Underline="false" />
        <asp:DetailsView ID="dvListings" runat="server" DataSourceID="dsListings" DefaultMode="Insert"
            Visible="false" AutoGenerateRows="false">
            <Fields>
                <asp:TemplateField HeaderText="Picture">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtPicture" runat="server" Text='<%# Eval("Picture")%>' />
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
                <asp:TemplateField HeaderText="State">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtState" runat="server" Text='<%# Eval("State")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Zip">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtZip" runat="server" Text='<%# Eval("Zip")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Number of Stories">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtNumberOfStories" runat="server" Text='<%# Eval("Number of Stories")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Frame Type">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtFrameType" runat="server" Text='<%# Eval("Frame Type")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Basement">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlBasement" runat="server">
                            <asp:ListItem Text="True" Value="True" />
                            <asp:ListItem Text="False" Value="False" />
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Heating Type">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtHeatingType" runat="server" Text='<%# Eval("Heating Type")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Central Air">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlCentralAir" runat="server">
                            <asp:ListItem Text="Yes" Value="Yes" />
                            <asp:ListItem Text="No" Value="No" />
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="School District">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtSchoolDistrict" runat="server" Text='<%# Eval("School District")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Agent">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlAgent" runat="server" DataSourceID="dsAgents"
                            DataValueField="AgentID" DataTextField="AgentName" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Taxes">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtTaxes" runat="server" Text='<%# Eval("Taxes")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Asking Price">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtAskingPrice" runat="server" Text='<%# Eval("AskingPrice")%>' />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="false" ItemStyle-HorizontalAlign="Center">
                    <InsertItemTemplate>
                        <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Width="60" Text="Insert" />
                        <asp:Button ID="btnCancel" runat="server" OnClick="CancelListingInsert" Width="60" Text="Cancel" />
                    </InsertItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <br />
        <br />
        <br />
        <br />
        <asp:DropDownList ID="ddlSecretAgent" runat="server" DataSourceID="dsAgents" DataValueField="AgentID"
            DataTextField="AgentName" />
        <asp:GridView ID="gvListings" runat="server" AutoGenerateColumns="False" DataKeyNames="Listing Number, AgentID"
            DataSourceID="dsListings" AllowSorting="true" Width="1058" BackColor="LightGoldenrodYellow" BorderColor="Tan"
            ForeColor="Black">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="Picture" SortExpression="Picture" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Image ID="imgPicture" runat="server" Height="25%" Width="25%"
                            ImageUrl='<%# "~/Images/HousePics/" + Eval("Picture")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPicture" runat="server" Text='<%# Eval("Picture")%>' />
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
                <asp:TemplateField HeaderText="State" SortExpression="State">
                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("State")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtState" runat="server" Text='<%# Eval("State")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Zip" SortExpression="Zip">
                    <ItemTemplate>
                        <asp:Label ID="lblZip" runat="server" Text='<%# Eval("Zip")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtZip" runat="server" Text='<%# Eval("Zip")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Number of Stories" SortExpression="Number of Stories">
                    <ItemTemplate>
                        <asp:Label ID="lblNumberOfStories" runat="server" Text='<%# Eval("Number of Stories")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNumberOfStories" runat="server" Text='<%# Eval("Number of Stories")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Frame Type" SortExpression="Frame Type">
                    <ItemTemplate>
                        <asp:Label ID="lblFrameType" runat="server" Text='<%# Eval("Frame Type")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFrameType" runat="server" Text='<%# Eval("Frame Type")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Basement" SortExpression="Basement">
                    <ItemTemplate>
                        <asp:Label ID="lblBasement" runat="server" Text='<%# Eval("Basement")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlBasement" runat="server" SelectedValue='<%# Eval("Basement")%>'>
                            <asp:ListItem Text="True" Value="True" />
                            <asp:ListItem Text="False" Value="False" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Heating Type" SortExpression="Heating Type">
                    <ItemTemplate>
                        <asp:Label ID="lblHeatingType" runat="server" Text='<%# Eval("Heating Type")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtHeatingType" runat="server" Text='<%# Eval("Heating Type")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Central Air" SortExpression="Central Air">
                    <ItemTemplate>
                        <asp:Label ID="lblCentralAir" runat="server" Text='<%# Eval("Central Air")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlCentralAir" runat="server"
                            SelectedValue='<%# Eval("Central Air")%>'>
                            <asp:ListItem Text="Yes" Value="Yes" />
                            <asp:ListItem Text="No" Value="No" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="School District" SortExpression="School District">
                    <ItemTemplate>
                        <asp:Label ID="lblSchoolDistrict" runat="server" Text='<%# Eval("School District")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSchoolDistrict" runat="server" Text='<%# Eval("School District")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Agent" SortExpression="AgentID">
                    <ItemTemplate>
                        <asp:Label ID="lblAgent" runat="server" Text='<%# Eval("AgentID")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlAgent" runat="server" DataSourceID="dsAgents"
                            DataValueField="AgentID" SelectedValue='<%# Eval("AgentID")%>'
                            DataTextField="AgentName" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Taxes" SortExpression="Taxes">
                    <ItemTemplate>
                        <asp:Label ID="lblTaxes" runat="server" Text='<%# FormatCurrency(Eval("Taxes"))%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTaxes" runat="server" Text='<%# Eval("Taxes")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Asking Price" SortExpression="AskingPrice">
                    <ItemTemplate>
                        <asp:Label ID="lblAskingPrice" runat="server" Text='<%# FormatCurrency(Eval("AskingPrice"))%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAskingPrice" runat="server" Text='<%# Eval("AskingPrice")%>' />
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
        <asp:SqlDataSource ID="dsListings" runat="server" ConnectionString="<%$ ConnectionStrings:RealEstateDatabaseConnection %>"
            ProviderName="<%$ ConnectionStrings:RealEstateDatabaseConnection.ProviderName %>"
            DeleteCommand="DELETE FROM [Listings] WHERE (([Listing Number] = @Listing_Number) OR ([Listing Number] IS NULL AND @Listing_Number IS NULL))"
            InsertCommand="INSERT INTO [Listings] ([Listing Number], [Address], [City], [State], [Zip], [Number of Stories], [Frame Type], [Basement], [Heating Type], [Central Air], [Taxes], [School District], [Picture], [AskingPrice], [AgentID]) VALUES (@Listing_Number, @Address, @City, @State, @Zip, @Number_of_Stories, @Frame_Type, @Basement, @Heating_Type, @Central_Air, @Taxes, @School_District, @Picture, @AskingPrice, @AgentID)"
            SelectCommand="SELECT [li].* FROM [Listings] AS li ORDER BY [li].[State], [li].[City], [li].[Listing Number]"
            UpdateCommand="UPDATE [Listings] SET [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [Number of Stories] = @Number_of_Stories, [Frame Type] = @Frame_Type, [Basement] = @Basement, [Heating Type] = @Heating_Type, [Central Air] = @Central_Air, [Taxes] = @Taxes, [School District] = @School_District, [Picture] = @Picture, [AskingPrice] = @AskingPrice, [AgentID] = @AgentID WHERE (([Listing Number] = @Listing_Number) OR ([Listing Number] IS NULL AND @Listing_Number IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="@Listing_Number" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="@Listing_Number" Type="String" />
                <asp:Parameter Name="@Address" Type="String" />
                <asp:Parameter Name="@City" Type="String" />
                <asp:Parameter Name="@State" Type="String" />
                <asp:Parameter Name="@Zip" Type="String" />
                <asp:Parameter Name="@Number_of_Stories" Type="String" />
                <asp:Parameter Name="@Frame_Type" Type="String" />
                <asp:Parameter Name="@Basement" Type="Boolean" />
                <asp:Parameter Name="@Heating_Type" Type="String" />
                <asp:Parameter Name="@Central_Air" Type="String" />
                <asp:Parameter Name="@Taxes" Type="Decimal" />
                <asp:Parameter Name="@School_District" Type="String" />
                <asp:Parameter Name="@Picture" Type="String" />
                <asp:Parameter Name="@AskingPrice" Type="Decimal" />
                <asp:Parameter Name="@AgentID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="@Address" Type="String" />
                <asp:Parameter Name="@City" Type="String" />
                <asp:Parameter Name="@State" Type="String" />
                <asp:Parameter Name="@Zip" Type="String" />
                <asp:Parameter Name="@Number_of_Stories" Type="String" />
                <asp:Parameter Name="@Frame_Type" Type="String" />
                <asp:Parameter Name="@Basement" Type="Boolean" />
                <asp:Parameter Name="@Heating_Type" Type="String" />
                <asp:Parameter Name="@Central_Air" Type="String" />
                <asp:Parameter Name="@Taxes" Type="Decimal" />
                <asp:Parameter Name="@School_District" Type="String" />
                <asp:Parameter Name="@Picture" Type="String" />
                <asp:Parameter Name="@AskingPrice" Type="Decimal" />
                <asp:Parameter Name="@AgentID" Type="String" />
                <asp:Parameter Name="@Listing_Number" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsAgents" runat="server"
            ConnectionString="<%$ ConnectionStrings:RealEstateDatabaseConnection %>"
            ProviderName="<%$ ConnectionStrings:RealEstateDatabaseConnection.ProviderName %>"
            SelectCommand="SELECT [AgentID], [First Name] + ' ' + [Last Name] AS AgentName FROM Agents">
        </asp:SqlDataSource>
    </center>
    </div>
    </form>
</body>
</html>