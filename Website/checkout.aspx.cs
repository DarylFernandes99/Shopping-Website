using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class checkout : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(<enter your database connection>);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                btnLogout.Visible = true;
                Menu1.Visible = false;
                profileIcon.Visible = true;
                cartIcon.Visible = true;
                countItems.Visible = true;
                DataTable dt = new DataTable();
                dt = (DataTable)Session["count"];
                if (dt != null)
                {
                    countItems.Text = dt.Rows.Count.ToString();
                }
                else
                {
                    countItems.Text = "0";
                }

                if (!IsPostBack)
                {
                    filldata();
                    orderDate.Text = DateTime.Now.ToShortDateString();
                    calculateOrderID();
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/index.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            btnCheckout.Visible = false;
            Panel1.Visible = false;
            completeOrder.Visible = true;
            orderIDCompleted.Text = orderID.Text;
            orderDateCompleted.Text = orderDate.Text;

            DataTable dt;
            dt = (DataTable)Session["count"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                String uname = "";
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT uname FROM violet_user_login WHERE username=@user OR email=@user", con);
                cmd.Parameters.AddWithValue("@user", Session["user"].ToString());
                SqlDataReader read = cmd.ExecuteReader();
                while (read.Read())
                {
                    uname = read["uname"].ToString();
                }
                con.Close();
                
                String updatepass = "INSERT INTO violet_order VALUES('" + uname.ToString() + "','" + dt.Rows[i]["pname"] + "','" + orderID.Text + "','" + orderDate.Text + "'," + dt.Rows[i]["quantity"] + "," + dt.Rows[i]["total"] + ")";
                con.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = updatepass;
                cmd1.Connection = con;
                cmd1.ExecuteNonQuery();
                con.Close();
            }

            SqlCommand cmd2 = new SqlCommand();
            String delete = "DELETE FROM violet_cart WHERE uname='" + Session["uname"] + "'";
            con.Open();
            cmd2.CommandText = delete;
            cmd2.Connection = con;
            cmd2.ExecuteNonQuery();
            con.Close();
        }

        //Fill data in  GriedView using DataTable
        public void filldata()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("pimage");
            dt.Columns.Add("pname");
            dt.Columns.Add("price");
            dt.Columns.Add("quantity");
            dt.Columns.Add("total");
            dt.Columns.Add("uname");

            if (Request.QueryString["id"] != null)
            {
                if (Session["count"] == null)
                {
                    dr = dt.NewRow();
                    String myquery = "SELECT * FROM violet_products where pname='" + Request.QueryString["id"] + "'";
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = myquery;
                    cmd.Connection = con;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = 1;
                    dr["pimage"] = ds.Tables[0].Rows[0]["pimage"].ToString();
                    dr["pname"] = ds.Tables[0].Rows[0]["pname"].ToString();
                    dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                    dr["quantity"] = Request.QueryString["quantity"];

                    decimal price = Convert.ToDecimal(ds.Tables[0].Rows[0]["price"].ToString());
                    int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                    decimal total = price * quantity;
                    dr["total"] = total;

                    dr["uname"] = ds.Tables[0].Rows[0]["uname"].ToString();
                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["count"] = dt;

                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[4].Text = "Grand Total";
                        GridView1.FooterRow.Cells[5].Text = grandTotal().ToString();
                    }
                }
                else
                {
                    dt = (DataTable)Session["count"];
                    int sr;
                    sr = dt.Rows.Count;

                    dr = dt.NewRow();
                    String myquery = "SELECT * FROM violet_products where pname='" + Request.QueryString["id"] + "'";
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = myquery;
                    cmd.Connection = con;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"] = sr + 1;
                    dr["pname"] = ds.Tables[0].Rows[0]["pname"].ToString();
                    dr["pimage"] = ds.Tables[0].Rows[0]["pimage"].ToString();
                    dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                    dr["quantity"] = Request.QueryString["quantity"];

                    decimal price = Convert.ToDecimal(ds.Tables[0].Rows[0]["price"].ToString());
                    int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                    decimal total = price * quantity;
                    dr["total"] = total;

                    dr["uname"] = ds.Tables[0].Rows[0]["uname"].ToString();
                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["count"] = dt;

                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[4].Text = "Grand Total";
                        GridView1.FooterRow.Cells[5].Text = grandTotal().ToString();
                    }
                }
            }
            else
            {
                dt = (DataTable)Session["count"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[4].Text = "Grand Total";
                    GridView1.FooterRow.Cells[5].Text = grandTotal().ToString();
                }
            }
        }

        //Finding total amount of all productsadded to cart
        public decimal grandTotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["count"];
            decimal grandTotal = 0;
            int i = 0;
            int n = dt.Rows.Count;
            while (i < n)
            {
                grandTotal = grandTotal + Convert.ToDecimal(dt.Rows[i]["total"].ToString());
                i = i + 1;
            }
            return grandTotal;
        }

        //Calculating Order ID
        public void calculateOrderID()
        {
            String pass = "abcdefghijklmnopqrstuvwxyz123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            Random r = new Random();
            char[] mypass = new char[5];
            for (int i = 0; i < 5; i++)
            {
                mypass[i] = pass[(int)( 61 * r.NextDouble() )];
            }
            String orderid;
            orderid = "#" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);

            orderID.Text = orderid;

        }
    }
}