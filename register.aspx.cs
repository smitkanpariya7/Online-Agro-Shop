using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SK_AGRO
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtname.Text.Trim();
                string email = txtemail.Text.Trim();
                string mobile = txtmobile.Text.Trim();
                string username = txtuser.Text.Trim();
                string password = txtpass.Text.Trim();

                string constr = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "INSERT INTO User_login (u_name, u_email, u_mobile, u_user, u_pass) VALUES (@Name, @Email, @Mobile, @Username, @Password)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Mobile", mobile);
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        con.Open();
                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            lblMessage.Text = "Registration successful!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            lblMessage.Visible = true;

                            ClearFields();
                        }
                        else
                        {
                            lblMessage.Text = "Registration failed. Try again.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Visible = true;
                        }
                    }
                }
            }
        }

        private void ClearFields()
        {
            txtname.Text = "";
            txtemail.Text = "";
            txtmobile.Text = "";
            txtuser.Text = "";
            txtpass.Text = "";
        }
    }
}
