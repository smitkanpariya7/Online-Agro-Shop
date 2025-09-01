using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace SK_AGRO
{
    public partial class cart : System.Web.UI.Page
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            string sessionId = Session.SessionID;
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string sql = @"
                    SELECT c.ProductId, 
                           ISNULL(p.p_name, 'N/A') AS Name, 
                           ISNULL(p.p_image, '') AS p_image, 
                           ISNULL(c.Quantity, 1) AS Quantity, 
                           ISNULL(p.p_price, 0) AS Price
                    FROM Cart c
                    INNER JOIN Product p ON c.ProductId = p.p_Id
                    WHERE c.SessionId = @sid";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@sid", sessionId);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            if (dt.Rows.Count > 0)
            {
                rptCart.DataSource = dt;
                rptCart.DataBind();
                pnlCartItems.Visible = true;
                pnlEmptyCart.Visible = false;
                lblItemCount.Text = $"{dt.Rows.Count} item(s)";
                CalculateSummary(dt);
            }
            else
            {
                rptCart.DataSource = null;
                rptCart.DataBind();
                pnlCartItems.Visible = false;
                pnlEmptyCart.Visible = true;
                lblItemCount.Text = "0 item(s)";
                litSubtotal.Text = "0.00";
                litShipping.Text = "0.00";
                litTotal.Text = "0.00";
            }
        }

        public string GetProductImage(object img)
        {
            string fileName = img?.ToString() ?? "";
            return string.IsNullOrWhiteSpace(fileName)
                ? ResolveUrl("~/images/no-image.png")
                : ResolveUrl("~/admin/img/" + fileName);
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);

            switch (e.CommandName)
            {
                case "Increase":
                    UpdateQuantity(productId, +1);
                    break;
                case "Decrease":
                    UpdateQuantity(productId, -1);
                    break;
                case "Remove":
                    RemoveItem(productId);
                    break;
            }

            BindCart();
        }

        private void UpdateQuantity(int productId, int change)
        {
            string sessionId = Session.SessionID;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    UPDATE Cart
                    SET Quantity = CASE 
                        WHEN Quantity + @chg <= 1 THEN 1
                        ELSE Quantity + @chg
                    END
                    WHERE ProductId = @pid AND SessionId = @sid";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@chg", change);
                    cmd.Parameters.AddWithValue("@pid", productId);
                    cmd.Parameters.AddWithValue("@sid", sessionId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void RemoveItem(int productId)
        {
            string sessionId = Session.SessionID;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Cart WHERE ProductId = @pid AND SessionId = @sid";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@pid", productId);
                    cmd.Parameters.AddWithValue("@sid", sessionId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void CalculateSummary(DataTable dt)
        {
            decimal subtotal = 0;

            foreach (DataRow row in dt.Rows)
            {
                decimal price = Convert.ToDecimal(row["Price"]);
                int quantity = Convert.ToInt32(row["Quantity"]);
                subtotal += price * quantity;
            }

            decimal shipping = 0.00m; // Flat or dynamic
            litSubtotal.Text = subtotal.ToString("0.00");
            litShipping.Text = shipping.ToString("0.00");
            litTotal.Text = (subtotal + shipping).ToString("0.00");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (rptCart.Items.Count == 0)
            {
                lblMessage.Text = "Your cart is empty. Please add items.";
                lblMessage.Visible = true;
            }
            else
            {
                Response.Redirect("payment.aspx");
            }
        }
    }
}
