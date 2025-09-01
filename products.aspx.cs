using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SK_AGRO
{
    public partial class products : System.Web.UI.Page
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;
        protected string CartCountValue = "0";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
                UpdateCartCount();
            }
        }

        private void LoadProducts()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT p_Id, p_name, p_price, p_image, p_des FROM product";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rpt_products.DataSource = dt;
                rpt_products.DataBind();
                pnlNoProducts.Visible = dt.Rows.Count == 0;
            }
        }

        public string GetProductImage(object imageName)
        {
            return string.IsNullOrEmpty(imageName?.ToString()) ? "/images/no-image.jpg" : "/admin/img/" + imageName;
        }

        protected void AddToCart_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument == null)
            {
                lblMessage.Text = "Invalid product.";
                lblMessage.Visible = true;
                return;
            }

            int productId = Convert.ToInt32(e.CommandArgument);
            if (!int.TryParse(e.CommandArgument.ToString(), out productId))
            {
                lblMessage.Text = "Product added to cart!";
                lblMessage.Visible = true;
                return;
            }

            int quantity = 1;
            string sessionId = Session.SessionID;

            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    con.Open();

                    // Get product details
                    SqlCommand prodCmd = new SqlCommand("SELECT p_name, p_price, p_image FROM product WHERE p_Id = @pid", con);
                    prodCmd.Parameters.AddWithValue("@pid", productId);

                    SqlDataReader reader = prodCmd.ExecuteReader();
                    if (!reader.Read())
                    {
                        lblMessage.Text = "Product not found.";
                        lblMessage.Visible = true;
                        return;
                    }

                    string name = reader["p_name"].ToString();
                    decimal price = Convert.ToDecimal(reader["p_price"]);
                    string image = reader["p_image"].ToString();

                    reader.Close();

                    // Check if already in cart
                    SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Cart WHERE ProductId = @pid AND SessionId = @sid", con);
                    checkCmd.Parameters.AddWithValue("@pid", productId);
                    checkCmd.Parameters.AddWithValue("@sid", sessionId);

                    int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (exists > 0)
                    {
                        SqlCommand updateCmd = new SqlCommand("UPDATE Cart SET Quantity = Quantity + 1 WHERE ProductId = @pid AND SessionId = @sid", con);
                        updateCmd.Parameters.AddWithValue("@pid", productId);
                        updateCmd.Parameters.AddWithValue("@sid", sessionId);
                        updateCmd.ExecuteNonQuery();
                    }
                    else
                    {
                        SqlCommand insertCmd = new SqlCommand(@"INSERT INTO Cart 
                (ProductId, ProductName, ProductPrice, ProductImage, Quantity, SessionId) 
                VALUES (@pid, @pname, @pprice, @pimg, @qty, @sid)", con);

                        insertCmd.Parameters.AddWithValue("@pid", productId);
                        insertCmd.Parameters.AddWithValue("@pname", name);
                        insertCmd.Parameters.AddWithValue("@pprice", price);
                        insertCmd.Parameters.AddWithValue("@pimg", image);
                        insertCmd.Parameters.AddWithValue("@qty", quantity);
                        insertCmd.Parameters.AddWithValue("@sid", sessionId);

                        insertCmd.ExecuteNonQuery();
                    }

                    lblMessage.Text = "✅ Product added to cart!";
                    lblMessage.Visible = true;
                }

                UpdateCartCount();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ Error: " + ex.Message;
                lblMessage.Visible = true;
            }
        }



        private void UpdateCartCount()
        {
            int totalItems = 0;
            string sessionId = Session.SessionID;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT SUM(Quantity) FROM Cart WHERE SessionId = @sid", con);
                cmd.Parameters.AddWithValue("@sid", sessionId);
                object result = cmd.ExecuteScalar();
                totalItems = result != DBNull.Value ? Convert.ToInt32(result) : 0;
            }

            CartCountValue = totalItems.ToString();

            var cartCountControl = Master?.FindControl("cartItemCount") as System.Web.UI.HtmlControls.HtmlGenericControl;
            if (cartCountControl != null)
            {
                cartCountControl.InnerText = totalItems.ToString();
            }
        }

    }
}
