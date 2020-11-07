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
    public partial class sellerProfile : System.Web.UI.Page
    {
        //Connection
        readonly SqlConnection con = new SqlConnection(<enter your database connection>);
        int uid = 0000;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                btnLogout.Visible = true;
                Menu1.Visible = false;
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }

            SqlCommand cmd = new SqlCommand("SELECT * FROM violet_user_login where username=@name OR email=@name", con);
            cmd.Parameters.AddWithValue("@name", Session["user"]);

            if (!Page.IsPostBack)
            {
                validateAge.ValueToCompare = DateTime.Today.ToShortDateString();
                con.Open();
                SqlDataReader read = cmd.ExecuteReader();
                while (read.Read())
                {
                    txtName.Text = read["uname"].ToString();
                    txtEmail.Text = read["email"].ToString();
                    txtUsername.Text = Session["user"].ToString();
                    txtPhone.Text = read["phone"].ToString();
                    txtDOB.Text = read["dob"].ToString();
                    txtDOB.Text = txtDOB.Text.Substring(0, 10);
                    selectCountry.Text = read["country"].ToString();
                    selectState.Text = read["state"].ToString();
                    selectCity.Text = read["city"].ToString();
                    lblGender.Text = read["gender"].ToString();
                    txtAddress.InnerText = read["address"].ToString();
                    uid = Convert.ToInt32(read["uid"]);
                }
                con.Close();
            }

            if (uid < 5000)
            {
                Response.Redirect("~/profile.aspx");
            }

            //Disable Fields
            disableInput();
            Submit.Visible = false;
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            txtPhone.Enabled = true;
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            
        }

        public void disableInput()
        {
            txtName.Enabled = false;
            txtEmail.Enabled = false;
            txtUsername.Enabled = false;
            txtPhone.Enabled = false;
            txtDOB.Enabled = false;
            txtAddress.Disabled = true;
            selectCountry.Enabled = false;
            selectCity.Enabled = false;
            selectState.Enabled = false;
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/index.aspx");
        }
    }
}