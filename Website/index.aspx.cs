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
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(<enter your database connection>);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["category"] != null)
            {
                productsDisplay.DataSourceID = null;
                productsDisplay.DataSource = SqlDataSource5;
                productsDisplay.DataBind();
            }
            if (Session["user"] != null)
            {
                Session["addproduct"] = "false";
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
            }
        }

        protected void productsDisplay_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addtocart")
            {
                Session["addproduct"] = "true";
                DropDownList number = (DropDownList)( e.Item.FindControl("DropDownList1") );
                Label lbl = (Label)( e.Item.FindControl("Label1") );

                SqlCommand cmd = new SqlCommand("SELECT stock FROM violet_products WHERE pname=@pname", con);
                cmd.Parameters.AddWithValue("@pname", lbl.Text);
                con.Open();
                SqlDataReader read = cmd.ExecuteReader();
                int q = 0;
                while (read.Read())
                {
                    q = Convert.ToInt32(read["stock"].ToString());
                }
                con.Close();
                int updateStock = q - Convert.ToInt32(number.SelectedItem.ToString());
                String update = "UPDATE violet_products SET stock=" + updateStock + " WHERE pname='" + lbl.Text + "'";
                SqlCommand cmd1 = new SqlCommand(update, con);
                //Executing Query
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();

                Response.Redirect("~/cart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + number.SelectedItem.ToString());
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/index.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (searchProducts.ToString() != null)
            {
                productsDisplay.DataSourceID = null;
                productsDisplay.DataSource = SqlDataSource2;
                productsDisplay.DataBind();
            }
        }

        protected void sortPrice_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            productsDisplay.DataSourceID = null;
            if (sortPrice.SelectedItem.Text == "Low to High")
            {
                productsDisplay.DataSource = SqlDataSource3;
                productsDisplay.DataBind();
            }
            else if(sortPrice.SelectedItem.Text == "High to Low")
            {
                productsDisplay.DataSource = SqlDataSource4;
                productsDisplay.DataBind();
            }
            else
            {
                productsDisplay.DataSource = SqlDataSource1;
                productsDisplay.DataBind();
            }
        }

        protected void productsDisplay_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DropDownList number = (DropDownList)( e.Item.FindControl("DropDownList1") );
            Label lbl = (Label)( e.Item.FindControl("Label1") );
            ImageButton imgBtn = (ImageButton)( e.Item.FindControl("ImageButton1") );

            SqlCommand cmd = new SqlCommand("SELECT stock FROM violet_products WHERE pname=@pname", con);
            cmd.Parameters.AddWithValue("@pname", lbl.Text);
            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            int q = 0;
            while (read.Read())
            {
                q = Convert.ToInt32(read["stock"].ToString());
            }
            con.Close();

            int i;
            if (q > 0)
            {
                for (i = 1; i <= q; i++)
                {
                    String n = i.ToString();
                    number.Items.Add(n);
                    if (i == 10)
                        break;
                }
            }
            else
            {
                number.Enabled = false;
                number.Items.Add("1");
                imgBtn.Enabled = false;
                imgBtn.ImageUrl = "img/sold.png";
            }
        }

        protected void searchIcon_Click(object sender, ImageClickEventArgs e)
        {
            searchProducts.Focus();
        }
    }
}