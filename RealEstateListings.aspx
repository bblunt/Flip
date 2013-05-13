<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RealEstateListings.aspx.vb" Inherits="RealEstateListings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Real Estate Listings</title>
    <style type="text/css">
        .style1
        {
            width: 22%;
        }
        .style2
        {
            height: 28px;
        }
        </style>
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
            Font-Underline="false" Visible="False" />
        <asp:DetailsView ID="dvListings" runat="server" DataSourceID="dsListings" DefaultMode="Insert"
            Visible="false" AutoGenerateRows="false">
            <Fields>
                <asp:TemplateField HeaderText="Picture">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtPicture" runat="server" Text='<%# Eval("Picture")%>' />
                        <asp:RequiredFieldValidator ID="valPicture" runat="server"
                                ControlToValidate="txtPicture" ErrorMessage="*" ForeColor="Red" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address")%>' />
                        <asp:RequiredFieldValidator ID="valAddress" runat="server"
                                ControlToValidate="txtAddress" ErrorMessage="*" ForeColor="Red" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("City")%>' />
                        <asp:RequiredFieldValidator ID="valCity" runat="server"
                                ControlToValidate="txtCity" ErrorMessage="*" ForeColor="Red" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtState" runat="server" Text='<%# Eval("State")%>'
                            MaxLength="2" />
                        <asp:RequiredFieldValidator ID="valState" runat="server"
                                ControlToValidate="txtState" ErrorMessage="*" ForeColor="Red" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Zip">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtZip" runat="server" Text='<%# Eval("Zip")%>' />
                        <asp:RequiredFieldValidator ID="valZip" runat="server"
                                ControlToValidate="txtZip" ErrorMessage="*" ForeColor="Red" />
                        <asp:CompareValidator ID="valZipNum" runat="server" ControlToValidate="txtZip" Type="Integer"
                                Operator="DataTypeCheck" Display="Dynamic" Text="Please enter valid numeric value."
                                ForeColor="Red" />
                        <asp:RangeValidator ID="valZipNumRange" runat="server" ControlToValidate="txtZip" Type="Integer"
                                MinimumValue="1001" MaximumValue="99999" Display="Dynamic" ForeColor="Red"
                                Text="Please enter a numeric value greater than 01001, but less than 99950." />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Number of Stories">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtNumberOfStories" runat="server" Text='<%# Eval("Number of Stories")%>' />
                        <asp:RequiredFieldValidator ID="valNumberOfStories" runat="server"
                                ControlToValidate="txtNumberOfStories" ErrorMessage="*" ForeColor="Red" />
                        <asp:CompareValidator ID="valNumberOfStoriesNum" runat="server" ControlToValidate="txtNumberOfStories"
                                Type="Integer" Operator="DataTypeCheck" Display="Dynamic" Text="Please enter valid numeric value."
                                ForeColor="Red" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Frame Type">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtFrameType" runat="server" Text='<%# Eval("Frame Type")%>' />
                        <asp:RequiredFieldValidator ID="valFrameType" runat="server"
                                ControlToValidate="txtFrameType" ErrorMessage="*" ForeColor="Red" />
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
                        <asp:RequiredFieldValidator ID="valHeatingType" runat="server"
                                ControlToValidate="txtHeatingType" ErrorMessage="*" ForeColor="Red" />
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
                        <asp:RequiredFieldValidator ID="valTaxes" runat="server"
                                ControlToValidate="txtTaxes" ErrorMessage="*" ForeColor="Red" />
                        <asp:CompareValidator ID="valTaxesNum" runat="server" ControlToValidate="txtTaxes"
                                Type="Double" Operator="DataTypeCheck" Display="Dynamic" Text="Please enter valid numeric value."
                                ForeColor="Red" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Asking Price">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtAskingPrice" runat="server" Text='<%# Eval("AskingPrice")%>' />
                        <asp:RequiredFieldValidator ID="valAskingPrice" runat="server"
                                ControlToValidate="txtAskingPrice" ErrorMessage="*" ForeColor="Red" />
                        <asp:CompareValidator ID="valAskingPriceNum" runat="server" ControlToValidate="txtAskingPrice"
                                Type="Double" Operator="DataTypeCheck" Display="Dynamic" Text="Please enter valid numeric value."
                                ForeColor="Red" />
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="false" ItemStyle-HorizontalAlign="Center">
                    <InsertItemTemplate>
                        <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Width="60" Text="Insert" />
                        <asp:Button ID="btnCancel" runat="server" OnClick="CancelListingInsert" Width="60"
                            CausesValidation="false" Text="Cancel" />
                    </InsertItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <br />
        <table class="style1" align="center">
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" 
                        Text="To make changes, please enter the password." />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:TextBox ID="tbPassword" runat="server" style="text-align: center" 
                        TextMode="Password" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server"
                        ErrorMessage="Password invalid. Access denied." ValidationGroup="Password" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnOkPassword" runat="server" Height="27px" 
                        style="margin-left: 4px" Text="OK" ValidationGroup="Password" 
                        Width="61px"/>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Label ID="lblMinAskingPrice" runat="server" Text="Filter by Minimum Asking Price:" />
        <asp:TextBox ID="txtMinAskingPrice" runat="server" AutoPostBack="true" />
        <asp:Label ID="lblMaxAskingPrice" runat="server" Text="Filter by Maximum Asking Price:" />
        <asp:TextBox ID="txtMaxAskingPrice" runat="server" AutoPostBack="true" />
        <asp:Label ID="lblConversionCheck" runat="server" Visible="false" ForeColor="Red" />
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
                        <asp:RequiredFieldValidator ID="valPicture" runat="server"
                                ControlToValidate="txtPicture" ErrorMessage="*" ForeColor="Red" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" SortExpression="Address">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address")%>' />
                        <asp:RequiredFieldValidator ID="valAddress" runat="server"
                                ControlToValidate="txtAddress" ErrorMessage="*" ForeColor="Red" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="City">
                    <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("City")%>' />
                        <asp:RequiredFieldValidator ID="valCity" runat="server"
                                ControlToValidate="txtCity" ErrorMessage="*" ForeColor="Red" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State" SortExpression="State">
                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("State")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtState" runat="server" Text='<%# Eval("State")%>'
                            MaxLength="2" />
                        <asp:RequiredFieldValidator ID="valState" runat="server"
                                ControlToValidate="txtState" ErrorMessage="*" ForeColor="Red" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Zip" SortExpression="Zip">
                    <ItemTemplate>
                        <asp:Label ID="lblZip" runat="server" Text='<%# Eval("Zip")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtZip" runat="server" Text='<%# Eval("Zip")%>' />
                        <asp:RequiredFieldValidator ID="valZip" runat="server"
                                ControlToValidate="txtZip" ErrorMessage="*" ForeColor="Red" />
                        <asp:CompareValidator ID="valZipNum" runat="server" ControlToValidate="txtZip" Type="Integer"
                                Operator="DataTypeCheck" Display="Dynamic" Text="Please enter valid numeric value."
                                ForeColor="Red" />
                        <asp:RangeValidator ID="valZipNumRange" runat="server" ControlToValidate="txtZip" Type="Integer"
                                MinimumValue="1001" MaximumValue="99999" Display="Dynamic" ForeColor="Red"
                                Text="Please enter a numeric value greater than 01001, but less than 99950." />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Number of Stories" SortExpression="Number of Stories">
                    <ItemTemplate>
                        <asp:Label ID="lblNumberOfStories" runat="server" Text='<%# Eval("Number of Stories")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNumberOfStories" runat="server" Text='<%# Eval("Number of Stories")%>' />
                        <asp:RequiredFieldValidator ID="valNumberOfStories" runat="server"
                                ControlToValidate="txtNumberOfStories" ErrorMessage="*" ForeColor="Red" />
                        <asp:CompareValidator ID="valNumberOfStoriesNum" runat="server" ControlToValidate="txtNumberOfStories"
                                Type="Integer" Operator="DataTypeCheck" Display="Dynamic" Text="Please enter valid numeric value."
                                ForeColor="Red" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Frame Type" SortExpression="Frame Type">
                    <ItemTemplate>
                        <asp:Label ID="lblFrameType" runat="server" Text='<%# Eval("Frame Type")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFrameType" runat="server" Text='<%# Eval("Frame Type")%>' />
                        <asp:RequiredFieldValidator ID="valFrameType" runat="server"
                                ControlToValidate="txtFrameType" ErrorMessage="*" ForeColor="Red" />
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
                        <asp:RequiredFieldValidator ID="valHeatingType" runat="server"
                                ControlToValidate="txtHeatingType" ErrorMessage="*" ForeColor="Red" />
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
                        <asp:RequiredFieldValidator ID="valTaxes" runat="server"
                                ControlToValidate="txtTaxes" ErrorMessage="*" ForeColor="Red" />
                        <asp:CompareValidator ID="valTaxesNum" runat="server" ControlToValidate="txtTaxes"
                                Type="Double" Operator="DataTypeCheck" Display="Dynamic" Text="Please enter valid numeric value."
                                ForeColor="Red" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Asking Price" SortExpression="AskingPrice">
                    <ItemTemplate>
                        <asp:Label ID="lblAskingPrice" runat="server" Text='<%# FormatCurrency(Eval("AskingPrice"))%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAskingPrice" runat="server" Text='<%# Eval("AskingPrice")%>' />
                        <asp:RequiredFieldValidator ID="valAskingPrice" runat="server"
                                ControlToValidate="txtAskingPrice" ErrorMessage="*" ForeColor="Red" />
                        <asp:CompareValidator ID="valAskingPriceNum" runat="server" ControlToValidate="txtAskingPrice"
                                Type="Double" Operator="DataTypeCheck" Display="Dynamic" Text="Please enter valid numeric value."
                                ForeColor="Red" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate> 
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Edit" 
                            Text="Edit" />
                            <asp:LinkButton runat="server" CausesValidation="False" CommandName="Delete" 
                            Text="Delete" OnClientClick="return confirm('Are you certain you want to delete this listing?')" />
                        </ItemTemplate>
                </asp:TemplateField>
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
            SelectCommand="SELECT [li].* FROM [Listings] AS li WHERE (@MinAskingPrice = 0 OR [li].[AskingPrice] >= @MinAskingPrice) AND (@MaxAskingPrice = 0 OR [li].[AskingPrice] <= @MaxAskingPrice) ORDER BY [li].[State], [li].[City], [li].[Listing Number]"
            UpdateCommand="UPDATE [Listings] SET [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [Number of Stories] = @Number_of_Stories, [Frame Type] = @Frame_Type, [Basement] = @Basement, [Heating Type] = @Heating_Type, [Central Air] = @Central_Air, [Taxes] = @Taxes, [School District] = @School_District, [Picture] = @Picture, [AskingPrice] = @AskingPrice, [AgentID] = @AgentID WHERE (([Listing Number] = @Listing_Number) OR ([Listing Number] IS NULL AND @Listing_Number IS NULL))">
            <SelectParameters>
                <asp:Parameter Name="@MinAskingPrice" Type="Decimal" DefaultValue="0" />
                <asp:Parameter Name="@MaxAskingPrice" Type="Decimal" DefaultValue="0" />
            </SelectParameters>
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