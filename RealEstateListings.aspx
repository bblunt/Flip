<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RealEstateListings.aspx.vb" Inherits="RealEstateListings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Real Estate Listings</title>
</head>
<body>
    <form id="frmRealEstateListings" runat="server">
    <div>
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
                <asp:TemplateField HeaderText="">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txt" runat="server" Text='<%# Eval("")%>' />
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
        <asp:GridView ID="gvAgents" runat="server" AutoGenerateColumns="False" DataKeyNames="AgentID" DataSourceID="dsAgents"
            AllowSorting="true" Width="1058" BackColor="LightGoldenrodYellow" BorderColor="Tan" ForeColor="Black">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:TemplateField HeaderText="" SortExpression="" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:Image ID="img" runat="server" Height="25%" Width="25%"
                            ImageUrl='<%# "~/Images/HousePics/" + Eval("")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt" runat="server" Text='<%# Eval("")%>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="" SortExpression="">
                    <ItemTemplate>
                        <asp:Label ID="lbl" runat="server" Text='<%# Eval("")%>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt" runat="server" Text='<%# Eval("")%>' />
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
    </div>
    </form>
</body>
</html>