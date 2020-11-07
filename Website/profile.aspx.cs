using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class profile : System.Web.UI.Page
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
                profileIcon.Visible = true;
                cartIcon.Visible = true;
                countItems.Visible = true;
                DataTable dt = new DataTable();
                dt = (DataTable)Session["count1"];
                if (dt != null)
                {
                    countItems.Text = dt.Rows.Count.ToString();
                }
                else
                {
                    countItems.Text = "0";
                }
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

            String fetchCount = "SELECT COUNT(*) FROM violet_order WHERE uname='" + txtName.Text + "'";
            con.Open();
            SqlCommand cmd6 = new SqlCommand(fetchCount, con);
            int rowCount = Convert.ToInt32(cmd6.ExecuteScalar());
            con.Close();

            if (rowCount == 0)
            {
                panelOrder.Visible = false;
                Label7.Text = "No Orders Have Been Placed";
            }

            if (uid > 5000)
            {
                btnAddProduct.Visible = true;
                Label8.Visible = true;
                Panel1.Visible = true;
                //filldata();
            }

            //Disable Fields
            disableInput();

            Submit.Visible = false;
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            Update.Visible = true;
            Submit.Visible = false;
            string query = "UPDATE violet_user_login set phone=" + txtPhone.Text + ",address='" + txtAddress.Value + "',country='" + selectCountry.SelectedItem.ToString() + "',state='" + selectState.SelectedItem.ToString() + "',city='" + selectCity.SelectedItem.ToString() + "' where username='" + Session["user"] + "' OR email='" + Session["user"] + "'";
            Response.Write(query + "<br>");
            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            Update.Visible = false;
            Submit.Visible = true;
            // can be updated - phone,address,city,state,country
            disableInput();
            txtPhone.Enabled = true;
            txtAddress.Disabled = false;
            selectCountry.Enabled = true;
            selectCity.Enabled = true;
            selectState.Enabled = true;

            //uname,email,username,password,phone,dob,country,state,city,gender,address,secq,seca

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/index.aspx");
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

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/addProducts.aspx");
        }

        [Obsolete]
        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            panelOrder.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        [Obsolete]
        protected void DownloadPDF(object sender, EventArgs e)
        {
            exportpdf();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        public void filldata()
        {
            String fetchCount = "SELECT COUNT(*) FROM violet_products WHERE uname='" + txtName.Text + "'";
            con.Open();
            SqlCommand cmd6 = new SqlCommand(fetchCount, con);
            int rowCount = Convert.ToInt32(cmd6.ExecuteScalar()); 
            con.Close();

            if (rowCount > 0)
            {
                String query = "SELECT * FROM violet_products WHERE uname='" + txtName.Text + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                con.Open();
                DataTable ds = new DataTable();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                Label8.Text = "No Products Added";
                Panel1.Visible = false;
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Control control = e.Row.Cells[6].Controls[0];
                if (control is LinkButton)
                {
                    ( (LinkButton)control ).OnClientClick = "return confirm('Are you Sure?')";
                }
            }
        }
    }
}