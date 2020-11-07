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
    public partial class contact : System.Web.UI.Page
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
            String strMessage = txtMessage.Value;

            //Connection
            SqlConnection con = new SqlConnection(<enter your database connection>);

            //Insertion
            SqlCommand cmd = new SqlCommand("INSERT INTO violet_contact VALUES (@name, @email, @message)", con);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@message", strMessage);

            //Executing Query
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Value = "";
            lblErrorMsg.Visible = true;
        }
    }
}