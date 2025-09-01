using System;
using System.IO;

namespace SK_AGRO.admin
{
    public partial class MasterPage1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string currentPage = Path.GetFileName(Request.Url.AbsolutePath).ToLower();

                hlDashboard.CssClass = "nav-link";
                hlCategory.CssClass = "nav-link";
                hlProduct.CssClass = "nav-link";
                hlUser.CssClass = "nav-link";
                hlFeedback.CssClass = "nav-link";
                hlPayment.CssClass = "nav-link";

                switch (currentPage)
                {
                    case "dashboard.aspx":
                        hlDashboard.CssClass += " active";
                        break;
                    case "category.aspx":
                        hlCategory.CssClass += " active";
                        break;
                    case "manage_product.aspx":
                        hlProduct.CssClass += " active";
                        break;
                    case "manage_user.aspx":
                        hlUser.CssClass += " active";
                        break;
                    case "feedback.aspx":
                        hlFeedback.CssClass += " active";
                        break;
                    case "paymentview.aspx":
                        hlPayment.CssClass += " active";
                        break;
                }
            }
        }
    }
}
