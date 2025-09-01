using System;
using System.Data.SqlClient;
using System.Configuration;

namespace SK_AGRO.admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDashboardCounts();
                //Response.Redirect("login.aspx");
            }
        }

        private void GetDashboardCounts()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Get Product Count
                    string productQuery = "SELECT COUNT(*) FROM product";
                    SqlCommand productCmd = new SqlCommand(productQuery, connection);
                    lblProduct.Text = productCmd.ExecuteScalar().ToString();

                    // Get User Count
                    string userQuery = "SELECT COUNT(*) FROM user_login";
                    SqlCommand userCmd = new SqlCommand(userQuery, connection);
                    lblUser.Text = userCmd.ExecuteScalar().ToString();

                    // Get Active Category Count
                    string categoryQuery = "SELECT COUNT(*) FROM category";
                    SqlCommand categoryCmd = new SqlCommand(categoryQuery, connection);
                    lblCategory.Text = categoryCmd.ExecuteScalar().ToString();

                    // Get Payment Count
                    string paymentQuery = "SELECT COUNT(*) FROM Payments";
                    SqlCommand paymentCmd = new SqlCommand(paymentQuery, connection);
                    lblPayment.Text = paymentCmd.ExecuteScalar().ToString();

                    // Get Feedback Count
                    string feedbackQuery = "SELECT COUNT(*) FROM feedback";
                    SqlCommand feedbackCmd = new SqlCommand(feedbackQuery, connection);
                    lblFeedback.Text = feedbackCmd.ExecuteScalar().ToString();
                }
                catch (Exception ex)
                {
                    // Log error or show user-friendly message
                    Response.Write("<script>alert('Error loading dashboard data: " + ex.Message.Replace("'", "\\'") + "');</script>");
                }
            }
        }
    }
}
