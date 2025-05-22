# Shopping Website - E-Commerce Platform

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-ASP.NET-purple.svg)
![Language](https://img.shields.io/badge/language-C%23-green.svg)
![Database](https://img.shields.io/badge/database-SQL%20Server-red.svg)

A comprehensive e-commerce web application built using **ASP.NET Web Forms** and **C#**. This platform enables dual user roles - customers can browse and purchase products while sellers can register and list their products for sale.

## 🌟 Overview

This Shopping Website is a full-featured e-commerce platform that demonstrates modern web development practices using ASP.NET Web Forms. The application supports a dual marketplace model where both customers and sellers can interact within the same platform.

**Key Highlights:**
- Dual user registration system (Customer/Seller)
- Product catalog with search and filtering
- Shopping cart functionality with session management
- Secure user authentication and authorization
- Responsive design with custom styling
- Database-driven product management
- Order processing and checkout system

## ✨ Features

### For Customers
- **User Registration & Authentication** - Secure account creation and login
- **Product Browsing** - View products with images, prices, and seller information
- **Advanced Search** - Search products by keywords with smart filtering
- **Product Sorting** - Sort by price (Low to High, High to Low)
- **Category Filtering** - Browse products by specific categories
- **Shopping Cart** - Add/remove products with quantity selection
- **Profile Management** - Update personal information and view order history
- **Secure Checkout** - Complete purchase process with order confirmation

### For Sellers
- **Seller Registration** - Dedicated seller account creation
- **Product Management** - Add new products with images and descriptions
- **Inventory Tracking** - Monitor stock levels and availability
- **Seller Dashboard** - Manage listed products and view sales
- **Category Selection** - Organize products into appropriate categories

### General Features
- **Responsive Navigation** - Easy-to-use menu system
- **Session Management** - Persistent shopping cart across sessions
- **Image Upload** - Support for product image uploads
- **Password Recovery** - Forgot password functionality
- **Contact System** - Customer support and inquiry handling
- **Modern UI/UX** - Clean, professional design

## 🛠 Technology Stack

### Frontend
- **ASP.NET Web Forms** - Server-side web application framework
- **HTML5** - Semantic markup structure
- **CSS3** - Custom styling and responsive design
- **JavaScript** - Client-side interactivity and validation

### Backend
- **C# (.NET Framework 4.7.2)** - Server-side programming language
- **ASP.NET Web Forms** - Web application framework
- **ADO.NET** - Data access technology

### Database
- **Microsoft SQL Server** - Relational database management system
- **T-SQL** - Database query language

### Development Tools
- **Visual Studio 2019** - Integrated development environment
- **IIS Express** - Web server for development
- **NuGet** - Package management

### Third-Party Libraries
- **Microsoft.CodeDom.Providers.DotNetCompilerPlatform** (v2.0.1) - Roslyn compiler support
- **iTextSharp** - PDF generation (for invoices/receipts)

## 📁 Project Structure

```
Shopping-Website/
├── Website/                          # Main web application
│   ├── *.aspx                       # Web Forms pages
│   ├── *.aspx.cs                    # Code-behind files
│   ├── *.aspx.designer.cs           # Designer files
│   ├── img/                         # Static images
│   │   ├── categories/              # Category images
│   │   ├── icons/                   # UI icons
│   │   ├── logos/                   # Brand logos
│   │   └── products/                # Product images
│   ├── css/                         # Stylesheets
│   ├── Web.config                   # Application configuration
│   ├── Website.csproj               # Project file
│   └── packages.config              # NuGet packages
├── packages/                        # NuGet packages
├── DbSql.sql                        # Database schema script
├── Website.sln                      # Solution file
├── LICENSE                          # MIT license
└── README.md                        # Project documentation
```

## 🗄 Database Schema

The application uses a relational database with the following main tables:

### Tables Overview

#### `violet_user_login`
Stores customer account information
```sql
- uname (VARCHAR(50), PRIMARY KEY)    # User full name
- email (VARCHAR(50), UNIQUE)         # Email address
- username (VARCHAR(20), UNIQUE)      # Login username
- password (VARCHAR(20))              # User password
- phone (DECIMAL(10,0), UNIQUE)       # Phone number
- dob (DATE)                          # Date of birth
- country (VARCHAR(20))               # Country
- state (VARCHAR(20))                 # State
- city (VARCHAR(20))                  # City
- gender (VARCHAR(10))                # Gender
- address (VARCHAR(500))              # Full address
- secq (VARCHAR(100))                 # Security question
- seca (VARCHAR(20))                  # Security answer
```

#### `violet_seller_login`
Stores seller account information (same structure as user_login)

#### `violet_products`
Stores product information
```sql
- pname (VARCHAR(50), PRIMARY KEY)    # Product name
- price (DECIMAL(20,2))               # Product price
- pimage (VARCHAR(250), UNIQUE)       # Product image path
- category (VARCHAR(15))              # Product category
- sname (VARCHAR(50), FOREIGN KEY)    # Seller name reference
- stock (INT)                         # Available quantity
- keywords (VARCHAR(500))             # Search keywords
```

#### `violet_cart`
Stores shopping cart items
```sql
- uname (VARCHAR(50), FOREIGN KEY)    # User reference
- pname (VARCHAR(50), FOREIGN KEY)    # Product reference
- quantity (INT)                      # Item quantity
```

#### `violet_contact`
Stores contact form submissions
```sql
- uname (VARCHAR(50))                 # User name
- email (VARCHAR(50))                 # Contact email
- message (VARCHAR(500))              # Message content
```

## 🚀 Setup Instructions

### Prerequisites
- **Visual Studio 2019** or later
- **SQL Server** (Express/Developer/Standard)
- **.NET Framework 4.7.2** or later
- **IIS Express** (included with Visual Studio)

### Step-by-Step Installation

#### 1. Database Setup
1. Open **SQL Server Management Studio (SSMS)**
2. Execute the script in `DbSql.sql` to create the database and tables:
   ```sql
   -- Create database
   CREATE DATABASE website;
   USE website;
   
   -- Execute all table creation scripts from DbSql.sql
   ```

#### 2. Configure Database Connection
1. Open `Website/Web.config`
2. Update the connection string:
   ```xml
   <connectionStrings>
     <add name="cmpConnectionString" 
          connectionString="Data Source=your-server;Initial Catalog=website;Integrated Security=True"
          providerName="System.Data.SqlClient" />
   </connectionStrings>
   ```

#### 3. Update Code-Behind Files
Update the connection string in all `.aspx.cs` files:
```csharp
SqlConnection con = new SqlConnection("Data Source=your-server;Initial Catalog=website;Integrated Security=True");
```

#### 4. Open in Visual Studio
1. Open `Website.sln` in Visual Studio 2019
2. Restore NuGet packages (automatic)
3. Build the solution (`Ctrl+Shift+B`)

#### 5. Run the Application
1. Set the Website project as startup project
2. Press `F5` or click **Start Debugging**
3. The application will open in your default browser at `https://localhost:44337/`

### 🔧 Configuration Options

#### Application Settings
In `Web.config`, you can configure:
- **Database Connection**: Update connection strings
- **Session Timeout**: Modify session state settings
- **Error Handling**: Configure custom error pages
- **Security**: Set authentication and authorization rules

#### Upload Directories
Ensure the following directories have appropriate permissions:
- `Website/img/products/` - For product images
- `Website/img/categories/` - For category images

## 👥 User Roles & Functionality

### Customer Journey
1. **Registration** (`register.aspx`)
   - Create new customer account
   - Provide personal details and contact information
   - Set login credentials

2. **Authentication** (`login.aspx`)
   - Secure login with username/email and password
   - Session management for persistent login
   - Password recovery option

3. **Shopping Experience** (`index.aspx`)
   - Browse featured products
   - Search products by keywords
   - Filter by categories and price
   - Sort products (price low-to-high, high-to-low)

4. **Cart Management** (`cart.aspx`)
   - Add products to shopping cart
   - Modify quantities
   - Remove items
   - View total cost

5. **Checkout Process** (`checkout.aspx`)
   - Review order details
   - Confirm purchase
   - Complete transaction

### Seller Journey
1. **Seller Registration** (`sellerRegister.aspx`)
   - Create seller account
   - Provide business details

2. **Seller Authentication** (`sellerSignIn.aspx`)
   - Secure seller login
   - Access to seller dashboard

3. **Product Management** (`addProducts.aspx`)
   - Add new products with images
   - Set prices and categories
   - Manage inventory levels
   - Update product descriptions

4. **Seller Dashboard** (`sellerProfile.aspx`)
   - View listed products
   - Monitor sales performance
   - Update seller information

## 📄 Page Descriptions

### Public Pages
- **`index.aspx`** - Homepage with product catalog and search functionality
- **`about.aspx`** - Company information and mission statement
- **`contact.aspx`** - Contact form and business details
- **`blog.aspx`** - News, updates, and shopping tips
- **`categories.aspx`** - Product categories and filtered views

### Authentication Pages
- **`login.aspx`** - User login form with validation
- **`register.aspx`** - Customer registration form
- **`sellerSignIn.aspx`** - Seller login portal
- **`sellerRegister.aspx`** - Seller registration form
- **`forgotpass.aspx`** - Password recovery system

### User Dashboard
- **`profile.aspx`** - Customer profile management
- **`cart.aspx`** - Shopping cart with item management
- **`checkout.aspx`** - Order processing and payment

### Seller Dashboard
- **`sellerProfile.aspx`** - Seller account management
- **`addProducts.aspx`** - Product listing and management

## 🎨 UI/UX Features

### Design Elements
- **Responsive Navigation** - Fixed header with dropdown menus
- **Product Grid** - Clean product display with images and details
- **Search & Filter** - Advanced search with sorting options
- **Shopping Cart Icon** - Real-time cart item counter
- **Footer Links** - Organized footer with company information

### Interactive Features
- **Image Hover Effects** - Product image interactions
- **Form Validation** - Client and server-side validation
- **Session Indicators** - Login status and user information
- **Loading States** - Visual feedback during operations

## 🔒 Security Features

### Authentication & Authorization
- **Password Encryption** - Secure password storage
- **Session Management** - Secure session handling
- **SQL Injection Prevention** - Parameterized queries
- **Input Validation** - Server-side validation for all forms

### Data Protection
- **User Data Security** - Protected personal information
- **Secure File Upload** - Validated image uploads
- **Error Handling** - Custom error pages without sensitive information

## 📱 Browser Compatibility

### Supported Browsers
- **Chrome** 80+ ✅
- **Firefox** 75+ ✅
- **Safari** 13+ ✅
- **Edge** 80+ ✅
- **Internet Explorer** 11+ ⚠️ (Limited support)

## 🐛 Known Issues & Limitations

### Current Limitations
1. **Payment Integration** - No actual payment gateway (demo only)
2. **Email Notifications** - Email system not implemented
3. **Advanced Search** - Limited search filters
4. **Mobile Responsiveness** - Needs optimization for mobile devices
5. **Image Optimization** - No automatic image resizing

### Future Enhancements
- **Payment Gateway Integration** (PayPal, Stripe)
- **Email Notification System**
- **Advanced Product Filtering**
- **Mobile-First Responsive Design**
- **Product Reviews and Ratings**
- **Order Tracking System**
- **Admin Dashboard**
- **Analytics and Reporting**

## 🤝 Contributing

We welcome contributions to improve the Shopping Website! Here's how you can help:

### How to Contribute
1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### Development Guidelines
- Follow C# coding conventions
- Write clear commit messages
- Update documentation for new features
- Test thoroughly before submitting PR
- Ensure database changes are documented

### Areas for Contribution
- **Bug Fixes** - Report and fix issues
- **New Features** - Add functionality
- **UI/UX Improvements** - Enhance user experience
- **Performance Optimization** - Improve application speed
- **Security Enhancements** - Strengthen security measures
- **Documentation** - Improve project documentation

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

### MIT License Summary
- ✅ **Commercial Use** - Use for commercial projects
- ✅ **Modification** - Modify the code
- ✅ **Distribution** - Distribute the code
- ✅ **Private Use** - Use privately
- ❌ **Liability** - No warranty provided
- ❌ **Warranty** - No warranty provided

---

## 🎯 Quick Start

### For Developers
```bash
# Clone the repository

# Open in Visual Studio
start Website.sln

# Update connection string in Web.config
# Build and run (F5)
```

### For Users
1. Navigate to the homepage
2. Register as a customer or seller
3. Start shopping or listing products
4. Enjoy the e-commerce experience!

---

**Made with ❤️ using ASP.NET and C#**

*This project demonstrates modern web development practices and serves as an educational resource for learning e-commerce application development.*
