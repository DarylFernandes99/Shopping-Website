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
    public partial class cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(<enter your database connection>);
        static Boolean availabledesignid = false;
        String uname = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                btnLogout.Visible = true;
                Menu1.Visible = false;
                profileIcon.Visible = true;
                cartIcon.Visible = true;
                countItems.Visible = true;

                SqlCommand cmd = new SqlCommand("SELECT uname FROM violet_user_login WHERE username=@name OR email=@name", con);
                cmd.Parameters.AddWithValue("@name", Session["user"]);
                con.Open();
                SqlDataReader read = cmd.ExecuteReader();
                while (read.Read())
                {
                    uname = read["uname"].ToString();
                }
                con.Close();

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
                }
            }
            else
            {
                countItems.Text = "";
                lblEmpty.Text = "Login First to add itmes to your cart";
                lblEmpty.Visible = true;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/index.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string productName = "";
            DataTable dt = new DataTable();
            dt = (DataTable)Session["count"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                productName = dt.Rows[i]["pname"].ToString();
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);

                if (sr == sr1)
                {
                    //Updating stock after deletion
                    int j = Convert.ToInt32(dt.Rows[i]["quantity"].ToString());
                    String updateQuantity = "UPDATE violet_products SET stock=stock+" + j +" WHERE pname='" + productName + "'";
                    SqlCommand cmd1 = new SqlCommand(updateQuantity, con);
                    //Executing Query
                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();

                    dt.Rows[i].Delete();
                    dt.AcceptChanges();

                    String update = "DELETE FROM violet_cart WHERE uname='" + uname + "' AND pname='" + productName + "' AND sno=" + sr;
                    SqlCommand cmd = new SqlCommand(update, con);
                    //Executing Query
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    break;
                }
            }

            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                productName = dt.Rows[i-1]["pname"].ToString();
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();

                String update = "UPDATE violet_cart SET sno=" + Convert.ToInt32(dt.Rows[i - 1]["sno"].ToString()) + " WHERE uname='" + uname + "' AND pname='" + productName + "'";
                SqlCommand cmd = new SqlCommand(update, con);
                //Executing Query
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }

            Session["count"] = dt;
            Response.Redirect("~/cart.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnCheckout.Visible = false;
            GridView1.Visible = false;
            editQuantity.Visible = true;
            lblEmpty.Visible = false;
            modify(GridView1.SelectedRow.Cells[0].Text);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int q;
            q = Convert.ToInt32(DropDownList1.Text);
            decimal cost;
            cost = Convert.ToDecimal(Label5.Text);
            decimal totalcost;
            totalcost = cost * q;
            Label6.Text = totalcost.ToString();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DataTable dt;

            dt = (DataTable)Session["count"];

            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());

                sr1 = Convert.ToInt32(Label3.Text);

                if (sr == sr1)
                {
                    //Updating stock after updating cart
                    int j = Convert.ToInt32(DropDownList1.Text);
                    String updateQuantity = "UPDATE violet_products SET stock=(stock+" + Convert.ToInt32(Session["oldQuantity"].ToString()) + "-" + j + ") WHERE pname='" + Label4.Text + "'";
                    SqlCommand cmd1 = new SqlCommand(updateQuantity, con);
                    //Executing Query
                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();

                    dt.Rows[i]["sno"] = Label3.Text;
                    dt.Rows[i]["pname"] = Label4.Text;
                    dt.Rows[i]["quantity"] = DropDownList1.Text;
                    dt.Rows[i]["price"] = Label5.Text;
                    dt.Rows[i]["total"] = Label6.Text;
                    dt.AcceptChanges();

                    String update = "UPDATE violet_cart SET quantity=" + Convert.ToInt32(dt.Rows[i]["quantity"].ToString()) + ", total=" + Convert.ToDecimal(dt.Rows[i]["total"].ToString()) + " WHERE uname='" + uname + "' AND pname='" + Label4.Text + "'";
                    SqlCommand cmd = new SqlCommand(update, con);
                    //Executing Query
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    break;
                }
            }
            Response.Redirect("~/cart.aspx");

        }

        //Fill data in  GriedView using DataTable
        public void filldata()
        {
            if(Session["addproduct"].ToString() == "true")
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
                Session["addproduct"] = "false";

                if (Request.QueryString["id"] != null)
                {
                    btnCheckout.Visible = true;
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

                        savecartdetail(uname, 1, ds.Tables[0].Rows[0]["pimage"].ToString(), ds.Tables[0].Rows[0]["pname"].ToString(), Convert.ToDecimal(ds.Tables[0].Rows[0]["price"].ToString()), Convert.ToInt32(Request.QueryString["quantity"].ToString()), total, ds.Tables[0].Rows[0]["uname"].ToString());

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
                        checkdesignid();
                        if (availabledesignid == true)
                        {
                            updatequantity();
                            DataTable dt1;
                            dt1 = (DataTable)Session["count"];
                            GridView1.DataSource = dt1;
                            GridView1.DataBind();
                            availabledesignid = false;
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

                            savecartdetail(uname, sr+1, ds.Tables[0].Rows[0]["pimage"].ToString(), ds.Tables[0].Rows[0]["pname"].ToString(), Convert.ToDecimal(ds.Tables[0].Rows[0]["price"].ToString()), Convert.ToInt32(Request.QueryString["quantity"].ToString()), total, ds.Tables[0].Rows[0]["uname"].ToString());

                            dt.Rows.Add(dr);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["count"] = dt;
                        }

                        if (GridView1.Rows.Count > 0)
                        {
                            GridView1.FooterRow.Cells[4].Text = "Grand Total";
                            GridView1.FooterRow.Cells[5].Text = grandTotal().ToString();
                        }
                    }
                }
            }
            else
            {
                DataTable dt;
                dt = (DataTable)Session["count"];
                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[4].Text = "Grand Total";
                    GridView1.FooterRow.Cells[5].Text = grandTotal().ToString();
                    lblEmpty.Visible = false;
                    btnCheckout.Visible = true;
                }
                else
                    lblEmpty.Visible = true;
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

        public void modify(string modifyQuantity)
        {
            DataTable dt;

            if (!IsPostBack)
            {

            }
            else
            {
                if (modifyQuantity != null)
                {
                    dt = (DataTable)Session["count"];

                    for (int i = 0; i <= dt.Rows.Count - 1; i++)
                    {
                        int sr;
                        int sr1;
                        sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                        Label3.Text = modifyQuantity;
                        Label4.Text = sr.ToString();
                        sr1 = Convert.ToInt32(Label3.Text);

                        if (sr == sr1)
                        {
                            //Inserting contents of DropDownList
                            SqlCommand cmd = new SqlCommand("SELECT stock FROM violet_products WHERE pname=@pname", con);
                            cmd.Parameters.AddWithValue("@pname", dt.Rows[i]["pname"].ToString());
                            con.Open();
                            SqlDataReader read = cmd.ExecuteReader();
                            int q = 0;
                            while (read.Read())
                            {
                                q = Convert.ToInt32(read["stock"].ToString());
                            }
                            con.Close();
                            int j;
                            if (q > 0)
                            {
                                for (j = 1; j <= q; j++)
                                {
                                    String n = j.ToString();
                                    DropDownList1.Items.Add(n);
                                }
                            }
                            else
                            {
                                DropDownList1.Items.Add("1");
                                DropDownList1.Enabled = false;
                            }

                            Label3.Text = dt.Rows[i]["sno"].ToString();
                            Label4.Text = dt.Rows[i]["pname"].ToString();
                            DropDownList1.Text = dt.Rows[i]["quantity"].ToString();
                            Session["oldQuantity"] = DropDownList1.Text;
                            Label5.Text = dt.Rows[i]["price"].ToString();
                            Label6.Text = dt.Rows[i]["total"].ToString();
                            break;
                        }
                    }
                }
            }
        }

        private void checkdesignid()
        {
            DataTable dt;
            string designid;
            string querydesignid = Request.QueryString["id"].ToString();
            dt = (DataTable)Session["count"];
            foreach (DataRow row in dt.Rows)
            {
                designid = row["pname"].ToString();
                if (designid == querydesignid)
                {
                    availabledesignid = true;
                }
            }
        }

        private void updatequantity()
        {
            DataTable dt;
            string designid;
            String querydesignid = Request.QueryString["id"];
            dt = (DataTable)Session["count"];
            foreach (DataRow row in dt.Rows)
            {
                designid = row["pname"].ToString();
                if (designid == querydesignid)
                {
                    int newquantity = Convert.ToInt16(row["quantity"].ToString()) + Convert.ToInt16(Request.QueryString["quantity"].ToString());
                    row["quantity"] = newquantity;
                    Decimal price = Convert.ToDecimal(row["price"].ToString());
                    Decimal totalprice = price * newquantity;
                    row["total"] = totalprice;
                    break;
                }
            }
            Session["count"] = dt;
        }

        private void savecartdetail(String name, int sno, String productimage, String Productname, Decimal price, int quantity, Decimal totalprice, String sname)
        {
            String query = "INSERT INTO violet_cart values('" + name + "', " + sno + ", '" + productimage + "', '" + Productname + "', " + price + ", " + quantity + ", " + totalprice + ", '" + sname +"')";
            
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}