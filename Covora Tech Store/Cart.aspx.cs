using Covora_Tech_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Covora_Tech_Store
{
    public partial class Cart : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }

            var cart = (List<CartItem>)Session["Cart"];
            CheckoutBtn.Visible = cart != null && cart.Count > 0;
        }

        private void BindCart()
        {
            var cart = (List<CartItem>)Session["Cart"];
            if (cart != null && cart.Count > 0)
            {
                // Bind desktop GridView
                CartGrid.DataSource = cart;
                CartGrid.DataBind();

                // Bind mobile Repeater
                CartRepeater.DataSource = cart;
                CartRepeater.DataBind();

                // ✅ Calculate grand total with tax
                decimal subtotal = cart.Sum(c => c.Subtotal);
                decimal tax = subtotal * 0.15m;
                decimal grandTotal = subtotal + tax;

                MobileGrandTotal.Text = $"Grand Total (incl. 15% tax): {grandTotal:C}";
            }
            else
            {
                // Empty cart case
                CartGrid.DataSource = null;
                CartGrid.DataBind();

                CartRepeater.DataSource = null;
                CartRepeater.DataBind();

                MobileGrandTotal.Text = "Your cart is empty.";
            }
        }




        protected void CartGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                var cart = (List<CartItem>)Session["Cart"];
                if (cart != null && rowIndex >= 0 && rowIndex < cart.Count)
                {
                    cart.RemoveAt(rowIndex);
                    Session["Cart"] = cart; // Update the cart in session
                    Session["CartCount"] = cart.Count; // Update the cart count in session
                    BindCart(); // refresh the grid
                    // After updating Session["Cart"] and Session["CartCount"]
                    Response.Redirect(Request.RawUrl);

                }
            }
        }

        protected void CartGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                var cart = (List<CartItem>)Session["Cart"];
                if (cart != null && cart.Count > 0)
                {
                    decimal subtotal = cart.Sum(c => c.Subtotal);
                    decimal tax = subtotal * 0.15m;
                    decimal grandTotal = subtotal + tax;

                    // ✅ Clear all existing cells
                    e.Row.Cells.Clear();

                    // ✅ Create one cell for the label
                    TableCell labelCell = new TableCell();
                    labelCell.ColumnSpan = 5; // match the number of columns you want it to span
                    labelCell.Text = "GRAND TOTAL (incl. 15% tax)";
                    labelCell.CssClass = "fw-bold text-end"; // Bootstrap styling
                    e.Row.Cells.Add(labelCell);

                    // ✅ Create one cell for the value
                    TableCell valueCell = new TableCell();
                    valueCell.Text = grandTotal.ToString("C");
                    valueCell.CssClass = "fw-bold";
                    e.Row.Cells.Add(valueCell);
                }
            }
        }


        protected void CartRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                string productId = e.CommandArgument.ToString();
                var cart = (List<CartItem>)Session["Cart"];

                if (cart != null)
                {
                    var item = cart.FirstOrDefault(c => c.ProductId == productId);
                    if (item != null)
                    {
                        cart.Remove(item);
                        Session["Cart"] = cart;
                        Session["CartCount"] = cart.Count;
                    }
                }

                // Refresh both views
                BindCart();
                Response.Redirect(Request.RawUrl);
            }
        }



    }
}