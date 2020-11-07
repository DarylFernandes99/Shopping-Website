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
    public partial class sellerSignIn : System.Web.UI.Page
    {
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
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/index.aspx");
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            //Connection
            SqlConnection con = new SqlConnection(<enter your database connection>);

            SqlCommand cmd = new SqlCommand("SELECT password FROM violet_user_login WHERE username=@name OR email=@name", con);
            cmd.Parameters.AddWithValue("@name", txtName.Text);

            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            string pass = "";
            while (read.Read())
            {
                pass = read["password"].ToString();
            }
            con.Close();

            if (pass == txtPassword.Text)
            {
                Session["user"] = txtName.Text;
                Response.Redirect("~/index.aspx");
            }
            else
            {
                txtName.Focus();
                lblErrorMsg.Visible = true;
            }
        }
    }
}