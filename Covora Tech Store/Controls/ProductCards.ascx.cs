using System;
using System.Linq;
using System.Web.UI;
using Covora_Tech_Store.Models;
namespace Covora_Tech_Store.Controls
{
    public partial class ProductCards : UserControl
    {
        public bool FeaturedOnly { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var products = ProductCatalog.GetProducts();
                if (FeaturedOnly)
                    products = products.Where(product => product.IsFeatured);
                ProductRepeater.DataSource = products;
                ProductRepeater.DataBind();
            }
        }
    }
}
