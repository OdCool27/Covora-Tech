using System.Globalization;
namespace Covora_Tech_Store.Models
{
    // One product's information. Prices use decimal values in Jamaican dollars.
    public class Product
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Category { get; set; }
        public decimal UnitPrice { get; set; }
        public int availableQuantity { get; set; }
        public string ImageUrl { get; set; }
        public bool IsFeatured { get; set; }
        public bool HasImage { get { return !string.IsNullOrWhiteSpace(ImageUrl); } }
        public string DisplayPrice { get { return "JMD " + UnitPrice.ToString("N2", CultureInfo.InvariantCulture); } }
    }
}
