using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SK_AGRO.admin
{
    public partial class category : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
            }
        }

        private void BindCategories()
        {
            try
            {
                string searchTerm = txtSearch?.Text?.Trim() ?? "";
                string query = "SELECT c_id, c_name, c_image FROM Category";

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    query += " WHERE c_name LIKE @SearchTerm";
                }

                query += " ORDER BY c_name ASC"; // Changed from created_at to c_name as it might not exist

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        if (!string.IsNullOrEmpty(searchTerm))
                        {
                            cmd.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");
                        }

                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gdv.DataSource = dt;
                        gdv.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                ShowErrorMessage("Error loading categories: " + ex.Message);
            }
        }

        protected void btnsum_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string categoryName = txtname.Text.Trim();
                    string imageName = "";

                    // Handle file upload
                    if (fupload.HasFile)
                    {
                        string extension = Path.GetExtension(fupload.FileName).ToLower();
                        string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                        if (Array.IndexOf(allowedExtensions, extension) == -1)
                        {
                            ShowErrorMessage("Only image files (JPG, JPEG, PNG, GIF) are allowed.");
                            return;
                        }

                        // Generate unique filename
                        imageName = Guid.NewGuid().ToString() + extension;
                        string savePath = Server.MapPath("~/admin/img/") + imageName;
                        fupload.SaveAs(savePath);
                    }
                    else
                    {
                        ShowErrorMessage("Please upload an image for the category.");
                        return;
                    }

                    // Insert into database
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        string query = @"INSERT INTO Category (c_name, c_image) 
                                        VALUES (@Name, @Image)";

                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Name", categoryName);
                            cmd.Parameters.AddWithValue("@Image", imageName);

                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Reset form and refresh grid
                    txtname.Text = "";
                    BindCategories();
                    ShowSuccessMessage("Category added successfully!");
                }
                catch (Exception ex)
                {
                    ShowErrorMessage("Error adding category: " + ex.Message);
                }
            }
        }

        protected void gdv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdv.EditIndex = e.NewEditIndex;
            BindCategories();
        }

        protected void gdv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gdv.EditIndex = -1;
            BindCategories();
        }

        protected void gdv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    GridViewRow row = gdv.Rows[e.RowIndex];
                    int categoryId = Convert.ToInt32(gdv.DataKeys[e.RowIndex].Values["c_id"]);

                    string categoryName = ((TextBox)row.FindControl("txtcategory")).Text;
                    FileUpload fileUpload = (FileUpload)row.FindControl("getfile");

                    string currentImage = gdv.DataKeys[e.RowIndex].Values["c_image"].ToString();
                    string imageName = currentImage;

                    if (fileUpload.HasFile)
                    {
                        string extension = Path.GetExtension(fileUpload.FileName).ToLower();
                        string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                        if (Array.IndexOf(allowedExtensions, extension) == -1)
                        {
                            ShowErrorMessage("Only image files (JPG, JPEG, PNG, GIF) are allowed.");
                            return;
                        }

                        // Generate unique filename
                        imageName = Guid.NewGuid().ToString() + extension;
                        string savePath = Server.MapPath("~/admin/img/") + imageName;
                        fileUpload.SaveAs(savePath);

                        // Delete old image if it exists
                        if (!string.IsNullOrEmpty(currentImage))
                        {
                            string oldImagePath = Server.MapPath("~/admin/img/") + currentImage;
                            if (File.Exists(oldImagePath))
                            {
                                File.Delete(oldImagePath);
                            }
                        }
                    }

                    // Update database
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        string query = @"UPDATE Category 
                                        SET c_name = @Name, 
                                            c_image = @Image
                                        WHERE c_id = @Id";

                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Name", categoryName);
                            cmd.Parameters.AddWithValue("@Image", imageName);
                            cmd.Parameters.AddWithValue("@Id", categoryId);

                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    gdv.EditIndex = -1;
                    BindCategories();
                    ShowSuccessMessage("Category updated successfully!");
                }
                catch (Exception ex)
                {
                    ShowErrorMessage("Error updating category: " + ex.Message);
                }
            }
        }

        protected void gdv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int categoryId = Convert.ToInt32(gdv.DataKeys[e.RowIndex].Values["c_id"]);
                string imageName = gdv.DataKeys[e.RowIndex].Values["c_image"].ToString();

                // Delete from database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Category WHERE c_id = @Id";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Id", categoryId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Delete image file if it exists
                if (!string.IsNullOrEmpty(imageName))
                {
                    string imagePath = Server.MapPath("~/admin/img/") + imageName;
                    if (File.Exists(imagePath))
                    {
                        File.Delete(imagePath);
                    }
                }

                BindCategories();
                ShowSuccessMessage("Category deleted successfully!");
            }
            catch (Exception ex)
            {
                ShowErrorMessage("Error deleting category: " + ex.Message);
            }
        }

        protected void gdv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdv.PageIndex = e.NewPageIndex;
            BindCategories();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindCategories();
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            gdv.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            BindCategories();
        }

        protected void ValidateImage(object source, ServerValidateEventArgs args)
        {
            if (!fupload.HasFile)
            {
                args.IsValid = false;
                return;
            }

            string extension = Path.GetExtension(fupload.FileName).ToLower();
            string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
            args.IsValid = Array.IndexOf(allowedExtensions, extension) != -1;
        }

        protected void ValidateEditImage(object source, ServerValidateEventArgs args)
        {
            FileUpload fileUpload = (FileUpload)((GridViewRow)((CustomValidator)source).NamingContainer).FindControl("getfile");

            if (fileUpload.HasFile)
            {
                string extension = Path.GetExtension(fileUpload.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                args.IsValid = Array.IndexOf(allowedExtensions, extension) != -1;
            }
            else
            {
                // No file uploaded is valid (keeping existing image)
                args.IsValid = true;
            }
        }

        private void ShowSuccessMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showSuccess",
                $"Swal.fire('Success!', '{message}', 'success');", true);
        }

        private void ShowErrorMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showError",
                $"Swal.fire('Error!', '{message}', 'error');", true);
        }
    }
}