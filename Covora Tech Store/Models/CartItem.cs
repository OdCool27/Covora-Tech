using System;
using System.Web;

namespace Covora_Tech_Store.Models
{
    public class CartItem
    {
        public String ProductId { get; set; }
        public String ProductName { get; set; }
        public decimal UnitPrice { get; set; }
        public int Quantity { get; set; }

        public decimal Subtotal
        {
            get { return UnitPrice * Quantity; }
        }
    }
}
