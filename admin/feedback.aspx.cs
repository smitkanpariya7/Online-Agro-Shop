using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SK_AGRO.admin
{
    public partial class feedback : System.Web.UI.Page
    {
        // Connection string from web.config
        string connectionString = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFeedbackData();
            }
        }

        private void BindFeedbackData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT id, name, u_mobile, u_email, message FROM Feedback ORDER BY id DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    show1.DataSource = dt;
                    show1.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Display error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error",
                    $"alert('Error loading feedback data: {ex.Message.Replace("'", "\\'")}');", true);
            }
        }

        protected void btn_d_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;

            // Add confirmation dialog
            ScriptManager.RegisterStartupScript(this, this.GetType(), "confirmDelete",
                $"if(confirm('Are you sure you want to delete this feedback?')) {{ __doPostBack('{btn.UniqueID}', ''); }}", true);

            if (!string.IsNullOrEmpty(Request["__EVENTTARGET"]) &&
                Request["__EVENTTARGET"] == btn.UniqueID)
            {
                DeleteFeedbackRecord(id);
            }
        }

        private void DeleteFeedbackRecord(string id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Feedback WHERE Id = @Id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Id", id);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        // Refresh the data
                        BindFeedbackData();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "success",
                            "alert('Feedback deleted successfully!');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error",
                    $"alert('Error deleting feedback: {ex.Message.Replace("'", "\\'")}');", true);
            }
        }
    }
}