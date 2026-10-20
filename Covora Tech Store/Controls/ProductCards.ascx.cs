using Covora_Tech_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
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

        protected void ProductCards_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var product = (Covora_Tech_Store.Models.Product)e.Item.DataItem;
                var ddl = (DropDownList)e.Item.FindControl("QuantityDropDown");

                ddl.Items.Clear();
                for (int i = 1; i <= product.availableQuantity; i++)
                {
                    ddl.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }


        protected void AddToCart_Command(object sender, CommandEventArgs e)
        {
            // Get product ID from the button's CommandArgument
            string productId = e.CommandArgument.ToString();

            // Find product details
            var product = ProductCatalog.GetProducts().FirstOrDefault(p => p.Id == productId);
            if (product == null) return;

            // Find the dropdown in the same RepeaterItem
            var button = (Button)sender;
            var itemContainer = (RepeaterItem)button.NamingContainer;
            var ddl = (DropDownList)itemContainer.FindControl("QuantityDropDown");
            int quantity = int.Parse(ddl.SelectedValue);

            // Get or create cart
            var cart = (List<CartItem>)Session["Cart"] ?? new List<CartItem>();

            // Check if product already exists in cart
            var existingItem = cart.FirstOrDefault(c => c.ProductId == product.Id);
            if (existingItem != null)
            {
                // Update quantity
                existingItem.Quantity += quantity;
            }
            else
            {
                // Add new item
                cart.Add(new CartItem
                {
                    ProductId = product.Id,
                    ProductName = product.Name,
                    UnitPrice = product.UnitPrice,
                    Quantity = quantity
                });
            }

            // Save back to session
            Session["Cart"] = cart;
            Session["CartCount"] = cart.Count();

            // After updating Session["Cart"] and Session["CartCount"]
            Response.Redirect(Request.RawUrl);

        }




    }
}
