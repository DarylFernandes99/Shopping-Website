<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Website.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>

    <!--Css Link-->
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <style type="text/css">
            .auto-style1 {
                width: 100%;
            }
            .auto-style2 {
                height: 26px;
            }
            .auto-style3 {
                height: 29px;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!--Header-->
                <div class="header">
                    <div style="z-index: 1; top: 0px; width: 100%; height: 100px; position: fixed; left: 0px; background-color: white">
                        <asp:HyperLink ID="Logo" runat="server" style="top: 30px; left: 50px; position: absolute" ImageUrl="~/img/logo.png" NavigateUrl="~/index.aspx"></asp:HyperLink>
                    
                        <asp:Menu ID="HeaderMenu" runat="server" Style="top: 30px; left: 250px; position: absolute" Font-Size="Large" Orientation="Horizontal" RenderingMode="Table" DisappearAfter="100" DynamicHorizontalOffset="2" Font-Names="Verdana" ForeColor="black" StaticSubMenuIndent="20%">
                            <DynamicHoverStyle />
                            <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" BackColor="White" />
                            <DynamicMenuStyle BorderStyle="Ridge" BorderColor="Black" />
                            <DynamicSelectedStyle />
                            <Items>
                                <asp:MenuItem Text="Home" Value="Home" NavigateUrl="index.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="Shop" Value="Shop">
                                    <asp:MenuItem Text="Categories" Value="Categories" NavigateUrl="categories.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="Cart" Value="Cart" NavigateUrl="cart.aspx"></asp:MenuItem>
                                </asp:MenuItem>
                                <asp:MenuItem Text="About" Value="About" NavigateUrl="about.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="Blog" Value="Blog" NavigateUrl="blog.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="Contact" Value="Contact" NavigateUrl="contact.aspx"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle />
                            <StaticMenuItemStyle HorizontalPadding="30px" VerticalPadding="5px" />
                            <StaticSelectedStyle />
                        </asp:Menu>
                
                        <asp:Menu ID="Menu1" runat="server" Style="top: 30px; left: 980px; position: absolute" Font-Size="Large" Orientation="Horizontal" RenderingMode="Table" DisappearAfter="100" DynamicHorizontalOffset="2" Font-Names="Verdana" ForeColor="black" StaticSubMenuIndent="20%">
                            <DynamicHoverStyle />
                            <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" BackColor="White" />
                            <DynamicMenuStyle BorderStyle="Ridge" BorderColor="Black" />
                            <DynamicSelectedStyle />
                            <Items>
                                <asp:MenuItem Text="Sign In" Value="Sign In" NavigateUrl="login.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="/" Value="/"></asp:MenuItem>
                                <asp:MenuItem Text="Register" Value="Register">
                                    <asp:MenuItem Text="User" Value="User" NavigateUrl="register.aspx"></asp:MenuItem>
                                    <asp:MenuItem Text="Seller" Value="Seller" NavigateUrl="sellerRegister.aspx"></asp:MenuItem>
                                </asp:MenuItem>
                            </Items>
                            <StaticHoverStyle />
                            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="5px" />
                            <StaticSelectedStyle />
                        </asp:Menu>
                        
                        <asp:Button ID="btnLogout" runat="server" Text="Log Out" style="background-color: white; top: 35px; left: 1000px; position: absolute" Font-Size="Large" BorderStyle="None" Font-Underline="True" Visible="False" OnClick="btnLogout_Click"/>

                        <asp:ImageButton ID="searchIcon" runat="server" ImageUrl="~/img/icons/search.png" PostBackUrl="~/index.aspx" style="top: 30px; left: 1300px; position: absolute" OnClick="searchIcon_Click"/>
                        <asp:ImageButton ID="profileIcon" runat="server" ImageUrl="~/img/icons/man.png" PostBackUrl="~/profile.aspx" style="top: 30px; left: 1350px; position: absolute" Visible="False" />
                        <asp:ImageButton ID="cartIcon" runat="server" ImageUrl="~/img/icons/bag.png" PostBackUrl="~/cart.aspx" style="top: 30px; left: 1400px; position: absolute" Visible="False" />

                        <asp:Label ID="countItems" runat="server" style="z-index: 1; border-radius: 50px; text-align:center; top: 40px; left: 1420px; position: absolute" Font-Size="Large" BorderColor="Black" BorderStyle="Solid" Visible="False"></asp:Label>
                    </div>

                    <!--Header Info-->
                        <div style="z-index: -1; top: 90px; width: 100%; height: 50px; position: absolute; background-color: lightslategray; left: 0px">
                            <asp:Image ID="FreeShipping" runat="server" AlternateText="Free Shipping" ImageUrl="~/img/icons/delivery.png" style=" left: 60px; top: 15px; position: absolute;"/>
                            <asp:Label ID="FreeShippingDetail" runat="server" Text="Free Shipping on orders over Rs.150* in India" style=" left: 110px; top: 15px; position: absolute;" ForeColor="White" Font-Size="Medium"></asp:Label>

                            <asp:Image ID="Voucher" runat="server" AlternateText="Voucher" ImageUrl="~/img/icons/voucher.png" style=" left: 630px; top: 10px; position: absolute;"/>
                            <asp:Label ID="VoucherDetail" runat="server" Text="20% Student Discount" style=" left: 680px; top: 15px; position: absolute;" ForeColor="White" Font-Size="Medium"></asp:Label>

                            <asp:Image ID="Discount" runat="server" AlternateText="Discount" ImageUrl="~/img/icons/sales.png" style=" left: 1100px; top: 10px; position: absolute;"/>
                            <asp:Label ID="DiscountDetail" runat="server" Text="30% off on dresses. Use code: 30OFF" style=" left: 1150px; top: 15px; position: absolute;" ForeColor="White" Font-Size="Medium"></asp:Label>
                        </div>
                    <!--Header Info-->
                </div>
            <!--Header-->

            <!--Body-->
                <div class="body">
                    <div class="displayProducts" style="top: 20px; position: relative">
                        <asp:Panel ID="sortProducts" BorderStyle="Solid" runat="server" height="275px" Width="200px" style="left: 30px; position: relative">
                            <table style="top: 15px; left: 25px; position: relative; text-align: center">
                                <tr>
                                    <th colspan="2" style="font-size: x-large">
                                        Sort by<br />
                                    </th>
                                </tr>
                                <tr>
                                    <th>
                                        <asp:Label ID="Label5" runat="server" Text="Price" Font-Size="Large"></asp:Label>
                                    </th>
                                    <td>
                                        <asp:DropDownList ID="sortPrice" runat="server" AutoPostBack="True" OnSelectedIndexChanged="sortPrice_SelectedIndexChanged">
                                            <asp:ListItem Selected="True">Random</asp:ListItem>
                                            <asp:ListItem>Low to High</asp:ListItem>
                                            <asp:ListItem>High to Low</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2" style="font-size: large">
                                        Find Product(s)
                                    </th>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="searchProducts" runat="server" style="width: 150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <br />
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" Font-Size="large" onClick="btnSearch_Click"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink ID="gotoAll" runat="server" ForeColor="Black" NavigateUrl="~/index.aspx">Show All Products</asp:HyperLink>
                                    </td>
                                </tr>
                                
                            </table>
                        </asp:Panel>

                        <br />
                        <asp:Panel ID="displayProducts" BorderStyle="Solid" runat="server" Width="1049px" style="top: -300px; left: 300px; position: relative">
                            <asp:DataList ID="productsDisplay" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" DataKeyField="pname" OnItemCommand="productsDisplay_ItemCommand" RepeatColumns="4" OnItemDataBound="productsDisplay_ItemDataBound">

                                <ItemTemplate>
                                    <table runat="server" class="auto-style1" border="1" style="border-collapse:collapse;">
                                        <tr>
                                            <td style="text-align: center">
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("pimage") %>' Style="z-index: 1; position: relative" onerror="this.onerror=null;this.src='img/products/human.png'" Height="256" />
                                            </td>
                                        </tr>
                                        <tr style="border: none">
                                              <td style="text-align: center">
                                                <asp:Label ID="Label1" runat="server" Style="z-index: 1; position: relative" Text='<%# Eval("pname") %>' Font-Bold="True" Font-Size="x-Large"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="border: none">
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text="Rs. " Font-Size="x-Large"></asp:Label>
                                                <asp:Label ID="Label2" runat="server" Style="z-index: 1; position: relative" Text='<%# Eval("price") %>' Font-Size="x-Large"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="border: none">
                                        <td style="z-index: 1; text-align: center">Select Quantity 
                                            <asp:DropDownList ID="DropDownList1" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2" style="text-align: center">
                                            <asp:ImageButton ID="ImageButton1" runat="server" Style="z-index: 1; position: relative" ImageUrl="~/img/addtocart.png" Height="50px" CommandName="addtocart" CommandArgument='<%# Eval("pname") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">Sold by 
                                            <asp:Label ID="Label3" runat="server" Style="z-index: 1; position: relative" Text='<%# Eval("uname") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    </table>
                                    <br />
                                    <br />
                                </ItemTemplate>

                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cmpConnectionString %>" SelectCommand="SELECT * FROM violet_products ORDER BY NEWID()"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:cmpConnectionString %>' SelectCommand="SELECT * FROM [violet_products] WHERE ([keywords] LIKE '%' + @keywords + '%')">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="searchProducts" PropertyName="Text" Name="keywords" Type="String"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:cmpConnectionString %>' SelectCommand="SELECT * FROM [violet_products] ORDER BY [price]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:cmpConnectionString %>' SelectCommand="SELECT * FROM [violet_products] ORDER BY [price] DESC"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString='<%$ ConnectionStrings:cmpConnectionString %>' SelectCommand="SELECT * FROM [violet_products] WHERE ([category] = @category)">
                                <SelectParameters>
                                    <asp:QueryStringParameter QueryStringField="category" Name="category" Type="String"></asp:QueryStringParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>

                    </div>
                </div>
            <!--Body-->

            <!-- Footer Section Begin -->
                <div class="footer" style="text-align: center; background-color: #262626; left: 0px">
                    <div style="left: 220px; position: absolute; color: #FFFFFF;">
                        <h2>About us</h2>
                            <ul style="list-style: none">
                                <li>About Us</li>
                                <li>Community</li>
                                <li>Jobs</li>
                                <li>Shipping</li>
                                <li>Contact Us</li>
                            </ul>
                    </div>
                
                    <div style="left: 470px; position: absolute; color: #FFFFFF;">
                        <h2>Customer Care</h2>
                            <ul style="list-style: none">
                                <li>Search</li>
                                <li>Privacy Policy</li>
                                <li>2019 Lookbook</li>
                                <li>Shipping & Delivery</li>
                                <li>Gallery</li>
                            </ul>
                    </div>
                
                    <div style="left: 780px; position: absolute; color: #FFFFFF;">
                        <h2>Our Services</h2>
                            <ul style="list-style: none">
                                <li>Free Shipping</li>
                                <li>Free Returnes</li>
                                <li>Our Franchising</li>
                                <li>Terms and conditions</li>
                                <li>Privacy Policy</li>
                            </ul>
                    </div>
                
                    <div style="left: 1100px; position: absolute; color: #FFFFFF;">
                        <h2>Information</h2>
                            <ul style="list-style: none">
                                <li>Payment methods</li>
                                <li>Times and shipping costs</li>
                                <li>Product Returns</li>
                                <li>Shipping methods</li>
                                <li>Conformity of the products</li>
                            </ul>
                    </div>

                    <div style="bottom: 15px; left: 600px; position: absolute; color: #FFFFFF;">
                        <h3>
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
                        </h3>
                    </div>
                </div>
            <!-- Footer Section End -->
        </div>
    </form>
</body>
</html>
