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
    public partial class login : System.Web.UI.Page
    {
        //Connection
        SqlConnection con = new SqlConnection(<enter your database connection>);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/index.aspx");
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT uname, password FROM violet_user_login WHERE username=@name OR email=@name", con);
            cmd.Parameters.AddWithValue("@name", txtName.Text);

            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            string pass = "";
            string name = "";
            while (read.Read())
            {
                name = read["uname"].ToString();
                pass = read["password"].ToString();
            }
            con.Close();

            if (pass == txtPassword.Text)
            {
                Session["uname"] = name;
                Session["user"] = txtName.Text;
                Session["count"] = null;
                fillsavedCart();
                Response.Redirect("~/index.aspx");
            }
            else
            {
                txtName.Focus();
                lblErrorMsg.Visible = true;
            }
        }

        private void fillsavedCart()
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
            

            String myquery = "SELECT * from violet_cart where uname='" + Session["uname"].ToString() + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                int counter = ds.Tables[0].Rows.Count;
                while (i < counter)
                {
                    dr = dt.NewRow();
                    dr["sno"] = i + 1;
                    dr["pimage"] = ds.Tables[0].Rows[i]["pimage"].ToString();
                    dr["pname"] = ds.Tables[0].Rows[i]["pname"].ToString();
                    dr["price"] = ds.Tables[0].Rows[i]["price"].ToString();
                    dr["quantity"] = ds.Tables[0].Rows[i]["quantity"].ToString();
                    dr["uname"] = ds.Tables[0].Rows[i]["uname"].ToString();
                    decimal price1 = Convert.ToDecimal(ds.Tables[0].Rows[i]["price"].ToString());
                    int quantity1 = Convert.ToInt16(ds.Tables[0].Rows[i]["quantity"].ToString());
                    Decimal totalprice1 = price1 * quantity1;
                    dr["total"] = totalprice1;
                    
                    dt.Rows.Add(dr);
                    i = i + 1;
                }

            }
            else
            {
                Session["count"] = null;
            }
            Session["count"] = dt;
        }
    }
}