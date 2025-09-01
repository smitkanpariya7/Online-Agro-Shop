using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace SK_AGRO.admin
{
    public partial class manage_user : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Cu_id, u_name, u_mobile, u_email, u_pass FROM user_login", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        show1.DataSource = dt;
                        show1.DataBind();
                    }
                }
            }
        }

        protected void btn_d_Click(object sender, EventArgs e)
        {
            // ✅ Proper cast to LinkButton (matches what is usually in Repeater)
            LinkButton btn = sender as LinkButton;
            if (btn != null)
            {
                int userId = Convert.ToInt32(btn.CommandArgument);

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM user_login WHERE Cu_id = @Cu_id", con))
                    {
                        cmd.Parameters.AddWithValue("@Cu_id", userId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // ✅ Refresh the grid after delete
                BindUsers();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            if (btn != null)
            {
                int userId = Convert.ToInt32(btn.CommandArgument);
                // Example: Redirect to edit page
                Response.Redirect("edit_user.aspx?id=" + userId);
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            // Example: Redirect to add user form
            Response.Redirect("add_user.aspx");
        }
    }
}
