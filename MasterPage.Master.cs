using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SK_AGRO
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string pageName = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

                // Reset all menu items
                homeNavItem.Attributes["class"] = "nav-item";
                productsNavItem.Attributes["class"] = "nav-item";
                aboutNavItem.Attributes["class"] = "nav-item";
                contactNavItem.Attributes["class"] = "nav-item";

                // Set active menu item
                switch (pageName.ToLower())
                {
                    case "index.aspx":
                    case "default.aspx":
                        homeNavItem.Attributes["class"] = "nav-item active";
                        break;
                    case "products.aspx":
                        productsNavItem.Attributes["class"] = "nav-item active";
                        break;
                    case "aboutus.aspx":
                        aboutNavItem.Attributes["class"] = "nav-item active";
                        break;
                    case "contactus.aspx":
                        contactNavItem.Attributes["class"] = "nav-item active";
                        break;
                }
            }
        }
    }
}