<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Website.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About</title>

    <!--Css Link-->
        <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;<div class="container">
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

                        <asp:ImageButton ID="searchIcon" runat="server" ImageUrl="~/img/icons/search.png" PostBackUrl="~/index.aspx" style="top: 30px; left: 1300px; position: absolute"/>
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
                    <asp:Label ID="lblCartMsg" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" style="left: 720px; top: 10px; position: absolute" Text="Cart"></asp:Label>
                    <br /><br />
                    <asp:Label ID="lblEmpty" runat="server" Text="Cart is Empty, Add item(s) to your Cart!!!" Font-Size="x-Large" style="left: 550px; top: 100px; position: absolute" Visible="False"></asp:Label>
                    <div style="top: 100px; text-align: center; position: relative">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" Height="348px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HeaderStyle-BackColor="#999999" FooterStyle-BackColor="#999999" FooterStyle-BorderWidth="5px" HeaderStyle-BorderWidth="5px" Font-Bold="True">

                            <Columns>
                                <asp:BoundField DataField="sno" HeaderText="Sr. No.">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:ImageField DataImageUrlField="pimage" HeaderText="Product Image">
                                    <ItemStyle HorizontalAlign="Center" Height="50px"></ItemStyle>
                                </asp:ImageField>
                                <asp:BoundField DataField="pname" HeaderText="Product Name">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="price" HeaderText="Price (Rs.)">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="total" HeaderText="Total Price">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="uname" HeaderText="Seller Name">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:CommandField SelectText="Modify" ShowSelectButton="True" />
                                <asp:CommandField DeleteText="Remove Item(s)" ShowDeleteButton="True" />
                            </Columns>

                        </asp:GridView>

                        <asp:Panel ID="editQuantity" runat="server" Height="280px" style="z-index: 1; top: -50px; left: 500px; position: relative; text-align: center" Width="520px" Visible="False">

                            <table border="1" style="top: 50px; left: 18px; position: relative; text-align: center; border-collapse: collapse;">
                                <tr style="border: none">
                                    <th>
                                        <asp:Label ID="Label1" runat="server" Text="Sr. No." Font-Size="x-Large" Font-Bold="true"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label2" runat="server" Text="Product Name" Font-Size="x-Large" Font-Bold="true"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label7" runat="server" Text="Price" Font-Size="x-Large" Font-Bold="true"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label8" runat="server" Text="Quantity" Font-Size="x-Large" Font-Bold="true"></asp:Label>
                                    </th>
                                    <th>
                                        <asp:Label ID="Label9" runat="server" Text="Total Cost" Font-Size="x-Large" Font-Bold="true"></asp:Label>
                                    </th>
                                </tr>

                                <tr style="border: none">
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Font-Size="Large"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Font-Size="Large"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Font-Size="Large"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="medium" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Font-Size="Large"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="border: none">
                                    <td rowspan="2" colspan="5">
                                        <br/>
                                        <asp:Button ID="btnUpdate" runat="server" Text="Update" Font-Size="Medium" OnClick="btnUpdate_Click"/>
                                        <br />
                                    </td>
                                </tr>
                            </table>

                        </asp:Panel>

                        <br /><br />

                        <asp:Button ID="btnCheckout" runat="server" Text="Proceed to checkout" Font-Size="Large" Visible="False" PostBackUrl="~/checkout.aspx" />

                        <br /><br />
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
