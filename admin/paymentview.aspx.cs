using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SK_AGRO.admin
{
    public partial class paymentview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "success": return "badge badge-success";
                case "pending": return "badge badge-pending";
                case "failed": return "badge badge-failed";
                default: return "badge bg-secondary";
            }
        }

    }
}