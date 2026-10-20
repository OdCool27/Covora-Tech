using System.Collections.Generic;
namespace Covora_Tech_Store.Models
{
    public static class ProductCatalog
    {
        // Sample data. Both pages read this collection; no database as yet.
        public static IEnumerable<Product> GetProducts()
        {
            return new List<Product>
            {
                new Product {
                    Id = "CT-101", Name = "Everyday Wireless Earbuds",
                    Description = "Wireless earbuds with a compact charging case for music, calls and your daily commute.",
                    Category = "Audio", UnitPrice = 8900m, availableQuantity = 16, ImageUrl = "~/assets/earbuds.png", IsFeatured = true
                },
                new Product {
                    Id = "CT-102", Name = "Portable Power Bank",
                    Description = "A compact 10,000 mAh backup battery with USB charging to keep your devices ready while you are out.",
                    Category = "Power", UnitPrice = 5200m, availableQuantity = 32, ImageUrl = "~/assets/powerbank.png"
                },
                new Product {
                    Id = "CT-103", Name = "Adjustable Desk Lamp",
                    Description = "An LED desk lamp with an adjustable angle and three brightness settings for study or work.",
                    Category = "Workspace", UnitPrice = 6500m, availableQuantity = 24, ImageUrl = "~/assets/lamp.png"
                },
                new Product {
                    Id = "CT-104", Name = "Dual Extended Screen",
                    Description = "An extended dual screen for laptops. Ideal for additional screens needed on the go.",
                    Category = "Visual", UnitPrice = 11000m, availableQuantity = 10, ImageUrl = "~/assets/extended-screen.png"
                }
            };
        }
    }
}
