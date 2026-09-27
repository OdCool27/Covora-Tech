using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
namespace Covora_Tech_Store
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Use the actual page filename, even when FriendlyUrls hides .aspx.
            string page = System.IO.Path.GetFileName(Page.AppRelativeVirtualPath);
            SetCurrentPage(HomeLink, page.Equals("Default.aspx", StringComparison.OrdinalIgnoreCase));
            SetCurrentPage(ProductsLink, page.Equals("Products.aspx", StringComparison.OrdinalIgnoreCase));
            SetCurrentPage(AboutLink, page.Equals("About.aspx", StringComparison.OrdinalIgnoreCase));
            SetCurrentPage(ContactLink, page.Equals("Contact.aspx", StringComparison.OrdinalIgnoreCase));
        }
        private static void SetCurrentPage(HtmlAnchor link, bool isCurrent)
        {
            if (isCurrent)
            {
                link.Attributes["class"] = "nav-link active";
                link.Attributes["aria-current"] = "page";
            }
        }
    }
}
