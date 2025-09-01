using System;
using System.Data.SqlClient;
using System.Configuration;

namespace SK_AGRO.admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtadmin.Text.Trim();
            string password = txtpass.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM admin WHERE Ad_Email=@Email AND Ad_password=@Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();

                    if (count == 1)
                    {
                        Session["AdminEmail"] = email;
                        Response.Redirect("dashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Email or Password!";
                        lblMessage.Visible = true;
                    }
                }
            }
        }
    }
}
