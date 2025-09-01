using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace SK_AGRO.admin
{
    public partial class manage_product : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
                BindGrid();
            }
        }

        void BindCategory()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM category", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                ddleventname.DataSource = dr;
                ddleventname.DataTextField = "c_name";
                ddleventname.DataValueField = "c_id";
                ddleventname.DataBind();
                con.Close();
            }
        }

        void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT p.*, c.c_name 
                                 FROM product p 
                                 JOIN category c ON p.c_id = c.c_id";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gdv.DataSource = dt;
                gdv.DataBind();
            }
        }

        protected void btnsum_Click(object sender, EventArgs e)
        {
            string filename = "";
            if (fupload.HasFile)
            {
                filename = Path.GetFileName(fupload.FileName);
                fupload.SaveAs(Server.MapPath("~/admin/img/") + filename);
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO product (p_name, p_des, p_price, p_image, c_id) VALUES (@name, @des, @price, @image, @cid)", con);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@des", txtdes.Text);
                cmd.Parameters.AddWithValue("@price", txtprice.Text);
                cmd.Parameters.AddWithValue("@image", filename);
                cmd.Parameters.AddWithValue("@cid", ddleventname.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            BindGrid();
            txtname.Text = txtdes.Text = txtprice.Text = "";
        }

        protected void gdv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdv.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gdv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdv.EditIndex = e.NewEditIndex;
            BindGrid();

            DropDownList ddlcat = (DropDownList)gdv.Rows[e.NewEditIndex].FindControl("ddlcat");
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM category", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                ddlcat.DataSource = dr;
                ddlcat.DataTextField = "c_name";
                ddlcat.DataValueField = "c_id";
                ddlcat.DataBind();
                con.Close();
            }

            Label lblcat = (Label)gdv.Rows[e.NewEditIndex].FindControl("lblcat");
            if (lblcat != null && ddlcat != null)
            {
                ddlcat.SelectedValue = GetCategoryId(lblcat.Text);
            }
        }

        string GetCategoryId(string categoryName)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT c_id FROM category WHERE c_name=@name", con);
                cmd.Parameters.AddWithValue("@name", categoryName);
                con.Open();
                object result = cmd.ExecuteScalar();
                con.Close();
                return result?.ToString() ?? "";
            }
        }

        protected void gdv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gdv.EditIndex = -1;
            BindGrid();
        }

        protected void gdv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblid = (Label)gdv.Rows[e.RowIndex].FindControl("lblid");
            TextBox txtproduct = (TextBox)gdv.Rows[e.RowIndex].FindControl("txtproduct");
            TextBox txtdes = (TextBox)gdv.Rows[e.RowIndex].FindControl("txtdes");
            TextBox txtprice = (TextBox)gdv.Rows[e.RowIndex].FindControl("txtprice");
            DropDownList ddlcat = (DropDownList)gdv.Rows[e.RowIndex].FindControl("ddlcat");
            FileUpload fu = (FileUpload)gdv.Rows[e.RowIndex].FindControl("getfile");

            string filename = "";
            if (fu.HasFile)
            {
                filename = Path.GetFileName(fu.FileName);
                fu.SaveAs(Server.MapPath("~/admin/img/") + filename);
            }
            else
            {
                Image img = (Image)gdv.Rows[e.RowIndex].FindControl("img1");
                filename = Path.GetFileName(img.ImageUrl);
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE product SET p_name=@name, p_des=@des, p_price=@price, p_image=@image, c_id=@cid WHERE p_Id=@id", con);
                cmd.Parameters.AddWithValue("@name", txtproduct.Text);
                cmd.Parameters.AddWithValue("@des", txtdes.Text);
                cmd.Parameters.AddWithValue("@price", txtprice.Text);
                cmd.Parameters.AddWithValue("@image", filename);
                cmd.Parameters.AddWithValue("@cid", ddlcat.SelectedValue);
                cmd.Parameters.AddWithValue("@id", lblid.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gdv.EditIndex = -1;
            BindGrid();
        }

        protected void gdv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblid = (Label)gdv.Rows[e.RowIndex].FindControl("lblid");

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM product WHERE p_Id=@id", con);
                cmd.Parameters.AddWithValue("@id", lblid.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            BindGrid();
        }
    }
}
