using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class forgotpass : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(<enter your database connection>);
        static string secans = "";
        static string emailid = "";
        static string pass = "";
        static string uname = "";

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

        protected void submit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT username, password, secq, seca, email FROM violet_user_login WHERE username=@username OR email=@username", con);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    uname = dr["username"].ToString();
                    lblSec.Text = dr["secq"].ToString();
                    pass = dr["password"].ToString();
                    secans = dr["seca"].ToString();
                    emailid = dr["email"].ToString();
                }
                con.Close();
                passwordPanel.Visible = true;
                lblErrorMsg.Visible = false;
                usernamePanel.Visible = false;
            }
            else
            {
                usernamePanel.Visible = true;
                passwordPanel.Visible = false;
                lblErrorMsg.Visible = true;
                txtUsername.Text = "";
                txtUsername.Focus();
            }
        }

        protected void submitAns_Click(object sender, EventArgs e)
        {
            if (txtSecA.Text == secans)
            {
                MailMessage Msg = new MailMessage();
                Msg.From = new MailAddress("enter email id");
                Msg.To.Add(emailid);
                Msg.Subject = "Password Recovery";
                Msg.Body = "Hi " + uname + " you're password is " + pass;

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("enter email id", "enter password");
                smtp.EnableSsl = true;
                smtp.Send(Msg);
                Msg = null;
                lblError.Visible = false;
                lblSuccess.Visible = true;
                Response.Redirect("~/login.aspx");
            }
            else
            {
                lblSuccess.Visible = false;
                lblError.Visible = true;
                txtSecA.Text = "";
                txtSecA.Focus();
            }
        }
    }
}
