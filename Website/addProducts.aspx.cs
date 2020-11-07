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
    public partial class addProducts : System.Web.UI.Page
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
                if (!Page.IsPostBack)
                {
                    selectCategory.Items.Clear();
                    String[] items = new string[] { "Computer", "Computer Accesories", };
                    foreach (string i in items)
                    {
                        selectCategory.Items.Add(i);
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("~/index.aspx");
        }


        public void uploadImg()
        {
            var supportedTypes = new[] { "jpg", "jpeg", "png" };
            var fileExt = System.IO.Path.GetExtension(uploadImage.FileName).Substring(1);

            if (uploadImage.HasFile)
            {
                if (!supportedTypes.Contains(fileExt))
                {
                    Label1.Visible = true;
                    Label1.Text = "File Extension Is InValid - Only Upload PNG/JPEG/JPG File";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    string folderPath = Server.MapPath("~/img/products/" + Session["user"] + "/");

                    //Check whether Directory (Folder) exists.
                    if (!Directory.Exists(folderPath))
                    {
                        //If Directory (Folder) does not exists. Create it.
                        Directory.CreateDirectory(folderPath);
                    }

                    //String path = folderPath + Path.GetFileName(uploadImage.FileName);
                    //uploadImage.SaveAs(path);

                    string str = uploadImage.FileName;
                    uploadImage.PostedFile.SaveAs(folderPath + "\\" + str.ToString());
                    string Image = "img/products/" + Session["user"] +"/" + str.ToString();
                    string name = txtName.Text;

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

                    SqlCommand cmd1 = new SqlCommand("INSERT INTO violet_products VALUES(@pname, @price, @Image, @category, @uname, @keywords)", con);
                    cmd1.Parameters.AddWithValue("@pname", name);
                    cmd1.Parameters.AddWithValue("Image", Image);
                    cmd1.Parameters.AddWithValue("@price", txtPrice.Text);
                    cmd1.Parameters.AddWithValue("@category", selectCategory.SelectedItem.ToString());
                    cmd1.Parameters.AddWithValue("@uname", uname);
                    cmd1.Parameters.AddWithValue("@keywords", txtKeywords.Value);

                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();

                    Label1.Text = "Image Uploaded";
                    Label1.ForeColor = System.Drawing.Color.ForestGreen;

                    Response.Redirect("~/profile.aspx");
                }
            }

            else
            {
                Label1.Text = "Please Upload your Image";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            uploadImg();
        }
    }
}