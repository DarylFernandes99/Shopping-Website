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
    public partial class sellerRegister : System.Web.UI.Page
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

            if (!Page.IsPostBack)
            {
                validateAge.ValueToCompare = DateTime.Today.ToShortDateString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/index.aspx");
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            String strAddress = txtAddress.Value;

            //Connection
            SqlConnection con = new SqlConnection(<enter your database connection>);

            //Insertion
            SqlCommand cmd = new SqlCommand("INSERT INTO violet_user_login VALUES (@name, @email, @username, @password, @phone, @dob, @country, @state, @city, @gender, @address, @secq, @seca)", con);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
            cmd.Parameters.AddWithValue("@country", selectCountry.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@state", selectState.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@city", selectCity.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@gender", selectGender.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("@address", strAddress);
            cmd.Parameters.AddWithValue("@secq", txtSecurityQ.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@seca", txtSecurityA.Text);

            //Executing Query
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/login.aspx");
        }
    }
}