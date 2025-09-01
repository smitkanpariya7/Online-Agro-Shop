using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SK_AGRO
{
    public partial class index : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Response.Redirect("login.aspx");
                BindCategories();
            }
        }

        private void BindCategories()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT c_id, c_name, c_image FROM Category";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    eventsRepeater.DataSource = dt;
                    eventsRepeater.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Log error or show user-friendly message
                System.Diagnostics.Debug.WriteLine("Error loading categories: " + ex.Message);
            }
        }

        protected void eventsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // You can add additional item binding logic here if needed
            }
        }

        protected void crdproduct_Click1(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string categoryId = btn.CommandArgument;
            Response.Redirect($"products.aspx?categoryId={categoryId}");
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            
        }
    }
}