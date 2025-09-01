using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace SK_AGRO
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both email and password.";
                lblMessage.Visible = true;
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM user_login WHERE u_email = @Email AND u_pass = @Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();

                    if (count == 1)
                    {
                        // Success — set session
                        Session["u_email"] = email;

                        // Redirect to dashboard
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid email or password. Please try again.";
                        lblMessage.Visible = true;
                    }
                }
            }
        }
    }
}
