using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SK_AGRO.admin
{
    public partial class forgot_password : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string newPass = txtNewPass.Text.Trim();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM admin WHERE Ad_Email=@Email", con);
                checkCmd.Parameters.AddWithValue("@Email", email);
                con.Open();
                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    SqlCommand updateCmd = new SqlCommand("UPDATE admin SET Ad_Password=@Password WHERE Ad_Email=@Email", con);
                    updateCmd.Parameters.AddWithValue("@Password", newPass); // You may want to hash this
                    updateCmd.Parameters.AddWithValue("@Email", email);

                    int rows = updateCmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        lblMessage.Text = "Password updated successfully.";
                        lblMessage.CssClass = "message success-message";
                        lblMessage.Visible = true;
                    }
                    else
                    {
                        lblMessage.Text = "Error updating password. Please try again.";
                        lblMessage.CssClass = "message error-message";
                        lblMessage.Visible = true;
                    }
                }
                else
                {
                    lblMessage.Text = "Email not found.";
                    lblMessage.CssClass = "message error-message";
                    lblMessage.Visible = true;
                }
            }
        }
    }
}
