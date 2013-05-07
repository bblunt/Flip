<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FlipsRealEstate.aspx.vb" Inherits="FlipRealEstate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Flip's Real Estate</title>
    <style type="text/css">
        .style1
        {
            width: 1058px;
        }
        .style2
        {
            width: 94%;
            color: #FFFF00;
            margin-bottom: 1px;
            background-color: #FFFF00;
        }
        .style3
        {
            width: 206px;
        }
        .style4
        {
            width: 210px;
        }
        .style5
        {
            background-color: #FFFF66;
        }
        .style6
        {
            color: #400040;
            background-color: #FFFF66;
        }
        .style7
        {
            width: 237px;
            background-color: #FFFF00;
            text-align: center;
        }
        .style8
        {
            width: 1058px;
            height: 295px;
        }
        .style9
        {
            width: 419px;
            font-size: xx-large;
            color: #660066;
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="frmFlipsRealEstate" runat="server">
    <div>
    <center
        <asp:Image ID="imgBanner" runat="server" ImageUrl="~/Images/FlipBanner.png" />
        <img alt="" class="style8" src="Images/FlipBanner.png" /></center>
    </div>
    <center>
    <table align="center" class="style1">
        <tr>
            <td bgcolor="#ED1C24" class="style7" align="center">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/RealEstateAgents.aspx" style="font-size: xx-large">Agents</asp:HyperLink>
            </td>
            <td class="style7" align="center">
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/RealEstateListings.aspx" style="font-size: xx-large">Listings</asp:HyperLink>
            </td>
            <td class="style7" width="237 px" align="center">
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/RealEstateListingsByAgent.aspx" style="font-size: xx-large">Listings by Agent</asp:HyperLink>
            </td>
        </tr>
    </table>
   </center>
        <center>
        <center style="background-color: #ED1C24; width: 1058px; margin-top: 0px;"> 
        
            <br />
            <br />
        
            <asp:Label ID="Label1" runat="server" 
                Text="While you are here, look up your current weather!" CssClass="style9"></asp:Label>

            <br />

            <br class="style6" />
            
            <br class="style6" />
            <table class="style2">
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label2" runat="server" Text="Country" CssClass="style6"></asp:Label>
                    </td>
                    <td class="style9">
                        <asp:DropDownList ID="CountryDropDownList" runat="server" CssClass="style5">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label3" runat="server" Text="City" CssClass="style6"></asp:Label>
                    </td>
                    <td class="style9">
                        <asp:DropDownList ID="CityDropDownList" runat="server" style="margin-left: 0px" 
                            CssClass="style5">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br class="style6" />
            <br class="style6" />
            <table class="style2">
                <tr>
                    <td class="style4">
                        <asp:Label ID="Label4" runat="server" Text="Info" CssClass="style6"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="WeatherLabel" runat="server" CssClass="style6"></asp:Label>
                    </td>
                </tr>
            </table>
            <br class="style6" />
            <asp:Button ID="NewWeatherButton" runat="server" Text="Update weather location data" 
                Height="26px" CssClass="style5" />
        </center>
        </center>
    <p>
        &nbsp;</p>
   
    </form>
    </body>
</html>