<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Website.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>

    <!--Css Link-->
        <link rel="stylesheet" type="text/css" href="css/style.css" />
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
                    <asp:Label ID="lblSignupMsg" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" style="left: 650px; top: 10px; position: absolute" Text="Registration Page"></asp:Label>
                    <div style="top: 100px; position: relative; text-align: center; font-size: large">
                        <asp:Label ID="lblImportant" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" style="width: 300px; height: 30px" placeholder="Enter Name..."></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validateNameEmpty" runat="server" ErrorMessage="Name field cannot be left blank" ControlToValidate="txtName" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="validateName" runat="server" ErrorMessage="Name should not contain any Numbers or Special Characters" ControlToValidate="txtName" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                        <br /><br />

                        <asp:Label ID="Label1" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" style="width: 300px; height: 30px" placeholder="Enter Email-ID...."></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validateEmailEmpty" runat="server" ErrorMessage="Email-ID field cannot be left blank" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Incorrect Email-ID" ControlToValidate="txtEmail" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,3})$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <br /><br />

                        <asp:Label ID="Label2" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server" style="width: 300px; height: 30px" placeholder="Enter Username...."></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validateUsernameEmpty" runat="server" ErrorMessage="Username field cannot be left blank" ControlToValidate="txtUsername" ForeColor="Red" SetFocusOnError="True" Display="Static"></asp:RequiredFieldValidator>
                        <br /><br />

                        <asp:Label ID="Label3" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" style="width: 300px; height: 30px" placeholder="Enter Password...." TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validatePasswordEmpty" runat="server" ErrorMessage="Password field cannot be left blank" ControlToValidate="txtPassword" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="validatePasswordExp" runat="server" ErrorMessage="Password Should contain 1 Upper and 1 Lower case, 1 Number and <br> 1 Special Character and should have 8 minimum characters" ControlToValidate="txtPassword" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <br /><br />

                        <asp:Label ID="Label4" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" style="width: 300px; height: 30px" placeholder="Re-Enter Password...." TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validateConfirmEmpty" runat="server" ErrorMessage="Confirm Password field cannot be left blank" ControlToValidate="txtConfirmPassword" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="validateConfirm" runat="server" ErrorMessage="Password Mismatch" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                        <br /><br />

                        <asp:Label ID="Label5" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" style="width: 300px; height: 30px" placeholder="Enter Phone Number...." MaxLength="10"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="validatePhoneEmpty" runat="server" ErrorMessage="Enter Phone Number" ControlToValidate="txtPhone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="validatePhone" runat="server" ErrorMessage="Phone number can only contain numbers" ControlToValidate="txtPhone" ForeColor="Red" ValidationExpression="^[0-9]{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        <br /><br />

                        <asp:Label ID="Label6" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtDOB" runat="server" style="width: 150px; height: 30px" TextMode="Date" placeholder="Enter Date Of Birth...."></asp:TextBox>
                            <br />
                            <asp:CompareValidator ID="validateAge" runat="server" ErrorMessage="Enter a valid Date Of Birth" Operator="LessThanEqual" ControlToValidate="txtDOB" ForeColor="Red" SetFocusOnError="True" Type="Date"></asp:CompareValidator>
                        <br /><br />

                        <asp:Label ID="Label7" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:DropDownList ID="selectCountry" runat="server" style="width: 100px; height: 30px" placeholder="Select Country....">
                            <asp:ListItem Selected="True">Select</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>USA</asp:ListItem>
                            <asp:ListItem>Germany</asp:ListItem>
                            <asp:ListItem>England</asp:ListItem>
                            <asp:ListItem>Pakistan</asp:ListItem>
                        </asp:DropDownList>
                            <br />
                            <%--<asp:CompareValidator ID="checkCountry" runat="server" ErrorMessage="Select a Country" ControlToValidate="selectCountry" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:CompareValidator>--%>
                        
                        <br /><br />

                        <asp:Label ID="Label8" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:DropDownList ID="selectState" runat="server" style="width: 100px; height: 30px" placeholder="Select State....">
                            <asp:ListItem Selected="True">Select</asp:ListItem>
                            <asp:ListItem>Maharashtra</asp:ListItem>
                            <asp:ListItem>Delhi</asp:ListItem>
                            <asp:ListItem>Goa</asp:ListItem>
                            <asp:ListItem>Gujarat</asp:ListItem>
                            <asp:ListItem>Karnataka</asp:ListItem>
                        </asp:DropDownList>
                            <br />
                            <%--<asp:CompareValidator ID="validateState" runat="server" ErrorMessage="Select a state" ControlToValidate="selectState" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:CompareValidator>--%>
                        <br /><br />

                        <asp:Label ID="Label9" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:DropDownList ID="selectCity" runat="server" style="width: 100px; height: 30px" placeholder="Select City....">
                            <asp:ListItem Selected="True">Select</asp:ListItem>
                            <asp:ListItem>Mumbai</asp:ListItem>
                            <asp:ListItem>Thane</asp:ListItem>
                            <asp:ListItem>Pune</asp:ListItem>
                            <asp:ListItem>Kolhapur</asp:ListItem>
                            <asp:ListItem>Ratnagiri</asp:ListItem>
                        </asp:DropDownList>
                            <br />
                            <%--<asp:RequiredFieldValidator ID="validateCity" runat="server" ErrorMessage="Select a city" ControlToValidate="selectCity" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        <br /><br />

                        <asp:RadioButtonList ID="selectGender" runat="server" style="left: 600px; position: absolute; width: 300px; height: 30px; font-size: large" placeholder="Select Gender...." RepeatDirection="Horizontal">
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                        </asp:RadioButtonList>
                        <br /><br /><br />

                        <asp:Label ID="Label13" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <textarea id="txtAddress" runat="server" cols="20" rows="2" style="width: 300px; height:100px" placeholder="Enter Complete Address...."></textarea>
                            <br />
                            <asp:RequiredFieldValidator ID="validateAddress" runat="server" ErrorMessage="Address Field cannot be left blank" ControlToValidate="txtAddress" ForeColor="Red" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                        <br/><br />

                        <asp:Label ID="Label11" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:DropDownList ID="txtSecurityQ" runat="server" style="width: 300px; height: 30px" placeholder="Select Security Question....">
                            <asp:ListItem>What is your Mother&#39;s maiden name?</asp:ListItem>
                            <asp:ListItem>What is your childhood friend&#39;s name?</asp:ListItem>
                            <asp:ListItem>What is the name of your first school?</asp:ListItem>
                        </asp:DropDownList>
                            <br />
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select a Security Question" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" ControlToValidate="txtSecurityQ"></asp:RequiredFieldValidator>--%>
                        <br /><br />
                        
                        <asp:Label ID="Label12" runat="server" Text="*" Font-Size="Large" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtSecurityA" runat="server" style="width: 300px; height: 30px" placeholder="Enter Security Answer...."></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Answer field cannot be left blank" ControlToValidate="txtSecurityA" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <br /><br />

                        <!--Buttons-->
                            <asp:Button ID="Submit" runat="server" Text="Submit" Font-Size="Large" OnClick="Submit_Click"/>
                            &nbsp &nbsp &nbsp &nbsp
                            <input id="btReset" type="reset" value="Reset" style="font-size: large" />

                        <br /><br />
                        <asp:Label ID="Label10" runat="server" Text="* - All fields are to be filled." Font-Size="medium" ForeColor="Red"></asp:Label>
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

                    <div style="bottom: 15px; left: 620px; position: absolute; color: #FFFFFF;">
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


